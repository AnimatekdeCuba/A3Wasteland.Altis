// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: deploy.sqf
//@file Author: MercyfulFate, GMG_Monkey, Matt76 @ CCG, Animatek
//@file Created: 21/7/2013 16:00
//@file Description: Deploy a Spawn Beacon
//@file Argument: [player, player, _action, []] the standard "called by an action" values


#define ANIM "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_CANCELLED "Action Cancelled"
#define ERR_TOO_CLOSE "Another owned beacon too close"
#define ERR_IN_WATER "Action Failed! You can only place a spawn beacon on terra firma"
#define ERR_IN_VEHICLE "Action Failed! You can't do this in a vehicle"
#define ERR_IN_BUILDING "Action Failed! You cannot place a beacon in a building"
#define ERR_IN_ROCK "Action Failed! You cannot place a beacon in a Rock or Object"
#define MAX_BEACONS format ["You cannot deploy more then %1 spawnbeacons", [_MaxSpawnbeacons]]
_MaxSpawnbeacons = ceil (["A3W_maxSpawnBeacons", 5] call getPublicVar);

private _PosPlayer = getPos player;
private _uid = getPlayerUID player;
private _CloseBeacons = nearestObjects [player, ["Land_PlasticCase_01_small_F"], 2000, true];
private _TooClose = false;
{
	if (_x getvariable ["ownerUID", ""] == _uid) then {_TooClose = true};
} foreach _CloseBeacons;


private _beacons = [];
{
	if (_x getVariable ["ownerUID",""] == getPlayerUID player) then
	{
		_beacons pushBack _x;
	};
} forEach pvar_spawn_beacons;

private _hasFailed = 
{	
	private _ownedBeacons = count _beacons;
	private _relpos = player getRelPos [20, 0];
	private _progress = _this select 0;
	private _failed = true;
	private _lisCheck = lineIntersectsWith [getPosWorld player, getPosWorld player vectorAdd [0, 0, 50], player, objNull];
	private _isok = 0; // 0 = ok, 1 = rock, 2 = building
	{
		switch (true) do {         
			case (((str _x) find 'rock') != -1): {_isok = 1;};
			case (((str _x) find 'stone') != -1): {_isok = 2;};
			case (_x isKindOf 'HOUSE'): {_isok = 3;};
		};
		// exit foreach if bad shit found
		if (_isok > 0) exitWith {};
	} forEach _lisCheck;
	if (_isok > 0) exitWith {
		switch (_isok) do {
			case 1: {[true, ERR_IN_ROCK]};
			case 2: {[true, ERR_IN_ROCK]};
			case 3: {[true, ERR_IN_BUILDING]};
		};
	};
	switch (true) do {
		case (!alive player): {};
		case (doCancelAction) :{doCancelAction = false; _text = ERR_CANCELLED;};
		case (_ownedBeacons >= _MaxSpawnbeacons): {player spawn deleteBeacon; _text = MAX_BEACONS};
		case (vehicle player != player): {_text = ERR_IN_VEHICLE};
		case (_TooClose): {_text = ERR_TOO_CLOSE};
		case (surfaceIsWater position player): {_text = ERR_IN_WATER};
		default {
			_text = format["Spawn Beacon %1%2 Deployed", round(_progress*100), "%"];
			_failed = false;
		};
	};
	[_failed, _text];
};
private _success = [MF_ITEMS_SPAWN_BEACON_DURATION, ANIM, _hasFailed, []] call a3w_actions_start;

if (_success) then {

	// Spawn 2m in front of the player
	private _beacon = createVehicle [MF_ITEMS_SPAWN_BEACON_DEPLOYED_TYPE, [player, [0,2,0]] call relativePos, [], 0, "NONE"];
	_beacon setDir (getDir player + 270);
	_beacon setVariable ["allowDamage", true, true];
	_beacon setVariable ["a3w_spawnBeacon", true, true];
	_beacon setVariable ["R3F_LOG_disabled", true];
	_beacon setVariable ["side", playerSide, true];
	_beacon setVariable ["ownerName", name player, true];
	_beacon setVariable ["ownerUID", _uid, true];
	_beacon setVariable ["packing", false, true];
	_beacon setVariable ["groupOnly", (playerSide == INDEPENDENT), true];
	pvar_spawn_beacons pushBack _beacon;
	publicVariable "pvar_spawn_beacons";
	pvar_manualObjectSave = netId _beacon;
	publicVariableServer "pvar_manualObjectSave";
	["You placed the Spawn Beacon successfully!", 5] call mf_notify_client;
};
_success;

/***********************************ORIGINAL**************************
#define ANIM "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_CANCELLED "Action Cancelled"
#define ERR_TOO_CLOSE "Another owned beacon too close"
#define ERR_IN_VEHICLE "Action Failed! You can't do this in a vehicle"
#define ERR_IN_WATER "Action Failed! You can only place a spawn beacon on terra firma"
#define ERR_IN_BUILDING "Action Failed! You cannot place a beacon in a building"
#define ERR_IN_ROCK "Action Failed! You cannot place a beacon in a Rock or Object"
#define MAX_BEACONS format ["You cannot deploy more then %1 spawnbeacons", [_MaxSpawnbeacons]]
_MaxSpawnbeacons = ceil (["A3W_maxSpawnBeacons", 5] call getPublicVar);
 
private ["_hasFailed", "_success","_pos","_uid","_beacon","_beacons","_ownedBeacons"];
 
_beacons = [];
{
	if (_x getVariable ["ownerUID",""] == getPlayerUID player) then
	{
		_beacons pushBack _x;
	};
} forEach pvar_spawn_beacons;
 
_ownedBeacons = count _beacons;
_relpos = player getRelPos [20, 0];
_hasFailed = {
	if (!alive player) exitWith {[true, 'dead']};
	if (doCancelAction) exitWith {
		doCancelAction = false;
		[true, ERR_CANCELLED]
	};
	if (vehicle player != player) exitWith {
		[true, ERR_IN_VEHICLE]
	};
	if (surfaceIsWater position player) exitWith {
		[true, ERR_IN_WATER]
	};
	if (_ownedBeacons >= _MaxSpawnbeacons) exitWith {
		player spawn deleteBeacon;
		[true, MAX_BEACONS]
	};
   
	private _lisCheck = lineIntersectsWith [getPosWorld player, getPosWorld player vectorAdd [0, 0, 50], player, objNull];
	private _isok = 0; // 0 = ok, 1 = rock, 2 = building
	{
		switch (true) do {         
			case (((str _x) find 'rock') != -1): {_isok = 1;};
			case (((str _x) find 'stone') != -1): {_isok = 2;};
			case (_x isKindOf 'HOUSE'): {_isok = 3;};
		};
		// exit foreach if bad shit found
		if (_isok > 0) exitWith {};
	} forEach _lisCheck;
	if (_isok > 0) exitWith {
		switch (_isok) do {
			case 1: {[true, ERR_IN_ROCK]};
			case 2: {[true, ERR_IN_ROCK]};
			case 3: {[true, ERR_IN_BUILDING]};
		};
	};
	[false, format["Spawn Beacon %1%2 Deployed", round(_progress*100), "%"]]
};
_success = [MF_ITEMS_SPAWN_BEACON_DURATION, ANIM, _hasFailed, []] call a3w_actions_start;
 
if (_success) then {
	_uid = getPlayerUID player;
	// Spawn 2m in front of the player
	_beacon = createVehicle [MF_ITEMS_SPAWN_BEACON_DEPLOYED_TYPE, [player, [0,2,0]] call relativePos, [], 0, "CAN_COLLIDE"];
	_beacon setDir (getDir player + 270);
	_beacon setVariable ["allowDamage", true, true];
	_beacon setVariable ["a3w_spawnBeacon", true, true];
	_beacon setVariable ["persistent", true, true];
	_beacon setVariable ["R3F_LOG_disabled", true];
	_beacon setVariable ["side", playerSide, true];
	_beacon setVariable ["ownerName", name player, true];
	_beacon setVariable ["ownerUID", _uid, true];
	_beacon setVariable ["packing", false, true];
	_beacon setVariable ["groupOnly", (playerSide == INDEPENDENT), true];
	pvar_spawn_beacons pushBack _beacon;
	publicVariable "pvar_spawn_beacons";
	pvar_manualObjectSave = netId _beacon;
	publicVariableServer "pvar_manualObjectSave";
	["You placed a Spawn Beacon successfully!", 5] call mf_notify_client;
};
_success;
**********************************************************************/