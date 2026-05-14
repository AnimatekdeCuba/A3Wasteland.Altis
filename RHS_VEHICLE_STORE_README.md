# RHS Vehicle Store - Nueva Implementación

## Descripción
Esta es una nueva implementación de la tienda de vehículos con soporte dinámico para todos los vehículos RHS, con cálculo automático de precios basado en variantes y features.

## Archivos Creados

### `/client/systems/vehicleStoreNew/`
- `rhsVehicleConfig.sqf` - Configuración de precios, modificadores y listas negras
- `parseRHSVehicles.sqf` - Funciones para parsear classnames RHS automáticamente
- `loadVehicleStoreNew.sqf` - Script de carga del diálogo
- `populateVehicleStoreNew.sqf` - Llena las listas de vehículos
- `vehicleStoreNew_handlers.sqf` - Handlers para interacción del usuario

### `/client/systems/vehicleStoreNew/dialog/`
- `vehiclestoreNew_defines.hpp` - Definiciones de IDC
- `vehiclestoreNew_settings.hpp` - Configuración del diálogo GUI

## Características Principales

### 1. Precio Dinámico sin Cargo por Texturas
- Los precios se calculan automáticamente basándose en:
  - **Precio base** del tipo de vehículo (M998, M1078, etc.)
  - **Modificadores por variante** (flatbed, ammo, repair, etc.)
  - **Modificadores por armamento** (M2, TOW, MK19, etc.)
- **Las texturas NO afectan el precio** (según requerimiento)

### 2. Agrupación Inteligente de Vehículos
- Los vehículos similares se agrupan por nombre base
- Ejemplo: Todos los M998 aparecen como un solo entry con sub-opciones

### 3. Soporte para Lista Negra Editable
```sqf
// En rhsVehicleConfig.sqf, editar rhsVehicleBlacklist:
rhsVehicleBlacklist = compileFinal str
[
    ["rhsusf_M977A4_AMMO_usarmy_d", "Demasiado caro"],
    ["rhs_vehicle_classname", "Razón"]
];
```

### 4. Capacidad R3F Visible
- Muestra la capacidad de transporte de carga según R3F_LOG
- Se actualiza dinámicamente con cada selección

### 5. UI Mejorada
- **Lista principal izquierda**: Vehículos base
- **Sublistas derecha**: Variantes, texturas, features
- **Vista previa 3D central**: Se actualiza con cambios
- **Descripción abajo**: Info del vehículo
- **Precio abajo-derecha**: Se actualiza con el "pedido"
- **Texturas a la derecha**: Sin costo adicional

### 6. Menú de Acción Diferenciado
En el NPC de la tienda verás:
- `Open Vehicle Store (Legacy)` - Tienda original
- `Open RHS Vehicle Store (NEW)` - Nueva tienda dinámica

### 7. Popup de Confirmación
- Similar al sistema actual
- Confirmación/cancelación antes de comprar

## Configuración de Precios

### Editar Precios Base
En `rhsVehicleConfig.sqf`:
```sqf
rhsVehicleBasePrices = compileFinal str
[
    ["MRZR", 3900],
    ["M1025", 5000],
    ["M998", 4000],
    // ... añadir más
];
```

### Editar Modificadores por Variante
```sqf
rhsVehicleVariantModifiers = compileFinal str
[
    ["flatbed", 500],      // Cama plana +$500
    ["ammo", 50000],       // Munición +$50,000
    ["repair", 30000],     // Reparación +$30,000
    ["open", -200],        // Abierto -$200
    // ... añadir más
];
```

### Editar Modificadores por Armamento
```sqf
rhsVehicleFeatureModifiers = compileFinal str
[
    ["m2", 3000],          // M2 Browning +$3,000
    ["tow", 10000],        // Sistema TOW +$10,000
    ["mk19", 4000],        // MK19 +$4,000
    // ... añadir más
];
```

## Futuro: Sistema de Demanda y Precios Dinámicos

Para implementar el sistema de economía dinámica (punto 6):

### Ideas de Implementación:
1. **Contador Global**: Database que trackea compras/ventas
2. **Demanda**: Si un vehículo se compra mucho → precio de compra sube
3. **Oferta**: Si hay muchos en el servidor → precio de venta baja
4. **Stock**: Out of stock si demasiados del mismo tipo

### Estructura Sugerida:
```sqf
// server\systems\economy\vehicleDemand.sqf
A3W_vehicleDemand = 
{
    "M998": {
        "totalOwned": 15,
        "purchasesLastHour": 5,
        "basePrice": 4000,
        "currentBuyPrice": 4200,  // +5% por demanda
        "currentSellPrice": 3800, // -5% por oferta
        "inStock": true
    }
}
```

## Integración con R3F_LOG

Para actualizar la configuración de R3F_LOG con vehículos RHS:

```sqf
// addons\R3F_LOG\config.sqf
R3F_LOG_CFG_can_transport_cargo = R3F_LOG_CFG_can_transport_cargo +
[
    ["ACE_Truck5tRepair", 35],
    ["rhsusf_M998_d_2dr", 40],
    ["rhsusf_M1078A1P2_D_fmtv_usarmy", 100],
    // ... añadir todos los vehículos RHS necesarios
];
```

## Notas Importantes

1. **Los patrones de classnames RHS no son 100% consistentes** - El parser hace lo mejor posible pero puede haber casos edge
2. **Edición manual disponible** - Para casos particulares, editar directamente en `rhsVehicleConfig.sqf`
3. **Compatibilidad** - La tienda legacy sigue funcionando, esta es una opción adicional
4. **Todos los vehículos RHS** - Incluye todas las facciones (US Army, Russian, Insurgents, etc.)

## Instalación

1. Los archivos ya están en `/client/systems/vehicleStoreNew/`
2. El menú de acción ya está integrado en `setupStoreNPC.sqf`
3. Para usar: Interactuar con el NPC de Vehicle Store y seleccionar "Open RHS Vehicle Store (NEW)"

## Solución de Problemas

### Vehículo no aparece:
- Verificar que no esté en la lista negra
- Verificar que el classname sea correcto
- Checkear filters de side/faction

### Precio incorrecto:
- Revisar modificadores en `rhsVehicleConfig.sqf`
- Verificar que el parser identifica correctamente las variantes

### Error en la consola:
- Revisar logs del cliente (.rpt)
- Verificar que todos los archivos están cargados

