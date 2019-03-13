/*
file Name: fn_ResupplyPoint.sqf
Author: GMG_Monkey
Purpose: Allow players to rearm, repair, refuel, and resupply vehicles. Charges dynamically based on what is needed.
*/

//Config Defines
	#define Fuel_Cost 0.5 //Price per liter of fuel
	#define Repair_Cost 1 //Price per Kg of repair cargo
	#define Ammo_Cost 5 //Price Per Kg of Ammo Cargo
//Check if mutex lock is active.
	if (mutexScriptInProgress) exitWith
	{
		titleText ["You are already performing another action.", "PLAIN DOWN", 0.5];
	};
//Input Parameters
	params ["", ["_unit",objNull,[objNull]]];
	private _vehicle = vehicle player;
//Array of all possible weapons magazines
	private _magprices =
	[
		//Pylon Weapons,							Max Ammo		Price		What it actually is
		["PylonRack_1Rnd_LG_scalpel",				1,				10000],		//SCALPEL X1
		["PylonRack_3Rnd_LG_scalpel",				3,				10000],		//SCALPEL X3
		["PylonRack_4Rnd_LG_scalpel",				4,				10000],		//SCALPEL X4
		["PylonRack_1Rnd_Missile_AGM_02_F",			1,				15000],		//MACER AGM X1
		["PylonRack_Missile_AGM_02_x1",				1,				20000],		//MACER II AGM X1
		["PylonMissile_Missile_AGM_02_x2",			2,				150000],	//MACER AGM X2
		["PylonRack_Missile_AGM_02_x2",				2,				20000],		//MACER II X2
		["PylonRack_3Rnd_Missile_AGM_02_F",			3,				10000],		//MACER AGM X3
		["PylonRack_12Rnd_PG_missiles",				12, 			2000],		//DAGR X12
		["PylonRack_1Rnd_Missile_AGM_01_F",			1,				15000],		//SHARUR X1
		["PylonMissile_Missile_AGM_KH25_x1",		1,				20000],		//KH-25 X1
		["PylonRack_1Rnd_Missile_AA_04_F",			1,				15000],		//FALCHION 22 X1
		["PylonRack_1Rnd_AAA_missiles",				1,				2500],		//ASRAAM X1
		["PylonRack_Missile_AMRAAM_C_x1",			1,				4000],		//AMRAAM C X1
		["PylonRack_Missile_AMRAAM_C_x2",			2,				4000],		//AMRAAM C X2
		["PylonMissile_Missile_AMRAAM_D_INT_x1",	1,				5000],		//AMRAAM D X1
		["PylonRack_Missile_AMRAAM_D_x2",			2,				5000],		//AMRAAM D X2
		["PylonRack_Missile_BIM9X_x2",				2,				7000],		//BIM9X X2
		["PylonMissile_Missile_BIM9X_x1",			1,				7000],		//BIM8X X1
		["PylonRack_1Rnd_Missile_AA_03_F",			1,				8000],		//SAHR-3
		["PylonMissile_Missile_AA_R73_x1",			1,				9000],		//R-73 X1
		["PylonMissile_Missile_AA_R77_x1",			1,				10000],		//R-77 X1
		["PylonRack_1Rnd_GAA_missiles",				1,				40000],		//ZYPHER X1
		["PylonRack_12Rnd_missiles",				12,				500],		//DAR ROCKETS X12
		["PylonRack_7Rnd_Rocket_04_HE_F",			7,				1000],		//SHRIEKER HE ROCKETS X7
		["PylonRack_7Rnd_Rocket_04_AP_F",			7,				1000],		//SHRIEKER AP ROCKETS X7
		["PylonRack_20Rnd_Rocket_03_HE_F",			20,				1000],		//TRATNYR HE ROCKETS X20
		["PylonRack_20Rnd_Rocket_03_AP_F",			20,				1000],		//TRATNYR AP ROCKETS X20
		["PylonRack_19Rnd_Rocket_Skyfire",			19,				800],		//SKYFIRE X19
		["PylonMissile_1Rnd_Bomb_04_F",				1,				2500],		//GBU-12 GUIDED BOMB NATO X1
		["PylonMissile_1Rnd_Bomb_03_F",				1,				2500],		//LOM-250G GUIDED BOMB CSAT X1
		["PylonMissile_Bomb_GBU12_x1",				1,				2500],		//GBU-12 LASER GUIDIED BOMB X1
		["PylonRack_Bomb_GBU12_x2",					2,				2500],		//GBU-12 LASER GUIDED BOMB X2
		["PylonMissile_Bomb_KAB250_x1",				1,				2500],		//KAB250 GUIDED BOMB X1
		["PylonMissile_1Rnd_Mk82_F",				1,				500],		//MK-82 DUMB BOMB X1
		["PylonWeapon_300Rnd_20mm_shells",			300,			5],			//20mm TWIN CANNON
		["PylonWeapon_2000Rnd_65x39_belt",			2000,			1],			//6.5mm GATTLING GUN (RIGHT SIDE)
		["PylonRack_4Rnd_BombDemine_01_F",			4,				1250],		//Demining Drone Charges
		//Non Dynamic magazines
		["1000Rnd_20mm_shells",						1000,			35],		//Blackfoot cannon ammo
		["1000Rnd_65x39_Belt_Green",				1000,			1],			//6.5 coax ammo
		["1000Rnd_65x39_Belt_Yellow",				1000,			1],
		["1000Rnd_762x51_Belt_Yellow",				1000,			3],
		["1000Rnd_Gatling_30mm_Plane_CAS_01_F", 	1000,			50],		//Wipeout cannon ammo
		["100Rnd_105mm_HEAT_MP",					100,			90],		//Blackfish 102mm cannon rounds
		["100Rnd_127x99_mag_Tracer_Red",			100,			10],
		["100Rnd_127x99_mag_Tracer_Yellow",			100,			10],
		["12Rnd_125mm_HEAT_T_Green",				12,				100],
		["12Rnd_125mm_HE_T_Green",					12,				100],
		["12Rnd_230mm_rockets",						12,				5000],
		["130Rnd_338_Mag",							130,			8],
		["140Rnd_30mm_MP_shells_Tracer_Green",		140,			50],		//30mm/Kamysh MP rounds
		["140Rnd_30mm_MP_shells_Tracer_Yellow",		140,			50],
		["14Rnd_120mm_HE_shells_Tracer_Yellow",		14,				100],		//Kuma cannon HE rounds
		["160Rnd_40mm_APFSDS_Tracer_Red_shells",	160,			70],		//blackfish 40mm cannon APFSDS rounds
		["16Rnd_120mm_HE_shells_Tracer_Red",		16,				100],
		["1Rnd_GAA_missiles",						1,				1000],
		["1Rnd_GAT_missiles",						1,				1000],
		["2000Rnd_65x39_Belt_Tracer_Green_Splash",	2000,			1],		//Orca minigun ammo
		["2000Rnd_65x39_Belt_Tracer_Red",			2000,			1],		//Helicopter Door gunner minigun ammo
		["2000Rnd_65x39_Belt_Tracer_Yellow",		2000,			1],
		["2000Rnd_65x39_belt",						2000,			1],		//6.5 LMG ammo
		["2000Rnd_762x51_Belt_Green",				2000,			3],
		["2000Rnd_762x51_Belt_Yellow",				2000,			3],		//Kuma coax ammo
		["200Rnd_127x99_mag_Tracer_Green",			200,			10],
		["200Rnd_127x99_mag_Tracer_Yellow",			200,			10],
		["200Rnd_40mm_G_belt",						200,			70],
		["20Rnd_105mm_HEAT_MP_T_Red",				20,				95],		//Slammer Cannon HEAT rounds
		["240Rnd_40mm_GPR_Tracer_Red_shells",		240,			70],		//Blackfish 40mm cannon GP rounds
		["24Rnd_125mm_APFSDS_T_Green",				24,				100],
		["250Rnd_30mm_APDS_shells_Tracer_Green",	250,			50],		//Kajman/Xian cannon APDS ammo
		["250Rnd_30mm_HE_shells_Tracer_Green",		250,			50],		//Kajman/Xian cannon HE ammo
		["28Rnd_120mm_APFSDS_shells_Tracer_Yellow",	28,				100],		//Kuma cannon AP rounds
		["2Rnd_155mm_Mo_Cluster",					2,				700],
		["2Rnd_155mm_Mo_LG",						2,				500],
		["2Rnd_155mm_Mo_guided",					2,				500],
		["2Rnd_GAT_missiles",						2,				1000],		//Kamysh/Gorgon AT missiles
		["300Rnd_20mm_shells",						300,			35],		//Buzzard Cannon ammo
		["32Rnd_120mm_APFSDS_shells_Tracer_Red",	32,				100],
		["32Rnd_155mm_Mo_shells",					32,				125],
		["4000Rnd_20mm_Tracer_Red_shells",			4000,			35],		//Blackfish gattling cannon rounds
		["40Rnd_105mm_APFSDS_T_Red",				40,				95],		//Slammer Cannon AP rounds
		["40Rnd_40mm_APFSDS_Tracer_Red_shells",		40,				70],		//Marshal 40mm AP ammo
		["450Rnd_127x108_Ball",						450,			5],
		["4Rnd_LG_Jian",							4,				1000],		//Fenhuang missiles
		["4Rnd_Titan_long_missiles",				4,				1500],		//Cheetah/Tigris AA missiles
		["5000Rnd_762x51_Belt",						5000,			3],		//Pawne minigun ammo
		["5000Rnd_762x51_Yellow_Belt",				5000,			3],		//Hellcat minigun ammo
		["500Rnd_127x99_mag_Tracer_Green",			500,			5],
		["500Rnd_127x99_mag_Tracer_Red",			500,			5],		//12.7 MG ammo
		["500Rnd_127x99_mag_Tracer_Yellow",			500,			5],		//Kuma Commander MG ammo
		["500Rnd_65x39_Belt_Tracer_Green_Splash",	500,			1],
		["500Rnd_Cannon_30mm_Plane_CAS_02_F",		500,			50],		//Neophran cannon ammo
		["60Rnd_30mm_APFSDS_shells_Tracer_Green",	60,				50],		//30mm/Kamysh AP rounds
		["60Rnd_30mm_APFSDS_shells_Tracer_Yellow",	60,				50],
		["60Rnd_40mm_GPR_Tracer_Red_shells",		60,				70],		//Marshal 40mm	GP ammo
		["680Rnd_35mm_AA_shells_Tracer_Green",		680,			60],		//Tigris Autocannon ammo
		["680Rnd_35mm_AA_shells_Tracer_Red",		680,			60],		//Cheetah autocannon ammo
		["6Rnd_155mm_Mo_AT_mine",					6,				500],
		["6Rnd_155mm_Mo_mine",						6,				300],
		["6Rnd_155mm_Mo_smoke",						6,				120],
		["8Rnd_82mm_Mo_Flare_white",				8,				120],
		["8Rnd_82mm_Mo_Smoke_white",				8,				120],
		["8Rnd_82mm_Mo_shells",						8,				150],
		["96Rnd_40mm_G_belt",						96,				70],
		["96Rnd_40mm_G_belt",						96,				70],		//40mm GP rounds
		["magazine_Missile_rim116_x21",				21,				2000],		//Spartan Turret missiles
		["magazine_Cannon_Phalanx_x1550",			1550,			50],		//Preatorian Ammo
		["magazine_Missile_rim162_x8",				8,				8000],		//Centurion Missiles
		["Pylon_1Rnd_Leaflets_West_F",				1,				1],
		["Pylon_1Rnd_Leaflets_East_F",				1,				1],
		["Pylon_1Rnd_Leaflets_Guer_F",				1,				1],
		["Pylon_1Rnd_Leaflets_Civ_F",				1,				1],
		["Pylon_1Rnd_Leaflets_Custom_01_F",			1,				1],
		["Pylon_1Rnd_Leaflets_Custom_02_F",			1,				1],
		["Pylon_1Rnd_Leaflets_Custom_03_F",			1,				1],
		["Pylon_1Rnd_Leaflets_Custom_04_F",			1,				1],
		["Pylon_1Rnd_Leaflets_Custom_05_F",			1,				1],
		["Pylon_1Rnd_Leaflets_Custom_06_F",			1,				1],
		["Pylon_1Rnd_Leaflets_Custom_07_F",			1,				1],
		["Pylon_1Rnd_Leaflets_Custom_08_F",			1,				1],
		["Pylon_1Rnd_Leaflets_Custom_09_F",			1,				1],
		["Pylon_1Rnd_Leaflets_Custom_10_F",			1,				1],
		//Countermeasures				
		["120Rnd_CMFlare_Chaff_Magazine",			120,			1],
		["168Rnd_CMFlare_Chaff_Magazine",			168,			1],
		["192Rnd_CMFlare_Chaff_Magazine",			192,			1],
		["240Rnd_CMFlare_Chaff_Magazine",			240,			1],
		["SmokeLauncherMag",						1,				1],
		//Support magazines				
		["Laserbatteries",							1,				1]
	];
//Resouce Arrays
	private _AmmoResourcesMax =
	[
			["B_Truck_01_ammo_F",					25000],
			["O_Truck_03_ammo_F", 					15000],
			["I_Truck_02_ammo_F",					10000],
			["B_APC_Tracked_01_CRV_F",				500],
			["O_Heli_Transport_04_ammo_F",			20000]

	];
	private _FuelResourcesMax =
	[
			["C_Van_01_fuel_F",						1000],
			["B_G_Van_01_fuel_F",					1000],
			["B_Truck_01_fuel_F",					25000],
			["O_Truck_03_fuel_F",					20000],
			["I_Truck_02_fuel_F",					15000],
			["B_APC_Tracked_01_CRV_F",				500],
			["O_Heli_Transport_04_fuel_F",			22000]

	];
	private _RepairResourcesMax =
	[
			["C_Offroad_01_repair_F",				500],
			["C_Van_02_service_F",					1000],
			["B_Truck_01_Repair_F",					25000],
			["O_Truck_03_repair_F",					20000],
			["I_Truck_02_box_F",					15000],
			["B_APC_Tracked_01_CRV_F",				500],
			["O_Heli_Transport_04_repair_F",		22000]

	];
//check if caller is in vehicle
	if (_vehicle == _unit) exitWith {};
//Define Vehicle Status
	private _vehClass = typeOf _vehicle;
	private _vehCfg = configFile >> "CfgVehicles" >> _vehClass;
	private _vehName = getText (_vehCfg >> "displayName");
	private _vehFuelCap = getnumber  (_vehCfg >> "fuelCapacity");
	private _vehturrets = allturrets _vehicle;
	private _mags = magazinesallturrets _vehicle;
	private _vehDamage = getDammage _vehicle;
	private _vehFuel = fuel _vehicle;
	private	_VehAmmoResource = _vehicle getvariable ["GOM_fnc_ammoCargo", 0];
	private _vehfuelresource = _vehicle getvariable ["GOM_fnc_fuelCargo", 0];
	private _vehRepairResource = _vehicle getvariable ["GOM_fnc_repairCargo", 0];
//Define Player Status
	private _money = player getvariable ["cmoney", 0];
//Calculate Resupply Prices
	//Calculate fuel cost
		private _fuelramaining = ceil (_vehfuel * _vehfuelcap);
		// player globalchat format ["Remaing fuel is %1 liters", _fuelramaining];
		private _ReFuelCost = ceil ((_vehfuelcap - _fuelramaining) * Fuel_Cost);
		// player globalchat format ["It will cost %1 to refuel the vehicle", _ReFuelCost];
	//Calculate repair cost
		// set vehicle price for vehicle not found in vehicle store
		private _vehprice = 1000;
		//Get Vehicle Price from store arrays
		{
			private _check = _x select 1;
			if (_vehClass == _check) exitWith
			{
				_vehprice = _x select 2;
				player globalchat format ["Vehicles Purchase Price was %1", _vehprice];
			};
		} forEach (call allVehStoreVehicles + call staticGunsArray);
		private _RepairCost = ceil ((_vehDamage * _vehprice)/2);
		// player globalchat format ["Repair Cost is %1, because the vehicle was %2 damaged", _RepairCost, _vehDamage];
	//Calculate Rearm Cost
		//initialize Cost variable
			private _RearmCost = 0;
		//Calculate rearm cost based on equiped magazines
			{
				private _mag = _x select 0;
				player globalchat format ["Selected ammo is= %1", _mag];
				private _magammo = _x select 2;
				player globalchat format ["Remaining ammo = %1", _magammo];
				{
					if (_mag == _x select 0) then
					{
						private _maxammo = _x select 1;
						player globalchat format ["Maximum ammo = %1", _maxammo];
						private _ammoprice = _x select 2;
						player globalchat format ["Price of ammo = %1", _ammoprice];
						private _ammoneeded = (_maxammo - _magammo);
						player globalchat format ["Needed ammo = %1", _ammoneeded];
						private _ammocost = (_ammoneeded * _ammoprice);
						player globalchat format ["Ammo cost= %1", _ammocost];
						_RearmCost = ( _RearmCost + _ammocost);
						player globalchat format ["Rearm costs is = %1", _RearmCost];
					};
				} foreach _magprices;
			} foreach _mags;
	//calcuate Ammo Resource costs
		//initialize Cost variable
			private _AmmoResourceCost = 0;
		//Calculate price based on expended resouces
			{
				private _Cost = 0;
				private _Check = _x select 0;
				if (_Vehclass iskindof _Check) then
				{
					private _ResourceMax = _x select 1;
					_Cost = ((_ResourceMax - _VehAmmoResource) * Ammo_Cost);
					//player globalchat format ["Vehicle remianing resources: %1 Maximum resources: %2 Cost to resupply: %3", _VehAmmoResource, _ResourceMax, _Cost];
					if (_Cost >= 0) then
					{
						_AmmoResourceCost = _Cost;
					};
				};
			} foreach _AmmoResourcesMax;
			// player globalchat format ["Vehicle remianing resources: %1 Cost to resupply: %2", _VehAmmoResource, _AmmoResourceCost];
	//Calculate Fuel Resource Cost
		//Initialize cost Variable
			private _FuelResourceCost = 0;
		//Calculate price based on expended resouces
			{
				private _Cost = 0;
				private _Check = _x select 0;
				if (_Vehclass iskindof _Check) then
				{
					private _ResourceMax = _x select 1;
					_Cost = ((_ResourceMax - _vehfuelresource) * Fuel_Cost);
					// player globalchat format ["Vehicle remianing resources: %1 Maximum resources: %2 Cost to resupply: %3", _vehfuelresource, _ResourceMax, _Cost];
					if (_Cost >= 0) then
					{
						_FuelResourceCost = _Cost;
					};
				};
				
			} foreach _FuelResourcesMax;
	//Calculate Repair Resource Cost
		//Initialize cost variable
			private _RepairResourceCost = 0;
		//Calculate price based on expended resouces
			{
				private _Cost = 0;
				private _Check = _x select 0;
				if (_Vehclass iskindof _Check) then
				{
					private _ResourceMax = _x select 1;
					_Cost = ((_ResourceMax - _vehRepairResource) * Repair_Cost);
					// player globalchat format ["Vehicle remianing resources: %1 Maximum resources: %2 Cost to resupply: %3", _vehRepairResource, _ResourceMax, _Cost];
					if (_Cost >= 0) then
					{
						_RepairResourceCost = _Cost;
					};
				};
			} foreach _RepairResourcesMax;
	//Calculate Total cost of resupply
		private _TotalPrice = (_AmmoResourceCost + _FuelResourceCost + _RepairResourceCost + _RearmCost + _RepairCost + _ReFuelCost);

//Start Resupply
	// Check player has enough money
		if (_money >= _totalprice) then
		{
			//Prompt player to confirm cost
			_msg = format ["%1<br/><br/>%2", format ["It will cost you $%1 to resupply %2.", _totalprice, _vehName], "Do you want to proceed?"];
			if ([_msg, "Resupply Vehicle", true, true] call BIS_fnc_guiMessage) then
			{
				mutexScriptInProgress = true;  //prevents players from doing other actions
				doCancelAction = false;
				//Subtract cost from player money
				[player, -_totalprice] call A3W_fnc_setCMoney;
				//Resupply Start
					//Turn of vehicle engine
						_vehicle engineOn false;
					//Setup Switch for service completion
						private _ResupplyComplete = false;
					//Begine Service Actions
						//Inform player of engine status
							titleText ["Starting Services. Vehicle Engine must Remain Off. No refunds for aborted services.", "PLAIN DOWN"];
							sleep 3;
						//Make sure that vehicle engine remains off during resupply and beging servicing
							if (isEngineOn _vehicle && !(_vehicle isKindOf "StaticWeapon")) exitwith {titletext ["Resupply Canceled, Vehicle engine started", "PLAIN DOWN"]};
							//Rearm Section
								if (_RearmCost > 0) then
								{
									titleText ["Rearming...", "PLAIN DOWN"];
									sleep 15;
									_vehicle setVehicleAmmo 1;
								};
							if (isEngineOn _vehicle && !(_vehicle isKindOf "StaticWeapon")) exitwith {titletext ["Resupply Canceled, Vehicle engine started", "PLAIN DOWN"]};
							//Repair Section
								if (_repaircost > 0) then
								{
									titleText ["Reparing...", "PLAIN DOWN"];
									sleep 15;
									_vehicle setDammage 0;
								};
							if (isEngineOn _vehicle && !(_vehicle isKindOf "StaticWeapon")) exitwith {titletext ["Resupply Canceled, Vehicle engine started", "PLAIN DOWN"]};
							//Refuel Section
								if (_ReFuelCost > 0) then
								{
									titleText ["Refueling...", "PLAIN DOWN"];
									sleep 15;
									_vehicle setFuel 1;
								};
							if (isEngineOn _vehicle && !(_vehicle isKindOf "StaticWeapon")) exitwith {titletext ["Resupply Canceled, Vehicle engine started", "PLAIN DOWN"]};
							//Ammo Resource Section
								if (_AmmoResourceCost > 0) then
								{
									{
										if (_Vehclass iskindof (_x select 0)) then
										{
											titleText ["Resupplying Ammunition Cargo...", "PLAIN DOWN"];
											sleep 15;
											_Vehicle setVariable ["GOM_fnc_ammoCargo", _x select 1, true];
										};
									} foreach _AmmoResourcesMax;
								};
							if (isEngineOn _vehicle && !(_vehicle isKindOf "StaticWeapon")) exitwith {titletext ["Resupply Canceled, Vehicle engine started", "PLAIN DOWN"]};
							// Fuel resource Section
								if (_FuelResourceCost > 0) then
								{
									{
										If (_Vehclass iskindof (_x select 0)) then
										{
											titleText ["Resupplying Fuel Cargo...", "PLAIN DOWN"];
											sleep 15;
											_Vehicle setVariable ["GOM_fnc_fuelCargo", _x select 1, true];
										};
									} foreach _FuelResourcesMax;
								};
							if (isEngineOn _vehicle && !(_vehicle isKindOf "StaticWeapon")) exitwith {titletext ["Resupply Canceled, Vehicle engine started", "PLAIN DOWN"]};
							//Repair Resource Section
								if (_RepairResourceCost > 0) then
								{
									{
										if (_vehclass iskindof (_x select 0)) then
										{
											titleText ["Resupplying Repair Cargo...", "PLAIN DOWN"];
											sleep 15;
											_Vehicle setVariable ["GOM_fnc_repairCargo", _x select 1, true];
										};
									} foreach _RepairResourcesMax;
								};
							//Set Completion to True
								_ResupplyComplete = true;
							//Turn Vehicle Engine On to end servicing
								_vehicle engineOn true;
					//Choose Exit text based on completion status
						if (_ResupplyComplete) then
						{
							titleText ["Vehicle Ready!", "PLAIN DOWN"];
						} else
						{
							titleText ["Service Aborted. NO REFUNDS", "PLAIN DOWN"];
						};
			};
	// Exit text if player doesn't have enough money		
		} else
		{
			titleText [format ["You don't have enough money, %1 costs %2 to resupply", _vehname, _totalprice], "PLAIN DOWN"];
		};
//All Done!