// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: vehicleSpawnClasses.sqf
//	@file Author: AgentRev

A3W_smallVehicles =
[
	"rhsusf_mrzr4_d",
	//"C_Kart_01_F",
	["B_Quadbike_01_F", "O_Quadbike_01_F", "I_Quadbike_01_F", "I_G_Quadbike_01_F"]
];

//Civilian Vehicle List - Random Spawns
civilianVehicles =
[
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_SUV_01_F",
	"C_Offroad_01_F",
	"rhsgref_un_uaz",
	["I_C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_F"],
	// ["C_Van_01_box_F", "C_Van_01_transport_F"],
	["C_Van_02_medevac_F","C_Van_02_vehicle_F","C_Van_02_transport_F","I_G_Van_02_vehicle_F","B_G_Van_02_transport_F"]
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles =
[
	"B_T_LSV_01_unarmed_F",
	"O_T_LSV_02_unarmed_F",
	["rhsusf_m1025_w","rhsusf_m1025_w_s"],
	"rhsusf_m998_w_2dr_fulltop",
	"rhsusf_m998_w_s_2dr_fulltop",
	"rhsusf_m998_w_4dr_fulltop",
	"rhsusf_m998_w_s_4dr_fulltop",
	"rhsgref_ins_uaz_dshkm",
	"rhs_tigr_m_msv",
	"RHS_UAZ_MSV_01",
	"rhs_uaz_open_MSV_01"
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles =
[
	//"B_MRAP_01_F",
	//"O_MRAP_02_F",
	//"I_MRAP_03_F",
	"rhsusf_rg33_usmc_w",
	"rhsusf_M1232_usarmy_wd",
	//["O_Truck_03_transport_F", "O_Truck_03_covered_F", "O_Truck_03_medical_F"],
	"rhsusf_M1078A1P2_WD_flatbed_fmtv_usarmy",
	"rhsusf_M1078A1P2_WD_fmtv_usarmy",
	"rhsusf_M1078A1P2_B_WD_CP_fmtv_usarmy",
	//["I_Truck_02_transport_F", "I_Truck_02_covered_F", "I_Truck_02_medical_F"],
	"rhs_kamaz5350_open_vmf",
	"rhs_kamaz5350_msv",
	"rhs_kamaz5350_flatbed_vv",
	//["B_Truck_01_box_F", "B_Truck_01_transport_F", "B_Truck_01_covered_F", "B_Truck_01_medical_F"],
	"rhsgref_un_ural",
	"rhsgref_ins_g_ural_open",
	"rhsgref_ins_g_ural_work",
	"rhsgref_cdf_gaz66_ap2"
];

//Water Vehicles - Random Spawns
waterVehicles =
[
	"C_Boat_Civil_01_F",
	"C_Boat_Civil_01_F",
	"C_Scooter_Transport_01_F",
	"C_Rubberboat",
	"B_Lifeboat",
	"O_Lifeboat",
	"I_C_Boat_Transport_02_F",
	"B_Boat_Transport_01_F",
	"O_Boat_Transport_01_F",
	"I_Boat_Transport_01_F",
	"B_G_Boat_Transport_01_F",
	"C_Boat_Civil_01_F",
	"C_Boat_Civil_01_rescue_F",
	"C_Boat_Civil_01_police_F",
	["C_Boat_Civil_01_police_F", "C_Boat_Civil_01_rescue_F"]
	// ["B_Boat_Armed_01_minigun_F", "O_Boat_Armed_01_hmg_F", "I_Boat_Armed_01_minigun_F"]
];

//Object List - Random Spawns.
staticWeaponsList =
[
	//"B_Mortar_01_F",
	//"O_Mortar_01_F",
	//"I_Mortar_01_F",
	//"I_G_Mortar_01_F"
];

//Object List - Random Helis.
staticHeliList =
[
	"C_Heli_Light_01_civil_F",
	"RHS_Mi8amt_civilian",
	// "B_Heli_Light_01_F",
	"RHS_UH1Y_UNARMED_d",
	//"O_Heli_Light_02_unarmed_F",
	"rhs_ka60_c",
	// "I_Heli_light_03_unarmed_F",
	"RHS_MELB_MH6M"
	// don't put cargo helicopters here, it doesn't make sense to find them in towns; they spawn in the CivHeli mission
];

//Object List - Random Planes.
staticPlaneList =
[
	"RHS_AN2_B", "RHS_AN2"
];

A3W_planeSpawnOdds = 0.25; // 0.0 to 1.0

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons =
[
	["SMG_01_F", "SMG_02_F", "hgun_PDW2000_F", "SMG_05_F"],
	["arifle_SDAR_F"]
	
];

vehicleAddition =
[
	["muzzle_snds_L"], // 9mm
	["acc_flashlight", "acc_pointer_IR"],
	["MiniGrenade", "HandGrenade"],
	["APERSTripMine_Wire_mag", "APERSBoundingMine_Range_mag", "APERSMine_Range_mag", "ClaymoreDirectionalMine_Remote_mag", "SLAMDirectionalMine_Wire_mag", "ATMine_Range_mag", "DemoCharge_Remote_mag", "SatchelCharge_Remote_mag"]
];

vehicleAddition2 =
[
	["Chemlight_blue", "Chemlight_green", "Chemlight_yellow", "Chemlight_red"],
	["SmokeShell", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellGreen", "SmokeShellYellow", "SmokeShellOrange", "SmokeShellRed"],
	["B_IR_Grenade", "I_IR_Grenade", "O_IR_Grenade"],
	"acc_flashlight",
	"acc_pointer_IR",
	"Medikit",
	"FirstAidKit",
	"MineDetector",
	"ToolKit"
];








