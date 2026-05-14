// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//  @file Version: 2.0
//  @file Name: parseRHSVehicles.sqf
//  @file Author: Custom implementation for RHS vehicles
//  @file Created: 2024
//  @file Args: []

#include "rhsVehicleConfig.sqf"

// Función principal para parsear classnames RHS
fn_parseRHSVehicleClassname =
{
	params ["_classname"];
	
	private _result = 
	[
		"",     // 0: vehicleName (nombre base)
		[],     // 1: variants (variantes encontradas)
		[],     // 2: features (armamento/features)
		"",     // 3: texture (textura identificada)
		"",     // 4: faction (faccción)
		0       // 5: calculatedPrice (precio calculado)
	];
	
	// Convertir a string y lowercase para análisis
	private _classStr = toLower _classname;
	
	// Extraer nombre base del vehículo
	private _baseName = "";
	{
		if (_classStr find _x != -1) exitWith
		{
			_baseName = _x;
		};
	} forEach [
		"mrzr", "m1025", "m998", "m1078", "m1083", "m1084", "m1085",
		"m977", "m978", "m984", "m985", "m1117", "m1126", "m1134",
		"m1128", "m1130", "m1133", "m1a1", "m1a2", "t72", "t80", "t90",
		"uh60", "ah64", "ch47", "mi8", "mi24", "ka52", "a10", "f35",
		"su25", "su34", "uaz", "btr", "bmp", "brdm", "zil", "ural"
	];
	
	if (_baseName == "") then
	{
		// Intentar extraer del classname directamente
		_parts = splitString _classname "_";
		if (count _parts > 1) then
		{
			_baseName = _parts select 1;
		};
	};
	
	_result set [0, _baseName];
	
	// Identificar variantes
	private _variants = [];
	{
		private _pattern = _x select 0;
		private _variantName = _x select 1;
		
		if (_classStr find _pattern != -1) then
		{
			_variants pushBack _variantName;
		};
	} forEach [
		["flatbed", "Flatbed"],
		["flat", "Flatbed"],
		["open", "Open"],
		["box", "Box"],
		["ammo", "Ammo"],
		["repair", "Repair"],
		["fuel", "Fuel"],
		["medical", "Medical"],
		["med", "Medical"],
		["cp", "Command"],
		["cargo", "Cargo"],
		["2dr", "2 Doors"],
		["4dr", "4 Doors"],
		["fulltop", "Full Top"],
		["halftop", "Half Top"],
		["snorkel", "Snorkel"]
	];
	
	_result set [1, _variants];
	
	// Identificar features/armamento
	private _features = [];
	{
		private _pattern = _x select 0;
		private _featureName = _x select 1;
		
		if (_classStr find _pattern != -1) then
		{
			_features pushBack _featureName;
		};
	} forEach [
		["m2", "M2 Browning"],
		["mk19", "MK19"],
		["m240", "M240"],
		["tow", "TOW"],
		["m220", "TOW"],
		["javelin", "Javelin"],
		["agt", "AGT"],
		["rcws", "RCWS"],
		["crows", "CROWS"],
		["m252", "Mortar"],
		["aa", "AA"],
		["sam", "SAM"],
		["bkit", "Armor Kit"],
		["b_kit", "Armor Kit"]
	];
	
	_result set [2, _features];
	
	// Identificar textura
	private _texture = "Default";
	{
		private _pattern = _x select 0;
		private _textureName = _x select 1;
		
		if (_classStr find _pattern != -1) exitWith
		{
			_texture = _textureName;
		};
	} forEach [
		["usarmy", "US Army"],
		["desert", "Desert"],
		["_d_", "Desert"],
		["tan", "Desert"],
		["woodland", "Woodland"],
		["_wd", "Woodland"],
		["_w_", "Woodland"],
		["winter", "Winter"],
		["snow", "Snow"],
		["aor1", "AOR1"],
		["aor2", "AOR2"],
		["ucp", "UCP"],
		["ins", "Insurgent"],
		["ru", "Russian"],
		["emr", "EMR"],
		["flora", "Flora"],
		["vdv", "VDV"],
		["nato", "NATO"],
		["hex", "Hexacam"],
		["ghex", "Green Hex"]
	];
	
	_result set [3, _texture];
	
	// Identificar facción
	private _faction = "CIV";
	if (_classStr find "usarmy" != -1 || {_classStr find "usmc" != -1}) then
	{
		_faction = "WEST";
	}
	else
	{
		if (_classStr find "ins" != -1 || {_classStr find "ru" != -1} || {_classStr find "soviet" != -1}) then
		{
			_faction = "EAST";
		}
		else
		{
			if (_classStr find "ind" != -1 || {_classStr find "gua" != -1}) then
			{
				_faction = "INDEPENDENT";
			};
		};
	};
	
	_result set [4, _faction];
	
	// Calcular precio
	private _basePrice = [_baseName] call fn_getRHSVehicleBasePrice;
	private _variantModifier = 0;
	{
		_variantModifier = _variantModifier + ([_x] call fn_getRHSVariantModifier);
	} forEach _variants;
	
	private _featureModifier = 0;
	{
		_featureModifier = _featureModifier + ([_x] call fn_getRHSFeatureModifier);
	} forEach _features;
	
	private _totalPrice = _basePrice + _variantModifier + _featureModifier;
	_result set [5, _totalPrice];
	
	_result
};

// Función para agrupar vehículos por nombre base
fn_groupRHSVehicles =
{
	params ["_vehicleList"];
	
	private _groupedVehicles = [];
	
	{
		private _vehData = _x;
		private _classname = if (_vehData isEqualType "") then { _vehData } else { _vehData select 1 };
		
		// Verificar lista negra
		if ([_classname] call fn_isRHSVehicleBlacklisted) then
		{
			continue;
		};
		
		// Parsear classname
		private _parsed = [_classname] call fn_parseRHSVehicleClassname;
		private _baseName = _parsed select 0;
		
		// Buscar si ya existe este vehículo base
		private _existingIndex = -1;
		{
			if ((_x select 0) == _baseName) exitWith
			{
				_existingIndex = _forEachIndex;
			};
		} forEach _groupedVehicles;
		
		if (_existingIndex == -1) then
		{
			// Crear nueva entrada
			private _newEntry = [
				_baseName,           // 0: nombre base
				[_parsed],          // 1: array de variantes parseadas
				_classname          // 2: classname original (primero)
			];
			
			_groupedVehicles pushBack _newEntry;
		}
		else
		{
			// Añadir variante al existente
			(_groupedVehicles select _existingIndex select 1) pushBack _parsed;
		};
	} forEach _vehicleList;
	
	_groupedVehicles
};

// Función para obtener todas las texturas disponibles para un vehículo
fn_getAvailableTextures =
{
	params ["_classname"];
	
	private _textures = [];
	private _classStr = toLower _classname;
	
	{
		private _pattern = _x select 0;
		private _textureName = _x select 1;
		
		if (_classStr find _pattern != -1) then
		{
			_textures pushBack [_textureName, _pattern];
		};
	} forEach [
		["usarmy", "US Army"],
		["desert", "Desert"],
		["d", "Desert"],
		["tan", "Desert"],
		["woodland", "Woodland"],
		["wd", "Woodland"],
		["w", "Woodland"],
		["winter", "Winter"],
		["snow", "Snow"],
		["aor1", "AOR1"],
		["aor2", "AOR2"],
		["ucp", "UCP"],
		["ins", "Insurgent"],
		["ru", "Russian"],
		["emr", "EMR"],
		["flora", "Flora"],
		["vdv", "VDV"],
		["nato", "NATO"],
		["hex", "Hexacam"],
		["ghex", "Green Hex"]
	];
	
	// Eliminar duplicados
	_textures = _textures arrayIntersect _textures;
	
	_textures
};

// Función para obtener todas las variantes únicas de un grupo de vehículos
fn_getUniqueVariants =
{
	params ["_parsedVehicles"];
	
	private _uniqueVariants = [];
	private _variantNames = [];
	
	{
		private _variants = _x select 1;
		
		{
			if !(_x in _variantNames) then
			{
				_variantNames pushBack _x;
				_uniqueVariants pushBack _x;
			};
		} forEach _variants;
	} forEach _parsedVehicles;
	
	_uniqueVariants
};

// Función para obtener todos los features únicos
fn_getUniqueFeatures =
{
	params ["_parsedVehicles"];
	
	private _uniqueFeatures = [];
	private _featureNames = [];
	
	{
		private _features = _x select 2;
		
		{
			if !(_x in _featureNames) then
			{
				_featureNames pushBack _x;
				_uniqueFeatures pushBack _x;
			};
		} forEach _features;
	} forEach _parsedVehicles;
	
	_uniqueFeatures
};

// Función para encontrar el classname específico basado en selección
fn_findSpecificClassname =
{
	params ["_baseName", "_selectedVariants", "_selectedTexture"];
	
	private _foundClassname = "";
	
	// Esta función buscará en la lista completa de vehículos RHS
	// el classname que mejor coincida con las selecciones
	
	_foundClassname
};
