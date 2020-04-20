// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_VehicleCapture.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, JoSchaap, AgentRev, GMG_Monkey
//	@file Created: 08/12/2012 15:19

// if (!isServer && hasinterface) exitWith {};
#include "CSATMissionDefines.sqf";

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
			[_aiGroup1, _missionPos, "CSAT", "Rifleman"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup1, _missionPos, "CSAT", "SAW"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup1, _missionPos, "CSAT", "Grenedier"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup1, _missionPos, "CSAT", "Medic"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup1, _missionPos, "CSAT", "Marksman"] call createsoldier;
		};
		[_aiGroup1, _missionPos, "CSAT", "AT"] call createsoldier;
		[_aiGroup1, _missionPos, "CSAT", "AA"] call createsoldier;
		[_aiGroup1, _missionPos, "CSAT", "AT"] call createsoldier;
	};
	_createsquad2 =
	{
		for "_i" from 1 to 5 do
		{
			[_aiGroup2, _missionPos, "CSAT", "Rifleman"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup2, _missionPos, "CSAT", "SAW"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup2, _missionPos, "CSAT", "Grenedier"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup2, _missionPos, "CSAT", "Medic"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup2, _missionPos, "CSAT", "Marksman"] call createsoldier;
		};
		[_aiGroup2, _missionPos, "CSAT", "AT"] call createsoldier;
		[_aiGroup2, _missionPos, "CSAT", "AA"] call createsoldier;
		[_aiGroup2, _missionPos, "CSAT", "AT"] call createsoldier;
	};
	_createsquad3 =
	{
		for "_i" from 1 to 5 do
		{
			[_aiGroup3, _missionPos, "CSAT", "Rifleman"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup3, _missionPos, "CSAT", "SAW"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup3, _missionPos, "CSAT", "Grenedier"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup3, _missionPos, "CSAT", "Medic"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup3, _missionPos, "CSAT", "Marksman"] call createsoldier;
		};
		[_aiGroup3, _missionPos, "CSAT", "AT"] call createsoldier;
		[_aiGroup3, _missionPos, "CSAT", "AA"] call createsoldier;
		[_aiGroup3, _missionPos, "CSAT", "AT"] call createsoldier;
	};
	_createsquad4 =
	{
		for "_i" from 1 to 5 do
		{
			[_aiGroup1, _missionPos, "CSAT", "Rifleman"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup1, _missionPos, "CSAT", "SAW"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup1, _missionPos, "CSAT", "Grenedier"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup1, _missionPos, "CSAT", "Medic"] call createsoldier;
		};
		for "_i" from 1 to 2 do
		{
			[_aiGroup1, _missionPos, "CSAT", "Marksman"] call createsoldier;
		};
		[_aiGroup1, _missionPos, "CSAT", "AT"] call createsoldier;
		[_aiGroup1, _missionPos, "CSAT", "AA"] call createsoldier;
		[_aiGroup1, _missionPos, "CSAT", "AT"] call createsoldier;
	};
	_aiGroup1 = createGroup CIVILIAN;
	_aiGroup2 = createGroup CIVILIAN;
	_aiGroup3 = createGroup CIVILIAN;
	_aiGroup4 = createGroup CIVILIAN;
	switch (true) do
	{
		case ({_vehicleClass isKindOf _x} count ["rhsgref_BRDM2_msv","rhsgref_BRDM2_ATGM_msv"] > 0):
		{
			_squad1 = call _createsquad1;
		};
		case ({_vehicleClass isKindOf _x} count ["rhs_zsu234_aa", "RHS_Ural_Zu23_VDV_01"] > 0):
		{
			_squad1 = call _createsquad1;
		};
		case (_vehicleClass isKindOf "rhs_btr80a_msv"):
		{
			_squad1 = call _createsquad1;
			_squad2 = call _createsquad2;
		};
		case ({_vehicleClass isKindOf _x} count [
		"rhs_bmd1p",
		"rhs_bmd1r",
		"rhs_bmd2m",
		"rhs_bmd4m_vdv",
		"rhs_bmp3mera_msv",
		"rhs_bmp2k_vdv"]>0):
		{
			_squad1 = call _createsquad1;
			_squad2 = call _createsquad2;
		};
		case ({_vehicleClass isKindOf _x} count ["rhs_t80bvk","rhs_t90a_tv"] > 0):
		{
			_squad1 = call _createsquad1;
			_squad2 = call _createsquad2;
			//_squad3 = call _createsquad3;
		};	
		case ({_vehicleClass isKindOf _x} count ["rhs_mig29sm_vmf","RHS_Su25SM_vvs"] > 0):
		{
			_squad1 = call _createsquad1;
			_squad2 = call _createsquad2;
			_squad3 = call _createsquad3;
			//_squad4 = call _createsquad4;
		};
		case ({_vehicleClass isKindOf _x} count ["O_UAV_02_dynamicLoadout_F","O_T_UAV_04_CAS_F"]>0):
		{
			_squad1 = call _createsquad1;
			_squad2 = call _createsquad2;
			_squad3 = call _createsquad3;
			//_squad1 = call _createsquad1;
		};
		case ({_vehicleClass isKindOf _x} count 
		[
		"RHS_Ka52_vvsc",
		"RHS_Mi24V_vvsc",
		"rhs_mi28n_vvsc",
		"RHS_Mi8AMTSh_vvsc",
		"RHS_Mi8mt_vvsc",
		"RHS_Mi8MTV3_vvsc",
		"RHS_Mi8mt_Cargo_vdv",
		"RHS_BM21_VDV_01",
		"rhs_2s3_tv"
		] > 0):
		{
			_squad1 = call _createsquad1;
			_squad2 = call _createsquad2;
			//_squad3 = call _createsquad3;
		};
	};
	_aiGroup1 setCombatMode "RED";
	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");
	_vehDeterminer = if ("AEIMO" find (_vehicleName select [0,1]) != -1) then { "An" } else { "A" };
	_missionHintText = format ["%1 <t color='%3'>%2</t> has been immobilized, go get it for your team!", _vehDeterminer, _vehicleName, CSATMissionColor];
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

_this call CSATMissionProcessor;
