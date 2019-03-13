// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HostageRescue.sqf
//	@file Author: JoSchaap, AgentRev, GriffinZS, RickB, soulkobk

if (!isServer) exitwith {};
#include "extraMissionDefines.sqf";

private ["_positions", "_camonet", "_hostage", "_obj1", "_obj3", "_obj4", "_vehicleName", "_chair", "_cash"];

_setupVars =
{
	_missionType = "Hostage Rescue";
	_locationsArray = MissionSpawnMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	
	//delete existing base parts and vehicles at location
	_baseToDelete = nearestObjects [_missionPos, ["All"], 25];
	{ deleteVehicle _x } forEach _baseToDelete; 
	
	_camonet = createVehicle ["CamoNet_INDP_open_F", [_missionPos select 0, _missionPos select 1], [], 0, "NONE"];
	_camonet allowdamage false;
	_camonet setDir random 360;
	_camonet setVariable ["R3F_LOG_disabled", false];

	_missionPos = getPosATL _camonet;

	_chair = createVehicle ["Land_Slums02_pole", _missionPos, [], 0, "NONE"];
	_chair setPosATL [_missionPos select 0, _missionPos select 1, _missionPos select 2];
	
	_hostage = createVehicle ["C_Nikos_aged", _missionPos, [], 0, "NONE"];
	_hostage setPosATL [_missionPos select 0, _missionPos select 1, _missionPos select 2];
	waitUntil {alive _hostage};
	[_hostage, "Acts_AidlPsitMstpSsurWnonDnon_loop"] call switchMoveGlobal;
	_hostage disableAI "anim";
	
   	

	_obj1 = createVehicle ["I_GMG_01_high_F", _missionPos,[], 10,"None"]; 
	_obj1 setPosATL [(_missionPos select 0) - 2, (_missionPos select 1) + 2, _missionPos select 2];
	
	_obj3 = createVehicle ["I_HMG_01_high_F", _missionPos,[], 10,"None"]; 
	_obj3 setPosATL [(_missionPos select 0) - 2, (_missionPos select 1) - 2, _missionPos select 2];
	
	_obj4 = createVehicle ["I_HMG_01_high_F", _missionPos,[], 10,"None"]; 
	_obj4 setPosATL [(_missionPos select 0) + 2, (_missionPos select 1) - 2, _missionPos select 2];

	
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos,10,20] spawn createcustomGroup;

	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";	
	
	_vehicleName = "Hostage";
	_missionHintText = format ["<br/>Mercenary soldiers have captured a merchant and claim ransome. <br/> Free the merchant and collect your fee", _vehicleName, extraMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = {!alive _hostage};

_failedExec =
{
	// Mission failed
	
	{ deleteVehicle _x } forEach [_camonet, _obj1, _obj3, _obj4, _hostage, _chair];
	_failedHintMessage = format ["The merchant is dead. <br/> Mission Failure"];
};

_successExec =
{
	// Mission completed
	private _DropLocation = _missionPos set [2, 200];
	{ deleteVehicle _x } forEach [_camonet, _hostage, _chair];
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_obj1, _obj3, _obj4];

	private _Box = createVehicle ["Box_IND_Wps_F", _DropLocation, [], 0, "NONE" ];
	private _Para = createVehicle ["B_Parachute_02_F", _DropLocation, [], 0, "None"];
	_Box attachTo [_Para,[0,0,-1.5]];
	_Box allowDamage false;
	_Box setVariable ["cmoney", 50000, true];
	WaitUntil {((((position _Box) select 2) < 1) || (isNil "_para"))};
	detach _Box;
	_smoke2= "SmokeShellGreen" createVehicle getPos _Box;
	_flare2= "F_40mm_Green" createVehicle getPos _Box;
	
	_successHintMessage = format ["The mercenaries have been killed. Your fee is being delivered"];
};

_this call extraMissionProcessor;