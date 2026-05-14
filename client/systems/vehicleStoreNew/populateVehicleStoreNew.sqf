// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//  @file Version: 2.0
//  @file Name: populateVehicleStoreNew.sqf
//  @file Author: Custom implementation for RHS vehicles
//  @file Created: 2024
//  @file Args: [categoryIndex]

#include "dialog\vehiclestoreNew_defines.hpp"
#include "..\rhsVehicleConfig.sqf"
#include "..\parseRHSVehicles.sqf"
disableSerialization

private ["_switch", "_dialog", "_vehlist", "_variantList", "_textureList", "_featureList", "_vehArray"]
_switch = _this select 0

// Grab access to the controls
_dialog = findDisplay vehshopNew_DIALOG
_vehlist = _dialog displayCtrl vehshopNew_veh_list
_variantList = _dialog displayCtrl vehshopNew_variant_list
_textureList = _dialog displayCtrl vehshopNew_texture_list
_featureList = _dialog displayCtrl vehshopNew_feature_list

// Limpiar listas
lbClear _vehlist
lbClear _variantList
lbClear _textureList
lbClear _featureList

// Obtener array de vehículos según categoría
_vehArray = switch (_switch) do
{
	case 0: { call landArray }
	case 1: { call armoredArray }
	case 2: { call tanksArray }
	case 3: { call helicoptersArray }
	case 4: { call planesArray }
	case 5: { call boatsArray }
	case 6: { call AutonomousArray }
	default { [] }
}

_noBuzzard = ["vehicleStore_noBuzzard", true] call getPublicVar

_playerSideNum = switch (playerSide) do
{
	case BLUFOR:      { 1 }
	case OPFOR:       { 0 }
	case INDEPENDENT: { 2 }
	default           { 3 }
}

// Filtrar y agrupar vehículos RHS
private _rhsVehicles = []
{
	_x params ["_vehName", "_vehClass", "_price", "_type", "_faction"]
	
	// Solo procesar vehículos RHS
	if (_vehClass find "rhs" != -1 || {_vehClass find "rhsgref" != -1}) then
	{
		// Verificar si es UAV/UGV y filtrar por side
		if (["UGV_01_base_F","UGV_02_Base_F","UAV_01_base_F","UAV_02_base_F","UAV_06_base_F"] findIf {_vehClass isKindOf _x} == -1 || 
		    {getNumber (configFile >> "CfgVehicles" >> _vehClass >> "side") in [3,_playerSideNum]}) then
		{
			_rhsVehicles pushBack _x
		}
	}
} forEach _vehArray

// Agrupar vehículos por nombre base
private _groupedVehicles = [_rhsVehicles] call fn_groupRHSVehicles

// Llenar lista principal de vehículos
{
	_x params ["_baseName", "_variants", "_firstClassname"]
	
	// Obtener información del vehículo
	_vehCfg = configFile >> "CfgVehicles" >> _firstClassname
	_vehPicture = getText (_vehCfg >> "picture")
	_vehDisplayName = getText (_vehCfg >> "displayName")
	
	// Si no hay nombre personalizado, usar el del config
	if (_baseName == "") then
	{
		_baseName = _vehDisplayName
	}
	
	// Añadir a la lista
	_vehIndex = _vehlist lbAdd _baseName
	_vehlist lbSetPicture [_vehIndex, _vehPicture]
	_vehlist lbSetData [_vehIndex, str _x]
	
} forEach _groupedVehicles

// Actualizar dinero del jugador
private _moneyCtrl = _dialog displayCtrl vehshopNew_money
if (!isNull _moneyCtrl) then
{
	_moneyCtrl ctrlSetText format["Cash: $%1", [player getVariable ["cmoney", 0]] call fn_numbersText]
}
