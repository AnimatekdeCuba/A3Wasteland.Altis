// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.1
//	@file Name: boxSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

if (!isServer) exitWith {};

private ["_counter","_pos","_markerName","_marker","_hint","_safePos","_boxes", "_boxList", "_boxClass", "_box", "_boxItems", "_magName"];

_counter = 0;

_boxList =
[
	"Box_NATO_Wps_F",
	"Box_NATO_WpsSpecial_F",
	"Box_East_Wps_F",
	"Box_East_WpsSpecial_F",
	"Box_IND_Wps_F",
	"Box_IND_WpsSpecial_F",
	"Box_IND_Ammo_F",
	"Box_T_East_Ammo_F",
	"Box_East_Ammo_F",
	"Box_NATO_Ammo_F",
	"Box_Syndicate_Ammo_F",
	"Box_T_East_Wps_F",
	"Box_Syndicate_Wps_F",
	"Box_AAF_Equip_F",
	"Box_CSAT_Equip_F",
	"Box_NATO_Equip_F",
	"Box_IED_Exp_F",
	"Box_IND_AmmoOrd_F",
	"Box_NATO_AmmoOrd_F",
	"Box_FIA_Ammo_F",
	"Box_FIA_Support_F",
	"Box_FIA_Wps_F",
	"Box_IND_Grenades_F",
	"Box_East_Grenades_F",
	"Box_NATO_Grenades_F",
	"Box_IND_WpsLaunch_F",
	"Box_East_WpsLaunch_F",
	"Box_NATO_WpsLaunch_F",
	"Box_Syndicate_WpsLaunch_F",
	"Box_IND_WpsSpecial_F",
	"Box_T_East_WpsSpecial_F",
	"Box_East_WpsSpecial_F",
	"Box_T_NATO_WpsSpecial_F",
	"Box_NATO_WpsSpecial_F",
	"I_supplyCrate_F",
	"O_supplyCrate_F",
	"C_supplyCrate_F",
	"C_T_supplyCrate_F",
	"IG_supplyCrate_F",
	"Box_GEN_Equip_F",
	"B_supplyCrate_F",
	"Box_IND_Support_F",
	"Box_East_Support_F",
	"Box_NATO_Support_F",
	"Box_AAF_Uniforms_F",
	"Box_CSAT_Uniforms_F",
	"Box_NATO_Uniforms_F"
];

{
	if (random 1 < 0.50) then // 50% chance of box spawning at each town
	{
		_pos = getMarkerPos (_x select 0);
		_boxClass = _boxList call BIS_fnc_selectRandom;
		_safePos = [_pos, 10, (_x select 1) / 2, 1, 0, 60 * (pi / 180), 0] call findSafePos; // spawns somewhere within half the town radius
		_box = createVehicle [_boxClass, _safePos, [], 0, "NONE"];
		_box allowDamage false;
		_box setVariable ["allowDamage", false, true];


		_counter = _counter + 1;
	};
} forEach (call cityList);

diag_log format ["WASTELAND SERVER - %1 Ammo Caches Spawned",_counter];
