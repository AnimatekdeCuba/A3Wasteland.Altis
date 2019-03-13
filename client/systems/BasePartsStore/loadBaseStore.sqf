// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: loadBaseStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\BaseStoreDefines.sqf";
disableSerialization;

private ["_genshopDialog", "_Dialog", "_playerMoney", "_owner"];
_genshopDialog = createDialog "BaseStore";

_Dialog = findDisplay BaseStore_DIALOG;
_playerMoney = _Dialog displayCtrl BaseStore_money;
_playerMoney ctrlSetText format["Cash: $%1", [player getVariable ["cmoney", 0]] call fn_numbersText];
if (!isNil "_this") then { _owner = _this select 0 };
if (!isNil "_owner") then
{
	currentOwnerID = _owner;
	currentOwnerName = vehicleVarName _owner;
};

[] spawn
{
	disableSerialization;
	_dialog = findDisplay BaseStore_DIALOG;
	while {!isNull _dialog} do
	{
		_escMenu = findDisplay 49;
		if (!isNull _escMenu) exitWith { _escMenu closeDisplay 0 }; // Force close Esc menu if open
		sleep 0.1;
	};
};
