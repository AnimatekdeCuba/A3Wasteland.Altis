// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*********************************************************#
# @@ScriptName: createCaptureTriggers.sqf
# @@Author: Nick 'Bewilderbeest' Ludlam <bewilder@recoil.org>, AgentRev, GMG_Monkey
# @@Create Date: 2013-09-15 16:26:38
# @@Modify Date: 2013-09-15 22:35:19
# @@Function: Creates server-side capture zone triggers
#*********************************************************/

if (!isServer && hasInterface) exitwith {};

{
	_marker = _x;

	if (["TERRITORY_", _marker] call fn_startsWith) then
	{
		if ({_x select 0 == _marker} count (["config_territory_markers", []] call getPublicVar) > 0) then
		{
			diag_log format ["Creating territory capture trigger for '%1'", _marker];
			_trig = createTrigger ["EmptyDetector", markerPos _marker];
			_trig setVariable ["captureTriggerMarker", _marker, true];
			//Set default guards
      		_pos = markerPos _marker;
     		 _numSide = 0;
      		_size = getMarkerSize _marker;
      		_dir = "random"; //markerDir _captureName
      		_radius = (_size select 0) max (_size select 1);
      		_spawnInfantry = [true,true]; //Land, Water
      		_spawnVehicles = [false,false,false]; //Land,Water,Air
      		_stayStill = false; //Stay still and do not patrol
      		_infantryAlways = _radius*0.07; //1.5% from radius
      		_infantryRandom = 5;
      		_vehiclesAlways = 0;
      		_vehiclesRandom = 0;
      		_aiSkills = 0.79; //Default or an array
      		_groupID = nil;
      
      		_customInit = "[[this], 'A3W_fnc_disableFF',true, true] call BIS_fnc_MP; this setSpeaker 'NoVoice'; this addEventHandler ['Killed', server_playerDied]; this setVariable ['isGuard',true,true];";
      		_territoryID = nil;
      
			[_pos,_numSide,_radius,_spawnInfantry,_spawnVehicles,_stayStill,[_infantryAlways,_infantryRandom],[_vehiclesAlways,_vehiclesRandom],_aiSkills, if (isNil "_groupID") then {nil} else {_groupID}, if (isNil "_customInit") then {nil} else {_customInit},if (isNil "_territoryID") then {nil} else {_territoryID}] execVM "addons\AI_spawn\militarize.sqf";
		
		}
		else
		{
			diag_log format ["WARNING: No config_territory_markers definition for marker '%1'. Deleting it!", _marker];
			deleteMarker _marker;
		};
	};
} forEach allMapMarkers;
