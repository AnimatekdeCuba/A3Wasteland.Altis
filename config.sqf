// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: config.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, AgentRev, GMG_Monkey
//	@file Created: 20/11/2012 05:13
//	@file Description: Main config.

// For SERVER CONFIG, values are in server\init.sqf

// Towns and cities array
cityList = compileFinal preprocessFileLineNumbers "mapConfig\towns.sqf";

config_items_jerrycans_max = compileFinal "1";
config_items_syphon_hose_max = compileFinal "1";

config_refuel_amount_default = compileFinal "0.25";
config_refuel_amounts = compileFinal str
[
	["Kart_01_Base_F", 1],
	["Quadbike_01_base_F", 0.5],
	["Tank", 0.1],
	["Air", 0.1]
];

if (isServer) then
{
	private _configfile = selectrandom ["Abdera", "ConstructionZone", "GhostHotel", "Kavala", "KoreFactory", "Magos", "MilHill", "Molos", "MOUTVillage", "Oreokastro", "Panagia","Sofia", "Therisa", "Zaros", "OilRigKavala", "OilRigPyrgosGulf", "OilRigNorth", "OilRigSouth"];
	diag_log format ["Capture Territory is %1", _configfile];
	config_territory_markers = compileFinal preprocessFileLineNumbers format ["mapConfig\TerritoryConfigs\%1.sqf", _configfile];
	publicVariable "config_territory_markers";
};
