//	@file Author: [404] Costlyy
//	@file Name: objectLockStateMachine.sqf
//	@file Version: 1.0
//  @file Date:	21/11/2012
//	@file Description: Locks an object until the player disconnects.
//	@file Args: [object,player,int,lockState(lock = 0 / unlock = 1)]

// Check if mutex lock is active.
if(R3F_LOG_mutex_local_verrou) exitWith {
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
};

private["_locking", "_object", "_lockState", "_lockDuration", "_stringEscapePercent", "_iteration", "_unlockDuration", "_totalDuration", "_checks", "_success","_IsProtected","_IsAllowed"];

_object = _this select 0;
_lockState = _this select 3;

_IsProtected = false;
_IsAllowed = false;

// if _object call A3W_fnc_StatictLockPoss;

if (((_object distance getMarkerPos "_BluBaseMarker") < 100) && !(side player == blufor)) exitwith {
	hint "This base can only be changed by Blufor"; R3F_LOG_mutex_local_verrou = false;
};

if (((_object distance getMarkerPos "_OPFBaseMarker") < 100) && !(side player == opfor)) exitwith {
	hint "This base can only be changed by Opfor"; R3F_LOG_mutex_local_verrou = false;
};

_totalDuration = 0;
_stringEscapePercent = "%";

switch (_lockState) do
{
	case 0: // LOCK
	{
		R3F_LOG_mutex_local_verrou = true;
		_totalDuration = 1;
		// Points of interest
		_poiDist = ["A3W_poiObjLockDistance", 100] call getPublicVar;
		_poiMarkers = allMapMarkers select {[["GenStore","BaseStore","GunStore","VehStore","Mission_","Jet_","Sniper_","RoadBlock_","Patrol_", "TERRITORY_", "NOBASE_"], _x] call fn_startsWith};

		if ({(getPosASL player) vectorDistance (ATLtoASL getMarkerPos _x) < _poiDist} count _poiMarkers > 0) exitWith
		{
			playSound "FD_CP_Not_Clear_F";
			[format ["You are not allowed to lock objects within %1m of stores and mission spawns, or within Territory Areas and Airfields", _poiDist], 5] call mf_notify_client;
			R3F_LOG_mutex_local_verrou = false;
		};
		//_object remoteExec [A3W_fnc_StatictLockPoss]; //MÁTAME
		_checks =
		{
			private ["_progress", "_object", "_failed", "_text", "_reLocker"];
			_progress = _this select 0;
			_object = _this select 1;
			_failed = true;

			switch (true) do
			{
				case (!alive player): { _text = "" };
				case (doCancelAction): { doCancelAction = false; _text = "Locking cancelled" };
				case (vehicle player != player): { _text = "Action failed! You can't do this in a vehicle" };
				case (!isNull (_object getVariable ["R3F_LOG_est_transporte_par", objNull])): { _text = "Action failed! Somebody moved the object" };
				case (_object getVariable ["objectLocked", false]): { _text = "Somebody else locked it before you" };
				default
				{
					_failed = false;
					_text = format ["Locking %1%2 complete", floor (_progress * 100), "%"];
				};
			};

			[_failed, _text];
		};

		_success = [_totalDuration, "", _checks, [_object]] call a3w_actions_start;

		if (_success) then
		{
			_object setVariable ["objectLocked", true, true];
			_object setVariable ["ownerUID", getPlayerUID player, true];
			pvar_manualObjectSave = netId _object;
			publicVariableServer "pvar_manualObjectSave";
			["Object locked!", 5] call mf_notify_client;
		};

		R3F_LOG_mutex_local_verrou = false;

	};
	case 1: // UNLOCK
	{
		R3F_LOG_mutex_local_verrou = true;
		_totalDuration = if (_object getVariable ["ownerUID", ""] == getPlayerUID player) then { 1 } else { 1}; // Allow owner to unlock quickly
		_checks =
		{
			private ["_progress", "_object", "_failed", "_text", "_reLocker"];
			_progress = _this select 0;
			_object = _this select 1;
			_failed = true;

			switch (true) do
			{
				case (!alive player): {};
				case (doCancelAction): { doCancelAction = false; _text = "Unlocking cancelled" };
				case (vehicle player != player): { _text = "Action failed! You can't do this in a vehicle" };
				case (!isNull (_object getVariable ["R3F_LOG_est_transporte_par", objNull])): { _text = "Action failed! Somebody moved the object" };
				case !(_object getVariable ["objectLocked", false]): { _text = "Somebody else unlocked it before you" };
				case (_object getVariable ["LockedDown", false]): {_text = "Object is locked down"};
				default
				{
					_failed = false;
					_text = format ["Unlocking %1%2 complete", floor (_progress * 100), "%"];
				};
			};

			[_failed, _text];
		};

		_success = [_totalDuration, "", _checks, [_object]] call a3w_actions_start;

		if (_success) then
		{
			_object setVariable ["objectLocked", false, true];
			pvar_manualObjectSave = netId _object;
			publicVariableServer "pvar_manualObjectSave";
			["Object unlocked!", 5] call mf_notify_client;
		};

		R3F_LOG_mutex_local_verrou = false;
	};
	default // This should not happen...
	{
		diag_log format["WASTELAND DEBUG: An error has occured in LockStateMachine.sqf. _lockState was unknown. _lockState actual: %1", _lockState];
	};
};

if (R3F_LOG_mutex_local_verrou) then {
	R3F_LOG_mutex_local_verrou = false;
	diag_log format["WASTELAND DEBUG: An error has occured in LockStateMachine.sqf. Mutex lock was not reset. Mutex lock state actual: %1", R3F_LOG_mutex_local_verrou];
};
