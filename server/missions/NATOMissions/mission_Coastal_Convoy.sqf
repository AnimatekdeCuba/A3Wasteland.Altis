// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 2
//	@file Name: mission_Coastal_Convoy.sqf
//	@file Author: JoSchaap / routes by Del1te - (original idea by Sanjo), GMG_Monkey
//	@file Created: 02/09/2013 11:29
//	@file Args: none

// if (!isServer && hasinterface) exitWith {};
#include "NATOMissionDefines.sqf"

private [ "_veh1", "_veh2", "_veh3", "_vehicles", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_vehicleName2", "_numWaypoints", "_box1", "_box2", "_box3"];

_setupVars =
{
	_missionType = "NATO Coastal Patrol";
	_locationsArray = CoastalConvoyPaths;
};

_setupObjects =
{
	private ["_starts", "_startDirs", "_waypoints"];
	call compile preprocessFileLineNumbers format ["mapConfig\convoys\%1.sqf", _missionLocation];

	_veh1types = "B_Boat_Armed_01_minigun_F";
	_veh2types = "B_Boat_Armed_01_minigun_F";
	_veh3types = "B_Boat_Armed_01_minigun_F";

	_veh1 = [_veh1types, _starts select 0,1,1,0,0,1] call createMissionVehicle;
	_veh2 = [_veh2types, _starts select 0,1,1,0,0,1] call createMissionVehicle;
	_veh3 = [_veh3types, _starts select 0,1,1,0,0,1] call createMissionVehicle;
	_vehicles = [_veh1, _veh2, _veh3];

	_aiGroup1 = createGroup CIVILIAN;
	{
		_vehicle = _x;
		_position = getPos _vehicle;
		private _drivers = _vehicle emptyPositions "Driver";
		private _Commanders =  _vehicle emptyPositions "Commander";
		private _Gunners = _vehicle emptyPositions "Gunner";
		private _Passangers = _vehicle emptyPositions "Cargo";
		if (_drivers > 0) then
		{
			for "_i" from 1 to _drivers do
			{
				private _Driver = [_aiGroup1, _position, "NATO", "Rifleman"] call createsoldier;
				_Driver moveInDriver _vehicle;
			};
		};
		if (_Commanders > 0) then
		{
			for "_i" from 1 to _Commanders do
			{
				private _Commander = [_aiGroup1, _position, "NATO", "Rifleman"] call createsoldier;
				_Commander moveInCommander _vehicle;
			};
		};
		if (_Gunners > 0) then
		{
			private _gunner = [_aiGroup1, _position, "NATO", "Rifleman"] call createsoldier;
			_gunner moveInGunner _vehicle;
		};
		if (_Passangers > 0) then
		{
			for "_i" from 1 to _Passangers do
			{
				private _soldierType = selectrandom ["Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","AT","AA","SAW","SAW","SAW","AT","Medic","Grenedier","AA","Medic","Grenedier","Marksman","Marksman","Marksman"];
				_soldier = [_aiGroup1, _position, "NATO", _soldierType] call createsoldier;
				_soldier moveInCargo _vehicle;
			};
		};
	} foreach _vehicles;

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup1 selectLeader _leader;

	_aiGroup1 setCombatMode "YELLOW"; // units will defend themselves
	_aiGroup1 setBehaviour "AWARE"; // units feel safe until they spot an enemy or get into contact
	_aiGroup1 setFormation "STAG COLUMN";

	_speedMode = "NORMAL";

	_aiGroup1 setSpeedMode _speedMode;

	// behaviour on waypoints
	{
		_waypoint = _aiGroup1 addWaypoint [_x, 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 50;
		_waypoint setWaypointCombatMode "YELLOW";
		_waypoint setWaypointBehaviour "AWARE";
		_waypoint setWaypointFormation "STAG COLUMN";
		_waypoint setWaypointSpeed _speedMode;
	} forEach _waypoints;

	_missionPos = getPosATL leader _aiGroup1;
	_missionPicture = getText (configFile >> "CfgVehicles" >> (_veh1types param [0,""]) >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> (_veh1types param [0,""]) >> "displayName");
	_vehicleName2 = getText (configFile >> "CfgVehicles" >> (_veh2types param [0,""]) >> "displayName");
	_missionHintText = format ["Two <t color='%3'>%1</t> are patrolling the coasts.<br/>Intercept them and recover their cargo!", _vehicleName, _vehicleName2, NATOMissionColor];
	_numWaypoints = count waypoints _aiGroup1;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup1 >= _numWaypoints};

_failedExec = nil;

// _vehicles are automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission completed
	_lootPos = getMarkerPos _marker;
	for "_i" from 1 to 2 do
	{
		private _tier = selectrandom ["1","2","3"];
		private _maxmoney =ceil (10000 + random 20000);
		private _box = [_lootPos, "NATO", _tier, 0, _maxmoney] call createrandomlootcrate;
		_box setVariable ["moveable", true, true];
	};
	_successHintMessage = "The patrol has been stopped, the ammo crates are yours to take. Find them near the wreck!";
};

_this call NATOMissionProcessor;
