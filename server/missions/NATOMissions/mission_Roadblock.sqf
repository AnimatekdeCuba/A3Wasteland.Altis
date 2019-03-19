// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Roadblock.sqf
//	@file Author: JoSchaap, AgentRev, LouD, GMG_Monkey

// if (!isServer && hasinterface) exitWith {};
#include "NATOMissionDefines.sqf";

private [ "_box1", "_barGate", "_bunker1","_bunker2","_obj1","_obj2"];

_setupVars =
{
	_missionType = "NATO Roadblock";
	_locationsArray = RoadblockMissionmarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	_markerDir = markerDir _missionLocation;

	//delete existing base parts and vehicles at location
	_baseToDelete = nearestObjects [_missionPos, ["All"], 25];
	{ deleteVehicle _x } forEach _baseToDelete;

	_bargate = createVehicle ["Land_BarGate_F", _missionPos, [], 0, "NONE"];
	_bargate setDir _markerDir;
	_bunker1 = createVehicle ["Land_BagBunker_Small_F", _bargate modelToWorld [6.5,-2,-4.1], [], 0, "NONE"];
	_obj1 = createVehicle ["I_GMG_01_high_F", _bargate modelToWorld [6.5,-2,-4.1], [], 0, "NONE"];
	_obj1 setVariable ["moveable", true, true];
	_bunker1 setDir _markerDir;
	_bunker2 = createVehicle ["Land_BagBunker_Small_F", _bargate modelToWorld [-8,-2,-4.1], [], 0, "NONE"];
	_obj2 = createVehicle ["I_GMG_01_high_F", _bargate modelToWorld [-8,-2,-4.1], [], 0, "NONE"];
	_obj2 setVariable ["moveable", true, true];
	_bunker2 setDir _markerDir;

		// NPC Randomizer
	_aiGroup1  = createGroup CIVILIAN;
	for "_i" from 1 to 7 do
	{
		private _soldierType = selectrandom ["Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","AT","AA","SAW","SAW","SAW","Engineer","Medic","Grenedier","Engineer","Medic","Grenedier","Marksman","Marksman","Marksman"];
		[_aiGroup1, _missionPos, "NATO", _soldierType] call createsoldier;
	};
	_aiGroup1 setCombatMode "RED";
	_missionHintText = format ["Enemies have set up an illegal roadblock and are searching vehicles! They need to be stopped!", NATOMissionColor];
	_soldiers = units _aiGroup1;
	_gunner1 = _soldiers select 0;
	_gunner2 = _soldiers select 1;
	_gunner1 moveInGunner _obj1;
	_gunner2 moveInGunner _obj2;
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed

	{ deleteVehicle _x } forEach [_barGate, _bunker1, _bunker2, _obj1, _obj2];

};

_successExec =
{
	// Mission completed
	_lootPos = getMarkerPos _marker;
	for "_i" from 1 to 1 do
	{
		private _tier = selectrandom ["1","2","3"];
		private _maxmoney = ceil (random 10000);
		private _box = [_lootPos, "NATO", _tier, 0, _maxmoney] call createrandomlootcrate;
		_box setVariable ["moveable", true, true];
	};
	{ _x setVariable ["R3F_LOG_disabled", false, true]} forEach [_barGate, _bunker1, _bunker2];
	{_x setVariable ["Moveable", true, true]} forEach [_barGate, _bunker1, _bunker2];
	{ _x setVariable ["allowDamage", true, true]} forEach [_obj1, _obj2];
	_successHintMessage = format ["The roadblock has been dismantled."];
};
_this call NATOMissionProcessor;
