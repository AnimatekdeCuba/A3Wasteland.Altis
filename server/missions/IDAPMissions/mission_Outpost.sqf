// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_VehicleCapture.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, JoSchaap, AgentRev, GMG_Monkey
//	@file Created: 08/12/2012 15:19

// if (!isServer && hasinterface) exitWith {};
#include "IDAPMissionDefines.sqf";

private ["_outpost", "_objects"];

_setupVars =
{
	_missionType = "IDAP Outpost";
	_locationsArray = MissionSpawnMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_outpost = (call compile preprocessFileLineNumbers "server\missions\outposts\outpostsList.sqf") call BIS_fnc_selectRandom;
	private _faction = "IDAP";
	_objects = [_outpost, _missionPos, 0, _faction] call createOutpost;

	_aiGroup1 = createGroup CIVILIAN;
	_aiGroup2 = createGroup CIVILIAN;
	_aiGroup3 = createGroup CIVILIAN;
	_aiGroup4 = createGroup CIVILIAN;

	for "_i" from 1 to 5 do
	{
		private _faction = selectrandom ["IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","NATO"];
		[_aiGroup1, _missionPos, _faction, "Rifleman"] call createsoldier;
	};
	_aiGroup1 setCombatMode "RED";
	for "_i" from 1 to 5 do
	{
		private _faction = selectrandom ["IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","NATO"];
		[_aiGroup1, _missionPos, _faction, "Rifleman"] call createsoldier;
	};
	_aiGroup2 setCombatMode "RED";
	for "_i" from 1 to 5 do
	{
		private _faction = selectrandom ["IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","NATO"];
		[_aiGroup1, _missionPos, _faction, "Rifleman"] call createsoldier;
	};
	_aiGroup3 setCombatMode "RED";
	for "_i" from 1 to 5 do
	{
		private _faction = selectrandom ["IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","NATO"];
		[_aiGroup1, _missionPos, _faction, "Rifleman"] call createsoldier;
	};
	_aiGroup4 setCombatMode "RED";
	_missionHintText = format ["An armed <t color='%1'>outpost</t> containing weapon crates has been spotted near the marker, go capture it!", IDAPMissionColor];
	_turrets = nearestObjects [_missionPos, ["RHS_M2StaticMG_W"], 50, true];
	{
		deleteVehicle _x
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
	{ _x setVariable ["Moveable", true, true] } forEach _objects;
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

_this call IDAPMissionProcessor;
