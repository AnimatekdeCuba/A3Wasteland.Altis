/*
Author: GMG_Monkey
Filename: createrandomlootcrate.sqf
Purpose: create random loot creates based on Faction, teir, and money
*/
#define RANDOM_BETWEEN(START,END) ((START) + floor random ((END) - (START) + 1))
//Input Params
private _location = _this select 0;
private _faction = _this select 1;
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
						"mission_Field_Engineer"
					];
				};
				default 
				{
					_LootSelect = selectRandom
					[
						"Mission_PMPistol",
						"Mission_P07Pistol",
						"Mission_ZuberPistol",
						"Mission_RookPistol",
						"Mission_PDW",
						"Mission_45Pistol",
						"Mission_ZuberPistol",
						"Mission_Sting",
						"Mission_Vermin",
						"Mission_Protector",
						"Mission_SDAR",
						"Mission_Mk20",
						"Mission_TRG",
						"Mission_Katiba",
						"Mission_MX",
						"Mission_SPAR16",
						"Mission_CAR95",
						"Mission_MXSW",
						"Mission_Mk200",
						"Mission_SPAR16S",
						"Mission_CAR951",
						"Mission_LIM",
						"Mission_AK",
						"Mission_MXM",
						"Mission_Mk18",
						"Mission_CMR76",
						"Mission_SPAR17",
						"Mission_MK14",
						"Mission_MK1",
						"Mission_MAR10",
						"Mission_Syrus",
						"Mission_M320",
						"Mission_Lynx",
						"Mission_ASP",
						"Mission_Zafir",
						"Mission_Ammo_45",
						"Mission_Ammo_545",
						"Mission_Ammo_556",
						"Mission_Ammo_58",
						"Mission_Ammo_65",
						"Mission_Ammo_762",
						"Mission_Ammo_338",
						"Mission_Ammo_93",
						"Mission_Ammo_408",
						"Mission_Ammo_127",
						"Mission_Ammo_50",
						"Mission_Ammo_3GL",
						"Mission_Ammo_UGL",
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
						"Mission_IDAP_APERSDispencer",
						"Mission_IDAP_MedDrone",
						"Mission_IDAP_DeMineDrone",
						"Mission_IDAP_UtilityDrone",
						"Mission_IDAP_Darter"
					];
				};
				case "SYN":
				{
					_LootSelect = selectRandom
					[
						"Mission_RPG7",
						"Mission_RPG42",
						"Mission_SYN_IED",
						"Mission_WepEquipment"
					];
				};
				case "GEN":
				{
					_LootSelect = selectRandom
					[
						"Mission_SPMG",
						"Mission_NAVID",
						"Mission_RPG7",
						"Mission_RPG42",
						"Mission_PCML",
						"Diving_Gear_AAF",
						"Mission_AAF_TitanAA",
						"Mission_AAF_TitanAT",
						"Mission_Grenades",
						"Mission_APERS",
						"Mission_ATMine",
						"Mission_ExpCharge",
						"Mission_Claymore",
						"Mission_ExpSatch",
						"Mission_Slam",
						"Mission_WepEquipment"
					];
				};
				case "AAF":
				{
					_LootSelect = selectRandom
					[
						
						"Mission_SPMG",
						"Mission_NAVID",
						"Mission_PCML",
						"Diving_Gear_AAF",
						"Mission_AAF_TitanAA",
						"Mission_AAF_TitanAT",
						"Mission_Grenades",
						"Mission_APERS",
						"Mission_ATMine",
						"Mission_ExpCharge",
						"Mission_Claymore",
						"Mission_ExpSatch",
						"Mission_Slam",
						"Mission_WepEquipment",
						"Mission_AAF_MedDrone",
						"Mission_AAF_UtilityDrone",
						"Mission_AAF_Darter"
					];
				};
				case "NATO":
				{
					_LootSelect = selectRandom
					[
						
						"Mission_SPMG",
						"Mission_NAVID",
						"Mission_PCML",
						"Diving_Gear_NATO",
						"Mission_NATO_TitanAA",
						"Mission_NATO_TitanAT",
						"Mission_Grenades",
						"Mission_APERS",
						"Mission_ATMine",
						"Mission_ExpCharge",
						"Mission_Claymore",
						"Mission_ExpSatch",
						"Mission_Slam",
						"Mission_WepEquipment",
						"Mission_NATO_MedDrone",
						"Mission_NATO_UtilityDrone",
						"Mission_NATO_Darter"
					];
				};
				case "CSAT":
				{
					_LootSelect = selectRandom
					[
						"Mission_SPMG",
						"Mission_NAVID",
						"Mission_PCML",
						"Diving_Gear_CSAT",
						"Mission_CSAT_TitanAA",
						"Mission_CSAT_TitanAT",
						"Mission_Grenades",
						"Mission_APERS",
						"Mission_ATMine",
						"Mission_ExpCharge",
						"Mission_Claymore",
						"Mission_ExpSatch",
						"Mission_Slam",
						"Mission_WepEquipment",
						"Mission_CSAT_MedDrone",
						"Mission_CSAT_UtilityDrone",
						"Mission_CSAT_Darter"
					];
				};
				default 
				{
					_LootSelect = selectRandom
					[
						"Mission_SPMG",
						"Mission_NAVID",
						"Mission_RPG7",
						"Mission_RPG42",
						"Mission_PCML",
						"Mission_Grenades",
						"Mission_APERS",
						"Mission_ATMine",
						"Mission_ExpCharge",
						"Mission_Claymore",
						"Mission_ExpSatch",
						"Mission_Slam",
						"Mission_IDAP_APERSDispencer",
						"Mission_WepEquipment",
						"Mission_IDAP_MedDrone",
						"Mission_IDAP_DeMineDrone",
						"Mission_IDAP_UtilityDrone",
						"Mission_IDAP_Darter",
						"Mission_AAF_MedDrone",
						"Mission_AAF_UtilityDrone",
						"Mission_AAF_Darter",
						"Mission_NATO_MedDrone",
						"Mission_NATO_UtilityDrone",
						"Mission_NATO_Darter",
						"Mission_CSAT_MedDrone",
						"Mission_CSAT_UtilityDrone",
						"Mission_CSAT_Darter"
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
						"Diving_Gear_NATO",
						"SniperGear_NATO",
						"Launchers_NATO",
						"CTRG"
					];
				};
				case "CSAT":
				{
					_LootSelect = selectRandom
					[
						"Diving_Gear_CSAT",
						"SniperGear_CSAT",
						"Launchers_CSAT",
						"Viper"
					];
				};
				case "AAF":
				{
					_LootSelect = selectRandom
					[
						"Diving_Gear_AAF",
						"SniperGear_AAF",
						"Launchers_AAF"
					];
				};
				default 
				{
					_LootSelect = selectRandom
					[
						"Diving_Gear_AAF",
						"Diving_Gear_NATO",
						"Diving_Gear_CSAT",
						"SniperGear_NATO",
						"Launchers_NATO",
						"CTRG",
						"SniperGear_CSAT",
						"Launchers_CSAT",
						"Viper",
						"SniperGear_AAF",
						"Launchers_AAF"
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
			_LootSelect == "Mission_PMPistol" ||
			_LootSelect == "Mission_P07Pistol"|| 
			_LootSelect == "Mission_ZuberPistol"|| 
			_LootSelect == "Mission_RookPistol"|| 
			_LootSelect == "Mission_PDW"|| 
			_LootSelect == "Mission_45Pistol"|| 
			_LootSelect == "Mission_ZuberPistol"|| 
			_LootSelect == "Mission_Sting"|| 
			_LootSelect == "Mission_Vermin"|| 
			_LootSelect == "Mission_Protector"|| 
			_LootSelect == "Mission_SDAR"|| 
			_LootSelect == "Mission_Mk20"|| 
			_LootSelect == "Mission_TRG"|| 
			_LootSelect == "Mission_Katiba"|| 
			_LootSelect == "Mission_MX"|| 
			_LootSelect == "Mission_SPAR16"|| 
			_LootSelect == "Mission_CAR95"|| 
			_LootSelect == "Mission_MXSW"|| 
			_LootSelect == "Mission_Mk200"|| 
			_LootSelect == "Mission_SPAR16S"|| 
			_LootSelect == "Mission_CAR951"|| 
			_LootSelect == "Mission_LIM"|| 
			_LootSelect == "Mission_AK"

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
			_LootSelect == "Mission_MXM"|| 
			_LootSelect == "Mission_Mk18"|| 
			_LootSelect == "Mission_CMR76"|| 
			_LootSelect == "Mission_SPAR17"|| 
			_LootSelect == "Mission_MK14"|| 
			_LootSelect == "Mission_MK1"|| 
			_LootSelect == "Mission_MAR10"|| 
			_LootSelect == "Mission_Syrus"|| 
			_LootSelect == "Mission_M320"|| 
			_LootSelect == "Mission_Lynx"|| 
			_LootSelect == "Mission_ASP"|| 
			_LootSelect == "Mission_Zafir"|| 
			_LootSelect == "Mission_SPMG"|| 
			_LootSelect == "Mission_NAVID"
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
			_LootSelect == "Mission_RPG7"|| 
			_LootSelect == "Mission_RPG42"|| 
			_LootSelect == "Mission_PCML"||
			_LootSelect == "Mission_NATO_TitanAA"||
			_LootSelect == "Mission_NATO_TitanAT"||
			_LootSelect == "Mission_CSAT_TitanAA"||
			_LootSelect == "Mission_CSAT_TitanAT"||
			_LootSelect == "Mission_AAF_TitanAA"||
			_LootSelect == "Mission_AAF_TitanAT"
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
			_LootSelect == "Mission_Ammo_45"||
			_LootSelect == "Mission_Ammo_545"||
			_LootSelect == "Mission_Ammo_556"||
			_LootSelect == "Mission_Ammo_58"||
			_LootSelect == "Mission_Ammo_65"||
			_LootSelect == "Mission_Ammo_762"||
			_LootSelect == "Mission_Ammo_338"||
			_LootSelect == "Mission_Ammo_93"||
			_LootSelect == "Mission_Ammo_408"||
			_LootSelect == "Mission_Ammo_127"||
			_LootSelect == "Mission_Ammo_50"||
			_LootSelect == "Mission_Ammo_3GL"||
			_LootSelect == "Mission_Ammo_UGL"
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
			_LootSelect == "Mission_IDAP_MedDrone"||
			_LootSelect == "Mission_IDAP_DeMineDrone"||
			_LootSelect == "Mission_IDAP_UtilityDrone"||
			_LootSelect == "Mission_IDAP_Darter"||
			_LootSelect == "Mission_AAF_MedDrone"||
			_LootSelect == "Mission_AAF_UtilityDrone"||
			_LootSelect == "Mission_AAF_Darter"||
			_LootSelect == "Mission_NATO_MedDrone"||
			_LootSelect == "Mission_NATO_UtilityDrone"||
			_LootSelect == "Mission_NATO_Darter"||
			_LootSelect == "Mission_CSAT_MedDrone"||
			_LootSelect == "Mission_CSAT_UtilityDrone"||
			_LootSelect == "Mission_CSAT_Darter"||
			_LootSelect == "SniperGear_NATO"||
			_LootSelect == "CTRG"||
			_LootSelect == "SniperGear_CSAT"||
			_LootSelect == "Viper"||
			_LootSelect == "SniperGear_AAF"
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
