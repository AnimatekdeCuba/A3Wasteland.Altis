/* name: fn_StatictLockPoss.sqf */
/* Author: Animatek with code from GMG_Monkey */
/* argument: [_static, _player, "_checkType"] - Validate autonomous weapon restrictions */
/* Compatible with: R3F, BOS, ACE3 */
/* 
   BEHAVIOR:
   - Static weapons spawn with AI disabled but movable via R3F
   - Can only be LOCKED (R3F/BoS objectLocked) inside owner's base perimeter
   - Can only have AI activated when INSIDE base AND locked
   - Co-owners (same group) can also lock/unlock in the base
   
   USAGE:
   - [_static, _player, "checkLock"] call A3W_fnc_StatictLockPoss; // Returns true if lock is allowed
   - [_static, _player, "checkActivate"] call A3W_fnc_StatictLockPoss; // Returns true if AI activation is allowed
   - [_static] call A3W_fnc_StatictLockPoss; // Legacy: just enforces current state
*/

if (!isServer && !hasInterface) exitWith {};

params [
    ["_input1", objNull, [objNull, ""], 2],
    ["_input2", objNull, [objNull, ""], 2],
    ["_input3", "", [""]]
];

// Determine parameter order based on types
private _static = objNull;
private _player = objNull;
private _checkType = "";

if (_input1 isEqualType objNull) then {
    _static = _input1;
    if (_input2 isEqualType objNull) then {
        _player = _input2;
        _checkType = _input3;
    } else {
        _checkType = _input2;
        _player = player;
    };
} else {
    // Legacy call with just [_static]
    _static = _input1;
    _player = player;
    _checkType = "";
};

// Validate inputs
if (isNull _static || !alive _static) exitWith { false };

// Only process static weapons
if !(_static isKindOf "StaticWeapon") exitWith { false };

// Check if this is an autonomous static weapon (excluding laser designators)
private _isAutonomousStatic = {_static isKindOf _x} count [
    "B_SAM_System_02_F",
    "B_HMG_01_A_F",
    "B_GMG_01_A_F",
    "B_SAM_System_01_F",
    "B_AAA_System_01_F",
    "O_HMG_01_A_F",
    "O_GMG_01_A_F",
    "I_HMG_01_A_F",
    "I_GMG_01_A_F",
    "B_SAM_System_03_F",
    "O_SAM_System_04_F"
] > 0;

private _isDesignator = {_static isKindOf _x} count [
    "B_Static_Designator_01_F",
    "O_Static_Designator_02_F"
] > 0;

// Only process autonomous statics, not designators
if (!_isAutonomousStatic || _isDesignator) exitWith { false };

// Helper function to validate base proximity and ownership
private _validateBaseAccess = {
    params ["_staticObj", "_playerObj"];
    
    private _playerUID = getPlayerUID _playerObj;
    private _staticOwnerUID = _staticObj getVariable ["ownerUID", ""];
    
    // Find nearest base manager
    private _manager = nearestObject [_staticObj, "Land_SatellitePhone_F"];
    if (isNull _manager) exitWith { [false, 0, 0, ""] };
    
    private _managerOwnerUID = _manager getVariable ["ownerUID", ""];
    private _managerLevel = _manager getVariable ["ManagerLevel", 1];
    
    // Calculate base radius
    private _baseRadius = switch (_managerLevel) do {
        case 2: { 20 };
        case 3: { 30 };
        case 4: { 40 };
        case 5: { 50 };
        default { 10 };
    };
    
    // Check if player owns this base or is co-owner (same group)
    private _isOwner = (_managerOwnerUID == _playerUID);
    private _isCoOwner = false;
    
    // Check co-ownership via group
    if (!_isOwner && _managerOwnerUID != "") then {
        {
            if (getPlayerUID _x == _managerOwnerUID) exitWith {
                _isCoOwner = (group _x == group _playerObj);
            };
        } forEach allPlayers;
    };
    
    // Calculate distance
    private _managerPosition = getPosATL _manager;
    private _distance = _staticObj distance2D _managerPosition;
    private _insideBase = (_distance <= _baseRadius);
    
    // Return: [isAllowed, distance, baseRadius, managerOwnerUID]
    [_isOwner || _isCoOwner, _distance, _baseRadius, _managerOwnerUID]
};

// CHECK TYPE: "checkLock" - Validate if player can lock this autonomous weapon
if (_checkType == "checkLock") then {
    if (isNull _player || !alive _player) exitWith { false };
    
    // Validate base access
    private _accessResult = [_static, _player] call _validateBaseAccess;
    private _hasAccess = _accessResult select 0;
    private _distance = _accessResult select 1;
    private _baseRadius = _accessResult select 2;
    
    if (!_hasAccess) exitWith {
        diag_log format ["[StaticLock] %1: Player lacks base access for locking", typeOf _static];
        false
    };
    
    if (!_distance <= _baseRadius) exitWith {
        diag_log format ["[StaticLock] %1: Outside base radius (%2m > %3m)", typeOf _static, _distance, _baseRadius];
        false
    };
    
    // All checks passed
    diag_log format ["[StaticLock] %1: Lock allowed (inside base at %2m)", typeOf _static, _distance];
    true
};

// CHECK TYPE: "checkActivate" - Validate if AI can be activated
if (_checkType == "checkActivate") then {
    // Must be locked first
    private _isLocked = _static getVariable ["objectLocked", false];
    if (!_isLocked) exitWith {
        diag_log format ["[StaticLock] %1: Cannot activate AI - not locked", typeOf _static];
        false
    };
    
    // Validate base access
    private _accessResult = [_static, _player] call _validateBaseAccess;
    private _hasAccess = _accessResult select 0;
    private _distance = _accessResult select 1;
    private _baseRadius = _accessResult select 2;
    
    if (!_hasAccess) exitWith {
        diag_log format ["[StaticLock] %1: Player lacks base access for activation", typeOf _static];
        false
    };
    
    if (!(_distance <= _baseRadius)) exitWith {
        diag_log format ["[StaticLock] %1: Cannot activate AI - outside base (%2m > %3m)", typeOf _static, _distance, _baseRadius];
        false
    };
    
    // All checks passed
    diag_log format ["[StaticLock] %1: AI activation allowed", typeOf _static];
    true
};

// LEGACY MODE: Just enforce current state (called without checkType or with empty string)
if (_checkType == "") then {
    if (!isServer) exitWith { false };
    
    // Get current lock state
    private _isLocked = _static getVariable ["objectLocked", false];
    
    // Find owner or use provided player
    private _targetPlayer = _player;
    if (isNull _targetPlayer) then {
        private _ownerUID = _static getVariable ["ownerUID", ""];
        if (_ownerUID == "") exitWith {
            _static setAutonomous false;
            _static setVariable ["R3F_LOG_disabled", false, true];
            false
        };
        
        {
            if (getPlayerUID _x == _ownerUID) exitWith {
                _targetPlayer = _x;
            };
        } forEach allPlayers;
        
        if (isNull _targetPlayer) exitWith {
            _static setAutonomous false;
            _static setVariable ["R3F_LOG_disabled", false, true];
            false
        };
    };
    
    // Validate base access
    private _accessResult = [_static, _targetPlayer] call _validateBaseAccess;
    private _hasAccess = _accessResult select 0;
    private _distance = _accessResult select 1;
    private _baseRadius = _accessResult select 2;
    
    private _insideBase = (_distance <= _baseRadius);
    
    // ENFORCE RULES:
    // 1. Outside base: Cannot be locked, AI always disabled, but R3F movable
    // 2. Inside base + locked: AI can be enabled
    // 3. Inside base + Not locked: AI disabled, R3F movable
    
    if (!_insideBase || !_hasAccess) then {
        // OUTSIDE BASE PERIMETER or NO ACCESS
        // Force unlock if somehow locked outside
        if (_isLocked) then {
            _static setVariable ["objectLocked", false, true];
            diag_log format ["[StaticLock] %1 forcibly unlocked (outside base/no access)", typeOf _static];
        };
        
        // Keep AI disabled
        _static setAutonomous false;
        
        // Keep R3F movable so player can transport it
        _static setVariable ["R3F_LOG_disabled", false, true];
        
        diag_log format ["[StaticLock] %1 outside base/no access (%2m), AI disabled, unlocked, movable", typeOf _static, _distance];
        false
    } else {
        // INSIDE BASE PERIMETER WITH ACCESS
        if (_isLocked) then {
            // Locked inside base: AI activation is ALLOWED (but not forced here)
            diag_log format ["[StaticLock] %1 inside base and locked, AI activation allowed", typeOf _static];
            true
        } else {
            // Not locked inside base: Keep AI disabled but R3F movable
            _static setAutonomous false;
            _static setVariable ["R3F_LOG_disabled", false, true];
            diag_log format ["[StaticLock] %1 inside base but not locked, AI disabled", typeOf _static];
            false
        };
    };
};
