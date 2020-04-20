// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: vehicleSpawnClasses.sqf
//	@file Author: AgentRev

A3W_smallVehicles =
[
	"rhsusf_mrzr4_d",
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
	["C_Van_01_box_F", "C_Van_01_transport_F"],
	["C_Van_02_medevac_F","C_Van_02_vehicle_F","C_Van_02_transport_F","I_G_Van_02_vehicle_F","B_G_Van_02_transport_F"]
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles =
[
	//"B_T_LSV_01_unarmed_F",
	//"O_T_LSV_02_unarmed_F",
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
	"RHS_MELB_MH6M",
	"RHS_UH60M_MEV_d"
	// don't put cargo helicopters here, it doesn't make sense to find them in towns; they spawn in the CivHeli mission
];

//Object List - Random Planes.
staticPlaneList =
[
	["RHS_AN2_B", "RHS_AN2"],
	"C_Plane_Civil_01_F"
];

A3W_planeSpawnOdds = 0.25; // 0.0 to 1.0

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons =
[
	["rhs_weap_m38", "rhs_weap_m38_rail", "rhs_weap_mosin_sbr", "rhs_weap_kar98k", "rhs_weap_m79"],
	["rhs_weap_m1garand_sa43", "rhs_weap_MP44", "rhs_weap_m3a1", "rhs_weap_m3a1_specops"],
	["rhs_weap_ak104", "rhs_weap_akmn", "rhs_weap_aks74un", "rhs_weap_m21s"],
	["rhs_weap_g36c", "rhs_weap_vhsk2", "rhs_weap_m16a4", "rhs_weap_m4a1_carryhandle"],
	["rhs_weap_asval_grip", "rhs_weap_vss_grip", "rhs_weap_m70ab2", "rhs_weap_m92"],
	["rhs_weap_m76", "rhs_weap_mg42", "rhs_weap_pm63"],
	["rhs_weap_m72a7", "rhs_weap_rshg2", "rhs_weap_panzerfaust60"]
];

vehicleAddition =
[
	//["rhsusf_acc_rotex_mp7", "rhsusf_acc_nt4_black", "rhs_acc_pbs1"],
	//["rhsusf_acc_rotex_mp7", "rhs_acc_pbs1"],
	["V_TacVest_camo", "V_TacVestIR_khk", "V_TacVestIR_oli"],
	["rhsgref_helmet_pasgt_olive", "rhssaf_helmet_m97_woodland"],
	//["optic_Arco_blk_F", "optic_SOS", "optic_DMS", "rhsusf_acc_ACOG_RMR", "rhsusf_acc_su230"],
	["rhs_acc_ekp8_18", "rhs_acc_1p87", "rhsusf_acc_T1_high", "rhsusf_acc_RX01"],
	["rhs_acc_ekp1", "rhs_acc_1p63", "rhs_acc_pkas", "rhs_acc_pso1m21"],
	//["optic_aco_smg", "optic_Holosight_blk_F", "optic_Holosight_smg"],
	["Medikit", "FirstAidKit", "ToolKit", "MineDetector"]
];

vehicleAddition2 =
[
	["Chemlight_blue", "Chemlight_green", "Chemlight_yellow", "Chemlight_red"],
	["rhssaf_mag_br_m75", "rhssaf_mag_br_m84", "rhs_mag_f1","DemoCharge_Remote_Mag"],
	["rhs_mag_an_m8hc", "rhssaf_mag_brd_m83_white", "rhssaf_mag_brd_m83_blue", "rhssaf_mag_brd_m83_green", "rhssaf_mag_brd_m83_yellow", "rhssaf_mag_brd_m83_red"],
	["rhs_mag_an_m14_th3", "rhssaf_mag_brk_m79", "rhssaf_mag_brz_m88", "rhs_mag_m7a3_cs", "rhsgref_mag_rkg3em", "rhs_mag_zarya2"],
	["B_IR_Grenade", "I_IR_Grenade", "O_IR_Grenade"],
	"acc_flashlight",
	"acc_pointer_IR",
	//"Medikit",
	//"FirstAidKit",
	"MineDetector",
	"ToolKit"
];








