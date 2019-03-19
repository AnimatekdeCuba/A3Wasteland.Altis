// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: missionProcessor.sqf
//	@file Author: AgentRev, GMG_Monkey

// if (!isServer && hasinterface) exitWith {};

#define MISSION_LOCATION_COOLDOWN (10*60)
#define MISSION_TIMER_EXTENSION (15*60)

private ["_controllerSuffix", "_missionTimeout", "_availableLocations", "_missionLocation", "_leader", "_marker", "_failed", "_complete", "_startTime", "_oldAiCount", "_leaderTemp1","_leaderTemp2","_leaderTemp3","_leaderTemp4", "_newAiCount", "_adjustTime", "_lastPos", "_floorHeight", "_startAiCount", "_reinforcementsCalled", "_reinforceChanceRoll", "_reinforcementsToCall"];

// Variables that can be defined in the mission script :
private ["_missionType", "_locationsArray", "_aiGroup1", "_aiGroup2", "_aiGroup3", "_aiGroup4", "_missionPos", "_missionPicture", "_missionHintText", "_successHintMessage", "_failedHintMessage", "_reinforceChance", "_minReinforceGroups","_maxReinforceGroups"];

_controllerSuffix = param [0, "", [""]];
_aiGroup1 = grpNull;
_aiGroup2 = grpNull;
_aiGroup3 = grpNull;
_aiGroup4 = grpNull;
_minefield = [];

if (!isNil "_setupVars") then { call _setupVars };

diag_log format ["WASTELAND SERVER - %1 Mission%2 started: %3", MISSION_PROC_TYPE_NAME, _controllerSuffix, _missionType];

_missionTimeout = MISSION_PROC_TIMEOUT;

if (!isNil "_locationsArray") then
{
	while {true} do
	{
		_availableLocations = [_locationsArray, { !(_x select 1) && diag_tickTime - (_x param [2, -1e11]) >= MISSION_LOCATION_COOLDOWN}] call BIS_fnc_conditionalSelect;

		if (count _availableLocations > 0) exitWith {};
		uiSleep 60;
	};

	_missionLocation = (_availableLocations call BIS_fnc_selectRandom) select 0;
	[_locationsArray, _missionLocation, true] call setLocationState;
	[_locationsArray, _missionLocation, markerPos _missionLocation] call cleanLocationObjects; // doesn't matter if _missionLocation is not a marker, the function will know
};

if (!isNil "_setupObjects") then { call _setupObjects };

_leader = leader _aiGroup1;
_marker = [_missionType, _missionPos] call createMissionMarker;
_aiGroup1 setVariable ["A3W_missionMarkerName", _marker, true];

if (isNil "_missionPicture") then { _missionPicture = "" };

[
	format ["%1 Objective", MISSION_PROC_TYPE_NAME],
	_missionType,
	_missionPicture,
	_missionHintText,
	MISSION_PROC_COLOR_DEFINE
]
call missionHint;

diag_log format ["WASTELAND SERVER - %1 Mission%2 waiting to be finished: %3", MISSION_PROC_TYPE_NAME, _controllerSuffix, _missionType];

_failed = false;
_complete = false;
_startTime = diag_tickTime;
_oldAiCount = 0;

if (isNil "_ignoreAiDeaths") then { _ignoreAiDeaths = false };

waitUntil
{
	uiSleep 1;

	_leaderTemp1 = leader _aiGroup1;
	_leaderTemp2 = leader _aiGroup2;
	_leaderTemp3 = leader _aiGroup3;
	_leaderTemp4 = leader _aiGroup4;

	// Force immediate leader change if current one is dead
	if (!alive _leaderTemp1) then
	{
		{
			if (alive _x) exitWith
			{
				_aiGroup1 selectLeader _x;
				_leaderTemp1 = _x;
			};
		} forEach units _aiGroup1;
	};
	if (!alive _leaderTemp2) then
	{
		{
			if (alive _x) exitWith
			{
				_aiGroup2 selectLeader _x;
				_leaderTemp2 = _x;
			};
		} forEach units _aiGroup2;
	};
	if (!alive _leaderTemp3) then
	{
		{
			if (alive _x) exitWith
			{
				_aiGroup3 selectLeader _x;
				_leaderTemp3 = _x;
			};
		} forEach units _aiGroup3;
	};
	if (!alive _leaderTemp4) then
	{
		{
			if (alive _x) exitWith
			{
				_aiGroup4 selectLeader _x;
				_leaderTemp4 = _x;
			};
		} forEach units _aiGroup4;
	};

	_newAiCount1 = count units _aiGroup1;
	_newAiCount2 = count units _aiGroup2;
	_newAiCount3 = count units _aiGroup3;
	_newAiCount4 = count units _aiGroup4;
	_AICount = (_newAiCount1 + _newAiCount2 + _newAiCount3 + _newAiCount4);

	if (_AICount < _oldAiCount) then
	{
		// some units were killed, mission expiry will be reset to 15 mins if it's currently lower than that
		_adjustTime = if (_missionTimeout < MISSION_TIMER_EXTENSION) then { MISSION_TIMER_EXTENSION - _missionTimeout } else { 0 };
		_startTime = _startTime max (diag_tickTime - ((MISSION_TIMER_EXTENSION - _adjustTime) max 0));
	};
	_oldAiCount = _AICount;
	// Update current leader
	if (!isNull _leaderTemp1) then 
	{ 
		_leader = _leaderTemp1 
	}
	else
	{
		if (!isNull _leaderTemp2) then
		{
			_leader = _leaderTemp2
		}
		else
		{
			if (!isNull _leaderTemp3) then
			{
				_leader = _leaderTemp3
			}
			else
			{
				if (!isNull _leaderTemp4) then
				{
					_leader = _leaderTemp4
				};
			};
		};
	}; 

	if (!isNil "_waitUntilMarkerPos") then { _marker setMarkerPos (call _waitUntilMarkerPos) };
	if (!isNil "_waitUntilExec") then { call _waitUntilExec };

	_failed = ((!isNil "_waitUntilCondition" && {call _waitUntilCondition}) || diag_tickTime - _startTime >= _missionTimeout);

	if (!isNil "_waitUntilSuccessCondition" && {call _waitUntilSuccessCondition}) then
	{
		_failed = false;
		_complete = true;
	};

	(_failed || _complete || (!_ignoreAiDeaths && ({alive _x} count units _aiGroup1 == 0) && ({alive _x} count units _aiGroup2 == 0) && ({alive _x} count units _aiGroup3 == 0) && ({alive _x} count units _aiGroup4 == 0)))
};

if (_failed) then
{
	// Mission failed

	{ moveOut _x; deleteVehicle _x } forEach units _aiGroup1;
	{ moveOut _x; deleteVehicle _x } forEach units _aiGroup2;
	{ moveOut _x; deleteVehicle _x } forEach units _aiGroup3;
	{ moveOut _x; deleteVehicle _x } forEach units _aiGroup4;

	if (!isNil "_failedExec") then { call _failedExec };

	if (!isNil "_vehicle" && {typeName _vehicle == "OBJECT"}) then
	{
		deleteVehicle _vehicle;
	};

	if (!isNil "_vehicles" && {typeName _vehicles == "ARRAY"}) then
	{
		{
			if (!isNil "_x" && {typeName _x == "OBJECT"}) then
			{
				deleteVehicle _x;
			};
		} forEach _vehicles;
	};
	if (!isNil "_minefield" && {typeName _minefield == "ARRAY"}) then
	{
		{
			if (!isNil "_x" && {typeName _x == "OBJECT"}) then
			{
				deleteVehicle _x;
			};
		} forEach _minefield;
	};
	[
		"Objective Failed",
		_missionType,
		_missionPicture,
		if (!isNil "_failedHintMessage") then { _failedHintMessage } else { "Better luck next time!" },
		failMissionColor
	]
	call missionHint;

	diag_log format ["WASTELAND SERVER - %1 Mission%2 failed: %3", MISSION_PROC_TYPE_NAME, _controllerSuffix, _missionType];
}
else
{
	// Mission completed

	if (isNull _leader) then
	{
		_lastPos = markerPos _marker;
	}
	else
	{
		_lastPos = _leader call fn_getPos3D;
		_floorHeight = (getPos _leader) select 2;
		_lastPos set [2, (_lastPos select 2) - _floorHeight];
	};

	if (!isNil "_successExec") then { call _successExec };

	if (!isNil "_vehicle" && {typeName _vehicle == "OBJECT"}) then
	{
		_vehicle setVariable ["R3F_LOG_disabled", false, true];

		if (!isNil "fn_manualVehicleSave") then
		{
			_vehicle call fn_manualVehicleSave;
		};
	};

	if (!isNil "_vehicles" && {typeName _vehicles == "ARRAY"}) then
	{
		{
			if (!isNil "_x" && {typeName _x == "OBJECT"}) then
			{
				_x setVariable ["R3F_LOG_disabled", false, true];

				if (!isNil "fn_manualVehicleSave") then
				{
					_x call fn_manualVehicleSave;
				};
			};
		} forEach _vehicles;
	};
	if (!isNil "_minefield" && {typeName _minefield == "ARRAY"}) then
	{
		{
			if (!isNil "_x" && {typeName _x == "OBJECT"}) then
			{
				deleteVehicle _x;
			};
		} forEach _minefield;
	};
	[
		"Objective Complete",
		_missionType,
		_missionPicture,
		_successHintMessage,
		successMissionColor
	]
	call missionHint;

	diag_log format ["WASTELAND SERVER - %1 Mission%2 complete: %3", MISSION_PROC_TYPE_NAME, _controllerSuffix, _missionType];
};

deleteGroup _aiGroup1;
deleteGroup _aiGroup2;
deleteGroup _aiGroup3;
deleteGroup _aiGroup4;
deleteMarker _marker;

if (!isNil "_locationsArray") then
{
	[_locationsArray, _missionLocation, false] call setLocationState;
};
