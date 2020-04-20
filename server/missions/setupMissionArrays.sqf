// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqf
//	@file Author: AgentRev, GMG_Monkey

// if (!isServer && hasinterface) exitWith {};



AAFMissions =
[
	["mission_AirWreck", 1],
	["mission_MediumPatrol", 1],
	["mission_Vehicle", 1],
	["mission_Outpost", 1],
	["mission_Sniper", 1],
	["mission_TownInvasion", 1],
	["mission_Roadblock", 1],
	["mission_Jaws", 1],
	["mission_SunkenSupplies", 1],
	["mission_SunkenTreasure", 1],
	["mission_Coastal_Convoy", 1],
	["mission_HeavyPatrol", 1],
	["mission_HostileJet", 1],
	["mission_InfantryPatrol", 1],
	["mission_LightPatrol", 1],
	["mission_AttackHelis", 1],
	["mission_HeliFormation", 1]
];
NATOMissions =
[
	["mission_AirWreck", 1],
	["mission_MediumPatrol", 1],
	["mission_Vehicle", 1],
	["mission_Outpost", 1],
	["mission_Sniper", 1],
	["mission_TownInvasion", 1],
	["mission_Roadblock", 1],
	["mission_Jaws", 1],
	["mission_SunkenSupplies", 1],
	["mission_SunkenTreasure", 1],
	["mission_Coastal_Convoy", 1],
	["mission_HeavyPatrol", 1],
	["mission_HostileJet", 1],
	["mission_InfantryPatrol", 1],
	["mission_LightPatrol", 1],
	["mission_AttackHelis", 1],
	["mission_HeliFormation", 1],
	//["mission_SupplyDrop", 1],
	//["mission_Gunship", 1],
	["mission_CTRGMediumConvoy", 1],
	["mission_CTRGPatrol", 1],
	["mission_CTRFSmallConvoy", 1]
];
CSATMissions =
[
	["mission_AirWreck", 1],
	["mission_MediumPatrol", 1],
	["mission_Vehicle", 1],
	["mission_Outpost", 1],
	["mission_Sniper", 1],
	["mission_TownInvasion", 1],
	["mission_Roadblock", 1],
	["mission_Jaws", 1],
	["mission_SunkenSupplies", 1],
	["mission_SunkenTreasure", 1],
	["mission_Coastal_Convoy", 1],
	["mission_HeavyPatrol", 1],
	["mission_HostileJet", 1],
	["mission_InfantryPatrol", 1],
	["mission_LightPatrol", 1],
	["mission_AttackHelis", 1],
	["mission_HeliFormation", 1],
	["mission_ViperFootPatrol", 1],
	["mission_ViperMediumConvoy", 1],
	["mission_ViperSmallVonvoy", 1]
	//["mission_HostileVTOL", 1]
];
IDAPMissions =
[
	["mission_AirWreck", 1],
	["mission_MediumPatrol", 1],
	["mission_Outpost", 1],
	["mission_HeavyPatrol", 1],
	["mission_LightPatrol", 1],
	["mission_HeliFormation", 1]
];
GENMissions =
[
	["mission_MediumPatrol", 1],
	["mission_Outpost", 1],
	["mission_TownInvasion", 1],
	["mission_Roadblock", 1],
	["mission_HeavyPatrol", 1],
	["mission_LightPatrol", 1]
];
SYNMissions =
[
	["mission_Outpost", 1],
	["mission_TownInvasion", 1],
	["mission_Roadblock", 1],
	["mission_Coastal_Convoy", 1],
	["mission_HeavyPatrol", 1],
	["mission_InfantryPatrol", 1],
	["mission_LightPatrol", 1]
];

{ _x set [2, false] } forEach NATOMissions;
{ _x set [2, false] } forEach CSATMissions;
{ _x set [2, false] } forEach GENMissions;
{ _x set [2, false] } forEach IDAPMissions;
{ _x set [2, false] } forEach SYNMissions;
{ _x set [2, false] } forEach AAFMissions;

MissionSpawnMarkers = [];
JetSpawnMarkers = [];
SunkenMissionMarkers = [];
SniperMissionMarkers = [];
RoadblockMissionmarkers = [];
PatrolMissionsMarkers = [];
{
	switch (true) do
	{
		case (["Mission_", _x] call fn_startsWith):
		{
			MissionSpawnMarkers pushBack [_x, false];
		};
		case (["SunkenMission_", _x] call fn_startsWith):
		{
			SunkenMissionMarkers pushBack [_x, false];
		};
		case (["Jet_", _x] call fn_startsWith):
		{
			JetSpawnMarkers pushBack [_x, false];
		};
		case (["Sniper_", _x] call fn_startsWith):
		{
			SniperMissionMarkers pushBack [_x, false];
		};
		case (["RoadBlock_", _x] call fn_startsWith):
		{
			RoadblockMissionmarkers pushBack [_x, false];
		};
		case (["Patrol_", _x] call fn_startsWith):
		{
			PatrolMissionsMarkers pushBack [_x, false];
		};
	};
} forEach allMapMarkers;

LandConvoyPaths = [];
{
	LandConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "mapConfig\convoys\landConvoysList.sqf");

CoastalConvoyPaths = [];
{
	CoastalConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "mapConfig\convoys\coastalConvoysList.sqf");

PatrolConvoyPaths = [];
{
	PatrolConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "mapConfig\convoys\patrolConvoysList.sqf");

SFConvoyPaths = [];
{
	SFConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "mapConfig\convoys\SFConvoysList.sqf");

ArtyConvoyPaths = [];
{
	ArtyConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "mapConfig\convoys\artyConvoysList.sqf");
