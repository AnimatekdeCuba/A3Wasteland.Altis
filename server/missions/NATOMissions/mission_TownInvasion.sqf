// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_TownInvasion.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, JoSchaap, AgentRev, Zenophon, GMG_Monkey
//  @file Information: JoSchaap's Lite version of 'Infantry Occupy House' Original was made by: Zenophon

if (!isServer && hasinterface) exitWith {};

#include "NATOMissionDefines.sqf"

private ["_box1", "_box2", "_box3", "_box4", "_townName", "_buildingRadius", "_putOnRoof", "_fillEvenly", "_tent1", "_chair1", "_chair2", "_cFire1"];

_setupVars =
{
	_missionType = "Town Invasion";
	// settings for this mission
	_locArray = ((call cityList) call BIS_fnc_selectRandom);
	_missionPos = markerPos (_locArray select 0);
	_buildingRadius = _locArray select 1;
	_townName = _locArray select 2;
	// reduce radius for larger towns. for example to avoid endless hide and seek in kavala ;)
	// _buildingRadius = if (_buildingRadius > 201) then {(_buildingRadius*0.5)} else {_buildingRadius};
	// 25% change on AI not going on rooftops
	if (random 1 < 0.75) then { _putOnRoof = true } else { _putOnRoof = false };
	// 25% chance on AI trying to fit into a single building instead of spreading out
	if (random 1 < 0.75) then { _fillEvenly = true } else { _fillEvenly = false };
};

_setupObjects =
{
	private _BoxPos1 = [_missionPos, 3, 10,1,0,0,0] call findSafePos;
	_box1 = [_BoxPos1, "NATO", "1", 0, 0] call createrandomlootcrate;
	private _BoxPos2 = [_missionPos, 3, 10,1,0,0,0] call findSafePos;
	_box2 = [_BoxPos2, "NATO", "2", 0, 0] call createrandomlootcrate;
	private _BoxPos3 = [_missionPos, 3, 10,1,0,0,0] call findSafePos;
	_box3 = [_BoxPos3, "NATO", "2", 0, 0] call createrandomlootcrate;
	private _BoxPos4 = [_missionPos, 3, 10,1,0,0,0] call findSafePos;
	_box4 = [_BoxPos4, "NATO", "3", 0, 0] call createrandomlootcrate;
	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_box1, _box2, _box3, _box4];
	// create some atmosphere around the crates 8)
	_tent1 = createVehicle ["Land_cargo_addon02_V2_F", _missionPos, [], 3, "None"];
	_tent1 setDir random 360;
	_chair1 = createVehicle ["Land_CampingChair_V1_F", _missionPos, [], 2, "None"];
	_chair1 setDir random 90;
	_chair2 = createVehicle ["Land_CampingChair_V2_F", _missionPos, [], 2, "None"];
	_chair2 setDir random 180;
	_cFire1	= createVehicle ["Campfire_burning_F", _missionPos, [], 2, "None"];


	// spawn some rebels/enemies :)
	_aiGroup1 = createGroup CIVILIAN;
	for "_i" from 1 to 10 do
	{
		private _soldierType = selectrandom ["Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","AT","AA","SAW","SAW","SAW","Engineer","Medic","Grenedier","Engineer","Medic","Grenedier","Marksman","Marksman","Marksman"];
		[_aiGroup1, _missionPos, "NATO", _soldierType] call createsoldier;

	};
	_aiGroup1 setCombatMode "RED";
	
	_aiGroup2 = createGroup CIVILIAN;
	for "_i" from 1 to 10 do
	{
		private _soldierType = selectrandom ["Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","AT","AA","SAW","SAW","SAW","Engineer","Medic","Grenedier","Engineer","Medic","Grenedier","Marksman","Marksman","Marksman"];
		[_aiGroup2, _missionPos, "NATO", _soldierType] call createsoldier;

	};
	_aiGroup2 setCombatMode "RED";
	
	_aiGroup3 = createGroup CIVILIAN;
	for "_i" from 1 to 10 do
	{
		private _soldierType = selectrandom ["Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","AT","AA","SAW","SAW","SAW","Engineer","Medic","Grenedier","Engineer","Medic","Grenedier","Marksman","Marksman","Marksman"];
		[_aiGroup3, _missionPos, "NATO", _soldierType] call createsoldier;

	};
	_aiGroup3 setCombatMode "RED";
	
	_aiGroup4 = createGroup CIVILIAN;
	for "_i" from 1 to 10 do
	{
		private _soldierType = selectrandom ["Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","Rifleman","AT","AA","SAW","SAW","SAW","Engineer","Medic","Grenedier","Engineer","Medic","Grenedier","Marksman","Marksman","Marksman"];
		[_aiGroup4, _missionPos, "NATO", _soldierType] call createsoldier;

	};
	// move them into buildings
	_group1 = units _aiGroup1;
	_group2 = units _aiGroup2;
	_group3 = units _aiGroup3;
	_group4 = units _aiGroup4;
	_units = _group1 + _group2 + _group3 + _group4;
	[_units, _missionPos, _buildingRadius, _fillEvenly, _putOnRoof] call moveIntoBuildings;
	_aiGroup4 setCombatMode "RED";

	_missionHintText = format ["Hostiles have taken over <br/><t size='1.25' color='%1'>%2</t><br/><br/>There seem to be <t color='%1'>30 enemies</t> hiding inside or on top of buildings. Get rid of them all, and take their supplies!<br/>Watch out for those windows!", NATOMissionColor, _townName];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach [_box1, _box2, _box3, _box4, _tent1, _chair1, _chair2, _cFire1];
};

_successExec =
{
	// Mission completed
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2, _box3, _box4];
	{ _x setVariable ["cmoney",ceil (random 10000), true] } forEach [_box1, _box2, _box3, _box4];
	{ _x setVariable ["Moveable", true, true] } forEach [_box1, _box2, _box3, _box4];

	_successHintMessage = format ["Nice work!<br/><br/><t color='%1'>%2</t><br/>is a safe place again!<br/>Their belongings are now yours to take!", NATOMissionColor, _townName];
	{ deleteVehicle _x } forEach [_tent1, _chair1, _chair2, _cFire1];
};

_this call NATOMissionProcessor;
