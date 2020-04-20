/*
Author: GMG_Monkey
Filename: createrandomlootcrate.sqf
Purpose: create random loot creates based on Faction, teir, and money
*/
#define RANDOM_BETWEEN(START,END) ((START) + floor random ((END) - (START) + 1))
//Input Params
private _location = _this select 0;
private _Faction = _this select 1;
private _Tier = _this select 2;
private _MinMoney = _this select 3;
private _MaxMoney = _this select 4;
// Initalize variables
private _CrateSelect = "";
private _LootSelect = "";

//Chose the lootz
	switch (_Tier) do
	{
		case "1":
		{
			switch (_faction) do
			{
				case "IDAP":
				{
					_LootSelect = selectRandom
					[
						"Medical",
						"mission_Field_Engineer",
						"General_supplies"
					];
				};
				default 
				{
					_LootSelect = selectRandom
					[
						"mission_USLaunchers",
						"mission_USLaunchers2",
						"mission_USSpecial",
						"Launchers_Tier_2",
						"Diving_Gear",
						"General_supplies",
						"GEVP",
						"Ammo_Drop",
						"mission_AALauncher",
						"mission_CompactLauncher",
						"mission_snipers",
						"mission_RPG",
						"mission_PCML",
						"mission_Pistols",
						"mission_AssRifles",
						"mission_SMGs",
						"mission_LMGs",
						"Medical",
						"mission_Field_Engineer"
					];
				};
			};
		};
		case "2":
		{
			switch (_faction) do
			{
				case "IDAP":
				{
					_LootSelect = selectRandom
					[
						"Diving_Gear",
						"General_supplies",
						"Ammo_Drop",
						"mission_SMGs"
					];
				};
				case "SYN":
				{
					_LootSelect = selectRandom
					[
						"mission_RPG",
						"mission_AssRifles",
						"mission_SMGs",
						"Ammo_Drop",
						"mission_AALauncher",
						"mission_CompactLauncher"
					];
				};
				case "GEN":
				{
					_LootSelect = selectRandom
					[
						"mission_USLaunchers",
						"mission_USSpecial",
						"Launchers_Tier_2",
						"Diving_Gear",
						"General_supplies",
						"GEVP",
						"Ammo_Drop",
						"mission_AALauncher",
						"mission_CompactLauncher",
						"mission_snipers",
						"mission_RPG",
						"mission_PCML",
						"mission_Pistols",
						"mission_AssRifles",
						"mission_SMGs",
						"mission_LMGs",
						"Medical",
						"mission_Field_Engineer"
					];
				};
				case "AAF":
				{
					_LootSelect = selectRandom
					[
						
						"mission_USLaunchers",
						"mission_USLaunchers2",
						"mission_USSpecial",
						"Launchers_Tier_2",
						"Diving_Gear",
						"General_supplies",
						"GEVP",
						"Ammo_Drop",
						"mission_AALauncher",
						"mission_CompactLauncher",
						"mission_snipers",
						"mission_RPG",
						"mission_PCML",
						"mission_Pistols",
						"mission_AssRifles",
						"mission_SMGs",
						"mission_LMGs",
						"Medical",
						"mission_Field_Engineer"
					];
				};
				case "NATO":
				{
					_LootSelect = selectRandom
					[
						
						"mission_USLaunchers",
						"mission_USLaunchers2",
						"mission_USSpecial",
						"Launchers_Tier_2",
						"Diving_Gear",
						"General_supplies",
						"GEVP",
						"Ammo_Drop",
						"mission_AALauncher",
						"mission_CompactLauncher",
						"mission_snipers",
						"mission_RPG",
						"mission_PCML",
						"mission_Pistols",
						"mission_AssRifles",
						"mission_SMGs",
						"mission_LMGs",
						"Medical",
						"mission_Field_Engineer"
					];
				};
				case "CSAT":
				{
					_LootSelect = selectRandom
					[
						"mission_USLaunchers",
						"mission_USLaunchers2",
						"mission_USSpecial",
						"Launchers_Tier_2",
						"Diving_Gear",
						"General_supplies",
						"GEVP",
						"Ammo_Drop",
						"mission_AALauncher",
						"mission_CompactLauncher",
						"mission_snipers",
						"mission_RPG",
						"mission_PCML",
						"mission_Pistols",
						"mission_AssRifles",
						"mission_SMGs",
						"mission_LMGs",
						"Medical",
						"mission_Field_Engineer"
					];
				};
				default 
				{
					_LootSelect = selectRandom
					[
						"mission_USLaunchers",
						"mission_USLaunchers2",
						"mission_USSpecial",
						"Launchers_Tier_2",
						"Diving_Gear",
						"General_supplies",
						"GEVP",
						"Ammo_Drop",
						"mission_AALauncher",
						"mission_CompactLauncher",
						"mission_snipers",
						"mission_RPG",
						"mission_PCML",
						"mission_Pistols",
						"mission_AssRifles",
						"mission_SMGs",
						"mission_LMGs",
						"Medical",
						"mission_Field_Engineer"
					];
				};
			};
		};
		case "3":
		{
			switch (_faction) do
			{
				case "NATO":
				{
					_LootSelect = selectRandom
					[
						"Diving_Gear",
						"mission_snipers",
						"mission_USLaunchers",
						"mission_USLaunchers2",
						"mission_USSpecial"
					];
				};
				case "CSAT":
				{
					_LootSelect = selectRandom
					[
						"Diving_Gear",
						"mission_snipers",
						"mission_USLaunchers",
						"mission_USLaunchers2",
						"mission_USSpecial"
					];
				};
				case "AAF":
				{
					_LootSelect = selectRandom
					[
						"Diving_Gear",
						"mission_snipers",
						"mission_USLaunchers",
						"mission_USLaunchers2",
						"mission_AALauncher"
					];
				};
				default 
				{
					_LootSelect = selectRandom
					[
						"Diving_Gear",
						"mission_snipers",
						"mission_USLaunchers",
						"mission_USLaunchers2",
						"mission_USSpecial",
						"mission_AALauncher"
					];
				};
			};
		};
		case "4":
		{
			_LootSelect = selectRandom
			[
				"VehicleAmmo"
			];
		};
		case "5":
		{
			_LootSelect = selectRandom
			[
				"Container"
			];
		};
	};
//Choose the box
	//Basic Weapons Crate
		if  
		(
			_LootSelect == "mission_Pistols" ||
			_LootSelect == "mission_SMGs"|| 
			_LootSelect == "mission_AssRifles"|| 
			_LootSelect == "mission_LMGs"

		) then
		{
			switch (_faction) do
			{
				case "NATO":
				{
					_CrateSelect = selectrandom ["Box_T_NATO_Wps_F","Box_NATO_Wps_F"];
				};
				case "CSAT":
				{
					_CrateSelect = selectrandom ["Box_T_East_Wps_F","Box_East_Wps_F"];
				};
				case "AAF":
				{
					_CrateSelect = "Box_IND_Wps_F";
				};
				case "SYN":
				{
					_CrateSelect = "Box_Syndicate_Wps_F";
				};
				default
				{
					_CrateSelect = selectrandom["Box_T_NATO_Wps_F","Box_NATO_Wps_F","Box_T_East_Wps_F","Box_East_Wps_F","Box_IND_Wps_F","Box_Syndicate_Wps_F"];
				};
			};
		};
	//Special Weapons crete
		if 
		(
			_LootSelect == "mission_snipers"|| 
			_LootSelect == "Diving_Gear"|| 
			_LootSelect == "mission_USSpecial"|| 
			_LootSelect == "GEVP"
		) then
		{
			switch (_faction) do
			{
				case "NATO":
				{
					_CrateSelect = selectrandom ["Box_T_NATO_WpsSpecial_F","Box_NATO_WpsSpecial_F"];
				};
				case "CSAT":
				{
					_CrateSelect = selectrandom ["Box_T_East_WpsSpecial_F","Box_East_WpsSpecial_F"];
				};
				case "AAF":
				{
					_CrateSelect = "Box_IND_WpsSpecial_F";
				};
				default
				{
					_CrateSelect = selectrandom ["Box_T_NATO_WpsSpecial_F","Box_NATO_WpsSpecial_F","Box_IND_WpsSpecial_F","Box_T_East_WpsSpecial_F","Box_East_WpsSpecial_F"];
				};
			};
		};
	//Launchers Crate
		if 
		(
			_LootSelect == "mission_USLaunchers"|| 
			_LootSelect == "mission_USLaunchers2"|| 
			_LootSelect == "Launchers_Tier_2"|| 
			_LootSelect == "mission_AALauncher"||
			_LootSelect == "mission_CompactLauncher"||
			_LootSelect == "mission_RPG"||
			_LootSelect == "mission_PCML"
		) then
		{
			switch (_faction) do
			{
				case "NATO":
				{
					_CrateSelect = "Box_NATO_WpsLaunch_F";
				};
				case "CSAT":
				{
					_CrateSelect = "Box_East_WpsLaunch_F";
				};
				case "AAF":
				{
					_CrateSelect = "Box_IND_WpsLaunch_F";
				};
				case "SYN":
				{
					_CrateSelect = "Box_Syndicate_WpsLaunch_F";
				};
				default
				{
					_CrateSelect = selectrandom ["Box_NATO_WpsLaunch_F","Box_East_WpsLaunch_F","Box_Syndicate_WpsLaunch_F"]
				};
			};
		};
	// Ammo Crate
		if 
		(
			_LootSelect == "Ammo_Drop"
		) then
		{
			switch (_faction) do
			{
				case "NATO":
				{
					_CrateSelect = "Box_NATO_Ammo_F";
				};
				case "CSAT":
				{
					_CrateSelect = selectrandom ["Box_T_East_Ammo_F","Box_East_Ammo_F"];
				};
				case "AAF":
				{
					_CrateSelect = "Box_IND_Ammo_F";
				};
				case "SYN":
				{
					_CrateSelect = "Box_Syndicate_Ammo_F";
				};
				default
				{
					_CrateSelect = selectrandom ["Box_NATO_Ammo_F","Box_T_East_Ammo_F","Box_East_Ammo_F","Box_IND_Ammo_F","Box_Syndicate_Ammo_F"];
				};
			};
		};
	//Equipment Crate
		if 
		(
			_LootSelect == "General_supplies"
		) then
		{
			switch (_faction) do
			{
				case "NATO":
				{
					_CrateSelect = "Box_NATO_Equip_F";
				};
				case "CSAT":
				{
					_CrateSelect = "Box_CSAT_Equip_F";
				};
				case "AAF":
				{
					_CrateSelect = "Box_AAF_Equip_F";
				};
				case "SYN":
				{
					_CrateSelect = "Box_Syndicate_WpsLaunch_F";
				};
				case "IDAP":
				{
					_CrateSelect = "Box_IDAP_Equip_F";
				};
				case "GEN":
				{
					_CrateSelect = "Box_GEN_Equip_F";
				};
				default
				{
					_CrateSelect = selectrandom ["Box_NATO_Equip_F","Box_CSAT_Equip_F","Box_AAF_Equip_F","Box_IDAP_Equip_F","Box_GEN_Equip_F"]
				};
			};
		};
	//Explosives Crate
		if 
		(
			_LootSelect == "Mission_APERS"||
			_LootSelect == "Mission_ATMine"||
			_LootSelect == "Mission_ExpCharge"||
			_LootSelect == "Mission_Claymore"||
			_LootSelect == "Mission_ExpSatch"||
			_LootSelect == "Mission_Slam"||
			_LootSelect == "Mission_IDAP_APERSDispencer"||
			_LootSelect == "Mission_SYN_IED"
		) then
		{
			switch (_faction) do
			{
				case "NATO":
				{
					_CrateSelect = selectrandom ["Box_NATO_AmmoOrd_F"];
				};
				case "CSAT":
				{
					_CrateSelect = selectrandom ["Box_East_AmmoOrd_F"];
				};
				case "AAF":
				{
					_CrateSelect = selectrandom ["Box_IND_AmmoOrd_F"];
				};
				case "SYN":
				{
					_CrateSelect = selectrandom ["Box_IED_Exp_F"];
				};
				case "IDAP":
				{
					_CrateSelect = selectrandom ["Box_IDAP_AmmoOrd_F"];
				};
				default
				{
					_CrateSelect = selectrandom ["Box_NATO_AmmoOrd_F","Box_East_AmmoOrd_F","Box_IND_AmmoOrd_F","Box_IED_Exp_F","Box_IDAP_AmmoOrd_F"];
				};
			};
		};
	//Grenades Crate
		if 
		(
			_LootSelect == "Mission_Grenades"
		) then
		{
			switch (_faction) do
			{
				case "NATO":
				{
					_CrateSelect = "Box_NATO_Grenades_F";
				};
				case "CSAT":
				{
					_CrateSelect = "Box_East_Grenades_F";
				};
				case "AAF":
				{
					_CrateSelect = "Box_IND_Grenades_F";
				};
				default
				{
					_CrateSelect = selectrandom ["Box_NATO_Grenades_F","Box_East_Grenades_F","Box_IND_Grenades_F"]
				};
			};
		};
	//Support Crate
		if 
		(
			_LootSelect == ""
		) then
		{
			switch (_faction) do
			{
				case "NATO":
				{
					_CrateSelect = "Box_NATO_Support_F";
				};
				case "CSAT":
				{
					_CrateSelect = "Box_East_Support_F";
				};
				case "AAF":
				{
					_CrateSelect = "Box_IND_Support_F";
				};
				default
				{
					_CrateSelect = selectrandom ["Box_NATO_Support_F","Box_East_Support_F","Box_IND_Support_F"]
				};
			};
		};
	//SupplyCrate
		if 
		(
			_LootSelect == "Medical"||
			_LootSelect == "mission_Field_Engineer"
		) then
		{
			switch (_faction) do
			{
				case "NATO":
				{
					_CrateSelect = selectrandom ["C_T_supplyCrate_F","C_supplyCrate_F","B_supplyCrate_F"];
				};
				case "CSAT":
				{
					_CrateSelect = "O_supplyCrate_F";
				};
				case "AAF":
				{
					_CrateSelect = "I_supplyCrate_F";
				};
				case "IDAP":
				{
					_CrateSelect = "C_IDAP_supplyCrate_F";
				};
				default
				{
					_CrateSelect = selectrandom ["C_T_supplyCrate_F","C_supplyCrate_F","B_supplyCrate_F","O_supplyCrate_F","I_supplyCrate_F","C_IDAP_supplyCrate_F"];
				};
			};
		};
		/*
		IG_supplyCrate_F
		*/
	//Uniforms Crate
		if 
		(
			_LootSelect == ""
		) then
		{
			switch (_faction) do
			{
				case "NATO":
				{
					_CrateSelect = "Box_NATO_Uniforms_F";
				};
				case "CSAT":
				{
					_CrateSelect = "Box_CSAT_Uniforms_F";
				};
				case "AAF":
				{
					_CrateSelect = "Box_AAF_Uniforms_F";
				};
				default
				{
					_CrateSelect = selectrandom ["Box_NATO_Uniforms_F","Box_CSAT_Uniforms_F","Box_AAF_Uniforms_F"];
				};
			};
		};
	//Vehicle Ammo Crate
		if 
		(
			_LootSelect == "VehicleAmmo"
		) then
		{
			switch (_faction) do
			{
				case "NATO":
				{
					_CrateSelect = "Box_NATO_AmmoVeh_F";
				};
				case "CSAT":
				{
					_CrateSelect = "Box_East_AmmoVeh_F";
				};
				case "AAF":
				{
					_CrateSelect = "Box_IND_AmmoVeh_F";
				};
				default
				{
					_CrateSelect = selectrandom ["Box_NATO_AmmoVeh_F","Box_East_AmmoVeh_F","Box_IND_AmmoVeh_F"];
				};
			};
		};
	//Cargo Net
		if 
		(
			_LootSelect == "Launchers_NATO"||
			_LootSelect == "Launchers_CSAT"||
			_LootSelect == "Launchers_AAF"

		) then
		{
			switch (_faction) do
			{
				case "NATO":
				{
					_CrateSelect = "B_CargoNet_01_ammo_F";
				};
				case "CSAT":
				{
					_CrateSelect = "O_CargoNet_01_ammo_F";
				};
				case "AAF":
				{
					_CrateSelect = "I_CargoNet_01_ammo_F";
				};
				case "IDAP":
				{
					_CrateSelect = "C_IDAP_CargoNet_01_supplies_F";
				};
				default
				{
					_CrateSelect = selectrandom ["B_CargoNet_01_ammo_F","O_CargoNet_01_ammo_F","I_CargoNet_01_ammo_F","C_IDAP_CargoNet_01_supplies_F"];
				};
			};
		};
	//Huron/Taru Containers
		if 
		(
			_LootSelect == "Container"
		) then
		{
			switch (_faction) do
			{
				case "NATO":
				{
					_CrateSelect = selectrandom ["B_Slingload_01_Ammo_F","B_Slingload_01_Fuel_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F","B_Slingload_01_Cargo_F"];
				};
				case "CSAT":
				{
					_CrateSelect = selectrandom ["Land_Pod_Heli_Transport_04_ammo_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_repair_F"];
				};
				default
				{
					_CrateSelect = selectrandom ["B_Slingload_01_Ammo_F","B_Slingload_01_Fuel_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F","B_Slingload_01_Cargo_F","Land_Pod_Heli_Transport_04_ammo_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_repair_F"];
				};
			};
		};
	//Caches
		if 
		(
			_LootSelect == ""
		) then
		{
			_CrateSelect = selectrandom ["Box_FIA_Ammo_F","Box_FIA_Support_F","Box_FIA_Wps_F"]
		};

//Let's make some loot!
private _Money = RANDOM_BETWEEN(_MinMoney,_MaxMoney);
_crate = createVehicle [_CrateSelect, _location, [], 0, "NONE"];
[_crate, _LootSelect] call fn_refillbox;
_crate setVariable ["cmoney", _Money, true];
if ({_crate iskindof _x} count 
[
	"Box_NATO_AmmoVeh_F",
	"Box_EAST_AmmoVeh_F",
	"Box_IND_AmmoVeh_F",
	"B_Slingload_01_Ammo_F",
	"B_Slingload_01_Fuel_F",
	"B_Slingload_01_Repair_F",
	"Land_Pod_Heli_Transport_04_fuel_F",
	"Land_Pod_Heli_Transport_04_repair_F",
	"Land_Pod_Heli_Transport_04_ammo_F"
] > 0) then	
{
	private _AmmoResourcesMax =
	[
		["Box_NATO_AmmoVeh_F",						5000],
		["Box_EAST_AmmoVeh_F",						5000],
		["Box_IND_AmmoVeh_F",						5000],
		["B_Slingload_01_Ammo_F",					30000],
		["Land_Pod_Heli_Transport_04_ammo_F",		22000]
	];
	private _FuelResourcesMax =
	[
		["B_Slingload_01_Fuel_F",					20000],
		["Land_Pod_Heli_Transport_04_fuel_F",		22000]
	];
	private _RepairResourcesMax =
	[
		["B_Slingload_01_Repair_F",					25000],
		["Land_Pod_Heli_Transport_04_repair_F",		22000]
	];
	_crate setAmmoCargo 0;
	_crate setFuelCargo 0;
	_crate setRepairCargo 0;
	_crate spawn GOM_fnc_addAircraftLoadoutToObject;
	{
		private _check = _x select 0;
		private _value = _x select 1;
		if (_crate iskindof _check) then
		{
			_crate setVariable ["GOM_fnc_ammoCargo", _value, true];
		};
	} foreach _AmmoResourcesMax;
	{
		private _check = _x select 0;
		private _value = _x select 1;
		if (_crate iskindof _check) then
		{
			_crate setVariable ["GOM_fnc_fuelCargo", _value, true];
		};
	} foreach _FuelResourcesMax;
	{
		private _check = _x select 0;
		private _value = _x select 1;
		if (_crate iskindof _check) then
		{
			_crate setVariable ["GOM_fnc_repairCargo", _value, true];
		};
	} foreach _RepairResourcesMax;
};
_crate

//"mission_USLaunchers",
//"mission_USSpecial",
//"Launchers_Tier_2",
//"Diving_Gear",
//"General_supplies",
//"GEVP",
//"Ammo_Drop",
//"mission_AALauncher",
//"mission_CompactLauncher",
//"mission_snipers",
//"mission_RPG",
//"mission_PCML",
//"mission_Pistols",
//"mission_AssRifles",
//"mission_SMGs",
//"mission_LMGs",
//"Medical",
//"mission_Field_Engineer",