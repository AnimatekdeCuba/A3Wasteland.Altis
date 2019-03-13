/* name: fn_StatictLockPoss.sqf */
private _static = cursorObject;
private _manager = nearestObject [player, "Land_SatellitePhone_F"];
private _ManagerPosition = getpos _manager;
private _distance = _static distance2d _ManagerPosition;
//Get manager level
private _ManagerLevel = _manager getVariable ["ManagerLevel", 1];
//set default base radius for level 1 manager
private _BaseRadius = 10;
//set base radius based on manager level
switch (_ManagerLevel) do
{
	case (2):
	{
		_BaseRadius = 20;
	};
	case (3):
	{
		_BaseRadius = 30;
	};
	case (4):
	{
		_BaseRadius = 40;
	};
	case (5):
	{
		_BaseRadius = 50;
	};
};

if ({_static iskindof _x} count[
	"B_SAM_System_02_F",
	"B_HMG_01_A_F",
	"B_GMG_01_A_F",
	"B_SAM_System_01_F",
	"B_AAA_System_01_F",
	"O_HMG_01_A_F",
	"O_GMG_01_A_F",
	"I_HMG_01_A_F",
	"I_GMG_01_A_F"]>0) && (!({_static iskindof _x} count["B_Static_Designator_01_F","O_Static_Designator_02_F"])>0) then     // except remote laser designator
	
{
	if (_static getVariable ["R3F_LOG_disabled", false]) then			// if is unLocked
	{
		_static setAutonomous false;									// Shutdown autonomous
	};
	
	if (_distance > _BaseRadius) then									// Check distance from player base, kinda.
	{
		_static setVariable ["R3F_LOG_disabled", false, true];			// keeping it unlocked and in "BLUE" and "CARELESS" mode, if it is away from player base
		playSound "FD_CP_Not_Clear_F";
		["Please, lock this only in your base.", 5] call mf_notify_client;
	}
	else
	{
		if (_distance < _BaseRadius) then									// Now is functionally
		{
			if (_static getVariable ["R3F_LOG_disabled", false]) then		// wait for it...
			_static setAutonomous true;										// Turn On autonomous
		};
	};
};