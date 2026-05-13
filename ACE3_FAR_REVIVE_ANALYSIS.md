# Análisis de Integración ACE3 + FAR_Revive en A3Wasteland

## Resumen Ejecutivo

La integración actual tiene varios **bugs críticos y exploits potenciales** que deben ser corregidos para asegurar:
1. Funcionamiento correcto del killfeed
2. Compatibilidad total con lastResort mientras se está inconsciente
3. Prevención de exploits de revive dance y otros bugs
4. Mantenimiento de todas las dependencias de FAR_revive que usa A3Wasteland

---

## Problemas Críticos Identificados

### 1. CONFLICTO DE ESTADOS DE INCONSCIENCIA (CRÍTICO)

**Ubicación:** `addons/far_revive/FAR_defines.sqf:36`
```sqf
#define UNCONSCIOUS(UNIT) (UNIT getVariable ["ACE_isUnconscious", false])
```

**Problema:** El sistema usa `ACE_isUnconscious` pero ACE3 también establece su propio estado interno. Cuando ACE3 pone al jugador inconsciente, puede que no establezca `ACE_isUnconscious` inmediatamente, causando que:
- El killfeed no detecte correctamente el estado
- lastResort no funcione porque las teclas están bloqueadas por ACE3
- Las acciones de revive no aparezcan correctamente

**Solución necesaria:** Verificar ambos estados (ACE3 nativo y variable FAR)

---

### 2. LAST RESORT NO FUNCIONA CON INPUTS DESACTIVADOS (CRÍTICO)

**Ubicación:** `addons/far_revive/FAR_lastResort.sqf:7`
```sqf
if !(player getVariable ["performingDuty", false]) then
```

**Ubicación:** `client/clientEvents/onKeyPress.sqf:153-157`
```sqf
if (_key == 14) then // backspace
{
    execVM "addons\far_revive\FAR_lastResort.sqf";
    _handled = true;
};
```

**Problema:** 
- ACE3 desactiva los inputs del teclado cuando el jugador está inconsciente (setUnconscious true)
- La tecla Backspace (14) para lastResort NO se procesa porque ACE3 bloquea los inputs
- El jugador NO puede usar lastResort mientras está en estado inconsciente de ACE3

**Solución necesaria:** 
- Usar un KeyDown EH que se ejecute ANTES de que ACE3 bloquee los inputs
- O verificar el estado de inconsciencia de ACE3 específicamente en onKeyPress

---

### 3. KILLFEED PUEDE FALLAR AL DETECTAR MUERTE (ALTO)

**Ubicación:** `client/clientEvents/onKilled.sqf:27-31`
```sqf
if (_player getVariable ["ACE_isUnconscious", false] && _deathCause isEqualTo []) then
{
    _deathCause = [["kill","bleedout"] select (_player getVariable ["FAR_injuryBroadcast", false])];
    _player setVariable ["A3W_deathCause_local", _deathCause];
};
```

**Problema:**
- Si ACE3 maneja la transición de inconsciente a muerto internamente, `FAR_injuryBroadcast` puede no estar establecido
- El killfeed mostrará información incorrecta o incompleta
- La causa de muerte puede registrarse como "suicide" en lugar de "bleedout" o "kill"

**Solución necesaria:** 
- Verificar también el estado de bleeding de ACE3
- Sincronizar mejor las variables de causa de muerte entre ACE3 y FAR

---

### 4. STABILIZED MACRO USANDO FUNCIÓN ACE3 INCORRECTA (MEDIO)

**Ubicación:** `addons/far_revive/FAR_defines.sqf:37`
```sqf
#define STABILIZED(UNIT) (UNIT call ACE_medical_fnc_isInStableCondition)
```

**Problema:**
- `ACE_medical_fnc_isInStableCondition` verifica si la unidad está en condición estable según ACE3
- Pero FAR usa su propia lógica de estabilización con `FAR_isStabilized`
- Puede haber discrepancias donde FAR considera estabilizada una unidad que ACE3 no, o viceversa

**Solución necesaria:** 
- Verificar AMBOS estados: FAR_isStabilized Y ACE3 stable condition
- O forzar sincronización cuando FAR estabiliza

---

### 5. DUPLICACIÓN DE VARIABLES DE ESTADO (MEDIO)

**Ubicación:** `addons/far_revive/FAR_Player_Unconscious.sqf:286`
```sqf
_unit setVariable ["ace_sys_wounds_uncon", true];
```

**Ubicación:** `addons/far_revive/FAR_revive_init.sqf:42`
```sqf
_this setVariable ["ace_sys_wounds_uncon", false];
```

**Problema:**
- `ace_sys_wounds_uncon` es una variable OBSOLETA de ACE2/sistema antiguo de wounds
- ACE3 usa `ACE_isUnconscious` directamente
- Esta duplicación puede causar conflictos de estado

**Solución necesaria:** 
- Eliminar uso de `ace_sys_wounds_uncon`
- Usar solo `ACE_isUnconscious` consistentemente

---

### 6. REVIVE DANCE EXPLOIT POTENCIAL (MEDIO)

**Ubicación:** `addons/far_revive/FAR_Player_Unconscious.sqf:23`
```sqf
if (_unit == player) then
{
    a3w_actions_mutex = false; // prevent revive dance
};
```

**Problema:**
- El mutex se resetea pero no hay verificación consistente en todas las acciones
- Un jugador podría spamear revive/stabilize rápidamente
- ACE3 tiene sus propios cooldowns de tratamiento que pueden entrar en conflicto

**Solución necesaria:**
- Implementar cooldown explícito entre acciones de revive
- Sincronizar con cooldowns de ACE3 medical

---

### 7. INPUT BLOCKING EN INCONSCIENTE (ALTO)

**Ubicación:** `client/clientEvents/onKeyPress.sqf:192-198`
```sqf
// Block 3rd person and group cam while injured
if (!_handled && _key in (actionKeys "PersonView" + actionKeys "TacticalView")) then
{
    if (UNCONSCIOUS) then
    {
        _handled = true;
    };
};
```

**Problema:**
- Solo se bloquean cámaras, pero ACE3 bloquea TODOS los inputs
- LastResort (backspace) y Suicide (spacebar) en líneas 147-157 pueden no ejecutarse
- El jugador queda completamente indefenso sin poder usar últimas opciones

**Solución necesaria:**
- Detectar específicamente cuando ACE3 tiene el control de inconsciencia
- Permitir excepciones para teclas críticas (lastResort, suicide)

---

## Soluciones Propuestas

### SOLUCIÓN 1: Fix para UNCONSCIOUS macro

**Archivo:** `addons/far_revive/FAR_defines.sqf`

```sqf
// CAMBIO: Verificar tanto ACE3 como FAR states
#define UNCONSCIOUS(UNIT) ((UNIT getVariable ["ACE_isUnconscious", false]) || {(UNIT getVariable ["FAR_isUnconscious", 0]) == 1})
```

### SOLUCIÓN 2: Fix para STABILIZED macro

**Archivo:** `addons/far_revive/FAR_defines.sqf`

```sqf
// CAMBIO: Verificar ambos sistemas
#define STABILIZED(UNIT) ((UNIT getVariable ["FAR_isStabilized", 0]) == 1 || {(UNIT call ACE_medical_fnc_isInStableCondition)})
```

### SOLUCIÓN 3: Fix para LastResort con ACE3

**Archivo:** `client/clientEvents/onKeyPress.sqf`

Agregar al inicio del archivo, después de las definiciones:

```sqf
// Detectar si ACE3 está manejando la inconsciencia
#define ACE3_UNCONSCIOUS (player getVariable ["ACE_isUnconscious", false])
```

Y modificar la sección de inconsciente (líneas 145-158):

```sqf
else // UNCONSCIOUS
{
    // Forzar procesamiento de teclas críticas incluso si ACE3 bloquea inputs
    if (_key == 57) then // spacebar
    {
        execVM "client\functions\confirmSuicide.sqf";
        _handled = true;
    };

    if (_key == 14) then // backspace - LAST RESORT
    {
        // Verificar explícitamente que podemos ejecutar lastResort
        if (alive player && !(player getVariable ["performingDuty", false])) then
        {
            execVM "addons\far_revive\FAR_lastResort.sqf";
            _handled = true;
        };
    };
};
```

### SOLUCIÓN 4: Mejorar detección de causa de muerte

**Archivo:** `client/clientEvents/onKilled.sqf`

Modificar líneas 27-31:

```sqf
// Mejorar detección de causa de muerte con ACE3
if ((_player getVariable ["ACE_isUnconscious", false] || {(_player getVariable ["FAR_isUnconscious", 0]) == 1}) && _deathCause isEqualTo []) then
{
    // Verificar si hubo broadcast de herida o bleeding de ACE3
    private _wasBleeding = [_player] call ace_medical_fnc_getBloodLoss > 0;
    private _hadInjury = _player getVariable ["FAR_injuryBroadcast", false];
    
    _deathCause = [["kill", "bleedout"] select (_hadInjury || _wasBleeding)];
    _player setVariable ["A3W_deathCause_local", _deathCause];
};
```

### SOLUCIÓN 5: Eliminar variable obsoleta

**Archivo:** `addons/far_revive/FAR_Player_Unconscious.sqf`

Eliminar línea 286:
```sqf
// ELIMINAR: _unit setVariable ["ace_sys_wounds_uncon", true];
```

**Archivo:** `addons/far_revive/FAR_revive_init.sqf`

Eliminar línea 42:
```sqf
// ELIMINAR: _this setVariable ["ace_sys_wounds_uncon", false];
```

Y actualizar referencias en `FAR_Mute_ACRE` (líneas 91-110) para usar `ACE_isUnconscious`:

```sqf
// CAMBIAR de:
if ((player getVariable["ace_sys_wounds_uncon", false])) then
// A:
if ((player getVariable["ACE_isUnconscious", false])) then
```

### SOLUCIÓN 6: Sincronizar FAR_isStabilized con ACE3

**Archivo:** `addons/far_revive/FAR_revive_funcs.sqf`

En `FAR_HandleTreating`, después de estabilizar (línea 134-136):

```sqf
// Después de:
_target setVariable ["FAR_isStabilized", 1, true];
_target setVariable ["FAR_handleStabilize", true, true];

// AGREGAR: Sincronizar con ACE3
[_target, true] call ace_medical_fnc_setStable;
```

### SOLUCIÓN 7: Prevenir exploit de revive dance

**Archivo:** `addons/far_revive/FAR_revive_funcs.sqf`

Agregar cooldown en `FAR_Check_Revive` y `FAR_Check_Stabilize`:

```sqf
// Agregar al inicio de FAR_Check_Revive y FAR_Check_Stabilize
private _lastActionTime = player getVariable ["FAR_lastActionTime", 0];
if (diag_tickTime - _lastActionTime < 2) exitWith { false }; // 2 segundos de cooldown
```

Y al final de `FAR_HandleTreating`:

```sqf
_healer setVariable ["FAR_lastActionTime", diag_tickTime];
```

---

## Verificación de Killfeed

El killfeed debería funcionar correctamente SI:

1. ✅ `FAR_killerUnit` se establece correctamente antes de la muerte
2. ✅ `A3W_deathCause_local` refleja la causa correcta
3. ✅ `fn_killBroadcast` puede leer las variables del killer

**Puntos a verificar:**

- En `FAR_HandleDamage_EH.sqf`, asegurarse de que `_source` e `_instigator` se pasan correctamente a `FAR_setKillerInfo`
- En `FAR_Player_Unconscious.sqf`, la línea 112 llama a `FAR_findKiller` - esto debe ejecutarse ANTES de que ACE3 tome control
- En `onKilled.sqf`, las líneas 84-86 leen las variables `FAR_killer*` - deben estar disponibles

**Recomendación adicional:** Agregar logging temporal para debuggear:

```sqf
// En onKilled.sqf, antes de llamar a killBroadcast
diag_log format ["KILLFEED DEBUG: killer=%1, cause=%2, unconscious=%3", 
    _killer, _deathCause, _player getVariable ["ACE_isUnconscious", false]];
```

---

## Lista de Archivos a Modificar

1. `addons/far_revive/FAR_defines.sqf` - Macros UNCONSCIOUS y STABILIZED
2. `addons/far_revive/FAR_Player_Unconscious.sqf` - Eliminar ace_sys_wounds_uncon
3. `addons/far_revive/FAR_revive_init.sqf` - Eliminar ace_sys_wounds_uncon, actualizar MuteACRE
4. `addons/far_revive/FAR_revive_funcs.sqf` - Sincronizar estabilización, agregar cooldowns
5. `client/clientEvents/onKeyPress.sqf` - Fix para lastResort con ACE3
6. `client/clientEvents/onKilled.sqf` - Mejorar detección de causa de muerte

---

## Testing Recomendado

Después de aplicar los fixes:

1. **Test Inconsciencia:**
   - Ser herido hasta quedar inconsciente
   - Verificar que aparece UI de bleedout
   - Verificar que otros jugadores ven icono de inconsciente

2. **Test LastResort:**
   - Quedar inconsciente con explosivo en inventario
   - Presionar Backspace
   - Verificar que explota y muere

3. **Test Killfeed:**
   - Ser eliminado por otro jugador
   - Verificar que killfeed muestra killer correcto
   - Verificar que causa de muerte es correcta

4. **Test Revive:**
   - Ser estabilizado por médico
   - Ser revivido completamente
   - Verificar que no hay freeze o bugs de animación

5. **Test Anti-Exploit:**
   - Intentar spamear revive/stabilize
   - Verificar que cooldown funciona
   - Intentar revive dance (matar y revivir rápidamente)
