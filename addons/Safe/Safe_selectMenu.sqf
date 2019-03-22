// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: Safe_selectMenu.sqf
//	@file Author: LouD / Cael817 for original script
//	@file Description: Safe script

#define PLAYER_CONDITION "(vehicle player == player && {!isNull cursorTarget})"
#define ITEM_CONDITION "{cursortarget iskindof _BoxList} && {(player distance cursortarget) < 3}"
#define OBJECT_CONDITION "{cursorTarget getVariable ['objectLocked', false]}"
#define HACKING_CONDITION "{'ACE_key_lockpick' in (items player)} && {cursorTarget getVariable ['ownerUID',''] != getPlayerUID player}"

private _BoxList = [
					'Box_FIA_Ammo_F',
					'Box_T_East_Ammo_F',
					'Box_East_Ammo_F',
					'Box_IND_Ammo_F',
					'Box_NATO_Ammo_F',
					'Box_Syndicate_Ammo_F',
					'Box_T_East_Wps_F',
					'Box_East_Wps_F',
					'Box_IND_Wps_F',
					'Box_T_NATO_Wps_F',
					'Box_NATO_Wps_F',
					'Box_Syndicate_Wps_F',
					'Box_FIA_Support_F',
					'Box_CSAT_Equip_F',
					'Box_IDAP_Equip_F',
					'Box_AAF_Equip_F',
					'Box_NATO_Equip_F',
					'Box_East_AmmoOrd_F',
					'Box_IDAP_AmmoOrd_F',
					'Box_IND_AmmoOrd_F',
					'Box_NATO_AmmoOrd_F',
					'Box_IED_Exp_F',
					'Box_East_Grenades_F',
					'Box_IND_Grenades_F',
					'Box_NATO_Grenades_F',
					'Box_East_WpsLaunch_F',
					'Box_IND_WpsLaunch_F',
					'Box_NATO_WpsLaunch_F',
					'Box_Syndicate_WpsLaunch_F',
					'Box_T_East_WpsSpecial_F',
					'Box_East_WpsSpecial_F',
					'Box_IND_WpsSpecial_F',
					'Box_T_NATO_WpsSpecial_F',
					'Box_NATO_WpsSpecial_F',
					'Box_GEN_Equip_F',
					'C_IDAP_supplyCrate_F',
					'I_supplyCrate_F',
					'Box_East_Support_F',
					'Box_IND_Support_F',
					'Box_NATO_Support_F',
					'Box_CSAT_Uniforms_F',
					'Box_IDAP_Uniforms_F',
					'Box_AAF_Uniforms_F',
					'Box_NATO_Uniforms_F',
					'Box_FIA_Wps_F'
					];

Safe_open = 
{
	private ["_unit","_uid,", "_owner"];

	_unit = _this select 0;
	_uid = getPlayerUID _unit;
	_owner = cursorTarget getvariable "ownerUID";

	if (!isNull (uiNamespace getVariable ["Safe_Menu", displayNull]) && player getVariable ["FAR_isUnconscious", 0] == 0) exitWith {};

	switch (true) do
	{
		case (_uid == _owner || _uid != _owner):
		{
			execVM "addons\Safe\password_enter.sqf";
			hint "Welcome";
		};
		case (isNil _uid || isNull _uid):
		{
			hint "Primero debes bloquear esta caja!";
		};
		default
		{
		hint "Ha ocurrido un error. Puede que tu Base Locker no esté activado."
		};

	};
};

Safe_Actions = 
{
	{ [player, _x] call fn_addManagedAction } forEach
	[
		["<t color='#FFE496'><img image='client\icons\r3f_lock.paa'/> Abrir Caja Fuerte</t>", Safe_open, [cursorTarget], -97, false, false, "", PLAYER_CONDITION + " && " + ITEM_CONDITION + " && " + OBJECT_CONDITION],
		["<t color='#FFE496'><img image='client\icons\take.paa'/> Forzar Caja Fuerte</t>", "addons\Safe\Safe_hack.sqf", [cursorTarget], -97, false, false, "", PLAYER_CONDITION + " && " + ITEM_CONDITION + " && " + OBJECT_CONDITION + " && " + HACKING_CONDITION]
	];
};

SafeScriptInitialized = true;