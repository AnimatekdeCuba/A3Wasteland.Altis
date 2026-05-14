// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//  @file Version: 2.0
//  @file Name: rhsVehicleConfig.sqf
//  @file Author: Custom implementation for RHS vehicles
//  @file Created: 2024
//  @file Args: []

// ============================================================================
// CONFIGURACIÓN DE PRECIOS PARA VEHÍCULOS RHS
// Estructura: precio base + modificadores por variante + modificadores por feature
// Los precios son editables fácilmente por el editor de misión
// ============================================================================

// Precios base por tipo de vehículo (se pueden editar fácilmente)
// Estos precios sirven como fallback si no hay un precio específico definido
rhsVehicleBasePrices = compileFinal str
[
	// Vehículos ligeros
	["MRZR", 3900],
	["M1025", 5000],
	["M998", 4000],
	["UAZ", 4000],
	["HMMWV", 5000],
	["Tigr", 9000],
	
	// Camiones medianos
	["M1078", 5500],
	["M1083", 6500],
	["M1084", 7500],
	["M1085", 12000],
	["FMTV", 6000],
	
	// Camiones pesados
	["M977", 6000],
	["M978", 8000],
	["M984", 7000],
	["M985", 8500],
	["HEMTT", 8000],
	
	// Blindados
	["M1117", 15000],
	["M1126", 18000],
	["M1134", 20000],
	["M1128", 22000],
	["M1130", 19000],
	["M1133", 17000],
	["Stryker", 20000],
	
	// Tanques
	["M1A1", 130000],
	["M1A2", 150000],
	["T72", 110000],
	["T80", 120000],
	["T90", 135000],
	["T14", 160000],
	
	// Helicópteros
	["UH60", 30000],
	["AH64", 550000],
	["CH47", 40000],
	["Mi8", 22000],
	["Mi24", 530000],
	["Ka52", 360000],
	["MH6", 70000],
	
	// Aviones
	["A10", 650000],
	["SU25", 550000],
	["SU34", 700000],
	["MIG29", 600000],
	["TU95", 800000],
	
	// APC/IFV
	["M2A2", 95000],
	["M2A3", 100000],
	["BMP1", 95000],
	["BMP2", 100000],
	["BMP3", 120000],
	["BTR80", 85000],
	["BMD", 80000]
];

// Modificadores por variante de carrocería
// Se suman al precio base del vehículo
rhsVehicleVariantModifiers = compileFinal str
[
	// Variantes de camiones
	["flatbed", 500],      // Cama plana (+capacidad)
	["flat", 500],         // Alias de flatbed
	["open", -200],        // Abierto (más barato)
	["box", 1000],         // Caja cerrada
	["ammo", 50000],       // Munición (muy caro)
	["repair", 30000],     // Reparación
	["fuel", 20000],       // Combustible
	["medical", 5000],     // Médico
	["med", 5000],         // Alias de medical
	["mev", 5000],         // MEV (Medical Evacuation)
	["cp", 2000],          // Puesto de comando
	["cargo", 300],        // Carga general
	["heavy", 2000],       // Versión pesada
	["ap2", 1500],         // AP-2 (puesto de mando)
	["r142", 1500],        // R-142 (comunicaciones)
	
	// Variantes de blindaje
	["bkit", 4000],        // Kit de blindaje B
	["b_kit", 4000],       // Alias
	["armored", 5000],     // Blindado
	["unarmed", -5000],    // Desarmado (más barato)
	
	// Variantes de puertas/techos
	["2dr", 0],            // 2 puertas
	["4dr", 500],          // 4 puertas
	["fulltop", 200],      // Techo completo
	["halftop", 100],      // Medio techo
	["snorkel", 50],       // Snorkel
	["s", 50],             // Alias de snorkel
	
	// Artillería/sistemas especiales
	["zu23", 15000],       // ZU-23 AA montado
	["bm21", 65000],       // BM-21 Grad
	["bmkt", 3000],        // BMKT (montaje de arma)
	["pmp", 3000],         // PMP (punto móvil de combustible)
	["hq", 2500],          // Cuartel general
	["deploy", 3000]       // Sistema deployable
];

// Modificadores por armamento/features
// Se suman al precio base
rhsVehicleFeatureModifiers = compileFinal str
[
	// Ametralladoras
	["m2", 3000],          // M2 Browning .50cal
	["m240", 2500],        // M240
	["mk19", 4000],        // MK19 lanzagranadas
	["pkm", 2000],         // PKM rusa
	["dshkm", 3000],       // DShKM rusa
	["ags30", 3500],       // AGS-30 rusa
	["spg9", 4000],        // SPG-9 sin retroceso
	
	// Sistemas antitanque
	["tow", 10000],        // Sistema TOW
	["javelin", 12000],    // Javelin
	["konkurs", 8000],     // Konkurs ruso
	["atgm", 10000],       // ATGM genérico
	["9k113", 12000],      // 9K113 Konkurs
	
	// Torretas/sistemas remotos
	["crows", 15000],      // CROWS torreta remota
	["rcws", 12000],       // RCWS torreta remota
	["turret", 5000],      // Torreta genérica
	
	// Sistemas de helicóptero
	["upk23", 6000],       // Pod UPK-23
	["fab", 8000],         // Bombas FAB
	["s13", 7000],         // Cohetes S-13
	["ffar", 4000],        // Pods FFAR
	["gs", 3000],          // Gunship
	["cs", 3000],          // Close Support
	["aa", 4000],          // Anti-aéreo
	["cas", 5000],         // CAS (Close Air Support)
	["cluster", 6000],     // Bombas de racimo
	["kh29", 8000],        // Misil KH-29
	
	// Accesorios de armas
	["npz", 1000],         // Mira NPZ
	["gp25", 2000],        // Lanzagranadas GP-25
	["bg", 2000],          // Lanzagranadas BG
	["grip", 500],         // Agarre delantero
	["zenitco", 1500],     // Accesorios Zenitco
	["b33", 1000],         // Culata B-33
	["kac", 1500],         // Culata KAC
	["sopmod", 1500],      // Culata SOPMOD
	["mstock", 1000],      // Culata Magpull
	["lmt", 1500],         // Cañón LMT
	["m203", 2000],        // Lanzagranadas M203
	["m320", 2200],        // Lanzagranadas M320
	
	// Sistemas de protección
	["esss", 3000],        // Sistema ESSS (heli)
	["uik", 2000],         // Kit UIK
	["tuski", 5000],       // Kit TUSK
	["tusky", 5000],       // Alias TUSK
	["sep", 10000],        // Paquete SEP
	["aim", 8000],         // Paquete AIM
	["fep", 7000],         // Paquete FEP
	["hc", 9000],          // Paquete HC
	["gpk", 3000],         // Kit de protección GPK
	["ogpk", 4000],        // Kit de protección OGPK
	["asv", 3000],         // Kit ASV
	["sicps", 2500],       // Sistema SICPS
	["mctags", 2000],      // Sistema MCTAGS
	["rsv", 2000],         // Sistema RSV
	["tcv", 2500],         // Sistema TCV
	["gmv", 5000],         // Vehículo de movilidad GMV
	["sag2", 4000],        // Sistema SAG2
	["m134d", 8000],       // Ametralladora M134D
	
	// Radar/sensores
	["radar", 2000],       // Radar
	["sensor", 1500],      // Sensores avanzados
	["gps", 500],          // GPS
	["sat", 1000],         // Satélite
	["noradar", -10000]    // Sin radar (descuento)
];

// Patrones de texturas RHS (sin cargo adicional)
rhsTexturePatterns = compileFinal str
[
	// Texturas US Army
	["usarmy", "US Army"],
	["usa", "US Army"],
	["usmc", "USMC"],
	["socom", "SOCOM"],
	["desert", "Desert"],
	["d", "Desert"],
	["tan", "Desert"],
	["woodland", "Woodland"],
	["wd", "Woodland"],
	["w", "Woodland"],
	["wl", "Woodland"],
	["winter", "Winter"],
	["win", "Winter"],
	["snow", "Snow"],
	["aor1", "AOR1"],
	["aor2", "AOR2"],
	["ucp", "UCP"],
	["cw", "Cold Weather"],
	
	// Texturas rusas
	["msv", "MSV"],          // Rusia: Digital Flora
	["vdv", "VDV"],          // Rusia: VDV Airborne
	["vmf", "VMF"],          // Rusia: VMF Naval
	["vv", "VV"],            // Rusia: VV National Guard
	["vvs", "VVS"],          // Rusia: VVS Air Force
	["vvsc", "VVSC"],        // Rusia: VV Special Colors
	["tv", "TV"],            // Rusia: Tres colores
	["ins", "Insurgente"],
	["ru", "Ruso"],
	["russian", "Ruso"],
	["green", "Verde"],
	["g", "Verde"],
	["brown", "Marrón"],
	["br", "Marrón"],
	["camo", "Camuflaje"],
	["3camo", "3 Camo"],
	["emr", "EMR"],
	["flora", "Flora"],
	["barracks", "Barracas"],
	
	// Texturas Georgia/CDF
	["cdf", "CDF"],
	["b_cdf", "B CDF"],
	
	// Texturas Serbia/SAF
	["saf", "SAF"],
	["olive", "Olive"],
	
	// Texturas HIDF/NATO
	["hidf", "HIDF"],
	["natodesert", "NATO Desert"],
	["natowoodland", "NATO Woodland"],
	["hex", "Hexacam"],
	["ghex", "Green Hex"],
	
	// Texturas especiales
	["black", "Black"],
	["grey", "Grey"],
	["gray", "Grey"],
	["civilian", "Civilian"],
	["civ", "Civilian"],
	["generic", "Generic"],
	["old", "Old"],
	["dubna", "Dubna"],
	["irkutsk", "Irkutsk"],
	["tambov", "Tambov"],
	["chelyabinsk", "Chelyabinsk"],
	["blueonblue", "Blue on Blue"]
];

// ============================================================================
// LISTA NEGRA DE VEHÍCULOS NO DISPONIBLES
// Añadir aquí classnames completos que no deben aparecer en la tienda
// Útil para componentes, vehículos rotos, o vehículos no deseados
// ============================================================================
rhsVehicleBlacklist = compileFinal str
[
	// Componentes (asientos, paracaídas, puertas, etc.) - NO operables
	["_seat", "Componente: Asiento"],
	["_parachute", "Componente: Paracaídas"],
	["_wing_left", "Componente: Ala izquierda"],
	["_wing_right", "Componente: Ala derecha"],
	["_door_gunner", "Componente: Puerta gunner"],
	["_door_pilot", "Componente: Puerta piloto"],
	["_balonetes", "Componente: Balones"],
	["_blade", "Componente: Palas"],
	["_ejection_vest", "Componente: Chaleco eyección"],
	["_rps_rocket", "Componente: Cohete RPS"],
	
	// Vehículos de remolque (artillería estática no operable)
	["rhs_D30_towingVehicle", "Artillería remolcada (no operable)"],
	["rhs_ZU23_towingVehicle", "ZU-23 remolcado (no operable)"],
	["rhs_M119_towingVehicle", "M119 remolcado (no operable)"],
	
	// Vehículos no operables o de prueba específicos
	["rhs_bmd1r", "Variante de mando no operable"],
	["rhs_ka52_blade", "Palas de helicóptero (componente)"],
	
	// Ejemplos adicionales (descomentar según necesidad):
	// ["rhsusf_m998_d_2dr", "Ejemplo de vehículo específico a excluir"]
];

// ============================================================================
// PRECIOS ESPECÍFICOS POR CLASSNAME (opcional, sobrescribe cálculo automático)
// Formato: ["classname", precio]
// Usar para vehículos con precios especiales que no siguen la lógica estándar
// Basado en storeConfig.sqf existente
// ============================================================================
rhsVehicleSpecificPrices = compileFinal str
[
	// Tanques USA (storeConfig.sqf)
	["rhsusf_m109d_usarmy", 1000000],
	["rhsusf_m1a1hc_wd", 130600],
	["rhsusf_m1a1fep_d", 130000],
	["rhsusf_m1a1aimd_usarmy", 150000],
	["rhsusf_m1a1aim_tuski_d", 160000],
	["rhsusf_m1a2sep1d_usarmy", 100000],
	["rhsusf_m1a2sep1tuskiid_usarmy", 165000],
	
	// Artillería/APOYOS Rusia
	["RHS_BM21_MSV_01", 650000],
	["rhs_9k79", 1000000],
	["rhs_9k79_K", 1000000],
	["rhs_2s3_tv", 1000000],
	["rhs_sprut_vdv", 80000],
	
	// Tanques Rusia
	["rhs_t72ba_tv", 110000],
	["rhs_t80", 119000],
	["rhs_t80a", 120000],
	["rhs_t80bk", 125000],
	["rhs_t80bvk", 127000],
	["rhs_t80u45m", 130000],
	["rhs_t90_tv", 135000],
	["rhs_t90a_tv", 140000],
	
	// Helicópteros USA
	["RHS_MELB_H6M", 5500],
	["RHS_MELB_AH6M", 70000],
	["RHS_AH64DGrey", 550000],
	["RHS_AH64D_wd", 550000],
	["RHS_AH64D_noradar", 530000],
	["RHS_AH1Z", 555000],
	["RHS_CH_47F", 25000],
	["RHS_UH1Y_FFAR_d", 60000],
	["RHS_UH1Y_d", 60000],
	["RHS_UH1Y_UNARMED_d", 25000],
	["RHS_UH60M", 55000],
	["RHS_UH60M_ESSS", 30500],
	["RHS_UH60M2", 30000],
	["RHS_UH60M_MEV2", 30500],
	["RHS_UH60M_MEV", 31000],
	["rhsusf_CH53E_USMC_D", 40000],
	
	// Helicópteros Rusia
	["RHS_Mi24P_vvsc", 530000],
	["RHS_Mi24V_vvs", 550000],
	["RHS_Mi24Vt_vvs", 5000],
	["rhs_mi28n_vvs", 650000],
	["RHS_Mi8AMT_vdv", 5500],
	["RHS_Mi8mt_Cargo_vdv", 5700],
	["RHS_Mi8mt_vdv", 45000],
	["RHS_Mi8mtv3_Cargo_vvsc", 85000],
	["RHS_Mi8MTV3_vvsc", 95500],
	["RHS_Mi8MTV3_heavy_vdv", 100000],
	["RHS_Mi8AMTSh_vvsc", 120000],
	["RHS_Ka52_vvsc", 360000],
	["rhs_ka60_c", 4500],
	
	// Aviones
	["RHS_Su25SM_vvs", 550000],
	["RHS_Ka52_vvs", 360000],
	["RHS_MiG29S_vvs", 600000],
	["RHS_TU95MS_vvs", 800000]
];

// Función para obtener precio base de un vehículo
fn_getRHSVehicleBasePrice =
{
	params ["_vehicleName"];
	
	private _basePrice = 5000; // Precio por defecto
	
	{
		if (_x select 0 == _vehicleName) exitWith
		{
			_basePrice = _x select 1;
		};
	} forEach (call rhsVehicleBasePrices);
	
	_basePrice
};

// Función para calcular modificador por variante
fn_getRHSVariantModifier =
{
	params ["_variant"];
	
	private _modifier = 0;
	_variant = toLower _variant;
	
	{
		if (_variant find _x != -1) exitWith
		{
			_modifier = _x select 1;
		};
	} forEach (call rhsVehicleVariantModifiers);
	
	_modifier
};

// Función para calcular modificador por feature
fn_getRHSFeatureModifier =
{
	params ["_feature"];
	
	private _modifier = 0;
	_feature = toLower _feature;
	
	{
		if (_feature find _x != -1) exitWith
		{
			_modifier = _x select 1;
		};
	} forEach (call rhsVehicleFeatureModifiers);
	
	_modifier
};

// Función para identificar textura RHS
fn_identifyRHSTexture =
{
	params ["_textureCode"];
	
	private _textureName = "Default";
	_textureCode = toLower _textureCode;
	
	{
		if (_textureCode find _x != -1) exitWith
		{
			_textureName = _x select 1;
		};
	} forEach (call rhsTexturePatterns);
	
	_textureName
};

// Función para verificar si un vehículo está en la lista negra
fn_isRHSVehicleBlacklisted =
{
	params ["_classname"];
	
	private _blacklisted = false;
	
	{
		if (_x select 0 == _classname || {_classname find (_x select 0) != -1}) exitWith
		{
			_blacklisted = true;
		};
	} forEach (call rhsVehicleBlacklist);
	
	_blacklisted
};

// Función para obtener precio específico de un classname (si existe)
fn_getRHSVehicleSpecificPrice =
{
	params ["_classname"];
	
	private _price = -1;
	
	{
		if (_x select 0 == _classname) exitWith
		{
			_price = _x select 1;
		};
	} forEach (call rhsVehicleSpecificPrices);
	
	_price
};

// Función para obtener capacidad R3F de un vehículo
fn_getR3FCargoCapacity =
{
	params ["_classname"];
	
	private _capacity = 0;
	
	// Buscar en la configuración R3F_LOG
	if (isNil "R3F_LOG_CFG_can_transport_cargo") then
	{
		// Si R3F no está cargado aún, retornar 0
		_capacity = 0;
	}
	else
	{
		{
			private _classPattern = _x select 0;
			
			// Verificar coincidencia exacta o por herencia
			if (_classname == _classPattern || {_classname isKindOf _classPattern}) exitWith
			{
				_capacity = _x select 1;
			};
		} forEach R3F_LOG_CFG_can_transport_cargo;
	};
	
	_capacity
};

// Función principal para calcular precio de vehículo RHS
fn_calculateRHSVehiclePrice =
{
	params ["_classname", "_displayName"];
	
	// 1. Verificar si hay precio específico definido
	private _specificPrice = [_classname] call fn_getRHSVehicleSpecificPrice;
	if (_specificPrice > 0) exitWith { _specificPrice };
	
	// 2. Obtener nombre base del vehículo (sin sufijos de variante)
	private _baseName = _classname;
	{
		// Eliminar sufijos comunes
		_baseName = _baseName regexReplace [("(?i)" + _x), ""];
	} forEach ["_vdv", "_msv", "_tv", "_vvs", "_vvsc", "_vmf", "_vv", "_wd", "_d", "_w", "_s", "_camo", "_ffv", "_sts", "_m2", "_mk19", "_crows", "_gpk", "_ogpk", "_m240", "_m2crows", "_mk19crows", "_m2_lras3", "_uik", "_tuski", "_sep", "_aim", "_fep", "_hc", "_b", "_k", "_p", "_pk", "_r", "_at", "_kh29", "_cas", "_cluster", "_upk23", "_fab", "_s13", "_g", "_gp", "_r142", "_repair", "_ap2", "_ammo", "_zu23", "_flat", "_open", "_cargo", "_mev", "_esss", "_ffar", "_unarmed", "_10", "_light", "_gs", "_cs", "_aa", "_noradar", "_black", "_blade", "_blueonblue", "_generic", "_ext", "_old", "_dubna", "_irkutsk", "_tambov", "_chelyabinsk", "_1", "_2", "_3", "_4", "_5", "_6", "_7", "_8", "_9", "_0", "_01", "_02", "_03", "_04", "_05", "_usarmy", "_usmc", "_socom", "_ins", "_cdf", "_nat", "_hidf", "_saf"];
	
	// Limpiar guiones bajos sobrantes al final
	while {_baseName select [count _baseName - 1] == "_"} do { _baseName = _baseName select [0, count _baseName - 1]; };
	if (_baseName == "") then { _baseName = _classname; };
	
	// 3. Obtener precio base
	private _price = [_baseName] call fn_getRHSVehicleBasePrice;
	
	// 4. Aplicar modificadores por variante
	private _variantModifier = [_classname] call fn_getRHSVariantModifier;
	_price = _price + _variantModifier;
	
	// 5. Aplicar modificadores por features/armamento
	private _featureModifier = [_classname] call fn_getRHSFeatureModifier;
	_price = _price + _featureModifier;
	
	// Asegurar precio mínimo
	if (_price < 1000) then { _price = 1000 };
	
	_price
};
