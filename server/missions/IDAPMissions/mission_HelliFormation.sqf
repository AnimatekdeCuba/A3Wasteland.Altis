// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_altisPatrol.sqf
//	@file Author: JoSchaap, AgentRev, LouD, GMG_Monkey

if (!isServer && hasinterface) exitWith {};
#include "IDAPMissionDefines.sqf";

private ["_convoyVeh","_veh1","_veh2","_veh3","_veh4","_veh5","_pos","_rad","_vPos1","_vPos2","_vPos3","_vehiclePos1","_vehiclePos2","_vehiclePos3","_vehiclePos4","_vehicles","_leader","_speedMode","_waypoint","_vehicleName","_numWaypoints","_box1","_box2","_box3","_box4"];

_setupVars =
{
	_missionType = "IDAP Helicopter Formation";
	_locationsArray = PatrolMissionsMarkers; //Mission spawns at random town
};

_setupObjects =
{
	_town = (call cityList) call BIS_fnc_selectRandom;
	_missionPos = markerPos _missionLocation;

	_veh1types = "C_IDAP_Heli_Transport_02_F";
	_veh2types = "C_IDAP_Heli_Transport_02_F";
	_veh3types = "C_IDAP_Heli_Transport_02_F";


	_aiGroup1 = createGroup CIVILIAN;
	_aiGroup2 = createGroup CIVILIAN;

	_rad = _town select 1;
	_missionPos = [_missionPos,_rad,_rad + 50,5,0,0,0] call findSafePos;

	_veh1 = [_veh1, _missionPos] call createMissionVehicle;
	_veh2 = [_veh2, _missionPos] call createMissionVehicle;
	_veh3 = [_veh3, _missionPos] call createMissionVehicle;
	_vehicles = [_veh1,_veh2,_veh3];
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
				private _Driver = [_aiGroup1, _position, "IDAP", "HeliPilot"] call createsoldier;
				_Driver moveInDriver _vehicle;
			};
		};
		private _Copilot = [_aiGroup1, _position, "IDAP", "HeliPilot"] call createsoldier;
		_Copilot moveInAny _vehicle;
		if (_Gunners > 0) then
		{
			private _gunner = [_aiGroup1, _position, "IDAP", "HeliCrew"] call createsoldier;
			_gunner moveInGunner _vehicle;
		};
		if (_Passangers > 0) then
		{
			for "_i" from 1 to (ceil _Passangers/4) do
			{
				private _faction = selectrandom ["IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","IDAP","NATO"];
				_soldier = [_aiGroup1, _missionPos, _faction, "Rifleman"] call createsoldier;
				_soldier moveInCargo _vehicle;
			};
		};
	} foreach _vehicles;
	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup1 selectLeader _leader;
	_leader setRank "LIEUTENANT";

	_aiGroup1 setCombatMode "RED"; // Will fire on enemies
	_aiGroup1 setBehaviour "COMBAT"; // units feel safe until they spot an enemy or get into contact
	_aiGroup1 setFormation "FILE";

	_speedMode = "LIMITED";
	_aiGroup1 setSpeedMode _speedMode;

	{
		_waypoint = _aiGroup1 addWaypoint [markerPos (_x select 0), 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 50;
		_waypoint setWaypointCombatMode "RED";
		_waypoint setWaypointBehaviour "COMBAT"; // safe is the best behaviour to make AI follow roads, as soon as they spot an enemy or go into combat they WILL leave the road for cover though!
		_waypoint setWaypointFormation "FILE";
		_waypoint setWaypointSpeed _speedMode;
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup1;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh2types >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _veh2types >> "displayName");
	_vehicleName2 = getText (configFile >> "CfgVehicles" >> _veh3types >> "displayName");
	_vehicleName3 = getText (configFile >> "CfgVehicles" >> _veh4types >> "displayName");

	_missionHintText = format ["A convoy containing at least a <t color='%4'>%1</t>, a <t color='%4'>%2</t> and a <t color='%4'>%3</t> is patrolling Altis! Stop the patrol and capture the goods and money!", _vehicleName, _vehicleName2, _vehicleName3, IDAPMissionColor];

	_numWaypoints = count waypoints _aiGroup1;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup1 >= _numWaypoints};

_failedExec = nil;

// _vehicles are automatically deleted or unlocked in missionProcessor depending on the outcome
_drop_item =
{
	private _item = _this select 0;
	private _pos = _this select 1;

	if (isNil "_item" || {typeName _item != typeName [] || {count(_item) != 2}}) exitWith {};
	if (isNil "_pos" || {typeName _pos != typeName [] || {count(_pos) != 3}}) exitWith {};

	private _id = _item select 0;
	private _class = _item select 1;

	private _obj = createVehicle [_class, _pos, [], 5, "None"];
	_obj setPos ([_pos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
	_obj setVariable ["mf_item_id", _id, true];
};

_successExec =
{
_lootPos = getMarkerPos _marker;
	for "_i" from 1 to 4 do
	{
		private _tier = selectrandom ["1","2","3"];
		private _maxmoney = random 10000;
		private _box = [_lootPos, "IDAP", _tier, 0, _maxmoney] call createrandomlootcrate;
		_box setVariable ["moveable", true, true];
	};
	_successHintMessage = "The patrol has been stopped, the money and crates and vehicles are yours to take.";
};

_this call IDAPMissionProcessor;
