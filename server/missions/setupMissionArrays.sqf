// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqf
//	@file Author: AgentRev

if (!isServer && hasinterface) exitWith {};

AAFMissions =
[
	["mission_AirWreck", 0.5],
	["mission_MediumPatrol", 1],
	["mission_Vehicle", 1],
	["mission_Outpost", 0.5],
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
	["mission_HeliFormation", 0.5]
];
NATOMissions =
[
	["mission_AirWreck", 0.5],
	["mission_MediumPatrol", 1],
	["mission_Vehicle", 1],
	["mission_Outpost", 0.5],
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
	["mission_HeliFormation", 0.5],
	["mission_SupplyDrop", 1],
	["mission_Gunship", 0.5],
	["mission_CTRGMediumConvoy", 1],
	["mission_CTRGPatrol", 1],
	["mission_CTRFSmallConvoy", 1]
];
CSATMissions =
[
	["mission_AirWreck", 0.5],
	["mission_MediumPatrol", 1],
	["mission_Vehicle", 1],
	["mission_Outpost", 0.5],
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
	["mission_HeliFormation", 0.5],
	["mission_ViperFootPatrol", 1],
	["mission_ViperMediumConvoy", 1],
	["mission_ViperSmallVonvoy", 1],
	["mission_HostileVTOL", 0.5]
];
IDAPMissions =
[
	["mission_AirWreck", 0.5],
	["mission_MediumPatrol", 1],
	["mission_Outpost", 0.5],
	["mission_HeavyPatrol", 1],
	["mission_LightPatrol", 1],
	["mission_HeliFormation", 1]
];
GENMissions =
[
	["mission_MediumPatrol", 1],
	["mission_Outpost", 0.5],
	["mission_TownInvasion", 1],
	["mission_Roadblock", 1],
	["mission_HeavyPatrol", 1],
	["mission_LightPatrol", 1]
];
SYNMissions =
[
	["mission_Outpost", 0.5],
	["mission_TownInvasion", 1],
	["mission_Roadblock", 1],
	["mission_Coastal_Convoy", 1],
	["mission_HeavyPatrol", 1],
	["mission_InfantryPatrol", 1],
	["mission_LightPatrol", 1]
];

MainMissions =
[
	// Mission filename, weight
	["mission_Outpost", 1],
	["mission_Sniper", 1],
	["mission_SupplyDrop", 1],
	["mission_TownInvasion", 1]
];

SideMissions =
[
	["mission_SmugglerPlane", 1],
	["mission_Roadblock", 1],
	["mission_AirWreck", 1],
	["mission_ConvoyAmbushers", 1],
	["mission_Smugglers", 1],
	["mission_Truck", 1]
];

MoneyMissions =
[
	["mission_MoneyShipment", 1]
];

PatrolMissions =
[
	["mission_militaryPatrol", 1],
	["mission_altisPatrol", 1]
	
];

vehicleMissions =
[
	["mission_APC", 1],
	["mission_MBT", 1],
	["mission_LightArmVeh", 1],
	["mission_ArmedHeli", 1],
	["mission_CivHeli", 1],
	["mission_LSV", 1],
	["mission_VTOL", 1],
	["mission_jet", 1]
];

extraMissions =
[
	["mission_Convoy", 1],
	["mission_ConvoyCSATSF", 1],
	["mission_ConvoyNATOSF", 1],
	["mission_MiniConvoy", 1],
	["mission_HackLaptop", 1],
	["mission_HostageRescue", 1]
];

aquaticMissions =
[
	["mission_ArmedDiversquad", 1],
	["mission_Coastal_Convoy", 1],
	["mission_SunkenSupplies", 1],
	["mission_SunkenTreasure", 1],
	["mission_Jaws", 1]
];

hostileairMissions =
[
	["mission_Gunship", 1],
	["mission_HostileHelicopter", 1],
	["mission_HostileHeliFormation", 1],
	["mission_HostileJet", 1],
	["mission_HostileVTOL", 1],
	["mission_transportheli", 1]
	
];

PrimaryMissions =
[
	["mission_artypatrol", 1]
];

MainMissions = [MainMissions, [["A3W_heliPatrolMissions", ["mission_Coastal_Convoy", "mission_HostileHeliFormation"]], ["A3W_underWaterMissions", ["mission_ArmedDiversquad"]]]] call removeDisabledMissions;
SideMissions = [SideMissions, [["A3W_heliPatrolMissions", ["mission_HostileHelicopter"]], ["A3W_underWaterMissions", ["mission_SunkenSupplies"]]]] call removeDisabledMissions;
MoneyMissions = [MoneyMissions, [["A3W_underWaterMissions", ["mission_SunkenTreasure"]]]] call removeDisabledMissions;



{ _x set [2, false] } forEach MainMissions;
{ _x set [2, false] } forEach SideMissions;
{ _x set [2, false] } forEach MoneyMissions;
{ _x set [2, false] } forEach PatrolMissions;
{ _x set [2, false] } forEach vehicleMissions;
{ _x set [2, false] } forEach extraMissions;
{ _x set [2, false] } forEach aquaticMissions;
{ _x set [2, false] } forEach hostileairMissions;
{ _x set [2, false] } forEach PrimaryMissions;
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
