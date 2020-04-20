// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: BoS_selectMenu.sqf
//	@file Author: LouD / Cael817 for original script Edited by: GMG_Monkey
//	@file Description: Baselocker script

#define PLAYER_CONDITION "(vehicle player == player && {!isNull cursorObject})"
#define ITEM_CONDITION "{{cursorObject iskindof _x} count ['Land_SatellitePhone_F']>0} && {alive cursorObject} && {(player distance cursorObject) < 5}"
#define OBJECT_CONDITION "{cursorObject getVariable ['objectLocked', false]}"
#define NONOWNED_CONDITION "{'ToolKit' in (items player)} && {cursorObject getVariable ['ownerUID',''] != getPlayerUID player}"

BoS_open =
{
	private ["_ownersuid","_coownersuid,","_owner"];
	_uid = getPlayerUID player;
	_objects = nearestObjects [player, ["Land_SatellitePhone_F"], 50];
	_owner = cursorObject getvariable "ownerUID";

	if (!isNull (uiNamespace getVariable ["BoS_Menu", displayNull]) && !(player call A3W_fnc_isUnconscious)) exitWith {};

	switch (true) do
	{
		case (_uid == _owner):
		{
			execVM "addons\BoS\BoS_ownerMenu.sqf";
			hint "Bienvenido, señor";
		};
		case (_uid != _owner):
		{
			execVM "addons\BoS\password_enter.sqf";
			hint "Bienvenido, compañero";
		};
	/*	case (isNil _uid || isNull _uid):
		{
			hint "You need to lock the object first!";
		};*/
		default
		{
		hint "Ha ocurrido un error. Esto debió ser porque su Base no está bloqueada."
		};
	};
};

BoS_Actions =
{
	{ [player, _x] call fn_addManagedAction } forEach
	[
		["<t color='#FFE496'><img image='client\icons\keypad.paa'/> Menú de la Base</t>", BoS_open, [cursorObject], -97, false, false, "", PLAYER_CONDITION + " && " + ITEM_CONDITION + " && " + OBJECT_CONDITION],
		["<t color='#FFE496'><img image='client\icons\take.paa'/> Hackear Base</t>", "addons\BoS\BoS_hackBase.sqf", [cursorObject], -97, false, false, "", PLAYER_CONDITION + " && " + ITEM_CONDITION + " && " + OBJECT_CONDITION + " && " + NONOWNED_CONDITION]
	];
};

BoS_Initialized = true;
