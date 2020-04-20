// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_transportheli.sqf
//	@file Author: JoSchaap, AgentRev

if (!isServer) exitwith {};
#include "hostileairMissionDefines.sqf";

private ["_transportChoicesUnarmed", "_transportChoicesArmed", "_supportChoices", "_veh1", "_veh2", "_veh3", "_createVehicle", "_vehicles", "_leader", "_speedMode", "_waypoint",
	"_vehicleName", "_vehicleName2", "_vehicleName3", "_numWaypoints", "_box1", "_box2", "_box3"];

_setupVars =
{
	_missionType = "Helicopter Escort";
	_locationsArray = nil; // locations are generated on the fly from towns
};

_setupObjects =
{
	_missionPos = markerPos (((call cityList) call BIS_fnc_selectRandom) select 0);

	_transportChoicesUnarmed = ["rhsgref_ins_Mi8amt","rhs_ka60_grey","O_Heli_Transport_04_box_F","rhsusf_CH53E_USMC_D"];
	_transportChoicesArmed = ["RHS_CH_47F","B_Heli_Transport_03_black_F"];
	_supportChoices = ["RHS_AH64D_wd","RHS_AH1Z_wd","RHS_Ka52_vvs","rhs_mi28n_vvs"];

	_veh1 = [];

	if ((floor random 2) == 1 ) then {
		_veh1 append [(_transportChoicesArmed call BIS_fnc_selectRandom)];
		_veh1 append [true];
	}
	else {
		_veh1 append [(_transportChoicesUnarmed call BIS_fnc_selectRandom)];
		_veh1 append [false];
	};

	_veh2 = _supportChoices call BIS_fnc_selectRandom;
	_veh3 = _supportChoices call BIS_fnc_selectRandom;

	_createVehicle =
	{
		private ["_type", "_isArmed", "_position", "_direction", "_vehicle", "_soldier"];

		_type = _this select 0;
		_isArmed = _this select 3;
		_position = _this select 1;
		_direction = _this select 2;

		_vehicle = createVehicle [_type, _position, [], 0, "FLY"];
		_vehicle setVehicleReportRemoteTargets true;
		_vehicle setVehicleReceiveRemoteTargets true;
		_vehicle setVehicleRadar 1;
		_vehicle confirmSensorTarget [west, true];
		_vehicle confirmSensorTarget [east, true];
		_vehicle confirmSensorTarget [resistance, true];
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		[_vehicle] call vehicleSetup;

		_vehicle setDir _direction;
		_aiGroup addVehicle _vehicle;

		// add a driver/pilot/captain to the vehicle
		// the little bird, orca, and hellcat do not require gunners and should not have any passengers
		_soldier = [_aiGroup, _position] call createRandomSoldierC;
		_soldier moveInDriver _vehicle;
		_soldier triggerDynamicSimulation true;

		if (_isArmed) then {
			if ((_type find "Transport") >= 0 ) then {
				_soldier = [_aiGroup, _position] call createRandomSoldierC;
				_soldier moveInTurret [_vehicle, [1]];
				_soldier = [_aiGroup, _position] call createRandomSoldierC;
				_soldier moveInTurret [_vehicle, [2]];
			}
			else {
				_soldier = [_aiGroup, _position] call createRandomSoldierC;
				_soldier moveInGunner _vehicle;
			};
		};

		// // remove flares because it overpowers AI choppers
		// if (_type isKindOf "Air") then
		// {
			// {
				// if (["CMFlare", _x] call fn_findString != -1) then
				// {
					// _vehicle removeMagazinesTurret [_x, [-1]];
				// };
			// } forEach getArray (configFile >> "CfgVehicles" >> _type >> "magazines");
		// };

		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;
		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;

	_vehicles =
	[
		[(_veh1 select 0), _missionPos vectorAdd ([[random 50, 0, 0], random 360] call BIS_fnc_rotateVector2D), 0, (_veh1 select 1)] call _createVehicle,
		[_veh2, _missionPos vectorAdd ([[random 50, 0, 0], random 360] call BIS_fnc_rotateVector2D), 0, true] call _createVehicle,
		[_veh3, _missionPos vectorAdd ([[random 50, 0, 0], random 360] call BIS_fnc_rotateVector2D), 0, true] call _createVehicle
	];

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup selectLeader _leader;

	_aiGroup setCombatMode "GREEN"; // Hold fire, engage at will (https://community.bistudio.com/wiki/setCombatMode)
	_aiGroup setBehaviour "SAFE"; // units feel safe until they spot an enemy or get into contact (https://community.bistudio.com/wiki/setBehaviour)
	_aiGroup setFormation "VEE";	// (https://community.bistudio.com/wiki/setFormation)

	_speedMode = if (missionDifficultyHard) then { "NORMAL" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	// behaviour on waypoints
	{
		_waypoint = _aiGroup addWaypoint [markerPos (_x select 0), 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 75;
		_waypoint setWaypointCombatMode "GREEN";
		_waypoint setWaypointBehaviour "AWARE";
		_waypoint setWaypointFormation "VEE";
		_waypoint setWaypointSpeed _speedMode;
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> (_veh1 select 0) >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> (_veh1 select 0) >> "displayName");
	_vehicleName2 = getText (configFile >> "CfgVehicles" >> _veh2 >> "displayName");
	_vehicleName3 = getText (configFile >> "CfgVehicles" >> _veh3 >> "displayName");

	_textVehSupport = "";

	if(_vehicleName2 == _vehicleName3) then {
		_textVehSupport = format ["2 <t color='%2'>%1</t> helicopters", _vehicleName2, hostileairMissionColor];
	}
	else
	{
		_textVehSupport = format ["1 <t color='%3'>%1</t> and 1 <t color='%3'>%2</t>", _vehicleName2, _vehicleName3, hostileairMissionColor];
	};

	_missionHintText = format ["A <t color='%3'>%1</t> helicopter and an escort of %2 are on the move. Take them down and collect their payload!", _vehicleName, _textVehSupport, hostileairMissionColor];

	_numWaypoints = count waypoints _aiGroup;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup >= _numWaypoints};

_failedExec = nil;

// _vehicles are automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission completed

	private ["_box1Choices", "_box1Select", "_box2Choices", "_box2Select", "_box3Choices","_box3Select"];

	_box1Choices = ["mission_AssRifles", "mission_LMGs", "mission_snipers", "mission_SMGs", "mission_Pistols"];
	_box2Choices = ["mission_USLaunchers", "Launchers_Tier_2"];
	_box3Choices = ["Ammo_Drop", "Medical"];

	_box1Select = _box1Choices call BIS_fnc_selectRandom;
	_box2Select = _box2Choices call BIS_fnc_selectRandom;
	_box3Select = _box3Choices call BIS_fnc_selectRandom;


	_box1 = createVehicle ["Box_NATO_Wps_F", _lastPos, [], 5, "None"];
	_box1 setDir random 360;
	_box1 setVariable ["moveable", true, true];
	[_box1, _box1Select] call fn_refillbox;

	_box2 = createVehicle ["Box_East_Wps_F", _lastPos, [], 5, "None"];
	_box2 setDir random 360;
	_box2 setVariable ["moveable", true, true];
	[_box2, _box2Select] call fn_refillbox;

	_box3 = createVehicle ["Box_IND_WpsSpecial_F", _lastPos, [], 5, "None"];
	_box3 setDir random 360;
	_box3 setVariable ["moveable", true, true];
	[_box3, _box3Select] call fn_refillbox;

	_successHintMessage = "The helicopter escort has been taken down! Ammo crates have fallen near the wreck.";
};

_this call hostileairMissionProcessor;
