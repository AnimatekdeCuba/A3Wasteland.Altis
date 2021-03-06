// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HackLaptop.sqf
//	@file Author: JoSchaap, AgentRev, LouD

if (!isServer) exitwith {};
#include "extraMissionDefines.sqf";

private ["_positions", "_bunker", "_laptop", "_obj", "_randomGroup", "_vehicleName"];

_setupVars =
{
	_missionType = "Enemy Laptop";
	_positions = [[12540.6,16320.7,0],[3060.51,13173.3,0],[23870.8,15973,0],[16128.1,16995.5,0],[16748.2,13640.6,0],[14025,12982.7,0],[21811.1,6011.82,0]];

	_missionPos = _positions call BIS_fnc_SelectRandom;
};

_setupObjects =
{
	_bunker = createVehicle ["Land_BagBunker_Small_F", [_missionPos select 0, _missionPos select 1], [], 0, "CAN_COLLIDE"];

	_missionPos = getPosASL _bunker;

	_laptop = createVehicle ["Land_Laptop_unfolded_F", _missionPos, [], 0, "CAN_COLLIDE"];
	_laptop setPosASL [_missionPos select 0, (_missionPos select 1) - 0.25, _missionPos select 2];

	_obj = createVehicle ["I_HMG_01_high_F", _missionPos,[], 10,"None"]; 
	_obj setPosASL [_missionPos select 0, (_missionPos select 1) + 2, _missionPos select 2];

	AddLaptopHandler = _laptop;
	publicVariable "AddLaptopHandler";

	_laptop setVariable [ "Done", false, true ];

	// NPC Randomizer 
	_randomGroup = [createGroup1,createGroup2,createGroup3,createGroup4,createGroup5] call BIS_fnc_selectRandom;
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos] spawn _randomGroup;

	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";	
	
	_vehicleName = "Laptop";
	_missionHintText = format ["Hemos hallado una <t color='%2'>%1</t> con las cuentas del banco de tu enemigo, anda y hackealo.", _vehicleName, extraMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec =
{
	AddLaptopHandler = _laptop;
	publicVariable "AddLaptopHandler";
};
_waitUntilCondition = nil;
_waitUntilSuccessCondition = { _laptop getVariable ["Done", false] };
_ignoreAiDeaths = true;

_failedExec =
{
	// Mission failed
	RemoveLaptopHandler = _laptop;
	publicVariable "RemoveLaptopHandler";
	{ deleteVehicle _x } forEach [_bunker, _obj, _laptop];
};

_successExec =
{
	// Mission completed
	RemoveLaptopHandler = _laptop;
	publicVariable "RemoveLaptopHandler";
	{ deleteVehicle _x } forEach [_bunker, _laptop];

	_successHintMessage = format ["La laptop ha sido hackeada y los bandidos han muerto!"];
};

_this call extraMissionProcessor;