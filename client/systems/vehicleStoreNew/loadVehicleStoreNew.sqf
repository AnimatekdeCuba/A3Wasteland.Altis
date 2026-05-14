// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//  @file Version: 2.0
//  @file Name: loadVehicleStoreNew.sqf
//  @file Author: Custom implementation for RHS vehicles
//  @file Created: 2024
//  @file Args: []

#include "dialog\vehiclestoreNew_defines.hpp"
disableSerialization

vehicleStoreNew_noBuzzard = false

private ["_vehshopDialog", "_Dialog", "_playerMoney", "_owner"]
_vehshopDialog = createDialog "vehshopNewd"

_Dialog = findDisplay vehshopNew_DIALOG
_playerMoney = _Dialog displayCtrl vehshopNew_money
_playerMoney ctrlSetText format["Cash: $%1", [player getVariable ["cmoney", 0]] call fn_numbersText]

if (!isNil "_this") then { _owner = _this select 0 }
if (!isNil "_owner") then
{
	currentOwnerID = _owner
	currentOwnerName = vehicleVarName _owner
}

// Manejo del checkbox de partes por defecto (similar al original)
private _defPartsChk = _Dialog displayCtrl 99999 // IDC temporal, ajustar según necesidad
if (!isNull _defPartsChk) then
{
	_defPartsChk cbSetChecked true
}

// Cerrar menú ESC si está abierto
[] spawn
{
	disableSerialization
	_dialog = findDisplay vehshopNew_DIALOG
	while {!isNull _dialog} do
	{
		_escMenu = findDisplay 49
		if (!isNull _escMenu) exitWith { _escMenu closeDisplay 0 }
		sleep 0.1
	}
}
