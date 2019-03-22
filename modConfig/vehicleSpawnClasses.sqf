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
	["arifle_SDAR_F"],
	["arifle_TRG20_F", "arifle_TRG21_F", "arifle_TRG21_GL_F"],
	["arifle_Mk20C_F", "arifle_Mk20_F", "arifle_Mk20_GL_F", "arifle_Mk20C_plain_F", "arifle_Mk20_plain_F", "arifle_Mk20_GL_plain_F"],
	["arifle_Katiba_F", "arifle_Katiba_C_F", "arifle_Katiba_GL_F"],
	["arifle_MXC_F", "arifle_MX_F", "arifle_MX_GL_F", "arifle_MXM_F", "arifle_MXC_Black_F", "arifle_MXC_khk_F", "arifle_MX_Black_F", "arifle_MX_khk_F", "arifle_MX_GL_Black_F", "arifle_MX_GL_khk_F"],
	["srifle_EBR_F", "srifle_DMR_01_F"],
	["hgun_Pistol_01_F", "hgun_P07_F", "hgun_P07_khk_F", "hgun_Rook40_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_01_F"],
	["arifle_MX_SW_F", "LMG_Mk200_F", "LMG_Zafir_F"],
	["arifle_SPAR_01_blk_F", "arifle_SPAR_01_khk_F", "arifle_SPAR_01_snd_F", "arifle_SPAR_01_GL_blk_F", "arifle_SPAR_01_GL_khk_F", "arifle_SPAR_01_GL_snd_F"],
	["arifle_CTAR_blk_F", "arifle_CTAR_GL_blk_F"],
	["arifle_ARX_blk_F", "arifle_ARX_hex_F", "arifle_ARX_ghex_F"],
	["arifle_AKS_F", "arifle_AKM_F", "arifle_AK12_F", "arifle_AK12_GL_F"],
	["arifle_MXM_F", "arifle_MXM_Black_F", "arifle_MXM_khk_F", "srifle_DMR_01_F", "srifle_EBR_F"],
	["srifle_DMR_07_blk_F", "srifle_DMR_07_hex_F", "srifle_DMR_07_ghex_F", "arifle_SPAR_03_blk_F", "arifle_SPAR_03_khk_F", "arifle_SPAR_03_snd_F"],
	["srifle_DMR_06_camo_F", "srifle_DMR_06_olive_F", "srifle_DMR_03_F", "srifle_DMR_03_multicam_F", "srifle_DMR_03_khaki_F", "srifle_DMR_03_tan_F", "srifle_DMR_03_woodland_F", "srifle_DMR_02_F", "srifle_DMR_02_camo_F", "srifle_DMR_02_sniper_F", "srifle_DMR_05_blk_F", "srifle_DMR_05_hex_F", "srifle_DMR_05_tan_f"],
	["srifle_DMR_04_F", "srifle_DMR_04_tan_F"],
	["arifle_MX_SW_F", "arifle_MX_SW_Black_F", "arifle_MX_SW_khk_F"],
	["arifle_SPAR_02_blk_F", "arifle_SPAR_02_khk_F", "arifle_SPAR_02_snd_F"],
	["arifle_CTARS_blk_F"],
	["LMG_03_F"],
	["SMG_01_F", "SMG_02_F", "hgun_PDW2000_F", "SMG_05_F"],
	["arifle_SDAR_F"],
	["arifle_TRG20_F", "arifle_TRG21_F", "arifle_TRG21_GL_F"],
	["arifle_Mk20C_F", "arifle_Mk20_F", "arifle_Mk20_GL_F", "arifle_Mk20C_plain_F", "arifle_Mk20_plain_F", "arifle_Mk20_GL_plain_F"],
	["arifle_Katiba_F", "arifle_Katiba_C_F", "arifle_Katiba_GL_F"],
	["arifle_MXC_F", "arifle_MX_F", "arifle_MX_GL_F", "arifle_MXM_F", "arifle_MXC_Black_F", "arifle_MXC_khk_F", "arifle_MX_Black_F", "arifle_MX_khk_F", "arifle_MX_GL_Black_F", "arifle_MX_GL_khk_F"],
	["srifle_EBR_F", "srifle_DMR_01_F"],
	["hgun_Pistol_01_F", "hgun_P07_F", "hgun_P07_khk_F", "hgun_Rook40_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_01_F"],
	["arifle_MX_SW_F", "LMG_Mk200_F", "LMG_Zafir_F"],
	["arifle_SPAR_01_blk_F", "arifle_SPAR_01_khk_F", "arifle_SPAR_01_snd_F", "arifle_SPAR_01_GL_blk_F", "arifle_SPAR_01_GL_khk_F", "arifle_SPAR_01_GL_snd_F"],
	["arifle_CTAR_blk_F", "arifle_CTAR_GL_blk_F"],
	["arifle_ARX_blk_F", "arifle_ARX_hex_F", "arifle_ARX_ghex_F"],
	["arifle_AKS_F", "arifle_AKM_F", "arifle_AK12_F", "arifle_AK12_GL_F"],
	["arifle_MXM_F", "arifle_MXM_Black_F", "arifle_MXM_khk_F", "srifle_DMR_01_F", "srifle_EBR_F"],
	["srifle_DMR_07_blk_F", "srifle_DMR_07_hex_F", "srifle_DMR_07_ghex_F", "arifle_SPAR_03_blk_F", "arifle_SPAR_03_khk_F", "arifle_SPAR_03_snd_F"],
	["srifle_DMR_06_camo_F", "srifle_DMR_06_olive_F", "srifle_DMR_03_F", "srifle_DMR_03_multicam_F", "srifle_DMR_03_khaki_F", "srifle_DMR_03_tan_F", "srifle_DMR_03_woodland_F", "srifle_DMR_02_F", "srifle_DMR_02_camo_F", "srifle_DMR_02_sniper_F", "srifle_DMR_05_blk_F", "srifle_DMR_05_hex_F", "srifle_DMR_05_tan_f"],
	["srifle_DMR_04_F", "srifle_DMR_04_tan_F"],
	["arifle_MX_SW_F", "arifle_MX_SW_Black_F", "arifle_MX_SW_khk_F"],
	["arifle_SPAR_02_blk_F", "arifle_SPAR_02_khk_F", "arifle_SPAR_02_snd_F"],
	["arifle_CTARS_blk_F"],
	["LMG_03_F"],
	["SMG_01_F", "SMG_02_F", "hgun_PDW2000_F", "SMG_05_F"],
	["arifle_SDAR_F"],
	["arifle_TRG20_F", "arifle_TRG21_F", "arifle_TRG21_GL_F"],
	["arifle_Mk20C_F", "arifle_Mk20_F", "arifle_Mk20_GL_F", "arifle_Mk20C_plain_F", "arifle_Mk20_plain_F", "arifle_Mk20_GL_plain_F"],
	["arifle_Katiba_F", "arifle_Katiba_C_F", "arifle_Katiba_GL_F"],
	["arifle_MXC_F", "arifle_MX_F", "arifle_MX_GL_F", "arifle_MXM_F", "arifle_MXC_Black_F", "arifle_MXC_khk_F", "arifle_MX_Black_F", "arifle_MX_khk_F", "arifle_MX_GL_Black_F", "arifle_MX_GL_khk_F"],
	["srifle_EBR_F", "srifle_DMR_01_F"],
	["hgun_Pistol_01_F", "hgun_P07_F", "hgun_P07_khk_F", "hgun_Rook40_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_01_F"],
	["arifle_MX_SW_F", "LMG_Mk200_F", "LMG_Zafir_F"],
	["arifle_SPAR_01_blk_F", "arifle_SPAR_01_khk_F", "arifle_SPAR_01_snd_F", "arifle_SPAR_01_GL_blk_F", "arifle_SPAR_01_GL_khk_F", "arifle_SPAR_01_GL_snd_F"],
	["arifle_CTAR_blk_F", "arifle_CTAR_GL_blk_F"],
	["arifle_ARX_blk_F", "arifle_ARX_hex_F", "arifle_ARX_ghex_F"],
	["arifle_AKS_F", "arifle_AKM_F", "arifle_AK12_F", "arifle_AK12_GL_F"],
	["arifle_MXM_F", "arifle_MXM_Black_F", "arifle_MXM_khk_F", "srifle_DMR_01_F", "srifle_EBR_F"],
	["srifle_DMR_07_blk_F", "srifle_DMR_07_hex_F", "srifle_DMR_07_ghex_F", "arifle_SPAR_03_blk_F", "arifle_SPAR_03_khk_F", "arifle_SPAR_03_snd_F"],
	["srifle_DMR_06_camo_F", "srifle_DMR_06_olive_F", "srifle_DMR_03_F", "srifle_DMR_03_multicam_F", "srifle_DMR_03_khaki_F", "srifle_DMR_03_tan_F", "srifle_DMR_03_woodland_F", "srifle_DMR_02_F", "srifle_DMR_02_camo_F", "srifle_DMR_02_sniper_F", "srifle_DMR_05_blk_F", "srifle_DMR_05_hex_F", "srifle_DMR_05_tan_f"],
	["srifle_DMR_04_F", "srifle_DMR_04_tan_F"],
	["arifle_MX_SW_F", "arifle_MX_SW_Black_F", "arifle_MX_SW_khk_F"],
	["arifle_SPAR_02_blk_F", "arifle_SPAR_02_khk_F", "arifle_SPAR_02_snd_F"],
	["arifle_CTARS_blk_F"],
	["LMG_03_F"],
	["MMG_02_sand_F", "MMG_02_camo_F", "MMG_02_black_F", "MMG_01_tan_F", "MMG_01_hex_F"],
	["launch_RPG7_F","launch_RPG32_F", "launch_RPG32_ghex_F","launch_NLAW_F"]
	
];

vehicleAddition =
[
	["muzzle_snds_L"], // 9mm
	["muzzle_snds_M", "muzzle_snds_m_khk_F", "muzzle_snds_m_snd_F"], // 5.56mm
	["muzzle_snds_58_blk_F", "muzzle_snds_58_wdm_F"], // 5.8mm
	["muzzle_snds_H", "muzzle_snds_H", "muzzle_snds_H_khk_F", "muzzle_snds_H_snd_F"], // 6.5mm
	["muzzle_snds_H_MG", "muzzle_snds_H_MG_blk_F", "muzzle_snds_H_MG_khk_F"], // 6.5mm LMG
	["muzzle_snds_65_TI_blk_F", "muzzle_snds_65_TI_hex_F", "muzzle_snds_65_TI_ghex_F"], // Type 115
	["muzzle_snds_B", "muzzle_snds_B_khk_F", "muzzle_snds_B_snd_F"], // 7.62mm
	["muzzle_snds_338_black", "muzzle_snds_338_green", "muzzle_snds_338_sand"], //.338
	["muzzle_snds_93mmg", "muzzle_snds_93mmg_tan"], // 9.3mm
	["muzzle_snds_acp"], // .45 ACP
	["bipod_01_F_blk", "bipod_02_F_blk", "bipod_03_F_blk", "bipod_01_F_mtp", "bipod_02_F_hex", "bipod_03_F_oli", "bipod_01_F_snd", "bipod_02_F_tan", "bipod_01_F_khk"],
	["optic_Yorris"],
	["optic_MRD"],
	["optic_Arco", "optic_Arco_blk_F", "optic_Arco_ghex_F"],
	["optic_SOS"],
	["optic_Hamr", "optic_Hamr_khk_F"],
	["optic_Aco", "optic_ACO_grn", "optic_aco_smg", "optic_ACO_grn_smg", "optic_Aco_grn"],
	["optic_Holosight", "optic_Holosight_smg"],
	["optic_MRCO"],
	["optic_ERCO_blk_F", "optic_ERCO_khk_F", "optic_ERCO_snd_F"],
	["optic_SOS", "optic_SOS_khk_F"],
	["optic_DMS", "optic_DMS_ghex_F"],
	["optic_KHS_old", "optic_KHS_blk", "optic_KHS_hex", "optic_KHS_tan"],
	["optic_AMS", "optic_AMS_khk", "optic_AMS_snd"],
	["optic_LRPS", "optic_LRPS_ghex_F", "optic_LRPS_tna_F"],
	["optic_NVS"],
	["acc_flashlight", "acc_pointer_IR"],
	["MiniGrenade", "HandGrenade"]
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








