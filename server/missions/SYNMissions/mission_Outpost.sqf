// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_VehicleCapture.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, JoSchaap, AgentRev, GMG_Monkey
//	@file Created: 08/12/2012 15:19

// if (!isServer && hasinterface) exitWith {};
#include "SYNMissionDefines.sqf";

private ["_outpost", "_objects"];

_setupVars =
{
	_missionType = "SYN Outpost";
	_locationsArray = MissionSpawnMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_outpost = (call compile preprocessFileLineNumbers "server\missions\outposts\outpostsList.sqf") call BIS_fnc_selectRandom;
	private _faction = "SYN";
	_objects = [_outpost, _missionPos, 0, _faction] call createOutpost;
	_aiGroup1 = createGroup CIVILIAN;
	_aiGroup2 = createGroup CIVILIAN;
	_aiGroup3 = createGroup CIVILIAN;
	//_aiGroup4 = createGroup CIVILIAN;

	for "_i" from 1 to 5 do
	{
		private _soldierType = selectrandom ["Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","AT","AT","AT","SAW","SAW","SAW","Grenedier","Grenedier","Grenedier","Grenedier","Grenedier"];
		[_aiGroup1, _missionPos, "SYN", _soldierType] call createsoldier;
	};
	_aiGroup1 setCombatMode "RED";
	for "_i" from 1 to 5 do
	{
		private _soldierType = selectrandom ["Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","AT","AT","AT","SAW","SAW","SAW","Grenedier","Grenedier","Grenedier","Grenedier","Grenedier"];
		[_aiGroup2, _missionPos, "SYN", _soldierType] call createsoldier;
	};
	_aiGroup2 setCombatMode "RED";
	for "_i" from 1 to 5 do
	{
		private _soldierType = selectrandom ["Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","AT","AT","AT","SAW","SAW","SAW","Grenedier","Grenedier","Grenedier","Grenedier","Grenedier"];
		[_aiGroup3, _missionPos, "SYN", _soldierType] call createsoldier;
	};
	_aiGroup3 setCombatMode "RED";
	/*for "_i" from 1 to 5 do
	{
		private _soldierType = selectrandom ["Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","AT","AT","AT","SAW","SAW","SAW","Grenedier","Grenedier","Grenedier","Grenedier","Grenedier"];
		[_aiGroup4, _missionPos, "SYN", _soldierType] call createsoldier;
	};
	_aiGroup4 setCombatMode "RED";*/
	_missionHintText = format ["An armed <t color='%1'>outpost</t> containing weapon crates has been spotted near the marker, go capture it!", SYNMissionColor];
	_turrets = nearestObjects [_missionPos, ["rhsgref_ins_g_DSHKM"], 50, true];
	{
		private _turret = _x;
		private _group = selectRandom [_aiGroup1, _aiGroup2, _aiGroup3];
		private _troops = units _group;
		private _gunner = _troops select _foreachindex;
		_gunner moveingunner _turret;
	} foreach _turrets;
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach _objects;
};

_successExec =
{
	// Mission complete
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach _objects;
	{ _x setVariable ["Movable", true, true] } forEach _objects;
	[_locationsArray, _missionLocation, _objects] call setLocationObjects;
	{
		 private _obj = _x;
		 if (_obj isKindOf "ReammoBox_F") then
		 {
			_obj setvariable ["cmoney",ceil (2000 + random 8000), true];
		 };
	} forEach _objects;

	_successHintMessage = "The outpost has been captured, good work.";
};

_this call SYNMissionProcessor;
