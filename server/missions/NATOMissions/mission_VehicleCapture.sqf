// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_VehicleCapture.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, JoSchaap, AgentRev, GMG_Monkey
//	@file Created: 08/12/2012 15:19

// if (!isServer && hasinterface) exitWith {};
#include "NATOMissionDefines.sqf";

private ["_vehicle", "_vehicleName", "_vehDeterminer", "_minefield"];
// setupVars must be defined in the top mission file

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	_spawnPos = _missionPos;
	_spawnPos set [2, 0.5];
	private _randomDamage = random [0, 0.5, 0.9];
	private _randomFuel = random [0, 0.5, 0.9];
	// Class, Position, Fuel, Ammo, Damage, Special
	_vehicle = [_vehicleClass, _spawnPos] call createMissionVehicle;
	_vehicle setDamage _randomDamage;
	_vehicle setFuel _randomFuel;
	_vehicle lock 2;
	_vehicle setVariable ["R3F_LOG_disabled", true, true];

	_createsquad1 =
	{
		for "_i" from 1 to 5 do
		{
			[_aiGroup1, _missionPos, "NATO", "Rifleman"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup1, _missionPos, "NATO", "SAW"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup1, _missionPos, "NATO", "Genedier"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup1, _missionPos, "NATO", "Medic"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup1, _missionPos, "NATO", "Marksman"] call createsoldier;
		};
		[_aiGroup1, _missionPos, "NATO", "AT"] call createsoldier;
		[_aiGroup1, _missionPos, "NATO", "AA"] call createsoldier;
		[_aiGroup1, _missionPos, "NATO", "Engineer"] call createsoldier;
	};
	_createsquad2 =
	{
		for "_i" from 1 to 5 do
		{
			[_aiGroup2, _missionPos, "NATO", "Rifleman"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup2, _missionPos, "NATO", "SAW"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup2, _missionPos, "NATO", "Genedier"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup2, _missionPos, "NATO", "Medic"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup2, _missionPos, "NATO", "Marksman"] call createsoldier;
		};
		[_aiGroup2, _missionPos, "NATO", "AT"] call createsoldier;
		[_aiGroup2, _missionPos, "NATO", "AA"] call createsoldier;
		[_aiGroup2, _missionPos, "NATO", "Engineer"] call createsoldier;
	};
	_createsquad3 =
	{
		for "_i" from 1 to 5 do
		{
			[_aiGroup3, _missionPos, "NATO", "Rifleman"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup3, _missionPos, "NATO", "SAW"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup3, _missionPos, "NATO", "Genedier"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup3, _missionPos, "NATO", "Medic"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup3, _missionPos, "NATO", "Marksman"] call createsoldier;
		};
		[_aiGroup3, _missionPos, "NATO", "AT"] call createsoldier;
		[_aiGroup3, _missionPos, "NATO", "AA"] call createsoldier;
		[_aiGroup3, _missionPos, "NATO", "Engineer"] call createsoldier;
	};
	_createsquad4 =
	{
		for "_i" from 1 to 5 do
		{
			[_aiGroup4, _missionPos, "NATO", "Rifleman"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup4, _missionPos, "NATO", "SAW"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup4, _missionPos, "NATO", "Genedier"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup4, _missionPos, "NATO", "Medic"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup4, _missionPos, "NATO", "Marksman"] call createsoldier;
		};
		[_aiGroup1, _missionPos, "NATO", "AT"] call createsoldier;
		[_aiGroup1, _missionPos, "NATO", "AA"] call createsoldier;
		[_aiGroup1, _missionPos, "NATO", "Engineer"] call createsoldier;
	};
	_aiGroup1 = createGroup CIVILIAN;
	_aiGroup2 = createGroup CIVILIAN;
	_aiGroup3 = createGroup CIVILIAN;
	_aiGroup4 = createGroup CIVILIAN;
	switch (true) do
	{
		case ({_vehicleClass isKindOf _x} count ["B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","B_UGV_01_rcws_F"] > 0):
		{
			_squad1 = call _createsquad1;
		};
		case ({_vehicleClass isKindOf _x} count ["B_APC_Tracked_01_AA_F", "B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_CRV_F","B_APC_Tracked_01_rcws_F"] > 0):
		{
			_squad1 = call _createsquad1;
			_squad2 = call _createsquad2;
		};
		case ({_vehicleClass isKindOf _x} count ["B_Heli_Light_01_dynamicLoadout_F","B_Heli_Attack_01_dynamicLoadout_F","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F","B_Heli_Light_01_F","B_Heli_Transport_01_F"]>0):
		{
			_squad1 = call _createsquad1;
			_squad2 = call _createsquad2;
			_squad3 = call _createsquad3;
		};	
		case ({_vehicleClass isKindOf _x} count ["B_MBT_01_arty_F", "B_MBT_01_mlrs_F","B_MBT_01_cannon_F","B_MBT_01_TUSK_F","B_UAV_02_dynamicLoadout_F","B_UAV_05_F","B_T_UAV_03_dynamicLoadout_F","B_Plane_CAS_01_dynamicLoadout_F","B_Plane_Fighter_01_F","B_Plane_Fighter_01_Stealth_F","B_T_VTOL_01_armed_F"] > 0):
		{
			_squad1 = call _createsquad1;
			_squad2 = call _createsquad2;
			_squad3 = call _createsquad3;
			_squad4 = call _createsquad4;
		};
	};
	_aiGroup1 setCombatMode "RED";
	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");
	_vehDeterminer = if ("AEIMO" find (_vehicleName select [0,1]) != -1) then { "An" } else { "A" };
	_missionHintText = format ["%1 <t color='%3'>%2</t> has been immobilized, go get it for your team!", _vehDeterminer, _vehicleName, NATOMissionColor];
	_mine1 = createvehicle ["ATMine", [(_missionPos select 0) -50 + (random 100),(_missionPos select 1) -50 + (random 100),0],[],0,"NONE"];
	_mine2 = createvehicle ["ATMine", [(_missionPos select 0) -50 + (random 100),(_missionPos select 1) -50 + (random 100),0],[],0,"NONE"];
	_mine3 = createvehicle ["ATMine", [(_missionPos select 0) -50 + (random 100),(_missionPos select 1) -50 + (random 100),0],[],0,"NONE"];
	_mine4 = createvehicle ["ATMine", [(_missionPos select 0) -50 + (random 100),(_missionPos select 1) -50 + (random 100),0],[],0,"NONE"];
	_mine5 = createvehicle ["ATMine", [(_missionPos select 0) -50 + (random 100),(_missionPos select 1) -50 + (random 100),0],[],0,"NONE"];
	_mine6 = createvehicle ["ATMine", [(_missionPos select 0) -50 + (random 100),(_missionPos select 1) -50 + (random 100),0],[],0,"NONE"];
	_mine7 = createvehicle ["ATMine", [(_missionPos select 0) -50 + (random 100),(_missionPos select 1) -50 + (random 100),0],[],0,"NONE"];
	_mine8 = createvehicle ["ATMine", [(_missionPos select 0) -50 + (random 100),(_missionPos select 1) -50 + (random 100),0],[],0,"NONE"];
	_mine9 = createvehicle ["ATMine", [(_missionPos select 0) -50 + (random 100),(_missionPos select 1) -50 + (random 100),0],[],0,"NONE"];
	_mine10 = createvehicle ["ATMine", [(_missionPos select 0) -50 + (random 100),(_missionPos select 1) -50 + (random 100),0],[],0,"NONE"];
	_minefield = [_mine1,_mine2,_mine3,_mine4,_mine5,_mine6,_mine7,_mine8,_mine9,_mine10];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = {!alive _vehicle};

_failedExec =
{
	// Mission failed
	deleteVehicle _vehicle;
	{ deleteVehicle _x } foreach [_mine1,_mine2,_mine3,_mine4,_mine5,_mine6,_mine7,_mine8,_mine9,_mine10];
};

_successExec =
{
	// Mission completed
	_vehicle lock 1;
	_vehicle setVariable ["R3F_LOG_disabled", false, true];
	{ deleteVehicle _x } foreach [_mine1,_mine2,_mine3,_mine4,_mine5,_mine6,_mine7,_mine8,_mine9,_mine10];

	_successHintMessage = format ["The %1 has been captured, well done.", _vehicleName];
};

_this call NATOMissionProcessor;
