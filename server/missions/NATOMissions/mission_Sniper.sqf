// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Sniper.sqf
//	@file Author: JoSchaap, AgentRev, LouD, GMG_Monkey

// if (!isServer && hasinterface) exitWith {};
#include "NATOMissionDefines.sqf";
private _box1 = "";
private _box2 = "";
private _box3 = "";
private _box4 = "";

_setupVars =
{
	_missionType = "NATO Sniper Nest";
	_locationsArray = SniperMissionMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	private _BoxPos1 = [_missionPos, 3, 10,1,0,0,0] call findSafePos;
	_box1 = [_BoxPos1, "NATO", "1", 0, 0] call createrandomlootcrate;
	private _BoxPos2 = [_missionPos, 3, 10,1,0,0,0] call findSafePos;
	_box2 = [_BoxPos2, "NATO", "2", 0, 0] call createrandomlootcrate;
	private _BoxPos3 = [_missionPos, 3, 10,1,0,0,0] call findSafePos;
	_box3 = [_BoxPos3, "NATO", "2", 0, 0] call createrandomlootcrate;
	private _BoxPos4 = [_missionPos, 3, 10,1,0,0,0] call findSafePos;
	_box4 = [_BoxPos4, "NATO", "3", 0, 0] call createrandomlootcrate;
	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_box1, _box2, _box3, _box4];
	_aiGroup1 = createGroup CIVILIAN;
	_aiGroup2 = createGroup CIVILIAN;
	for "_i" from 1 to 6 do
	{
		[_aiGroup2, _missionPos, "NATO", "Sniper"] call createsoldier;
	};
	for "_i" from 1 to 3 do
	{
		[_aiGroup1, _missionPos, "NATO", "AA"] call createsoldier;
	};
	for "_i" from 1 to 3 do
	{
		[_aiGroup1, _missionPos, "NATO", "AT"] call createsoldier;
	};
	_aiGroup1 setCombatMode "RED";
	_aiGroup1 setBehaviour "STEALTH";
	_aiGroup2 setCombatMode "RED";
	_aiGroup2 setBehaviour "STEALTH";
	[_aiGroup1, _missionPos] call defendArea;
	[_aiGroup2, _missionPos] call defendArea;

	_missionHintText = format ["A Sniper Nest has been spotted. Head to the marked area and Take them out! Be careful they are fully armed and dangerous!", NATOMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach [_box1, _box2, _box3, _box4];
};

_successExec =
{
	// Mission completed
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2, _box3, _box4];
	{ _x setVariable ["Movable", true, true] } forEach [_box1, _box2, _box3, _box4];
	{ _x setVariable ["cmoney", ceil (5000 + random 15000), true] } forEach [_box1, _box2, _box3, _box4];
	_successHintMessage = format ["The snipers are dead! Well Done!"];
};

_this call NATOMissionProcessor;
