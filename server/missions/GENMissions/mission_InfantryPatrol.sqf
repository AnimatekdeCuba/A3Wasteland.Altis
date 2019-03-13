// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_altisPatrol.sqf
//	@file Author: JoSchaap, AgentRev, LouD, GMG_Monkey

if (!isServer && hasinterface) exitWith {};
#include "GENMissionDefines.sqf";

private ["_convoyVeh","_veh1","_veh2","_veh3","_veh4","_veh5","_pos","_rad","_vehiclePosArray","_vPos1","_vPos2","_vPos3","_vehiclePos1","_vehiclePos2","_vehiclePos3","_vehiclePos4","_vehicles","_leader","_speedMode","_waypoint","_vehicleName","_numWaypoints","_box1","_box2","_box3","_box4"];

_setupVars =
{
	_missionType = "GEN Foot Patrol";
	_locationsArray = PatrolMissionsMarkers; //Mission spawns at random town
};

_setupObjects =
{
	_town = (call cityList) call BIS_fnc_selectRandom;
	_missionPos =markerPos _missionLocation;
	_aiGroup1 = createGroup CIVILIAN;
	for "_i" from 1 to 5 do
	{
		[_aiGroup1, _missionPos, "GEN", "Rifleman"] call createsoldier;
	};
	for "_i" from 1 to 2 do
	{
		[_aiGroup1, _missionPos, "GEN", "SAW"] call createsoldier;
	};
	for "_i" from 1 to 2 do
	{
		[_aiGroup1, _missionPos, "GEN", "Grenedier"] call createsoldier;
	};

	_aiGroup1 setCombatMode "RED"; // Will fire on enemies
	_aiGroup1 setBehaviour "AWARE";  
	_aiGroup1 setFormation "WEDGE";

	_speedMode = "LIMITED";
	_aiGroup1 setSpeedMode _speedMode;

	{
		_waypoint = _aiGroup1 addWaypoint [markerPos (_x select 0), 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 50;
		_waypoint setWaypointCombatMode "RED";
		_waypoint setWaypointBehaviour "AWARE"; // safe is the best behaviour to make AI follow roads, as soon as they spot an enemy or go into combat they WILL leave the road for cover though!
		_waypoint setWaypointFormation "WEDGE";
		_waypoint setWaypointSpeed _speedMode;
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup1;


	_missionHintText = "An infantry squad is patrolling Altis! Stop the patrol and capture the goods and money!";

	_numWaypoints = count waypoints _aiGroup1;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup1 >= _numWaypoints};

_failedExec = nil;

// _vehicles are automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	_lootPos = getMarkerPos _marker;
	for "_i" from 1 to 1 do
	{
		private _tier = selectrandom ["1","2"];
		private _maxmoney = random 10000;
		private _box = [_lootPos, "GEN", _tier, 0, _maxmoney] call createrandomlootcrate;
		_box setVariable ["moveable", true, true];
	};


	_successHintMessage = "The patrol has been stopped, the money and crates and vehicles are yours to take.";
};

_this call GENMissionProcessor;
