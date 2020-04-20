// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_altisPatrol.sqf
//	@file Author: JoSchaap, AgentRev, LouD, GMG_Monkey

// if (!isServer && hasinterface) exitWith {};
#include "SYNMissionDefines.sqf";

private ["_convoyVeh","_veh1","_veh2","_veh3","_veh4","_veh5","_pos","_rad","_vPos1","_vPos2","_vPos3","_vehiclePos1","_vehiclePos2","_vehiclePos3","_vehiclePos4","_vehicles","_leader","_speedMode","_waypoint","_vehicleName","_numWaypoints","_box1","_box2","_box3","_box4"];

_setupVars =
{
	_missionType = "SYN Large Convoy";
	_locationsArray = PatrolMissionsMarkers; //Mission spawns at random town
};

_setupObjects =
{
	_town = (call cityList) call BIS_fnc_selectRandom;
	_missionPos = markerPos _missionLocation;
	_veh1types = selectrandom ["I_C_Offroad_02_unarmed_F","I_C_Van_01_transport_F","I_C_Van_02_vehicle_F","I_C_Van_02_transport_F","I_G_Offroad_01_F","I_G_Offroad_01_armed_F"];
	_veh2types = selectrandom ["I_C_Offroad_02_unarmed_F","I_C_Van_01_transport_F","B_G_Offroad_01_AT_F","I_G_Offroad_01_armed_F"];
	_veh3types = selectrandom ["I_C_Offroad_02_unarmed_F","I_C_Van_01_transport_F","I_C_Van_02_vehicle_F","I_C_Van_02_transport_F","I_G_Offroad_01_F","I_G_Offroad_01_armed_F"];
	_veh4types = selectrandom ["I_C_Offroad_02_unarmed_F","I_C_Van_01_transport_F","I_C_Van_02_vehicle_F","I_C_Van_02_transport_F","I_G_Offroad_01_F","I_G_Offroad_01_armed_F"];
	_veh5types = selectRandom ["rhsgref_ins_btr60","rhsgref_ins_btr70"];
	_veh6types = selectrandom ["I_C_Offroad_02_unarmed_F","I_C_Van_01_transport_F","I_C_Van_02_vehicle_F","I_C_Van_02_transport_F","I_G_Offroad_01_F","I_G_Offroad_01_armed_F"];
	_veh7types = selectrandom ["I_C_Offroad_02_unarmed_F","I_C_Van_01_transport_F","I_C_Van_02_vehicle_F","I_C_Van_02_transport_F","I_G_Offroad_01_F","I_G_Offroad_01_armed_F"];
	_veh8types = selectrandom ["rhsgref_BRDM2_ATGM_ins","rhsgref_BRDM2_HQ_ins"];
	_veh9types = selectrandom ["I_C_Offroad_02_unarmed_F","I_C_Van_01_transport_F","I_C_Van_02_vehicle_F","I_C_Van_02_transport_F","I_G_Offroad_01_F","I_G_Offroad_01_armed_F"];

	_aiGroup1 = createGroup CIVILIAN;
	_aiGroup2 = createGroup CIVILIAN;

	_veh1 = [_veh1types, _missionPos] call createMissionVehicle;
	_veh2 = [_veh2types, _missionPos] call createMissionVehicle;
	_veh3 = [_veh3types, _missionPos] call createMissionVehicle;
	_veh4 = [_veh4types, _missionPos] call createMissionVehicle;
	_veh5 = [_veh5types, _missionPos] call createMissionVehicle;
	_veh6 = [_veh6types, _missionPos] call createMissionVehicle;
	_veh7 = [_veh7types, _missionPos] call createMissionVehicle;
	_veh8 = [_veh8types, _missionPos] call createMissionVehicle;
	_veh9 = [_veh9types, _missionPos] call createMissionVehicle;
	_vehicles = [_veh1,_veh2,_veh3,_veh4,_veh5,_veh6,_veh7,_veh8,_veh9];
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
				private _Driver = [_aiGroup1, _position, "SYN", "Crew"] call createsoldier;
				_Driver moveInDriver _vehicle;
			};
		};
		if (_Commanders > 0) then
		{
			for "_i" from 1 to _Commanders do
			{
				private _Commander = [_aiGroup1, _position, "SYN", "Crew"] call createsoldier;
				_Commander moveInCommander _vehicle;
			};
		};
		if (_Gunners > 0) then
		{
			private _gunner = [_aiGroup1, _position, "SYN", "Crew"] call createsoldier;
			_gunner moveInGunner _vehicle;
		};
		if (_Passangers > 0) then
		{
			for "_i" from 1 to (ceil _Passangers/4) do
			{
				private _soldierType = selectrandom ["Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","AT","AT","AT","SAW","SAW","SAW","Grenedier","Grenedier","Grenedier","Grenedier","Grenedier"];
				_soldier = [_aiGroup2, _position, "SYN", _soldierType] call createsoldier;
				_soldier moveInCargo _vehicle;
			};
		};
	} foreach _vehicles;

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup1 selectLeader _leader;
	_leader setRank "LIEUTENANT";

	_aiGroup1 setCombatMode "GREEN"; // Will defend themselves
	_aiGroup1 setBehaviour "AWARE"; // units feel safe until they spot an enemy or get into contact
	_aiGroup1 setFormation "FILE";

	_speedMode = "LIMITED";
	_aiGroup1 setSpeedMode _speedMode;

	{
		_waypoint = _aiGroup1 addWaypoint [markerPos (_x select 0), 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 50;
		_waypoint setWaypointCombatMode "GREEN";
		_waypoint setWaypointBehaviour "AWARE"; // safe is the best behaviour to make AI follow roads, as soon as they spot an enemy or go into combat they WILL leave the road for cover though!
		_waypoint setWaypointFormation "FILE";
		_waypoint setWaypointSpeed _speedMode;
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup1;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh2types >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _veh2types >> "displayName");
	_vehicleName2 = getText (configFile >> "CfgVehicles" >> _veh3types >> "displayName");
	_vehicleName3 = getText (configFile >> "CfgVehicles" >> _veh4types >> "displayName");

	_missionHintText = format ["A convoy containing at least a <t color='%4'>%1</t>, a <t color='%4'>%2</t> and a <t color='%4'>%3</t> is patrolling Altis! Stop the patrol and capture the goods and money!", _vehicleName, _vehicleName2, _vehicleName3, SYNMissionColor];

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
	for "_i" from 1 to 3 do
	{
		private _tier = selectrandom ["1","2"];
		private _maxmoney = ceil (10000 + random 20000);
		private _box = [_lootPos, "SYN", _tier, 0, _maxmoney] call createrandomlootcrate;
		_box setVariable ["moveable", true, true];
	};
	_successHintMessage = "The patrol has been stopped, the money and crates and vehicles are yours to take.";
};

_this call SYNMissionProcessor;
