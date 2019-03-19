// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_WepCache.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, GMG_Monkey
//	@file Created: 08/12/2012 15:19
//	@file Args:

// if (!isServer && hasinterface) exitWith {};
#include "NATOMissionDefines.sqf";

private ["_box1", "_boxPos", "_vehicleClass", "_vehicle"];

_setupVars =
{
	_missionType = "Sunken Treasure";
	_locationsArray = SunkenMissionMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	private _BoxPos1 = [_missionPos, 3, 10,1,0,0,0] call findSafePos;
	_box1 = [_BoxPos1, "NATO", "2", 0, 0] call createrandomlootcrate;
	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_box1];

	_vehicleClass = "B_Boat_Armed_01_minigun_F";
	// Vehicle Class, Position, Fuel, Ammo, Damage, Special
	_aiGroup1 = createGroup CIVILIAN;
	_aiGroup2 = createGroup CIVILIAN;
	_veh1 = [_vehicleClass, _missionPos,1,1,0,0,1] call createMissionVehicle;
	_vehicles = [_veh1];
	{
		private _vehicle = _x;
		private _drivers = _vehicle emptyPositions "Driver";
		private _Commanders =  _vehicle emptyPositions "Commander";
		private _Gunners = _vehicle emptyPositions "Gunner";
		private _Passangers = _vehicle emptyPositions "Cargo";
		_aiGroup1 addVehicle _vehicle;
		_vehicle lockDriver true;
		for "_i" from 1 to _drivers do
		{
			private _Driver = [_aiGroup1, _missionPos, "NATO", "Rifleman"] call createsoldier;
			_Driver moveInAny _vehicle; //The boat doesn't like moveindriver for some reason 
		};
		for "_i" from 1 to _Commanders do
		{
			private _Commander = [_aiGroup1, _missionPos, "NATO", "Rifleman"] call createsoldier;
			_Commander moveInCommander _vehicle;
		};
		private _gunner = [_aiGroup1, _missionPos, "NATO", "Rifleman"] call createsoldier;
		_gunner moveInGunner _vehicle;
		for "_i" from 1 to _Passangers do
		{
			[_aiGroup2, _missionPos, "NATO", "Diver"] call createsoldier;
		};
	} foreach _vehicles;
	_aiGroup1 setCombatMode "RED";
	_aiGroup2 setCombatMode "RED";
	[_veh1, _aiGroup1] spawn checkMissionVehicleLock;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_missionHintText = format ["A treasure containing money and weapons is being recovered.<br/>If you want to capture it, you will need diving gear and an underwater weapon."];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	deleteVehicle _box1;
};

// _vehicle is automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission complete
	_box1 setVariable ["R3F_LOG_disabled", false, true];
	_box1 setVariable ["cmoney",ceil (random 10000), true];
	_box1 setVariable ["moveable", true, true];

	_successHintMessage = "The treasure has been captured, well done.";
};

_this call NATOMissionProcessor;
