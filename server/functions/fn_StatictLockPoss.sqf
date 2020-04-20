/* name: fn_StatictLockPoss.sqf */
/* Author: Animatek with code from GMG_Monkey */
/* argument: Keep Autonomus weapons unlocked and Autonomus disabled until */


if (!isServer) exitWith {};

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

if ({_static iskindof _x} count
	[
		"B_SAM_System_02_F",
		"B_HMG_01_A_F",
		"B_GMG_01_A_F",
		"B_SAM_System_01_F",
		"B_AAA_System_01_F",
		"O_HMG_01_A_F",
		"O_GMG_01_A_F",
		"I_HMG_01_A_F",
		"I_GMG_01_A_F"
	]>0) && (!({_static iskindof _x} count
	[	// except remote laser designator
		"B_Static_Designator_01_F",
		"O_Static_Designator_02_F"
	])>0)
then     
{
	if (!(_static getVariable ["R3F_LOG_disabled", false])) then			// if is unLocked
	{
		_static setAutonomous false;										// Shutdown autonomous
	};
	
	if (_distance > _BaseRadius) then										// Check distance from player base, kinda.
	{
		_static setVariable ["R3F_LOG_disabled", false, true];				// keeping it unlocked, and "Autonomous false" mode, if it's away from player base
		playSound "FD_CP_Not_Clear_F";
		["Please, lock down this in your own base only.", 5] call mf_notify_client; // Lets him know
	}
	else
	{
		if (_distance < _BaseRadius) then									// Check if from player is in his base
		{
			if (_static getVariable ["R3F_LOG_disabled", false]) then		// wait for it...
			_static setAutonomous true;										// Turn On autonomous.. dary!
		};
	};
};