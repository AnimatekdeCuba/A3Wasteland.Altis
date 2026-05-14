// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//  @file Version: 2.0
//  @file Name: vehicleStoreNew_handlers.sqf
//  @file Author: Custom implementation for RHS vehicles
//  @file Created: 2024
//  @file Args: []

#include "dialog\vehiclestoreNew_defines.hpp"
#include "rhsVehicleConfig.sqf"
#include "parseRHSVehicles.sqf"
disableSerialization

// Variables globales para la selección actual
vehicleStoreNew_currentSelection = 
[
	"",     // 0: baseName
	[],     // 1: selectedVariants
	"",     // 2: selectedTexture
	[],     // 3: selectedFeatures
	"",     // 4: selectedClassname
	0      // 5: finalPrice
]

// Handler: Cuando se selecciona un vehículo de la lista principal
onVehicleSelectedNew =
{
	disableSerialization
	params ["_control"]
	
	private _dialog = ctrlParent _control
	private _vehlist = _dialog displayCtrl vehshopNew_veh_list
	private _variantList = _dialog displayCtrl vehshopNew_variant_list
	private _textureList = _dialog displayCtrl vehshopNew_texture_list
	private _featureList = _dialog displayCtrl vehshopNew_feature_list
	private _descCtrl = _dialog displayCtrl vehshopNew_description_ctrl
	private _priceCtrl = _dialog displayCtrl vehshopNew_price_ctrl
	private _capacityCtrl = _dialog displayCtrl vehshopNew_capacity_ctrl
	
	private _selIndex = lbCurSel _vehlist
	if (_selIndex == -1) exitWith {}
	
	private _vehData = call compile (_vehlist lbData _selIndex)
	_vehData params ["_baseName", "_parsedVehicles", "_firstClassname"]
	
	// Actualizar selección actual
	vehicleStoreNew_currentSelection set [0, _baseName]
	
	// Limpiar listas secundarias
	lbClear _variantList
	lbClear _textureList
	lbClear _featureList
	
	// Obtener variantes únicas
	private _uniqueVariants = [_parsedVehicles] call fn_getUniqueVariants
	{
		_varIndex = _variantList lbAdd _x
		_variantList lbSetData [_varIndex, _x]
	} forEach _uniqueVariants
	
	// Obtener texturas disponibles
	private _allTextures = []
	{
		private _classname = _x select 3 // classname original
		private _textures = [_classname] call fn_getAvailableTextures
		_allTextures append _textures
	} forEach _parsedVehicles
	
	// Eliminar duplicados
	_allTextures = _allTextures arrayIntersect _allTextures
	
	{
		_texIndex = _textureList lbAdd (_x select 0)
		_textureList lbSetData [_texIndex, _x select 1]
	} forEach _allTextures
	
	// Obtener features únicos
	private _uniqueFeatures = [_parsedVehicles] call fn_getUniqueFeatures
	{
		_featIndex = _featureList lbAdd _x
		_featureList lbSetData [_featIndex, _x]
	} forEach _uniqueFeatures
	
	// Actualizar descripción
	private _vehCfg = configFile >> "CfgVehicles" >> _firstClassname
	private _vehDisplayName = getText (_vehCfg >> "displayName")
	private _vehDesc = getText (_vehCfg >> "description")
	
	private _descText = format ["<t size='0.9'>%1</t><br/><t size='0.7'>%2</t>", _vehDisplayName, _vehDesc]
	_descCtrl ctrlSetStructuredText parseText _descText
	
	// Calcular precio inicial (primera variante)
	if (count _parsedVehicles > 0) then
	{
		private _firstParsed = _parsedVehicles select 0
		private _price = _firstParsed select 5
		vehicleStoreNew_currentSelection set [5, _price]
		
		_priceCtrl ctrlSetStructuredText parseText format ["<t size='1.2' color='#00ff00'>$%1</t>", [_price] call fn_numbersText]
		
		// Obtener capacidad R3F
		private _capacity = [_firstClassname] call fn_getR3FCargoCapacity
		if (_capacity > 0) then
		{
			_capacityCtrl ctrlSetStructuredText parseText format ["<t size='0.8'>R3F Capacity: %1 pts</t>", _capacity]
		}
		else
		{
			_capacityCtrl ctrlSetStructuredText parseText "<t size='0.8'>R3F Capacity: N/A</t>"
		}
	}
}

// Handler: Cuando se selecciona una variante
onVariantSelectedNew =
{
	disableSerialization
	params ["_control"]
	
	private _dialog = ctrlParent _control
	private _variantList = _dialog displayCtrl vehshopNew_variant_list
	private _priceCtrl = _dialog displayCtrl vehshopNew_price_ctrl
	
	private _selIndex = lbCurSel _variantList
	if (_selIndex == -1) exitWith {}
	
	private _selectedVariant = _variantList lbData _selIndex
	
	// Actualizar selección
	vehicleStoreNew_currentSelection set [1, [_selectedVariant]]
	
	// Recalcular precio
	[] call updateVehiclePriceNew
}

// Handler: Cuando se selecciona una textura
onTextureSelectedNew =
{
	disableSerialization
	params ["_control"]
	
	private _dialog = ctrlParent _control
	private _textureList = _dialog displayCtrl vehshopNew_texture_list
	
	private _selIndex = lbCurSel _textureList
	if (_selIndex == -1) exitWith {}
	
	private _selectedTexture = _textureList lbData _selIndex
	
	// Actualizar selección
	vehicleStoreNew_currentSelection set [2, _selectedTexture]
	
	// Nota: Las texturas no afectan el precio según requerimientos
}

// Handler: Cuando se selecciona un feature
onFeatureSelectedNew =
{
	disableSerialization
	params ["_control"]
	
	private _dialog = ctrlParent _control
	private _featureList = _dialog displayCtrl vehshopNew_feature_list
	
	private _selIndex = lbCurSel _featureList
	if (_selIndex == -1) exitWith {}
	
	private _selectedFeature = _featureList lbData _selIndex
	
	// Toggle feature en la selección
	private _currentFeatures = vehicleStoreNew_currentSelection select 3
	
	if (_selectedFeature in _currentFeatures) then
	{
		_currentFeatures = _currentFeatures - [_selectedFeature]
	}
	else
	{
		_currentFeatures pushBack _selectedFeature
	}
	
	vehicleStoreNew_currentSelection set [3, _currentFeatures]
	
	// Recalcular precio
	[] call updateVehiclePriceNew
}

// Función para actualizar el precio basado en selecciones
updateVehiclePriceNew =
{
	private _baseName = vehicleStoreNew_currentSelection select 0
	private _selectedVariants = vehicleStoreNew_currentSelection select 1
	private _selectedFeatures = vehicleStoreNew_currentSelection select 3
	
	// Obtener precio base
	private _basePrice = [_baseName] call fn_getRHSVehicleBasePrice
	
	// Sumar modificadores por variante
	private _variantModifier = 0
	{
		_variantModifier = _variantModifier + ([_x] call fn_getRHSVariantModifier)
	} forEach _selectedVariants
	
	// Sumar modificadores por feature
	private _featureModifier = 0
	{
		_featureModifier = _featureModifier + ([_x] call fn_getRHSFeatureModifier)
	} forEach _selectedFeatures
	
	// Precio total
	private _totalPrice = _basePrice + _variantModifier + _featureModifier
	vehicleStoreNew_currentSelection set [5, _totalPrice]
	
	// Actualizar UI
	disableSerialization
	private _dialog = findDisplay vehshopNew_DIALOG
	private _priceCtrl = _dialog displayCtrl vehshopNew_price_ctrl
	
	if (!isNull _priceCtrl) then
	{
		_priceCtrl ctrlSetStructuredText parseText format ["<t size='1.2' color='#00ff00'>$%1</t>", [_totalPrice] call fn_numbersText]
	}
}

// Función para confirmar compra
confirmPurchaseNew =
{
	disableSerialization
	
	private _dialog = findDisplay vehshopNew_DIALOG
	private _vehlist = _dialog displayCtrl vehshopNew_veh_list
	private _variantList = _dialog displayCtrl vehshopNew_variant_list
	private _textureList = _dialog displayCtrl vehshopNew_texture_list
	
	// Verificar selecciones
	private _selIndex = lbCurSel _vehlist
	if (_selIndex == -1) exitWith { hint "Selecciona un vehículo primero" }
	
	private _varIndex = lbCurSel _variantList
	if (_varIndex == -1) exitWith { hint "Selecciona una variante" }
	
	private _texIndex = lbCurSel _textureList
	if (_texIndex == -1) exitWith { hint "Selecciona una textura" }
	
	// Obtener datos
	private _vehData = call compile (_vehlist lbData _selIndex)
	private _selectedVariant = _variantList lbData _varIndex
	private _selectedTexture = _textureList lbData _texIndex
	private _finalPrice = vehicleStoreNew_currentSelection select 5
	
	// Verificar dinero
	private _playerMoney = player getVariable ["cmoney", 0]
	if (_finalPrice > _playerMoney) exitWith 
	{ 
		hint parseText format ["<t color='#ff0000'>No tienes suficiente dinero</t><br/>Necesitas: $%1<br/>Tienes: $%2", [_finalPrice] call fn_numbersText, [_playerMoney] call fn_numbersText]
	}
	
	// Mostrar confirmación
	private _confirmDialog = createSimpleDialog ["Confirm Purchase", format ["¿Comprar vehículo por $%1?", [_finalPrice] call fn_numbersText], 
	{
		params ["_result"]
		if (_result) then
		{
			// Proceder con la compra
			[] call processVehiclePurchaseNew
		}
	}]
	
	// Nota: Implementar sistema de popup personalizado si es necesario
	// Por ahora usar confirmación simple
	private _confirmed = [format ["¿Confirmar compra por $%1?", [_finalPrice] call fn_numbersText], "Confirm Purchase"] call BIS_fnc_guiMessage
	
	if (_confirmed) then
	{
		[] call processVehiclePurchaseNew
	}
}

// Función para procesar la compra
processVehiclePurchaseNew =
{
	scriptName "processVehiclePurchaseNew"
	
	// Verificar cooldown
	if (!isNil "vehicleStore_lastPurchaseTime") then
	{
		_timeLeft = (["A3W_vehiclePurchaseCooldown", 60] call getPublicVar) - (diag_tickTime - vehicleStore_lastPurchaseTime)
		if (_timeLeft > 0) exitWith
		{
			hint format ["Debe esperar %1s antes de comprar otro vehículo", ceil _timeLeft]
			playSound "FD_CP_Not_Clear_F"
		}
	}
	
	// Obtener selección actual
	private _vehData = vehicleStoreNew_currentSelection select 0
	private _selectedVariant = vehicleStoreNew_currentSelection select 1
	private _selectedTexture = vehicleStoreNew_currentSelection select 2
	private _finalPrice = vehicleStoreNew_currentSelection select 5
	
	// Encontrar classname específico
	// (Implementación pendiente - requiere búsqueda en lista completa)
	
	// Generar key de solicitud
	private _requestKey = call A3W_fnc_generateKey
	
	// Enviar solicitud al servidor
	// (Implementación similar a buyVehicles.sqf original)
	
	hint "Procesando compra..."
	
	// Marcar tiempo de compra
	vehicleStore_lastPurchaseTime = diag_tickTime
}
