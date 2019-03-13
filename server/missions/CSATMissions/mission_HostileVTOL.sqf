// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HostileJet.sqf
//	@file Author: JoSchaap, AgentRev, LouD, GMG_Monkey

if (!isServer && hasinterface) exitWith {};
#include "CSATMissionDefines.sqf";

private ["_planeChoices", "_convoyVeh", "_veh1", "_vehicles", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_numWaypoints", "_cash", "_Boxes1", "_currBox1", "_Boxes2", "_currBox2", "_Box1", "_Box2"];

_setupVars =
{
	_missionType = "CSAT VTOL";
	_locationsArray = nil; // locations are generated on the fly from towns
};

_setupObjects =
{
	_missionPos = markerPos (((call cityList) call BIS_fnc_selectRandom) select 0);

	_veh1types = selectrandom ["O_T_VTOL_02_vehicle_F","O_T_VTOL_02_infantry_F"];
	_veh1 = [_veh1types, _missionPos,1,1,0,1000] call createMissionVehicle;
	_aiGroup1 = createGroup CIVILIAN;
	
	_vehicles = [_veh1];
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
				private _Driver = [_aiGroup1, _position, "CSAT", "HeliPilot"] call createsoldier;
				_Driver moveInDriver _vehicle;
			};
		};
		private _Copilot = [_aiGroup1, _position, "CSAT", "HeliPilot"] call createsoldier;
		_Copilot moveInAny _vehicle;
		if (_Gunners > 0) then
		{
			private _gunner = [_aiGroup1, _position, "CSAT", "HeliCrew"] call createsoldier;
			_gunner moveInGunner _vehicle;
		};
		if (_Passangers > 0) then
		{
			for "_i" from 1 to _Passangers do
			{
				private _soldierType = selectrandom ["Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","AT","AA","SAW","SAW","SAW","Engineer","Medic","Grenedier","Engineer","Medic","Grenedier","Marksman","Marksman","Marksman"];
				_soldier = [_aiGroup1, _missionPos, "CSAT", _soldierType] call createsoldier;
				_soldier moveInCargo _vehicle;
			};
		};
	} foreach _vehicles;

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup1 selectLeader _leader;
	_leader setRank "LIEUTENANT";

	_aiGroup1 setCombatMode "RED";
	_aiGroup1 setBehaviour "COMBAT";
	_aiGroup1 setFormation "STAG COLUMN";

	_speedMode ="NORMAL";

	// behaviour on waypoints
	{
		_waypoint = _aiGroup1 addWaypoint [markerPos (_x select 0), 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 55;
		_waypoint setWaypointCombatMode "RED";
		_waypoint setWaypointBehaviour "COMBAT";
		_waypoint setWaypointFormation "STAG COLUMN";
		_waypoint setWaypointSpeed _speedMode;
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup1;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh1types >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _veh1types >> "displayName");
	_missionHintText = format ["An armed <t color='%2'>%1</t> is patrolling the island. Shoot it down and kill the pilot to recover the money and weapons!", _vehicleName, CSATMissionColor];

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
	_successHintMessage = "The sky is clear again, the enemy patrol was taken out!";
	_lootPos = getMarkerPos _marker;
	for "_i" from 1 to 4 do
	{
		private _tier = selectrandom ["1","2","3","4","5"];
		private _maxmoney = random 10000;
		private _box = [_lootPos, "CSAT", _tier, 0, _maxmoney] call createrandomlootcrate;
		_box setVariable ["moveable", true, true];
	};
	smoke= "SmokeShellGreen" createVehicle _lootPos;
	_flare= "F_40mm_Green" createVehicle _lootPos;
};

_this call CSATMissionProcessor;
