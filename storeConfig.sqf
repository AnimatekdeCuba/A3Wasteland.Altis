// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*********************************************************#
# @@ScriptName: storeConfig.sqf
# @@Author: His_Shadow,AgentRev
# @@Create Date: 2013-09-16 20:40:58
#*********************************************************/

// This tracks which store owner the client is interacting with
currentOwnerName = "";

// Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost

// empty name = name is extracted from class config

pistolArray = compileFinal str
[
	// Handguns
	["Starter Pistol",										"hgun_Pistol_Signal_F",														250,"HIDDEN"],
	["PM Pistol",											"hgun_Pistol_01_F",															250,"HIDDEN"],
	["P07 Pistol",											"hgun_P07_F",																500,"HIDDEN"],
	["P07 Pistol (Khaki)",									"hgun_P07_khk_F",															500,"HIDDEN"],
	["Rook-40 Pistol",										"hgun_Rook40_F",															500,"HIDDEN"],
	["ACP-C2 Pistol",										"hgun_ACPC2_F",																750,"HIDDEN"],
	["Zubr Revolver",										"hgun_Pistol_heavy_02_F",													750,"HIDDEN"],
	["4-Five Pistol",										"hgun_Pistol_heavy_01_F",													1000,"HIDDEN"],
	
	["PB 6P9",												"rhs_weap_pb_6p9",															300], // RHS
	["PM Makarov",											"rhs_weap_makarov_pm",														250], // RHS
	["Glock-17",											"rhsusf_weap_glock17g4",													500], // RHS
	["M9 Beretta",											"rhsusf_weap_m9",															550], // RHS
	["MP-443",												"rhs_weap_pya",																750], // RHS
	["TT-33",												"rhs_weap_tt33",															550], // RHS
	["M1911A1",												"rhsusf_weap_m1911a1",														550], // RHS
	["M320 GLM",                                            "rhs_weap_M320",                                                            1500] // RHS
];

smgArray = compileFinal str
[
	// RUSSIA
	["",				"rhs_weap_pp2000",						2000, "EAST"], 				// 9x19 / Con acesorios Plegable 
	["",				"rhs_weap_m3a1",						1600, "EAST", "HIDDEN"],	// .45 ACP / NO acesorios Plegable LOOT
	["",				"rhs_weap_m3a1_specops",				2100, "EAST"],				// .45 ACP / Con acesorios Plegable 
	["",				"rhs_weap_savz61",						1900, "EAST"],				// .45 ACP / NO acesorios Plegable  LOOT
	["",				"rhs_weap_scorpion",					1850, "EAST"],				// .45 ACP / NO acesorios Plegable 
	// USA
	["", 				"rhsusf_weap_MP7A2",					1500, "WEST"],				// RHS
	["", 				"rhsusf_weap_MP7A2_aor1",				1500, "WEST"],				// RHS
	["", 				"rhsusf_weap_MP7A2_desert",				1500, "WEST"],				// RHS
	["", 				"rhsusf_weap_MP7A2_winter",				1500, "WEST"]				// RHS
];

rifleArray = compileFinal str
[
	// Underwater Gun
	["",				"arifle_SDAR_F",						1000],
	// AK-103
	["",				"rhs_weap_ak103_1",						2500, "EAST"], // 7.62x39 / Tiro a Tiro
	["",				"rhs_weap_ak103_1_npz",					3000, "EAST"], // 7.62x39 / Tiro a Tiro / B-13
	["",				"rhs_weap_ak103_2",						3000, "EAST"], // 7.62x39 / Semi Auto 3 disparos
	["",				"rhs_weap_ak103_2_npz",					3500, "EAST"], // 7.62x39 / Semi Auto 3 disparos / B-13 
	["",				"rhs_weap_ak103",						4000, "EAST"], // 7.62x39 / full auto
	["",				"rhs_weap_ak103_npz",					4500, "EAST"], // 7.62x39 / B-13
	["",				"rhs_weap_ak103_gp25",					5800, "EAST"], // 7.62x39 / GP-25
	["",				"rhs_weap_ak103_gp25_npz",				6300, "EAST"], // 7.62x39 / GP-25 / B-13 
	["",				"rhs_weap_ak103_zenitco01",				4300, "EAST"], // 7.62x39 / Zenico
	["",				"rhs_weap_ak103_zenitco01_b33",			5000, "EAST"], // 7.62x39 / Zenico / B-33
	// AK-104
	["",				"rhs_weap_ak104",						4200, "EAST"], // 7.62x39 / Más ligera que el AK-103 / Cañón corto
	["",				"rhs_weap_ak104_npz",					4700, "EAST"], // 7.62x39 / B-13
	["",				"rhs_weap_ak104_zenitco01",				4700, "EAST"], // 7.62x39 / Zenico / Culata ligera
	["",				"rhs_weap_ak104_zenitco01_b33",			5200, "EAST"], // 7.62x39 / Zenico / B-33
	// AK-105
	["",				"rhs_weap_ak105",						4500, "EAST"], // 5.45x39 / Más Precisa que el AK-104 / Cañón corto
	["",				"rhs_weap_ak105_npz",					5000, "EAST"], // 5.45x39 / B-13
	["",				"rhs_weap_ak105_zenitco01",				5000, "EAST"], // 5.45x39 / Culata / Zenico
	["",				"rhs_weap_ak105_zenitco01_b33",			5300, "EAST"], // 5.45x39 / B-33 / Zenico
	// AK-74
	["",				"rhs_weap_ak74",						2500, "EAST"], // 5.45x39 / Más pesada que AK-105 / NO Accesorios LOOT
	["",				"rhs_weap_ak74_3",						2600, "EAST"], // 5.45x39 / Green
	["",				"rhs_weap_ak74_2",						2600, "EAST"], // 5.45x39 / Plum (madera)
	["",				"rhs_weap_ak74_gp25",					4300, "EAST"], // 5.45x39 / GP-25
	// AKS-74 (Plegable)
	["",				"rhs_weap_aks74",						2700, "EAST"], // 5.45x39 / una AK-74 Plegable / NO Accesorios LOOT
	["",				"rhs_weap_aks74_gp25",					4500, "EAST"], // 5.45x39 / 
	["",				"rhs_weap_aks74_2",						2800, "EAST"], // 5.45x39 / 
	// AK-74M
	["",				"rhs_weap_ak74m",						4300, "EAST"], // 5.45x39 / 
	["",				"rhs_weap_ak74m_npz",					4800, "EAST"], // 5.45x39 / B-13
	["",				"rhs_weap_ak74m_zenitco01",				4600, "EAST"], // 5.45x39 / Zenico
	["",				"rhs_weap_ak74m_zenitco01_b33",			5100, "EAST"], // 5.45x39 / Zenico / B-13
	["",				"rhs_weap_ak74mr",						5200, "EAST"], // 5.45x39 / Zenico / B-13 (UUK)
	["",				"rhs_weap_ak74mr_gp25",					7000, "EAST"], // 5.45x39 / Zenico / B-13 (UUK) + GP-25
	["",				"rhs_weap_ak74m_gp25",					6100, "EAST"], // 5.45x39 / GP-25
	["",				"rhs_weap_ak74m_fullplum",				4300, "EAST"], // 5.45x39 / 
	["",				"rhs_weap_ak74m_fullplum_npz",			4800, "EAST"], // 5.45x39 / B-13
	["",				"rhs_weap_ak74m_fullplum_gp25",			6100, "EAST"], // 5.45x39 / GP-25
	["",				"rhs_weap_ak74m_fullplum_gp25_npz",		6600, "EAST"], // 5.45x39 / GP-25 /B-13
	["",				"rhs_weap_ak74m_camo",					4300, "EAST"], // 5.45x39 / 
	["",				"rhs_weap_ak74m_desert",				4300, "EAST"], // 5.45x39 / 
	["",				"rhs_weap_ak74m_desert_npz",			4800, "EAST"], // 5.45x39 / B-13
	["",				"rhs_weap_ak74m_gp25_npz",				6600, "EAST"], // 5.45x39 / B-13 / GP-25
	// AK-74N
	["",				"rhs_weap_ak74n",						4200, "EAST"], // 5.45x39 /
	["",				"rhs_weap_ak74n_npz",					4700, "EAST"], // 5.45x39 / B-13
	["",				"rhs_weap_ak74n_gp25",					6000, "EAST"], // 5.45x39 / GP-25
	["",				"rhs_weap_ak74n_gp25_npz",				6500, "EAST"], // 5.45x39 / GP-25 /B-13
	["",				"rhs_weap_ak74n_2",						4200, "EAST"], // 5.45x39 / Plum
	["",				"rhs_weap_ak74n_2_npz",					4700, "EAST"], // 5.45x39 / B-13
	["",				"rhs_weap_ak74n_2_gp25",				6000, "EAST"], // 5.45x39 / GP-25
	["",				"rhs_weap_ak74n_2_gp25_npz",			6500, "EAST"], // 5.45x39 / GP-25 /B-13
	// AKS-74N (Plegable)
	["",				"rhs_weap_aks74n",						4400, "EAST"], // 5.45x39 / una AK-74N Plegable / 
	["",				"rhs_weap_aks74n_npz",					4900, "EAST"], // 5.45x39 / B-13
	["",				"rhs_weap_aks74n_gp25",					6200, "EAST"], // 5.45x39 / GP-25
	["",				"rhs_weap_aks74n_gp25_npz",				6700, "EAST"], // 5.45x39 / GP-25 B-13
	["",				"rhs_weap_aks74n_2",					4500, "EAST"], // 5.45x39 / Plum
	["",				"rhs_weap_aks74n_2_npz",				5000, "EAST"], // 5.45x39 / B-13
	// AKM
	["",				"rhs_weap_akm",							2500, "EAST"], // 7.62x39 / NO Accesorios LOOT
	["",				"rhs_weap_akm_gp25",					4300, "EAST"], // 7.62x39 / GP-25
	["",				"rhs_weap_akm_zenitco01_b33",			3300, "EAST"], // 7.62x39 / Zenico B-33
	// AKMS (Plegable)
	["",				"rhs_weap_akms",						2700, "EAST"], // 7.62x39 / NO Accesorios / Plegable LOOT
	["",				"rhs_weap_akms_gp25",					4500, "EAST"], // 7.62x39 / GP-25
	// AKMN
	["",				"rhs_weap_akmn",						3000, "EAST"], // 7.62x39 /
	["",				"rhs_weap_akmn_npz",					3500, "EAST"], // 7.62x39 / B-13
	["",				"rhs_weap_akmn_gp25",					4800, "EAST"], // 7.62x39 / GP-25
	["",				"rhs_weap_akmn_gp25_npz",				5300, "EAST"], // 7.62x39 / GP-25 B-13
	// VHS-D2 
	["",				"rhs_weap_vhsd2_ct15x",					4200, "EAST"], // 5.56x45 / NO Accesorios Mira propia
	["",				"rhs_weap_vhsd2_bg_ct15x",				6000, "EAST"], // 5.56x45 / NO Accesorios Mira propia / PG25 (equivalente)
	["",				"rhs_weap_vhsd2",						4500, "EAST"], // 5.56x45 / todos Accesorios
	["",				"rhs_weap_vhsd2_bg",					6300, "EAST"], // 5.56x45 / todos Accesorios / PG25 (equivalente)
	// VHS-K2 
	["",				"rhs_weap_vhsk2",						4100, "EAST"], // 5.56x45 / todos Accesorios cañón más corto
	// HK G36C 
	["",				"rhs_weap_g36kv",						4500, "EAST"], // 5.56x45 / todos Accesorios cañón más largo
	["",				"rhs_weap_g36kv_ag36",					6300, "EAST"], // 5.56x45 / todos Accesorios cañón más largo
	["",				"rhs_weap_g36c",						4200, "EAST"], // 5.56x45 / todos Accesorios cañón más corto
	// AKS-74U/UN 
	["",				"rhs_weap_aks74u",						2600, "EAST"], // 5.45x39 / NO Accesorios LOOT
	["",				"rhs_weap_aks74un",						2800, "EAST"], // 5.45x39 / Accesorios Rusos
	// M92
	["",				"rhs_weap_m92",							2800, "EAST"], // 7.62x39 / NO Accesorios LOOT
	// Sa vz. 58P/V
	["",				"rhs_weap_savz58p",						3000, "EAST"], // 7.62x39 / NO Accesorios LOOT
	["",				"rhs_weap_savz58p_black",				3000, "EAST"], // 7.62x39 / NO Accesorios LOOT
	["",				"rhs_weap_savz58p_rail",				3500, "EAST"], // 7.62x39 /  NPZ
	["",				"rhs_weap_savz58p_rail_black",			3500, "EAST"], // 7.62x39 /  NPZ
	["",				"rhs_weap_savz58v",						3200, "EAST"], // 7.62x39 /  NO Accesorios plegable LOOT
	["",				"rhs_weap_savz58v_black",				3200, "EAST"], // 7.62x39 /  NO Accesorios plegable LOOT
	["",				"rhs_weap_savz58v_rail",				3700, "EAST"], // 7.62x39 /  NPZ plegable 
	["",				"rhs_weap_savz58v_rail_black",			3700, "EAST"], // 7.62x39 /  NPZ plegable
	["",				"rhs_weap_savz58v_ris",					3900, "EAST"], // 7.62x39 /  NPZ plegable zenico
	// PM-63 (Idéntico a la AKM)
	["PM md. 63",		"rhs_weap_pm63",						2500, "EAST", "HIDDEN"], // 7.62x39 / NO Accesorios LOOT
	// M21A
	["",				"rhs_weap_m21a",						2700, "EAST"], // 5.56x45 / Accesorios Rusos
	["",				"rhs_weap_m21a_pr",						3200, "EAST"], // 5.56x45 / NPZ
	["",				"rhs_weap_m21a_pbg40",					4500, "EAST"], // 5.56x45 / NPZ GP-25
	["",				"rhs_weap_m21s",						2600, "EAST"], // 5.56x45 / Accesorios Rusos
	["",				"rhs_weap_m21s_pr",						3100, "EAST"], // 5.56x45 / NPZ
	["",				"rhs_weap_m21a_pr_pbg40",				5000, "EAST"], // 5.56x45 / NPZ / GP-25 / Culata
	// M70AB2/B1
	["",				"rhs_weap_m70ab2",						2900, "EAST"], // 5.56x45 / NO accesorios / Plegable LOOT
	["",				"rhs_weap_m70b1",						2700, "EAST"], // 5.56x45 / NO accesorios / rígida, más pesada LOOT
	// M70B3n
	["",				"rhs_weap_m70b3n",						3000, "EAST"], // 5.56x45 / accesorios rusos
	["",				"rhs_weap_m70b3n_pbg40",				4800, "EAST"], // 5.56x45 / accesorios rusos GP-25
	// M76
	["",				"rhs_weap_m76",							3500, "EAST"], // 7.9x57 / accesorios rusos / 
	["",				"rhs_weap_MP44",						3000, "EAST"], // 7.92x33 / NO accesorios / LOOT
	// ASVAL
	["",				"rhs_weap_asval",						3800, "EAST"], // 9x39 / Accesorios Rusos / Silenciador incluído
	["",				"rhs_weap_asval_npz",					4000, "EAST"], // 9x39 / B-13
	["",				"rhs_weap_asval_grip",					3900, "EAST"], // 9x39 / Grip
	["",				"rhs_weap_asval_grip_npz",				4100, "EAST"], // 9x39 / B-13 / Grip
	// IZh-18 12 Gauge
	["",				"rhs_weap_Izh18",						1500, "EAST"], // cal. 12 / Todos los accesorios
	["",				"rhs_weap_kar98k",						2000, "EAST", "HIDDEN"], // 7.92x57 / NO accesorios / 5rnd manual LOOT
	["",				"rhs_weap_m79",							4000, "EAST"], // 7.92x57 / NO accesorios / Lanzagranadas 40mm 1rnd 
	["",				"rhs_weap_m1garand_sa43",				1500, "EAST"], // .30 / NO accesorios / 8rnd Semi
	// USA
	["",										"rhs_weap_m32",						6500, "WEST"], // Lanzagranadas 6 rondas
	// HK416 D10
	["HK416 D10",								"rhs_weap_hk416d10",				3500, "WEST"], 
	["HK416 D10 (M320)",						"rhs_weap_hk416d10_m320",			5300, "WEST"], 
	["HK416 D10 (SOPMOD Stock)",				"rhs_weap_hk416d10_LMT",			3500, "WEST"], 
	["HK416 D10 (SOPMOD Stock/Desert)",			"rhs_weap_hk416d10_LMT_d",			3500, "WEST"], 
	["HK416 D10 (SOPMOD Stock/Woodland)",		"rhs_weap_hk416d10_LMT_wd",			3500, "WEST"], 
	// HK416 D14.5
	["HK416 D14.5",								"rhs_weap_hk416d145",				4300, "WEST"], 
	["HK416 D14.5 (Desert Grass)",				"rhs_weap_hk416d145_d",				4350, "WEST"], 
	["HK416 D14.5 (Desert Net)",				"rhs_weap_hk416d145_d_2",			4355, "WEST"], 
	["HK416 D14.5 (Woodland Grass)",			"rhs_weap_hk416d145_wd",			4350, "WEST"], 
	["HK416 D14.5 (Woodland Net)",				"rhs_weap_hk416d145_wd_2",			4355, "WEST"], 
	["HK416 D14.5 (M320)",						"rhs_weap_hk416d145_m320",			5600, "WEST"], 
	// M16A4
	["M16A4",									"rhs_weap_m16a4",					3000, "WEST"], 
	["M16A4 (Carryhandle)",						"rhs_weap_m16a4_carryhandle",		3050, "WEST"], 
	["M16A4 (Carryhandle/M320)",				"rhs_weap_m16a4_carryhandle_M203",	4800, "WEST"], 
	["M16A4 (Carryhandle/PMAG)",				"rhs_weap_m16a4_carryhandle_pmag",	3050, "WEST"], 
	["M16A4 (PMAG)",							"rhs_weap_m16a4_pmag",				3050, "WEST"],
	// M27 IAR
	["M27 IAR",									"rhs_weap_m27iar",					2566, "WEST"], 
	["M27 IAR (TD Grip)",						"rhs_weap_m27iar_grip",				2766, "WEST"], // viene con un asa delantera de fabrica
	// M4 
	["M4",										"rhs_weap_m4",						3700, "WEST"], // El M4 tira tiro a tiro (semi auto) y ráfaga de tres
	["M4 (Carryhandle)",						"rhs_weap_m4_carryhandle",			3750, "WEST"], 
	["M4 (Carryhandle/PMAG)",					"rhs_weap_m4_carryhandle_pmag",		3800, "WEST"], // PMAG = Magazine plástico
	["M4 (Carryhandle/PMAG/M-Stock)",			"rhs_weap_m4_carryhandle_mstock",	3850, "WEST"], // PMAG = Magazine plástico
	["M4 (M203)",								"rhs_weap_m4_m203",					5300, "WEST"], // 
	["M4 (M203S)",								"rhs_weap_m4_m203S",				5250, "WEST"], // tiene el anima del M203 mas corto ¿?
	["M4 (M320)",								"rhs_weap_m4_m320",					5500, "WEST"], // 
	["M4 (PMAG)",								"rhs_weap_m4_pmag",					3750, "WEST"], // 
	["M4 (PMAG/Magpull Stock)",					"rhs_weap_m4_mstock",				3750, "WEST"], // 
	// M4A1
	["M4A1",									"rhs_weap_m4a1_carryhandle",		3750, "WEST"], // el M4A1 tira semi auto y full auto
	["M4A1 (M203)",								"rhs_weap_m4a1_carryhandle_m203",	5300, "WEST"], // el M4A1 tira semi auto y full auto
	["M4A1 (M203S)",							"rhs_weap_m4a1_carryhandle_m203S",	5250, "WEST"], // el M4A1 tira semi auto y full auto
	["M4A1 (PMAG)",								"rhs_weap_m4a1_carryhandle_pmag",	3750, "WEST"], // el M4A1 tira semi auto y full auto
	["M4A1 (PMAG/Magpull Stock)",				"rhs_weap_m4a1_carryhandle_mstock",	3750, "WEST"], // Magpull Stock = Culata más ligera
	// M4A1 Block II
	["M4A1 Block II (Black)",					"rhs_weap_m4a1_blockII",			3750, "WEST"], // 
	["M4A1 Block II (Black/M203)",				"rhs_weap_m4a1_blockII_M203",		5300, "WEST"], // 
	["M4A1 Block II (Black/SOPMOD Stock)",		"rhs_weap_m4a1_blockII_KAC",		3750, "WEST"], // 
	["M4A1 Block II (Black Rail)",				"rhs_weap_m4a1_blockII_bk",			3750, "WEST"], // 
	["M4A1 Block II (Black Rail/M203)",			"rhs_weap_m4a1_blockII_M203_bk",	5300, "WEST"], // 
	["M4A1 Block II (Black Rail/SOPMOD Stock)",	"rhs_weap_m4a1_blockII_KAC_bk",		3750, "WEST"], // 
	["M4A1 Block II (Desert)",					"rhs_weap_m4a1_blockII_d",			3750, "WEST"], // 
	["M4A1 Block II (Desert/M203)",				"rhs_weap_m4a1_blockII_M203_d",		5300, "WEST"], // 
	["M4A1 Block II (Desert/SOPMOD Stock)",		"rhs_weap_m4a1_blockII_KAC_d",		3750, "WEST"], // 
	["M4A1 Block II (Woddland)",				"rhs_weap_m4a1_blockII_wd",			3750, "WEST"], // 
	["M4A1 Block II (Woddland/M203)",			"rhs_weap_m4a1_blockII_M203_wd",	5300, "WEST"], // 
	["M4A1 Block II (Woddland/SOPMOD Stock)",	"rhs_weap_m4a1_blockII_KAC_wd",		3750, "WEST"], // 
	// M4A1 PIP
	["M4A1 PIP", 								"rhs_weap_m4a1",					3750, "WEST"], // 
	["M4A1 PIP (Desert)", 						"rhs_weap_m4a1_d",					3750, "WEST"], // 
	["M4A1 PIP (Desert/M203)", 					"rhs_weap_m4a1_m203s_d",			5300, "WEST"], // 
	["M4A1 PIP (Desert/PMAG/Magpull Stock)",	"rhs_weap_m4a1_d_mstock",			3750, "WEST"], // 
	["M4A1 PIP (M203)", 						"rhs_weap_m4a1_m203",				5300, "WEST"], // 
	["M4A1 PIP (M203S)", 						"rhs_weap_m4a1_m203s",				5250, "WEST"], // 
	["M4A1 PIP (M320)", 						"rhs_weap_m4a1_m320",				5500, "WEST"], // 
	["M4A1 PIP (PMAG)", 						"rhs_weap_m4a1_pmag",				3750, "WEST"], // 
	["M4A1 PIP (PMAG/Magpull Stock)", 			"rhs_weap_m4a1_mstock",				3750, "WEST"], // 
	["M4A1 PIP (Woodland)", 					"rhs_weap_m4a1_wd",					3750, "WEST"], // 
	["M4A1 PIP (Woodland/M203S)", 				"rhs_weap_m4a1_m203s_wd",			5250, "WEST"], // 
	["M4A1 PIP (Woodland/PMAG/Magpull Stock)",	"rhs_weap_m4a1_wd_mstock",			3750, "WEST"], // 
	// Escopetas
	["590A1 (Long)", 							"rhs_weap_M590_8RD",				1500, "WEST"], //  Escopeta cañón largo 8Rondas bueno para loot
	["590A1 (Short)", 							"rhs_weap_M590_5RD",				1350, "WEST"], //  Escopeta cañón largo 5 Rondas
	// Mk 18
	["Mk 18 Mod 1",								"rhs_weap_mk18",					4600, "WEST"], // 
	["Mk 18 Mod 1 (Blak Rail)",					"rhs_weap_mk18_bk",					4600, "WEST"], // 
	["Mk 18 Mod 1 (Blak Rail/SOPMOD Stock)",	"rhs_weap_mk18_KAC_bk",				4600, "WEST"], // 
	["Mk 18 Mod 1 (Desert)", 					"rhs_weap_mk18_d",					4600, "WEST"], // 
	["Mk 18 Mod 1 (Desert/SOPMOD Stock)", 		"rhs_weap_mk18_KAC_d",				4600, "WEST"], // 
	["Mk 18 Mod 1 (M320)", 						"rhs_weap_mk18_m320",				6200, "WEST"], // 
	["Mk 18 Mod 1 (SOPMOD Stock)", 				"rhs_weap_mk18_KAC",				4600, "WEST"], // 
	["Mk 18 Mod 1 (Woodland)", 					"rhs_weap_mk18_wd",					4600, "WEST"], // 
	["Mk 18 Mod 1 (Woodland/SOPMOD Stock)",		"rhs_weap_mk18_KAC_wd",				4600, "WEST"], // 
	// Francotirador
	// RUSSIA
	// Mosin Nagant M38
	["",				"rhs_weap_m38",							1800,	"EAST", "HIDDEN"], // 7.62x54 / NO Accesorios / LOOT
	["",				"rhs_weap_m38_rail",					20500,	"EAST"], // 7.62x54 / NPZ /
	["",				"rhs_weap_mosin_sbr",					1600,	"EAST", "HIDDEN"], // 7.62x54 / NPZ / Recortado (menos alcance) LOOT
	// SVDM 
	["",				"rhs_weap_svdp",						25000, "EAST"], // 7.62x54 / Accesorios Rusos /
	["",				"rhs_weap_svdp_wd",						25200, "EAST"], // 7.62x54 / Accesorios Rusos / Camo
	["",				"rhs_weap_svdp_wd_npz",					25700, "EAST"], // 7.62x54 / NPZ / Camo
	["",				"rhs_weap_svdp_npz",					25500, "EAST"], // 7.62x54 / NPZ /
	// SVDS
	["",				"rhs_weap_svds",						25200, "EAST"], // 7.62x54 / 
	["",				"rhs_weap_svds_npz",					25700, "EAST"], // 7.62x54 / NPZ /
	// VSS Vintorez
	["",				"rhs_weap_vss",							18000, "EAST"], // 7.62x54 /
	["",				"rhs_weap_vss_npz",						18700, "EAST"], // 7.62x54 / NPZ /
	["",				"rhs_weap_vss_grip",					18500, "EAST"], // 7.62x54 / Grip /
	["",				"rhs_weap_vss_grip_npz",				19300, "EAST"], // 7.62x54 / NPZ / Grip
	// T-5000 
	["",				"rhs_weap_t5000",						120000, "EAST"], // .338 / Todos los accesorios
	// USA
	// M107
	["M107",									"rhs_weap_M107",					150000, "WEST"], // muy cabrón! Cal .50
	["M107 (Desert)",							"rhs_weap_M107_d",					150000, "WEST"], // muy cabrón! Cal .50
	["M107 (Woddland)",							"rhs_weap_M107_w",					150000, "WEST"], // muy cabrón! Cal .50
	// M14
	["M14 EBR-RI",								"rhs_weap_m14ebrri",				25000, "WEST"], // 7.62 semiauto
	// M2010 ESR
	["M2010 ESR",								"rhs_weap_XM2010",					35000, "WEST"], // cal .300 Manual
	["M2010 ESR (Camo)",						"rhs_weap_XM2010_wd",				35000, "WEST"], // cal .300 Manual
	["M2010 ESR (Desert)",						"rhs_weap_XM2010_d",				35000, "WEST"], // cal .300 Manual
	["M2010 ESR (Semi-arid)",					"rhs_weap_XM2010_sa",				35000, "WEST"], // cal .300 Manual
	// M24 SWS
	["M24 SWS",									"rhs_weap_m24sws",					23000, "WEST"], // cal 7.62 Manual ideal para loot
	["M24 SWS (Black)",							"rhs_weap_m24sws_blk",				23000, "WEST"], // cal 7.62 Manual ideal para loot
	["M24 SWS (Guillie)",						"rhs_weap_m24sws_ghillie",			25000, "WEST"], // cal 7.62 Manual ideal para loot
	// M40A5 
	["M40A5",									"rhs_weap_m40a5",					38500, "WEST"], // cal 7.62 Manual
	["M40A5 (Desert)",							"rhs_weap_m40a5_d",					38500, "WEST"], // cal 7.62 Manual
	["M40A5 (Woodland)",						"rhs_weap_m40a5_wd",				38500, "WEST"], // cal 7.62 Manual
	// Mk 11
	["Mk 11 Mod 0",								"rhs_weap_sr25",					26530, "WEST"], // cal 7.62 Manual semi auto
	["Mk 11 Mod 0 (Woodland)",					"rhs_weap_sr25_wd",					26530, "WEST"], // cal 7.62 Manual semi auto
	["Mk 11 Mod 0 (Desert)",					"rhs_weap_sr25_d",					26530, "WEST"], // cal 7.62 Manual semi auto
	["Mk 11 Mod 0 (EC)",						"rhs_weap_sr25_ec",					26630, "WEST"], // cal 7.62 Manual semi auto
	["Mk 11 Mod 0 (EC/Desert)",					"rhs_weap_sr25_ec_d",				26630, "WEST"], // cal 7.62 Manual semi auto
	["Mk 11 Mod 0 (EC/Woodland)",				"rhs_weap_sr25_ec_wd",				26630, "WEST"], // cal 7.62 Manual semi auto
	
	// Vanilla
	["Mk20 Carbine",														"arifle_Mk20C_plain_F",														150,"HIDDEN"],
	["Mk20 Carbine (Camo)",													"arifle_Mk20C_F",															150,"HIDDEN"],
	["Mk20 Rifle",															"arifle_Mk20_plain_F",														200,"HIDDEN"],
	["Mk20 Rifle (Camo)",													"arifle_Mk20_F",															200,"HIDDEN"],
	["Mk20 EGLM Rifle",														"arifle_Mk20_GL_plain_F",													250,"HIDDEN"],
	["Mk20 EGLM Rifle (Camo)",												"arifle_Mk20_GL_F",															250,"HIDDEN"],

	["TRG-20 Carbine",														"arifle_TRG20_F",															150,"HIDDEN"],
	["TRG-21 Rifle ",														"arifle_TRG21_F",															200,"HIDDEN"],
	["TRG-21 EGLM Rifle",													"arifle_TRG21_GL_F",														250,"HIDDEN"],

	["Katiba Carbine",														"arifle_Katiba_C_F",														150,"HIDDEN"],
	["Katiba Rifle",														"arifle_Katiba_F",															200,"HIDDEN"],
	["Katiba GL Rifle",														"arifle_Katiba_GL_F",														250,"HIDDEN"],

	["MX Carbine",															"arifle_MXC_F",																150,"HIDDEN"],
	["MX Carbine (Black)",													"arifle_MXC_Black_F",														150,"HIDDEN"],
	["MX Carbine (Khaki)",													"arifle_MXC_khk_F",															150,					"noDLC","HIDDEN"],
	["MX Rifle",															"arifle_MX_F",																200,"HIDDEN"],
	["MX Rifle (Black)",													"arifle_MX_Black_F",														200,"HIDDEN"],
	["MX Rifle (Khaki)",													"arifle_MX_khk_F",															200,					"noDLC","HIDDEN"],
	["MX 3GL Rifle",														"arifle_MX_GL_F",															250,"HIDDEN"],
	["MX 3GL Rifle (Black)",												"arifle_MX_GL_Black_F",														250,"HIDDEN"],
	["MX 3GL Rifle (Khaki)",												"arifle_MX_GL_khk_F",														250,					"noDLC","HIDDEN"],

	["SPAR-16 Rifle",														"arifle_SPAR_01_blk_F",														200,"HIDDEN"],
	["SPAR-16 Rifle (Khaki)",												"arifle_SPAR_01_khk_F",														200,"HIDDEN"],
	["SPAR-16 Rifle (Sand)",												"arifle_SPAR_01_snd_F",														200,"HIDDEN"],
	["SPAR-16 GL Rifle",													"arifle_SPAR_01_GL_blk_F",													250,"HIDDEN"],
	["SPAR-16 GL Rifle (Khaki)",											"arifle_SPAR_01_GL_khk_F",													250,"HIDDEN"],
	["SPAR-16 GL Rifle (Sand)",												"arifle_SPAR_01_GL_snd_F",													250,"HIDDEN"],

	["CAR-95 Rifle",														"arifle_CTAR_blk_F",														200,"HIDDEN"],
	["CAR-95 Rifle (Hex)",													"arifle_CTAR_hex_F",														200,"HIDDEN"],
	["CAR-95 Rifle (G Hex)",												"arifle_CTAR_ghex_F",														200,"HIDDEN"],
	["CAR-95 GL Rifle",														"arifle_CTAR_GL_blk_F",														250,"HIDDEN"],
	["CAR-95 GL Rifle (Hex)",												"arifle_CTAR_GL_hex_F",														250,"HIDDEN"],
	["CAR-95 GL Rifle (G Hex)",												"arifle_CTAR_GL_ghex_F",													250,"HIDDEN"],


	["Type 115 Rifle",														"arifle_ARX_blk_F",															300,"HIDDEN"],
	["Type 115 Rifle (Hex)",												"arifle_ARX_hex_F",															300,"HIDDEN"],
	["Type 115 Rifle (G Hex)",												"arifle_ARX_ghex_F",														300,"HIDDEN"],

	["AKS-74U Carbine",														"arifle_AKS_F",																150,"HIDDEN"],
	["AKM Rifle",															"arifle_AKM_F",																200,"HIDDEN"],
	["AK-12 Rifle",															"arifle_AK12_F",															250,"HIDDEN"],
	["AK-12 GL Rifle",														"arifle_AK12_GL_F",															300,"HIDDEN"],

	// Marksman Rifles
	["MXM Rifle",															"arifle_MXM_F",																300,"HIDDEN"],
	["MXM Rifle (Black)",													"arifle_MXM_Black_F",														300,"HIDDEN"],
	["MXM Rifle (Khaki)",													"arifle_MXM_khk_F",															300,					"noDLC","HIDDEN"],
	["Rahim DMR Rifle",														"srifle_DMR_01_F",															375,"HIDDEN"],
	["Mk18 ABR Rifle",														"srifle_EBR_F",																450,"HIDDEN"],

	// DLC
	["CMR-76 Rifle",														"srifle_DMR_07_blk_F",														400,"HIDDEN"],
	["CMR-76 Rifle (Hex)",													"srifle_DMR_07_hex_F",														400,"HIDDEN"],
	["CMR-76 Rifle (G Hex)",												"srifle_DMR_07_ghex_F",														400,"HIDDEN"],
	["SPAR-17 Rifle",														"arifle_SPAR_03_blk_F",														450,"HIDDEN"],
	["SPAR-17 Rifle (Khaki)",												"arifle_SPAR_03_khk_F",														450,"HIDDEN"],
	["SPAR-17 Rifle (Sand)",												"arifle_SPAR_03_snd_F",														450,"HIDDEN"],

	["Mk14 Rifle (Camo)",													"srifle_DMR_06_camo_F",														500,"HIDDEN"],
	["Mk14 Rifle (Olive)",													"srifle_DMR_06_olive_F",													500,"HIDDEN"],
	["Mk-I EMR Rifle",														"srifle_DMR_03_F",															500,"HIDDEN"],
	["Mk-I EMR Rifle (Camo)",												"srifle_DMR_03_multicam_F",													500,"HIDDEN"],
	["Mk-I EMR Rifle (Khaki)",												"srifle_DMR_03_khaki_F",													500,"HIDDEN"],
	["Mk-I EMR Rifle (Sand)",												"srifle_DMR_03_tan_F",														500,"HIDDEN"],
	["Mk-I EMR Rifle (Woodland)",											"srifle_DMR_03_woodland_F",													500,"HIDDEN"],
	["MAR-10 Rifle",														"srifle_DMR_02_F",															750,"HIDDEN"],
	["MAR-10 Rifle (Camo)",													"srifle_DMR_02_camo_F",														750,"HIDDEN"],
	["MAR-10 Rifle (Sand)",													"srifle_DMR_02_sniper_F",													750,"HIDDEN"],
	["Cyrus Rifle",															"srifle_DMR_05_blk_F",														750,"HIDDEN"],
	["Cyrus Rifle (Hex)",													"srifle_DMR_05_hex_F",														750,"HIDDEN"],
	["Cyrus Rifle (Tan)",													"srifle_DMR_05_tan_f",														750,"HIDDEN"],

	// Sniper Rifles
	["M320 LRR Sniper",														"srifle_LRR_LRPS_F",														1000,"HIDDEN"],
	["M320 LRR Sniper (Camo)",												"srifle_LRR_camo_LRPS_F",													1200,"HIDDEN"],
	["M320 LRR Sniper (Tropic)",											"srifle_LRR_tna_LRPS_F",													1200,"HIDDEN"],
	["GM6 Lynx Sniper",														"srifle_GM6_LRPS_F",														1250,"HIDDEN"],
	["GM6 Lynx Sniper (Camo)",												"srifle_GM6_camo_LRPS_F",													1500,"HIDDEN"],
	["GM6 Lynx Sniper (G Hex)",												"srifle_GM6_ghex_LRPS_F",													1500,"HIDDEN"],

	["ASP-1 Kir Rifle",														"srifle_DMR_04_F",															2000,"HIDDEN"],
	["ASP-1 Kir Rifle (Tan)",												"srifle_DMR_04_tan_F",														2000,"HIDDEN"]
];

lmgArray = compileFinal str
[
	// RUSSIA
	// PKM 
	["",				"rhs_weap_pkm",							20000, "EAST"], // 7.62x54 / NO Accesorios /
	// PKP 
	["",				"rhs_weap_pkp",							21000, "EAST"], // 7.62x54 / Accesorios Rusos /
	// MG42 
	["",				"rhs_weap_mg42",						25000, "EAST"], // 7.92x57 / NO Accesorios  /
	// M84
	["",				"rhs_weap_m84",							22000, "EAST"], // 7.62x54 / NO Accesorios /
	// FN Minimi
	["",				"rhs_weap_minimi_para_railed",			35000, "EAST"], // 7.62x54 / Todos Accesorios /
	// USA
	["M240B",																"rhs_weap_m240B",															20000, "WEST"], // 7.62 x 51mm
	["M240B (CAP)",															"rhs_weap_m240B_CAP",														20700, "WEST"], // 7.62 x 51mm
	["M240G",																"rhs_weap_m240G",															20500, "WEST"], // 7.62 x 51mm
	["M249",																"rhs_weap_m249",															30000, "WEST"], // 7.62 x 51mm SIN accesorios  idela para loot mas ligera, mas precision
	["M249 PIP (Solid Stock)",												"rhs_weap_m249_pip",														30300, "WEST"], // 7.62 x 51mm  idela para loot mas ligera, mas precision
	["M249 PIP (Long)",														"rhs_weap_m249_pip_L",														32000, "WEST"], // 7.62 x 51mm mas ligera, mas precision cañon largo
	["M249 PIP (Long/Para)",												"rhs_weap_m249_pip_L_para",													32500, "WEST"], // 7.62 x 51mm mas ligera, mas precision Para = culata ligera
	["M249 PIP (Long/VFG)",													"rhs_weap_m249_pip_L_vfg",													32800, "WEST"], // 7.62 x 51mm mas ligera, mas precision VFG = se pueden poder handles y asas
	["M249 PIP (Short)",													"rhs_weap_m249_pip_S",														32000, "WEST"], // 7.62 x 51mm mas ligera, mas precision cañon corto
	["M249 PIP (Short/Para)",												"rhs_weap_m249_pip_S_para",													32500, "WEST"], // 7.62 x 51mm mas ligera, mas precision cañon corto/Para
	["M249 PIP (Short/VFG)",												"rhs_weap_m249_pip_S_vfg",													32800, "WEST"], // 7.62 x 51mm mas ligera, mas precision cañon corto/VFG = se pueden poder handles y asas
	// Vanilla
	["MX SW LMG",															"arifle_MX_SW_F",															300,"HIDDEN"],
	["MX SW LMG (Black)",													"arifle_MX_SW_Black_F",														325,"HIDDEN"],
	["MX SW LMG (Khaki)",													"arifle_MX_SW_khk_F",														325,					"noDLC","HIDDEN"],
	["Mk200 LMG",															"LMG_Mk200_F",																400,"HIDDEN"],
	["Zafir LMG",															"LMG_Zafir_F",																500,"HIDDEN"],

	["SPAR-16S LMG",														"arifle_SPAR_02_blk_F",														300,"HIDDEN"],
	["SPAR-16S LMG (Khaki)",												"arifle_SPAR_02_khk_F",														300,"HIDDEN"],
	["SPAR-16S LMG (Sand)",													"arifle_SPAR_02_snd_F",														300,"HIDDEN"],
	["CAR-95-1 LMG",														"arifle_CTARS_blk_F",														300,"HIDDEN"],
	["CAR-95-1 LMG (Hex)",													"arifle_CTARS_hex_F",														300,"HIDDEN"],
	["CAR-95-1 LMG (G Hex)",												"arifle_CTARS_ghex_F",														300,"HIDDEN"],
	["LIM-85 LMG",															"LMG_03_F",																	350,"HIDDEN"],

	["SPMG MMG (Sand)",														"MMG_02_sand_F",															1500,"HIDDEN"],
	["SPMG MMG (MTP)",														"MMG_02_camo_F",															1500,"HIDDEN"],
	["SPMG MMG (Black)",													"MMG_02_black_F",															1500,"HIDDEN"],
	["Navid MMG (Tan)",														"MMG_01_tan_F",																2500,"HIDDEN"],
	["Navid MMG (Hex)",														"MMG_01_hex_F",																2500,"HIDDEN"]
];

launcherArray = compileFinal str
[
	["RPG-7",																"launch_RPG7_F",															700,"HIDDEN"],
	["RPG-42 Alamut",														"launch_RPG32_F",															800,"HIDDEN"],
	["RPG-42 Alamut (G Hex)",												"launch_RPG32_ghex_F",														800,					"noDLC","HIDDEN"],
	
	["Titan MPRL Compact (Sand)",											"launch_Titan_short_F",														4500,"HIDDEN"],
	["Titan MPRL Compact (Coyote)",											"launch_O_Titan_short_F",													4500,"HIDDEN"],
	["Titan MPRL Compact (Olive)",											"launch_I_Titan_short_F",													4500,"HIDDEN"],
	["Titan MPRL Compact (Tropic)",											"launch_B_Titan_short_tna_F",												4500,					"noDLC","HIDDEN"],
	["Titan MPRL Compact (G Hex)",											"launch_O_Titan_short_ghex_F",												4500,					"noDLC","HIDDEN"],
	["Titan MPRL AA (Sand)",												"launch_Titan_F",															5600,"HIDDEN"],
	["Titan MPRL AA (Hex)",													"launch_O_Titan_F",															5600,"HIDDEN"],
	["Titan MPRL AA (Digi)",												"launch_I_Titan_F",															5600,"HIDDEN"],
	["Titan MPRL AA (Tropic)",												"launch_B_Titan_tna_F",														5600,					"noDLC","HIDDEN"],
	["Titan MPRL AA (G Hex)",												"launch_O_Titan_ghex_F",													5600,					"noDLC","HIDDEN"],
	["MAAWS Mk4 Mod 0 (Green)", 											"launch_MRAWS_green_rail_F",												600, "noDLC"], // RPG-42 and MAAWS are similar, but MAAWS has longer range
	["MAAWS Mk4 Mod 0 (Olive)", 											"launch_MRAWS_olive_rail_F", 												600, "noDLC"],
	["MAAWS Mk4 Mod 0 (Sand)",  											"launch_MRAWS_sand_rail_F", 												600, "noDLC"],
	["MAAWS Mk4 Mod 1 (Green)",  											"launch_MRAWS_green_F", 													950, "noDLC"], // MAAWS Mod 1 has nightvision and laser rangefinder, while Mod 0 doesn't
	["MAAWS Mk4 Mod 1 (Olive)",  											"launch_MRAWS_olive_F", 													950, "noDLC"],
	["MAAWS Mk4 Mod 1 (Sand)",  											"launch_MRAWS_sand_F", 														950, "noDLC"],
	["9M135 Vorona (Brown)",  												"launch_O_Vorona_brown_F", 													2000, "noDLC"],
	["9M135 Vorona (Green)",  												"launch_O_Vorona_green_F", 													2000, "noDLC"],
	["M136 HEAT",                                                           "rhs_weap_M136",                                                            2000], // RHS
	["M136 HEDP",                                                           "rhs_weap_M136_hedp",                                                       1700], // RHS
	["M136 HP",                                                             "rhs_weap_M136_hp",                                                         1500], // RHS
	["M3 MAAWS",                                                            "rhs_weap_maaws",                                                           4000], // RHS
	["MK153 SMAW (Verde)",                                                  "rhs_weap_smaw",                                                 			4500], // RHS
	["MK153 SMAW (Negro)",                                                  "rhs_weap_smaw",                                                  			4500], // RHS
	["M72A7",                                                               "rhs_weap_m72a7",                                                           500], // RHS
	["RPG-26",                                                              "rhs_weap_rpg26",                                                           500], // RHS
	["RShG-2",                                                              "rhs_weap_rshg2",                                                           500], // RHS
	["RPG-7V2",                                                             "rhs_weap_rpg7",                                                            800], // RHS
	["NLAW",																"launch_NLAW_F",															5200],
	["Javelin",                                                             "rhs_weap_fgm148",                                                         10000], // RHS
	["9K38 Igla",                                                           "rhs_weap_igla",                                                           12000], // RHS              
	["FIN-92F",                                                             "rhs_weap_fim92",                                                          12500] // RHS

];

allGunStoreFirearms = compileFinal str (call pistolArray + call smgArray + call rifleArray + call lmgArray + call launcherArray);

staticGunsArray = compileFinal str
[	
	["Vehicle Ammo Crate (NATO)",											"Box_NATO_AmmoVeh_F",														100000],
	["Vehicle Ammo Crate (NATO)",											"Box_EAST_AmmoVeh_F",														100000],
	["Vehicle Ammo Crate (AAF)",											"Box_IND_AmmoVeh_F",														100000],
	["Ammo Container",														"B_Slingload_01_Ammo_F",													1000000],
	["Explosives Crate(Empty)",												"Box_NATO_AmmoOrd_F",														100],
	["Ammo Crate (Empty)",													"Box_NATO_Ammo_F",															100],
	["Granade Crate (Empty)",												"Box_NATO_Grenades_F",														100],
	["Launcher Crate (Empty)",												"Box_NATO_WpsLaunch_F",														100],
	["Special Weapon Crate (Empty)",										"Box_NATO_WpsSpecial_F",													100],
	["Weapon Crate (Empty)",												"Box_NATO_Wps_F",															100],
	["Static Titan AT 4Rnd (NATO)",											"B_static_AT_F",															20000,"HIDDEN"],
	["Static Titan AT 4Rnd (CSAT)",											"O_static_AT_F",															20000,"HIDDEN"],
	["Static Titan AT 4Rnd (AAF)",											"I_static_AT_F",															20000,"HIDDEN"],
	["Static Titan AA 4Rnd (NATO)",											"B_static_AA_F",															25000,"HIDDEN"],
	["Static Titan AA 4Rnd (CSAT)",											"O_static_AA_F",															25000,"HIDDEN"],
	["Static Titan AA 4Rnd (AAF)",											"I_static_AA_F",															25000,"HIDDEN"],
	["Mk30 HMG .50 Low tripod (NATO)",										"B_HMG_01_F",																2000,"HIDDEN"],
	["Mk30 HMG .50 Low tripod (CSAT)",										"O_HMG_01_F",																2000,"HIDDEN"],
	["Mk30 HMG .50 Low tripod (AAF)",										"I_HMG_01_F",																2000,"HIDDEN"],
	["Mk30 HMG .50 High tripod (NATO)",										"B_HMG_01_high_F",															3000,"HIDDEN"],
	["Mk30 HMG .50 High tripod (CSAT)",										"O_HMG_01_high_F",															3000,"HIDDEN"],
	["Mk30 HMG .50 High tripod (AAF)",										"I_HMG_01_high_F",															3000,"HIDDEN"],
	["Mk32 GMG 20mm Low tripod (NATO)",										"B_GMG_01_F",																5000,"HIDDEN"],
	["Mk32 GMG 20mm Low tripod (CSAT)",										"O_GMG_01_F",																5000,"HIDDEN"],
	["Mk32 GMG 20mm Low tripod (AAF)",										"I_GMG_01_F",																5000,"HIDDEN"],
	["Mk32 GMG 20mm High tripod (NATO)",									"B_GMG_01_high_F",															6000,"HIDDEN"],
	["Mk32 GMG 20mm High tripod (CSAT)",									"O_GMG_01_high_F",															6000,"HIDDEN"],
	["Mk32 GMG 20mm High tripod (AAF)",										"I_GMG_01_high_F",															6000,"HIDDEN"],
	["Mk6 Mortar (NATO)",													"B_Mortar_01_F",															25000],
	["Mk6 Mortar (CSAT)",													"O_Mortar_01_F",															25000],
	["Mk6 Mortar (AAF)",													"I_Mortar_01_F",															25000],
	
	["9K133-1 'Kornet-M'",													"rhs_Kornet_9M133_2_vdv",													17500], // RHS
	["9K115-2 'Metis-M'",													"rhs_Metis_9k115_2_msv",													17500], // RHS
	["9K38 'Djigit'",														"rhs_Igla_AA_pod_msv",														10000], // RHS
	["FIM-92F (DMS)",                                                      	"RHS_Stinger_AA_pod_D",                                                     10000], // RHS
	["M252",																"RHS_M252_USMC_WD",															25000], // RHS
	["M119",                                          						"RHS_M119_D",                                              					3500], // RHS
	["M2 Static .50 Low tripod",                                            "RHS_M2StaticMG_MiniTripod_W",                                              3500], // RHS
	["M2 Static .50 High tripod",                                           "RHS_M2StaticMG_W",                                                         3500], // RHS
	["KORD 12.7mm Low tripod",                                              "rhs_KORD_MSV",                                                             3500], // RHS
	["KORD 12.7mm High tripod",                                             "rhs_KORD_high_MSV",                                                        3500], // RHS
	["MK19 Static Low tripod",                                              "RHS_MK19_TriPod_W",                                                        5500], // RHS
	["AGS30 Static Low tripod",                                             "RHS_AGS30_TriPod_MSV",                                                     5500], // RHS
	["SPG9M Static",                                                        "rhs_SPG9M_MSV",                                                            8000], // RHS
	["M41A4 TOW",                                               			"RHS_TOW_TriPod_D",                                                         17500] // RHS
];

throwputArray = compileFinal str
[
	["",																	"ACE_1Rnd_82mm_Mo_HE",														1000], // ACE
	["",																	"ACE_1Rnd_82mm_Mo_Smoke",													50], // ACE
	["",																	"ACE_1Rnd_82mm_Mo_Illum",													100], // ACE
	["",																	"ACE_1Rnd_82mm_Mo_HE_Guided",												2000], // ACE
	["",																	"ACE_1Rnd_82mm_Mo_HE_LaserGuided",											2000], // ACE
	["Bengalas de Mano - Luz Blanca", 										"ACE_HandFlare_White", 														50], // ACE
	["Bengalas de Mano - Luz Roja", 										"ACE_HandFlare_Red", 														50], // ACE
	["Bengalas de Mano - Luz Verde", 										"ACE_HandFlare_Green", 														50], // ACE
	["Bengalas de Mano - Luz Amarilla", 									"ACE_HandFlare_Yellow", 													50], // ACE
	["", 																	"ACE_M84", 																	75], // ACE
	["", 																	"ACE_M14", 																	75], // ACE
	["RGN Impact Frag Grenade",                                             "rhs_mag_rgn",                                                              95], // RHS
	["RGO Frag Grenade",                                            		"rhs_mag_rgo",                                                              100], // RHS
	["F-1 Frag Grenade",                                                    "rhs_mag_f1",                                                               100], // RHS
	["M-67 Frag Grenade",                                                   "rhs_mag_m67",                                                              100], // RHS
	["RGD-5 Frag Grenade",                                                  "rhs_mag_rgd5",                                                             100], // RHS
	["RKG-3M Anti-Tank Grenade",                                            "rhsgref_mag_rkg3em",                                                       400], // RHS
	["M7A3 CS Gas",                                                         "rhs_mag_m7a3_cs",                                                          75], // RHS
	["MK3A2 Concussion",                                                    "rhs_mag_mk3a2",                                                            75], // RHS
	["Fakel Granada aturdidora",                                            "rhs_mag_fakel",                                                            75], // RHS
	["Plamya-M Granada aturdidora",                                         "rhs_mag_plamyam",                                                          75], // RHS
	["Zarya-2 Granada aturdidora",                                          "rhs_mag_zarya2",                                                           75], // RHS
	// ["Carga M112",														"rhsusf_m112_mag",															2500], // RHS No funciona con ACE
	// ["Carga M112 x4",													"rhsusf_m112x4_mag",														5000], // RHS No funciona con ACE
	["Mina M14 AP",															"rhsusf_mine_m14_mag",														1150], // RHS
	["Mina M19 AT",															"rhs_mine_M19_mag",															2500], // RHS
	["MRUD (3m)",															"rhssaf_mine_mrud_a_mag",													750], // RHS
	["MRUD (6m)",															"rhssaf_mine_mrud_b_mag",													850], // RHS
	["MRUD (10m)",															"rhssaf_mine_mrud_c_mag",													950], // RHS
	// ["MRUD (Remote)",													"rhssaf_mine_mrud_d_mag",													250], // RHS No funciona con ACE
	["PMF-1",																"rhs_mag_mine_pfm1",														950], // RHS
	["PMA-3",																"rhssaf_mine_pma3_mag",														950], // RHS
	["PMN-2",																"rhs_mine_pmn2_mag",														950], // RHS
	["PTM-1 Mina AP",														"rhs_mag_mine_ptm1",														550], // RHS
	["TM-62M Mina AT",														"rhs_mine_tm62m_mag",														2550], // RHS
	["TM-62M Mina AT",														"rhssaf_mine_tma4_mag",														2550], // RHS
	["Mina Flare Señuelo",													"ACE_FlareTripMine_Mag",													100], // ACE
	["Mina de Entrenamiento",												"TrainingMine_Mag",															10],
	["APERS Bounding Mine",													"APERSBoundingMine_Range_Mag",												250],
	["APERS Dispenser",														"APERSMineDispenser_Mag",													15000],
	["APERS Mine",															"APERSMine_Range_Mag",														300],
	["APERS Tripwire Mine",													"APERSTripMine_Wire_Mag",													200],
	["AT Mine",																"ATMine_Range_Mag",															2250],
	["Claymore Charge",														"ClaymoreDirectionalMine_Remote_Mag",										1050],
	["Explosive Charge",													"DemoCharge_Remote_Mag",													1250],
	["Explosive Satchel",													"SatchelCharge_Remote_Mag",													1500],
	["M6 SLAM Mine",														"SLAMDirectionalMine_Wire_Mag",												1350],
	["RGN Mini Grenade",													"MiniGrenade",																50],
	["RGO Frag Grenade",													"HandGrenade",																100],
	["IED pequeño (tierra)",												"IEDLandSmall_Remote_Mag",													1250],
	["IED pequeño (urbano)",												"IEDUrbanSmall_Remote_Mag",													1250],
	["IED grande (tierra)",													"IEDLandBig_Remote_Mag",													2500],
	["IED grande (urbano)",													"IEDUrbanBig_Remote_Mag",													2500],
	
	["RGD-2 (Blanco)",                                             			"rhs_mag_rdg2_white",                                                       80], // RHS
	["RGD-2 (Negro)",                                             			"rhs_mag_rdg2_black",                                                      	80], // RHS
	["NSP-D (Amarillo)",                                           			"rhs_mag_nspn_yellow",                                                     	60], // RHS
	["NSP-D (Rojo)",                                             			"rhs_mag_nspn_red",                                                         60], // RHS
	["NSP-D (Verde)",                                             			"rhs_mag_nspn_green",                                                       60], // RHS
	["NSP-D (Blanco)",                                             			"rhs_mag_nspd",                                                             60] // RHS
];

//Gun Store Ammo List
//Text name,classname,buy cost
ammoArray = compileFinal str
[
	// Testeo
	["",	"ACE_40mm_Flare_ir", 										00],
	["",	"ACE_40mm_Flare_white", 									00],
	["",	"ACE_10Rnd_338_300gr_HPBT_Mag", 							00],
	["",	"ACE_10Rnd_338_API526_Mag", 								00],
	["",	"ACE_130Rnd_338_Mag_green", 								00],
	["",	"ACE_130Rnd_338_Mag_yellow", 								00],
	["",	"ACE_7Rnd_408_305gr_Mag", 									00],
	["",	"ACE_5Rnd_127x99_Mag", 				 						00],
	["",	"ACE_5Rnd_127x99_AMAX_Mag", 				 				00],
	["",	"ACE_5Rnd_127x99_API_Mag", 				 					00],
	["",	"ACE_150Rnd_556x45_Drum_green", 							00],
	["",	"ACE_150Rnd_556x45_Drum_yellow", 							00],
	["",	"ACE_150Rnd_556x45_Drum_tracer_green", 						00],
	["",	"ACE_150Rnd_556x45_Drum_tracer_yellow", 					00],
	["",	"ACE_200Rnd_556x45_Box_green", 								00],
	["",	"ACE_200Rnd_556x45_Box_tracer_green", 						00],
	["",	"ACE_30Rnd_556x45_Stanag_M995_AP_mag", 						00],
	["",	"ACE_30Rnd_556x45_Stanag_Mk262_mag", 						00],
	["",	"ACE_30Rnd_556x45_Stanag_Mk318_mag", 						00],
	["",	"ACE_30Rnd_556x45_Stanag_Tracer_Dim", 						00],
	["",	"ACE_100Rnd_580x42_Drum_red", 								00],
	["",	"ACE_100Rnd_580x42_Drum_yellow", 							00],
	["",	"ACE_100Rnd_580x42_Drum_tracer_red", 						00],
	["",	"ACE_100Rnd_580x42_Drum_tracer_yellow", 					00],
	["",	"ACE_30Rnd_580x42_Mag_red", 								00],
	["",	"ACE_30Rnd_580x42_Mag_yellow", 								00],
	["",	"ACE_30Rnd_580x42_Mag_tracer_red", 							00],
	["",	"ACE_30Rnd_580x42_Mag_tracer_yellow", 						00],
	["",	"ACE_200Rnd_65x39_cased_Box_green", 						00],
	["",	"ACE_200Rnd_65x39_cased_Box_red", 							00],
	["",	"ACE_200Rnd_65x39_cased_Box_tracer_green", 					00],
	["",	"ACE_200Rnd_65x39_cased_Box_tracer_red", 					00],
	["",	"ACE_100Rnd_65x39_mx_tracer_green", 						00],
	["",	"ACE_100Rnd_65x39_mx_tracer_yellow", 						00],
	["",	"ACE_100Rnd_65x39_mx_green", 								00],
	["",	"ACE_100Rnd_65x39_mx_yellow", 								00],
	["",	"ACE_100Rnd_65x39_caseless_mag_Tracer_Dim", 				00],
	["",	"ACE_200Rnd_65x39_cased_Box_Tracer_Dim", 					00],
	["",	"ACE_30Rnd_65x39_mx_green", 								00],
	["",	"ACE_30Rnd_65x39_katiba_red", 								00],
	["",	"ACE_30Rnd_65x39_mx_yellow", 								00],
	["",	"ACE_30Rnd_65x39_katiba_yellow", 							00],
	["",	"ACE_30Rnd_65x39_mx_tracer_green", 							00],
	["",	"ACE_30Rnd_65x39_katiba_tracer_red", 						00],
	["",	"ACE_30Rnd_65x39_mx_tracer_yellow", 						00],
	["",	"ACE_30Rnd_65x39_katiba_tracer_yellow", 					00],
	["",	"ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 					00],
	["",	"ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim", 			00],
	["",	"ACE_20Rnd_65_Creedmor_mag", 								00],
	["",	"ACE_30Rnd_65_Creedmor_mag", 								00],
	["",	"ACE_20Rnd_65x47_Scenar_mag", 								00],
	["",	"ACE_30Rnd_65x47_Scenar_mag", 								00],
	["",	"ACE_20Rnd_762x51_Mag_tracer_green", 						00],
	["",	"ACE_20Rnd_762x51_Mag_tracer_yellow", 						00],
	["",	"ACE_10Rnd_762x51_M118LR_Mag", 								00],
	["",	"ACE_10Rnd_762x51_M993_AP_Mag", 							00],
	["",	"ACE_10Rnd_762x51_Mk316_Mod_0_Mag", 						00],
	["",	"ACE_10Rnd_762x51_Mk319_Mod_0_Mag", 						00],
	["",	"ACE_150Rnd_762x54_Box_red", 								00],
	["",	"ACE_150Rnd_762x54_Box_yellow", 							00],
	["",	"ACE_150Rnd_762x54_Box_tracer_red", 						00],
	["",	"ACE_150Rnd_762x54_Box_tracer_yellow", 						00],
	["",	"ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag", 					00],
	["",	"ACE_20Rnd_762x51_M118LR_Mag", 								00],
	["",	"ACE_20Rnd_762x51_M993_AP_Mag", 							00],
	["",	"ACE_20Rnd_762x67_Mk248_Mod_0_Mag", 						00],
	["",	"ACE_20Rnd_762x67_Mk248_Mod_1_Mag", 						00],
	["",	"ACE_20Rnd_762x51_Mk316_Mod_0_Mag", 						00],
	["",	"ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 						00],
	["",	"ACE_20Rnd_762x51_Mag_SD", 									00],
	["",	"ACE_20Rnd_762x51_Mag_Tracer_Dim", 							00],
	["",	"ACE_20Rnd_762x51_Mag_Tracer", 								00],
	["",	"ACE_10Rnd_762x54_Tracer_mag", 								00],
	["",	"ACE_1Rnd_82mm_Mo_HE_Guided", 								00],
	["",	"ACE_1Rnd_82mm_Mo_HE", 										00],
	["",	"ACE_1Rnd_82mm_Mo_Illum", 									00],
	["",	"ACE_1Rnd_82mm_Mo_HE_LaserGuided", 							00],
	["",	"ACE_1Rnd_82mm_Mo_Smoke", 									00],
	["",	"ACE_150Rnd_93x64_Mag_red", 								00],
	["",	"ACE_150Rnd_93x64_Mag_yellow", 								00],
	["",	"ACE_16Rnd_9x19_mag", 										00],
	["",	"ACE_HuntIR_M203", 											00],
	["",	"ACE_40mm_Flare_green", 									00],
	["",	"ACE_40mm_Flare_red", 										00],
	["",	"ACE_SpareBarrel", 											00],
	["",	"rhs_mag_100Rnd_556x45_M855_cmag", 							00],
	["",	"rhs_mag_100Rnd_556x45_M855_cmag_mixed", 					00],
	["",	"rhs_mag_100Rnd_556x45_M855A1_cmag", 						00],
	["",	"rhs_mag_100Rnd_556x45_M855A1_cmag_mixed", 					00],
	["",	"rhs_mag_100Rnd_556x45_Mk262_cmag", 						00],
	["",	"rhs_mag_100Rnd_556x45_Mk318_cmag", 						00],
	["",	"rhssaf_100rnd_556x45_EPR_G36", 							00],
	["",	"rhsusf_100Rnd_762x51_m61_ap", 								00],
	["",	"rhsusf_100Rnd_762x51_m62_tracer", 							00],
	["",	"rhsusf_100Rnd_762x51", 									00],
	["",	"rhsusf_100Rnd_762x51_m80a1epr", 							00],
	["",	"rhsusf_100Rnd_762x51_m82_blank", 							00],
	["",	"rhsusf_100Rnd_556x45_M200_soft_pouch", 					00],
	["",	"rhsusf_100Rnd_556x45_M855_soft_pouch", 					00],
	["",	"rhsusf_100Rnd_556x45_M855_mixed_soft_pouch", 				00],
	["",	"rhsusf_100Rnd_556x45_soft_pouch", 							00],
	["",	"rhsusf_100Rnd_556x45_mixed_soft_pouch", 					00],
	["",	"rhs_100Rnd_762x54mmR", 									00],
	["",	"rhs_100Rnd_762x54mmR_7BZ3", 								00],
	["",	"rhs_100Rnd_762x54mmR_7N26", 								00],
	["",	"rhs_100Rnd_762x54mmR_green", 								00],
	["",	"rhsusf_10Rnd_762x51_m118_special_Mag", 					00],
	["",	"rhs_100Rnd_762x54mmR_7N13", 								00],
	["",	"rhsusf_10Rnd_762x51_m62_Mag", 								00],
	["",	"rhsusf_10Rnd_762x51_m993_Mag", 							00],
	["",	"rhs_10Rnd_762x39mm", 										00],
	["",	"rhs_10Rnd_762x39mm_89", 									00],
	["",	"rhs_10Rnd_762x39mm_tracer", 								00],
	["",	"rhs_10Rnd_762x39mm_U", 									00],
	["",	"rhs_10rnd_9x39mm_SP5", 									00],
	["",	"rhs_10rnd_9x39mm_SP6", 									00],
	["",	"rhsusf_mag_10Rnd_STD_50BMG_M33", 							00],
	["",	"rhsusf_mag_10Rnd_STD_50BMG_mk211", 						00],
	["",	"rhssaf_10Rnd_792x57_m76_tracer", 			 				00],
	["",	"rhsgref_10Rnd_792x57_m76", 				 				00],
	["",	"rhsgref_10rnd_765x17_vz61", 				 				00],
	["",	"rhs_10Rnd_762x54mmR_7N1", 				 					00],
	["",	"rhs_10Rnd_762x54mmR_7N14", 				 				00],
	["",	"rhs_mag_9x18_12_57N181S", 				 					00],
	["",	"rhsusf_mag_15Rnd_9x19_FMJ", 				 				00],
	["",	"rhsusf_mag_15Rnd_9x19_JHP", 				 				00],
	["",	"rhsusf_mag_17Rnd_9x19_FMJ", 				 				00],
	["",	"rhsusf_mag_17Rnd_9x19_JHP", 				 				00],
	["",	"rhs_mag_9x19_17", 											00],
	["",	"rhs_18rnd_9x21mm_7BT3", 									00],
	["",	"rhs_18rnd_9x21mm_7N28", 									00],
	["",	"rhs_18rnd_9x21mm_7N29", 									00],
	["",	"rhsgref_1Rnd_00Buck", 										00],
	["",	"rhsgref_1Rnd_Slug", 										00],
	["",	"rhsusf_200rnd_556x45_M855_box", 							00],
	["",	"rhsusf_200rnd_556x45_M855_mixed_box", 						00],
	["",	"rhsusf_200Rnd_556x45_box", 								00],
	["",	"rhsusf_200rnd_556x45_mixed_box", 							00],
	["",	"rhsusf_200Rnd_556x45_M855_soft_pouch", 					00],
	["",	"rhsusf_200Rnd_556x45_M855_mixed_soft_pouch", 				00],
	["",	"rhsusf_200Rnd_556x45_soft_pouch", 							00],
	["",	"rhsusf_200Rnd_556x45_mixed_soft_pouch", 					00],
	["",	"rhsgref_20rnd_1143x23_M1T_SMG", 							00],
	["",	"rhs_20rnd_9x39mm_SP6", 									00],
	["",	"rhsgref_20rnd_1143x23_M1911B_SMG", 						00],
	["",	"rhs_20rnd_9x39mm_SP5", 									00],
	["",	"rhsusf_20Rnd_762x51_m118_special_Mag", 					00],
	["",	"rhsusf_20Rnd_762x51_m62_Mag", 								00],
	["",	"rhsusf_20Rnd_762x51_m993_Mag", 							00],
	["",	"rhs_mag_9x19mm_7n21_20", 									00],
	["",	"rhs_mag_9x19mm_7n31_20", 									00],
	["",	"rhsgref_20rnd_765x17_vz61", 								00],
	["",	"rhsusf_20Rnd_762x51_SR25_m118_special_Mag", 				00],
	["",	"rhsusf_20Rnd_762x51_SR25_m62_Mag", 						00],
	["",	"rhsusf_20Rnd_762x51_SR25_m993_Mag", 						00],
	["",	"rhsgref_24rnd_75x55_Stgw57", 								00],
	["",	"rhssaf_250Rnd_762x54R", 									00],
	["",	"rhsgref_25Rnd_792x33_SmE_StG", 							00],
	["",	"rhsgref_296Rnd_792x57_SmE_belt", 							00],
	["",	"rhsgref_296Rnd_792x57_SmE_notracers_belt", 				00],
	["",	"rhsgref_296Rnd_792x57_SmK_belt", 							00],
	["",	"rhsgref_296Rnd_792x57_SmK_alltracers_belt", 				00],
	["",	"rhsgref_30rnd_1143x23_M1T_SMG", 							00],
	["",	"rhsgref_30rnd_1143x23_M1T_2mag_SMG", 						00],
	["",	"rhsgref_30rnd_1143x23_M1911B_SMG", 						00],
	["",	"rhsgref_30rnd_1143x23_M1911B_2mag_SMG", 					00],
	["",	"rhsgref_30Rnd_792x33_SmE_StG", 							00],
	["",	"rhs_30Rnd_762x39mm_polymer", 								00],
	["",	"rhs_30Rnd_762x39mm_polymer_89", 							00],
	["",	"rhs_30Rnd_762x39mm_polymer_tracer", 						00],
	["",	"rhs_30Rnd_762x39mm_polymer_U", 							00],
	["",	"rhs_30Rnd_545x39_7N10_2mag_AK", 							00],
	["",	"rhs_30Rnd_545x39_7N10_2mag_camo_AK", 						00],
	["",	"rhs_30Rnd_545x39_7N10_2mag_desert_AK", 					00],
	["",	"rhs_30Rnd_545x39_7N10_2mag_plum_AK", 						00],
	["",	"rhs_30Rnd_545x39_AK_green", 								00],
	["",	"rhs_30Rnd_545x39_7N6_AK", 									00],
	["",	"rhs_30Rnd_545x39_7N6M_AK", 								00],
	["",	"rhs_30Rnd_545x39_7N10_camo_AK", 							00],
	["",	"rhs_30Rnd_545x39_7N22_camo_AK", 							00],
	["",	"rhs_30Rnd_545x39_7N10_desert_AK", 							00],
	["",	"rhs_30Rnd_545x39_7N22_desert_AK", 							00],
	["",	"rhs_30Rnd_545x39_7N6_green_AK", 							00],
	["",	"rhs_30Rnd_545x39_7N6M_green_AK", 							00],
	["",	"rhs_30Rnd_545x39_AK_plum_green", 							00],
	["",	"rhs_30Rnd_545x39_7N10_plum_AK", 							00],
	["",	"rhs_30Rnd_545x39_7N22_plum_AK", 							00],
	["",	"rhs_30Rnd_545x39_7N6M_plum_AK", 							00],
	["",	"rhs_30Rnd_545x39_7N10_AK", 								00],
	["",	"rhs_30Rnd_545x39_7N22_AK", 								00],
	["",	"rhs_30Rnd_545x39_7U1_AK", 									00],
	["",	"rhs_30Rnd_762x39mm_bakelite", 								00],
	["",	"rhs_30Rnd_762x39mm_bakelite_89", 							00],
	["",	"rhs_30Rnd_762x39mm_bakelite_tracer", 						00],
	["",	"rhs_30Rnd_762x39mm_bakelite_U", 							00],
	["",	"rhs_30Rnd_762x39mm", 										00],
	["",	"rhs_30Rnd_762x39mm_89", 									00],
	["",	"rhs_30Rnd_762x39mm_tracer", 								00],
	["",	"rhs_30Rnd_762x39mm_U", 									00],
	["",	"rhssaf_30rnd_556x45_TDIM_G36", 							00],
	["",	"rhssaf_30rnd_556x45_EPR_G36", 								00],
	["",	"rhssaf_30rnd_556x45_MDIM_G36", 							00],
	["",	"rhssaf_30rnd_556x45_Tracers_G36", 							00],
	["",	"rhssaf_30rnd_556x45_SPR_G36", 								00],
	["",	"rhssaf_30rnd_556x45_SOST_G36", 							00],
	["",	"rhsgref_30rnd_556x45_m21", 								00],
	["",	"rhsgref_30rnd_556x45_m21_t", 								00],
	["",	"rhssaf_30Rnd_762x39mm_M67", 								00],
	["",	"rhssaf_30Rnd_762x39mm_M78_tracer", 						00],
	["",	"rhssaf_30Rnd_762x39_M82_api", 								00],
	["",	"rhs_mag_30Rnd_556x45_M855_PMAG_Tan", 						00],
	["",	"rhs_mag_30Rnd_556x45_M855_PMAG", 							00],
	["",	"rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan", 					00],
	["",	"rhs_mag_30Rnd_556x45_M855A1_PMAG", 						00],
	["",	"rhs_mag_30Rnd_556x45_M855_PMAG_Tan_Tracer_Red", 			00],
	["",	"rhs_mag_30Rnd_556x45_M855_PMAG_Tracer_Red", 				00],
	["",	"rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red", 			00],
	["",	"rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", 				00],
	["",	"rhs_mag_30Rnd_556x45_Mk262_PMAG", 							00],
	["",	"rhs_mag_30Rnd_556x45_Mk262_PMAG_Tan", 						00],
	["",	"rhs_mag_30Rnd_556x45_Mk318_PMAG", 							00],
	["",	"rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan", 						00],
	["",	"rhs_30Rnd_762x39mm_Savz58", 								00],
	["",	"rhs_30Rnd_762x39mm_Savz58_tracer", 						00],
	["",	"rhs_mag_30Rnd_556x45_M200_Stanag", 						00],
	["",	"rhs_mag_30Rnd_556x45_M855_Stanag", 						00],
	["",	"rhs_mag_30Rnd_556x45_M855A1_Stanag", 						00],
	["",	"rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red", 				00],
	["",	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", 			00],
	["",	"rhs_mag_30Rnd_556x45_Mk262_Stanag", 						00],
	["",	"rhs_mag_30Rnd_556x45_Mk318_Stanag", 						00],
	["",	"rhsgref_30rnd_556x45_vhs2", 								00],
	["",	"rhsgref_30rnd_556x45_vhs2_t", 								00],
	["",	"rhsusf_mag_40Rnd_46x30_AP", 								00],
	["",	"rhsusf_mag_40Rnd_46x30_FMJ", 								00],
	["",	"rhsusf_mag_40Rnd_46x30_JHP", 								00],
	["",	"rhs_mag_9x19mm_7n21_44", 									00],
	["",	"rhs_mag_9x19mm_7n31_44", 									00],
	["",	"rhs_45Rnd_545X39_AK_Green", 								00],
	["",	"rhs_45Rnd_545X39_7N10_AK", 								00],
	["",	"rhs_45Rnd_545X39_7N22_AK", 								00],
	["",	"rhs_45Rnd_545X39_7N6_AK", 									00],
	["",	"rhs_45Rnd_545X39_7U1_AK", 									00],
	["",	"rhsgref_50Rnd_792x57_SmE_drum", 							00],
	["",	"rhsgref_50Rnd_792x57_SmE_notracers_drum", 					00],
	["",	"rhsgref_50Rnd_792x57_SmK_drum", 							00],
	["",	"rhsgref_50Rnd_792x57_SmK_alltracers_drum", 				00],
	["",	"rhsusf_50Rnd_762x51_m82_blank", 							00],
	["",	"rhsusf_50Rnd_762x51_m61_ap", 								00],
	["",	"rhsusf_50Rnd_762x51_m62_tracer", 							00],
	["",	"rhsusf_50Rnd_762x51", 										00],
	["",	"rhsusf_50Rnd_762x51_m80a1epr", 							00],
	["",	"rhsgref_5Rnd_762x54_m38", 									00],
	["",	"rhsgref_5Rnd_792x57_kar98k", 								00],
	["",	"rhsusf_5Rnd_00Buck", 										00],
	["",	"rhsusf_5Rnd_300winmag_xm2010", 							00],
	["",	"rhsusf_5Rnd_FRAG", 										00],
	["",	"rhsusf_5Rnd_HE","rhsusf_5Rnd_Slug", 						00],
	["",	"rhsusf_5Rnd_762x51_AICS_m118_special_Mag", 				00],
	["",	"rhsusf_5Rnd_762x51_AICS_m62_Mag", 							00],
	["",	"rhsusf_5Rnd_762x51_AICS_m993_Mag", 						00],
	["",	"rhsusf_5Rnd_762x51_m118_special_Mag", 						00],
	["",	"rhsusf_5Rnd_762x51_m62_Mag", 								00],
	["",	"rhsusf_5Rnd_762x51_m993_Mag", 								00],
	["",	"rhs_5Rnd_338lapua_t5000", 									00],
	["",	"rhsusf_mag_6Rnd_M397_HET", 								00],
	["",	"rhsusf_mag_6Rnd_M433_HEDP", 								00],
	["",	"rhsusf_mag_6Rnd_M441_HE", 									00],
	["",	"rhs_mag_6x8mm_mhp", 										00],
	["",	"rhsusf_mag_6Rnd_m4009", 									00],
	["",	"rhsusf_mag_6Rnd_M576_Buckshot", 							00],
	["",	"rhsusf_mag_6Rnd_M585_white", 								00],
	["",	"rhsusf_mag_6Rnd_m661_green", 								00],
	["",	"rhsusf_mag_6Rnd_m662_red", 								00],
	["",	"rhsusf_mag_6Rnd_M713_red", 								00],
	["",	"rhsusf_mag_6Rnd_M714_white", 								00],
	["",	"rhsusf_mag_6Rnd_M715_green", 								00],
	["",	"rhsusf_mag_6Rnd_M716_yellow", 								00],
	["",	"rhsusf_mag_6Rnd_M781_Practice", 							00],
	["",	"rhs_75Rnd_762x39mm", 										00],
	["",	"rhs_75Rnd_762x39mm_89", 									00],
	["",	"rhs_75Rnd_762x39mm_tracer", 								00],
	["",	"rhsusf_mag_7x45acp_MHP", 									00],
	["",	"rhsusf_8Rnd_00Buck", 										00],
	["",	"rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle", 					00],
	["",	"rhsgref_8Rnd_762x63_M2B_M1rifle", 							00],
	["",	"rhsusf_8Rnd_FRAG", 										00],
	["",	"rhsusf_8Rnd_HE", 											00],
	["",	"rhsusf_8Rnd_Slug", 										00],
	["",	"rhs_mag_9x18_8_57N181S", 									00],
	["",	"rhs_mag_762x25_8", 										00],
	["",	"rhs_mag_9k32_rocket", 										00],
	["",	"rhs_mag_2Rnd_Igla", 										00],
	["",	"rhs_mag_9k38_rocket", 										00],
	["",	"Vorona_HE", 												00],
	["",	"Vorona_HEAT", 												00],
	["",	"rhs_LaserMag", 											00],
	["",	"rhs_LaserFCSMag", 											00],
	["",	"Laserbatteries", 											00],
	["",	"rhs_mag_maaws_HE", 										00],
	["",	"rhs_mag_maaws_SMOKE", 										00],
	["",	"rhs_mag_maaws_HEDP", 										00],
	["",	"rhs_mag_maaws_ILLUM", 										00],
	["",	"rhs_mag_maaws_HEAT", 										00],
	["",	"rhs_fim92_mag", 											00],
	["",	"rhs_mag_rsp30_green", 										00],
	["",	"rhs_mag_rsp30_red", 										00],
	["",	"rhs_mag_rsp30_white", 										00],
	["",	"rhs_GDM40", 												00],
	["",	"rhs_mag_m4009", 											00],
	["",	"rhs_GRD40_Green", 											00],
	["",	"rhs_GRD40_Red", 											00],
	["",	"rhs_GRD40_White", 											00],
	["",	"rhs_fgm148_magazine_AT", 									00],
	["",	"rhs_mag_M397_HET", 										00],
	["",	"rhs_mag_M433_HEDP", 										00],
	["",	"rhs_mag_M441_HE", 											00],
	["",	"rhs_mag_m576", 											00],
	["",	"rhs_mag_M585_white", 										00],
	["",	"rhs_mag_m661_green", 										00],
	["",	"rhs_mag_m662_red", 										00],
	["",	"rhs_mag_m713_Red", 										00],
	["",	"rhs_mag_m714_White", 										00],
	["",	"rhs_mag_m715_Green", 										00],
	["",	"rhs_mag_m716_yellow", 										00],
	["",	"rhs_mag_M781_Practice", 									00],
	["",	"MRAWS_HE_F", 												00],
	["",	"MRAWS_HEAT_F", 											00],
	["",	"rhs_mag_smaw_SR", 											00],
	["",	"rhs_mag_smaw_HEAA", 										00],
	["",	"rhs_mag_smaw_HEDP", 										00],
	["",	"rhs_rpg7_OG7V_mag", 										00],
	["",	"rhs_rpg7_PG7V_mag", 										00],
	["",	"rhs_rpg7_PG7VL_mag", 										00],
	["",	"rhs_rpg7_PG7VM_mag", 										00],
	["",	"rhs_rpg7_PG7VR_mag", 										00],
	["",	"rhs_rpg7_PG7VS_mag", 										00],
	["",	"rhs_rpg7_TBG7V_mag", 										00],
	["",	"rhs_rpg7_type69_airburst_mag", 							00],
	["",	"rhs_VG40MD_Green", 										00],
	["",	"rhs_VG40MD_Red", 											00],
	["",	"rhs_VG40MD_White", 										00],
	["",	"rhs_VG40OP_green", 										00],
	["",	"rhs_VG40OP_red", 											00],
	["",	"rhs_VG40OP_white", 										00],
	["",	"rhs_VG40SZ", 												00],
	["",	"rhs_VG40TB", 												00],
	["",	"rhs_VOG25", 												00],
	["",	"rhs_VOG25P", 												00],
	//ACE
	/*["16Rnd 9x19", "ACE_16Rnd_9x19_Mag", 10],
	["30Rnd 9x19", "ACE_30Rnd_9x19_Mag", 15],
	["M995 5.56mm AP 30Rnd", "ACE_30Rnd_556x45_Stanag_M995_AP_mag", 50],
	["Mk262 5.56mm 30Rnd", "ACE_30Rnd_556x45_Stanag_Mk262_mag", 30],
	["Mk318 5.56mm 30Rnd", "ACE_30Rnd_556x45_Stanag_Mk318_mag", 25],
	["IR-DIM 5.56mm 30Rnd", "ACE_30Rnd_556x45_Stanag_Tracer_Dim", 25],
	["IR-Tracer 5.56mm 30Rnd", "ACE_30Rnd_556x45_Stanag_Trace_Dim", 35],
	["6.5mm Green-IR-Tracer 30Rnd", "ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim", 15],
	["6.5mm IR-Tracer 30Rnd", "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 15],
	["6.5mm Scenar 30Rnd", "ACE_30Rnd_65x47_Scenar_mag", 30],
	["6.5mm Creedmor 30Rnd", "ACE_30Rnd_65_Creedmor_mag", 30],
	["6.5mm Caseless IR Tracer 100Rnd", "ACE_100Rnd_65x39_caseless_mag_Tracer_Dim", 50],
	["6.5mm Cased IR-Tracer 200Rnd", "ACE_200Rnd_65x39_cased_Box_Tracer_Dim", 150],
	["7.62x51mm M118LR 10Rnd", "ACE_10Rnd_762x51_M118LR_Mag", 15],
	["7.62x51mm Mk316 Mod 0 10Rnd", "ACE_10Rnd_762x51_Mk316_Mod_0_Mag", 20],
	["7.62x51mm Mk319 Mod 0 10Rnd", "ACE_10Rnd_762x51_Mk319_Mod_0_Mag", 25],
	["7.62x51mm M993 AP 10Rnd", "ACE_10Rnd_762x51_M993_AP_Mag", 35],
	["7.62x51mm SD 20Rnd", "ACE_20Rnd_762x51_Mag_SD", 30],
	["7.62x51mm Tracer 20Rnd", "ACE_20Rnd_762x51_Mag_Tracer", 35],
	["7.62x51mm IR-Tracer 20Rnd", "ACE_20Rnd_762x51_Mag_Tracer_Dim", 35],
	["7.62x51mm M118LR 20Rnd", "ACE_20Rnd_762x51_M118LR_Mag", 35],
	["7.62x51mm Mk316 Mod 0 20Rnd", "ACE_20Rnd_762x51_Mk316_Mod_0_Mag", 40],
	["7.62x51mm Mk319 Mod 0 20Rnd", "ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 45],
	["7.62x51mm M993 AP 20Rnd", "ACE_20Rnd_762x51_M993_AP_Mag", 50],
	["7.62x54mmR Tracer 10Rnd", "ACE_10Rnd_762x54_Trace_mag", 40],
	["7.62x54mmR Tracer 10Rnd", "ACE_10Rnd_762x54_Tracer_mag", 40],
	["7.62x67mm Mk248 Mod 0 20Rnd", "ACE_20Rnd_762x67_Mk248_Mod_0_Mag", 40],
	["7.62x67 Mk248 Mod 1 20Rnd", "ACE_20Rnd_762x67_Mk248_Mod_1_Mag", 45],
	["7.62x67mm Berger Hybrid OTM 20Rnd", "ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag", 55],
	[".338 200gr HPBT 10Rnd", "ACE_10Rnd_338_300gr_HPBT_Mag", 55],
	[".338 API-526 10Rnd", "ACE_10Rnd_338_API526_Mag", 60],
	["12.7x99mm 5Rnd", "ACE_5Rnd_127x99_Mag", 50],
	["12.7x99mm API 5Rnd", "ACE_5Rnd_127x99_API_Mag", 60],
	["12.7x99mm AMAX 5Rnd", "ACE_5Rnd_127x99_AMAX_Mag", 55],
	["", "ACE_HuntIR_M203", 50],
	
	/// RHS
	["5.56mm 30Cart. EPR", "rhssaf_30rnd_556x45_EPR_G36", 50], // RHS
	["5.56mm 30Cart. SOST", "rhssaf_30rnd_556x45_SOST_G36", 50], // RHS
	["5.56mm 30Cart. SPR", "rhssaf_30rnd_556x45_SPR_G36", 50], // RHS
	["5.56mm 30Cart. MDIM", "rhssaf_30rnd_556x45_MDIM_G36", 50], // RHS
	["5.56mm 30Cart. TDIM", "rhssaf_30rnd_556x45_TDIM_G36", 50], // RHS
	["5.56mm 30Cart. Tracers", "rhssaf_30rnd_556x45_Tracers_G36", 50], // RHS
	
	["VOG25", 					"rhs_VOG25", 		100], 		// RHS
	["VOG25P", 					"rhs_VOG25P", 		150], 		// RHS
	["VG-40TB", 				"rhs_VG40TB", 		50], 		// RHS
	["VG-40SZ", 				"rhs_VG40SZ", 		55], 		// RHS
	["VG-40OP (White Flare)",	"rhs_VG40OP_white", 50], 		// RHS
	["VG-40OP (Green Flare)",	"rhs_VG40OP_green", 50], 		// RHS
	["VG-40OP (Red Flare)",		"rhs_VG40OP_red", 	50], 		// RHS
	["GDR-40OP (White Smoke)",	"rhs_GRD40_White", 	50], 		// RHS
	["GDR-40OP (Green Smoke)",	"rhs_GRD40_Green", 	50], 		// RHS
	["GDR-40OP (Red Smoke)", 	"rhs_GRD40_Red", 	50], 		// RHS
	["VG-40MD (White Smoke)", 	"rhs_VG40MD_White", 50], 		// RHS
	["VG-40MD (Green Smoke)", 	"rhs_VG40MD_Green", 50], 		// RHS
	["VG-40MD (Red Smoke)", 	"rhs_VG40MD_Red", 	50], 		// RHS
	["GDM40 (White)", 			"rhs_GDM40", 		100], 		// RHS

	["10RD.50BMG M33 STD Box", "rhsusf_mag_10Rnd_STD_50BMG_M33", 50], // RHS
	["10RD.50BMG Mk 211 STD Box", "rhsusf_mag_10Rnd_STD_50BMG_mk211", 50], // RHS
	["5RD.338 T-5000", "rhs_5Rnd_338lapua_t5000", 50], // RHS
	["17 Cartuchos 9x19", "rhs_mag_9x19_17", 50], // RHS
	["10rnd 9x17mm mag", "rhsgref_10rnd_9x17_skorpion", 50], // RHS
	["20rnd 9x17mm mag", "rhsgref_20rnd_9x17_skorpion", 50], // RHS
	["10rnd 7.65x17mm mag", "rhsgref_10rnd_765x17_vz61", 50], // RHS
	["20rnd 7.65x17mm mag", "rhsgref_20rnd_765x17_vz61", 50], // RHS
	["40Rnd 4.6mm AP", "rhsusf_mag_40Rnd_46x30_AP", 50], // RHS
	["40Rnd 4.6mm FMJ", "rhsusf_mag_40Rnd_46x30_FMJ", 50], // RHS
	["40Rnd 4.6mm JHP", "rhsusf_mag_40Rnd_46x30_JHP", 50], // RHS
	["45ACP HP 7Rnd", "rhsusf_mag_7x45acp_MHP", 50], // RHS
	["5.56mm 30Cart Fogeo", "rhs_mag_30Rnd_556x45_M200_Stanag", 50], // RHS
	["5.56mm 30Cart (Sin trazadoras)", "rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer", 50], // RHS
	["5.56mm 30Cart Trazadora amarilla", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow", 50], // RHS
	["5.56mm 30Cart Trazadora naranja", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Orange", 50], // RHS
	["5.56mm 30Cart Trazadora roja", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", 50], // RHS
 	["5.56mm 30Cart Trazadora verde", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green", 50], // RHS
	["5.56mm 30Cart. Mk262", "rhs_mag_30Rnd_556x45_Mk262_Stanag", 50], // RHS
	["5.56mm 30Cart. Mk318", "rhs_mag_30Rnd_556x45_Mk318_Stanag", 50], // RHS
	["5.56mm M200 100rnd Pouch", "rhsusf_100Rnd_556x45_M200_soft_pouch", 50], // RHS
	["5.56mm M855A1 (Mixed) 100rnd Pouch", "rhsusf_100Rnd_556x45_soft_pouch", 50], // RHS
	["5.56mm M855A1 (Mixed) 200rnd Belt", "rhs_200rnd_556x45_M_SAW", 50], // RHS
	["5.56mm M855A1 200rnd Belt", "rhs_200rnd_556x45_B_SAW", 50], // RHS
	["5.56mm M855A1 200rnd Pouch", "rhsusf_200Rnd_556x45_soft_pouch", 50], // RHS
	["5.56mm M855A1 30Cart", "rhs_mag_30Rnd_556x45_M855A1_Stanag", 50], // RHS
	["5.56mm Tracer 200rnd Belt", "rhs_200rnd_556x45_T_SAW", 50], // RHS
	["57-N-181S 12Rnd. PMM", "rhs_mag_9x18_12_57N181S", 50], // RHS
	["57-N-181S 8Rnd. PM", "rhs_mag_9x18_8_57N181S", 50], // RHS
	["57-N-231 30Rnd AK Mag", "rhs_30Rnd_762x39mm", 50], // RHS
	["57-N-231(89) 30Rnd AK Mag", "rhs_30Rnd_762x39mm_89", 50], // RHS
	["57-N-231P 30Rnd AK Mag", "rhs_30Rnd_762x39mm_tracer", 50], // RHS
	["57-N-231U 30Rnd AK Mag (Subsonic)", "rhs_30Rnd_762x39mm_U", 50], // RHS
	["57-N-323S 100Rnd PKM Box", "rhs_100Rnd_762x54mmR", 50], // RHS
	["5Cart. .00 Perdigones", "rhsusf_5Rnd_00Buck", 50], // RHS
	["5Cart. .300 Winchester Magnum", "rhsusf_5Rnd_300winmag_xm2010", 50], // RHS
	["5N7 Carg. 30 cartuchos AK-74", "rhs_30Rnd_545x39_AK", 50], // RHS
	["5N7 Carg. 30 cartuchos AK-74 (Sin trazadora)", "rhs_30Rnd_545x39_AK_no_tracers", 50], // RHS
	["5N7 Carg. 45 cartuchos RPK-74", "rhs_45Rnd_545X39_AK", 50], // RHS
	["5rnd 7.62x54Rmm clip", "rhsgref_5Rnd_762x54_m38", 50], // RHS
	["5rnd 7.92x57mm clip", "rhsgref_5Rnd_792x57_kar98k", 50], // RHS
	["5Rnd 12g FRAG", "rhsusf_5Rnd_FRAG", 50], // RHS
	["5Rnd 12g HE-EP", "rhsusf_5Rnd_HE", 50], // RHS
	["5Rnd 12g Slug", "rhsusf_5Rnd_Slug", 50], // RHS
	["6.5mm 30Rnd Trace Mag", "30Rnd_65x39_caseless_green_Tracer", 50], // RHS
	["6Rnd. GL Stun Grenade", "rhsusf_mag_6Rnd_m4009", 50], // RHS
	["6Rnd. M433 HEDP", "rhsusf_mag_6Rnd_M433_HEDP", 50], // RHS
	["6Rnd. M411 HE", "rhsusf_mag_6Rnd_M441_HE", 50], // RHS
	["6Rnd. M397 HE Timed", "rhsusf_mag_6Rnd_M397_HET", 50], // RHS
	["6Rnd. M576 Buckshot", "rhsusf_mag_6Rnd_M576_Buckshot", 50], // RHS
	["6Rnd. M585 White Flare", "rhsusf_mag_6Rnd_M585_white", 50], // RHS
	["6Rnd. M661 Green Flare", "rhsusf_mag_6Rnd_m661_green", 50], // RHS
	["6Rnd. M662 Red Flare", "rhsusf_mag_6Rnd_m662_red", 50], // RHS
	["6Rnd. M713 Red Smoke", "rhsusf_mag_6Rnd_M713_red", 50], // RHS
	["6Rnd. M714 White Smoke", "rhsusf_mag_6Rnd_M714_white", 50], // RHS
	["6Rnd. M715 Green Smoke", "rhsusf_mag_6Rnd_M715_green", 50], // RHS
	["6Rnd. M716 Yellow Smoke", "rhsusf_mag_6Rnd_M716_yellow", 50], // RHS
	["6Rnd. M781 Practice Round", "rhsusf_mag_6Rnd_M781_Practice", 50], // RHS
	["7T3M Carg. 30 cartuchos AK-74", "rhs_30Rnd_545x39_AK_green", 50], // RHS
	["7T3M Carg. 45 cartuchos RPK-74", "rhs_45Rnd_545X39_AK_Green", 50], // RHS
	["7.62mm M118 20Rnd Mag", "rhsusf_20Rnd_762x51_m118_special_Mag", 50], // RHS
	["7.62mm M118 10Rnd Mag", "rhsusf_10Rnd_762x51_m118_special_Mag", 50], // RHS
	["7.62mm M118 5Rnd Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", 50], // RHS
	["7.62mm M61 AP 100rnd Belt", "rhsusf_100Rnd_762x51_m61_ap", 50], // RHS
	["7.62mm M61 AP 50rnd Belt", "rhsusf_50Rnd_762x51_m61_ap", 50], // RHS
	["7.62mm M62 Tracer 100rnd Belt", "rhsusf_100Rnd_762x51_m62_tracer", 50], // RHS
	["7.62mm M62 Tracer 20rnd Mag", "rhsusf_20Rnd_762x51_m62_Mag", 50], // RHS
	["7.62mm M62 Tracer 10rnd Mag", "rhsusf_10Rnd_762x51_m62_Mag", 50], // RHS
	["7.62mm M62 Tracer 5rnd Mag", "rhsusf_5Rnd_762x51_m62_Mag", 50], // RHS
	["7.62mm M62 Tracer 50rnd Belt", "rhsusf_50Rnd_762x51_m62_tracer", 50], // RHS
	["7.62mm M80 Ball 100rnd Belt", "rhsusf_100Rnd_762x51", 50], // RHS
	["7.62mm M80 Ball 50rnd Belt", "rhsusf_50Rnd_762x51", 50], // RHS
	["7.62mm M80A1EPR 100rnd Belt", "rhsusf_100Rnd_762x51_m80a1epr", 50], // RHS
	["7.62mm M80A1EPR 50rnd Belt", "rhsusf_50Rnd_762x51_m80a1epr", 50], // RHS
	["7.62mm M82 Blank 100rnd Belt", "rhsusf_100Rnd_762x51_m82_blank", 50], // RHS
	["7.62mm M82 Blank 50rnd Belt", "rhsusf_50Rnd_762x51_m82_blank", 50], // RHS
	["7.62mm M993 20Rnd Mag", "rhsusf_20Rnd_762x51_m993_Mag", 50], // RHS
	["7.62mm M993 10Rnd Mag", "rhsusf_20Rnd_762x51_m993_Mag", 50], // RHS
	["7.62mm M993 5Rnd Mag", "rhsusf_5Rnd_762x51_m993_Mag", 50], // RHS
	["7BZ-3 100Rnd PKM AP Box", "rhs_100Rnd_762x54mmR_7BZ3", 50], // RHS
	["7N1 Carg. 10 cartuchos SVD", "rhs_10Rnd_762x54mmR_7N1", 50], // RHS
	["7N10 Carg. 30 cartuchos AK-74", "rhs_30Rnd_545x39_7N10_AK", 50], // RHS
	["7N10 Carg. 45 cartuchos RPK-74", "rhs_45Rnd_545X39_7N10_AK", 50], // RHS
	["7N13 100Rnd PKM AP Box", "rhs_100Rnd_762x54mmR_7N13", 50], // RHS
	["7N21 20Rnd PP-2000 Mag", "rhs_mag_9x19mm_7n21_20", 50], // RHS
	["7N21 44rnd PP-2000 Mag", "rhs_mag_9x19mm_7n21_44", 50], // RHS
	["7N22 Carg. 30 cartuchos AK-74", "rhs_30Rnd_545x39_7N22_AK", 50], // RHS
	["7N22 Carg. 45 cartuchos RPK-74", "rhs_45Rnd_545X39_7N22_AK", 50], // RHS
	["7N26 100Rnd PKM AP-I Box", "rhs_100Rnd_762x54mmR_7N26", 50], // RHS
	["7N31 20Rnd PP-2000 Mag", "rhs_mag_9x19mm_7n31_20", 50], // RHS
	["7N31 44rnd PP-2000 Mag", "rhs_mag_9x19mm_7n31_44", 50], // RHS
	["7T2 100Rnd PKM Tracer Box", "rhs_100Rnd_762x54mmR_green", 50], // RHS
	["7U1 Carg. 30 cartuchos AK-74 (Subsónico)", "rhs_30Rnd_545x39_7U1_AK", 50], // RHS
	["7U1 Carg. 45 cartuchos RPK-74", "rhs_45Rnd_545X39_7U1_AK", 50], // RHS
	["8Cart. .00 Perdigones", "rhsusf_8Rnd_00Buck", 50], // RHS
	["8Rnd 12g FRAG", "rhsusf_8Rnd_FRAG", 50], // RHS
	["8Rnd 12g HE-EP", "rhsusf_8Rnd_HE", 50], // RHS
	["8Rnd 12g Slug", "rhsusf_8Rnd_Slug", 50], // RHS
	["9mm M882 FMJ 15Rnd M9", "rhsusf_mag_15Rnd_9x19_FMJ", 50], // RHS
	["9mm M882 FMJ 17Rnd Glock", "rhsusf_mag_17Rnd_9x19_FMJ", 50], // RHS
	["9mm Mk243 JHP 15Rnd M9", "rhsusf_mag_15Rnd_9x19_JHP", 50], // RHS
	["9mm Mk243 JHP 17Rnd Glock", "rhsusf_mag_17Rnd_9x19_JHP", 50], // RHS
	["Baterías Láser", "rhs_LaserMag", 50], // RHS
	["GDM-40 (Blanco)", "rhs_GDM40", 50], // RHS
	["GL Stun Grenade Round", "rhs_mag_m4009", 50], // RHS
	["GRD-40 (Blanco)", "rhs_GRD40_White", 50], // RHS
	["GRD-40 (Rojo", "rhs_GRD40_Red", 50], // RHS
	["GRD-40 (Verde)", "rhs_GRD40_Green", 50], // RHS
	["M-21 magazine", "rhsgref_30rnd_556x45_m21", 50], // RHS
	["M-21 tracer magazine", "rhsgref_30rnd_556x45_m21_t", 50], // RHS
	["M-76 magazine", "rhsgref_10Rnd_792x57_m76", 50], // RHS
	["M433 HEDP", "rhs_mag_M433_HEDP", 50], // RHS
	["M441 HE", "rhs_mag_M441_HE", 50], // RHS
	["M576 Buckshot", "rhs_mag_m576", 50], // RHS
	["M585 White Flare", "rhs_mag_M585_white", 50], // RHS
	["M661 Green Flare", "rhs_mag_M661_green", 50], // RHS
	["M662 Red Flare", "rhs_mag_m662_red", 50], // RHS
	["M713 Red Smoke", "rhs_mag_m713_Red", 50], // RHS
	["M714 White Smoke", "rhs_mag_m714_White", 50], // RHS
	["M715 Green Smoke", "rhs_mag_m715_Green", 50], // RHS
	["M716 Yellow Smoke", "rhs_mag_m716_yellow", 50], // RHS
	["M781 Practice Round", "rhs_mag_M781_Practice", 50], // RHS
	["Cámara HuntIR", "ACE_HuntIR_M203", 500], // RHS
	["SP-5 10Rnd AS Val Mag", "rhs_10rnd_9x39mm_SP5", 50], // RHS
	["SP-5 20Rnd AS Val Mag", "rhs_20rnd_9x39mm_SP5", 50], // RHS
	["SP-6 10Rnd AS Val Mag", "rhs_10rnd_9x39mm_SP6", 50], // RHS
	["SP-6 20Rnd AS Val Mag", "rhs_20rnd_9x39mm_SP6", 50], // RHS
	["VG-40MD (Blanco)", "rhs_VG40MD_White", 50], // RHS
	["VG-40MD (Rojo)", "rhs_VG40MD_Red", 50], // RHS
	["VG-40MD (Verde)", "rhs_VG40MD_Green", 50], // RHS
	["VG-400P (Blanco)", "rhs_VG40OP_white", 50], // RHS
	["VG-400P (Rojo)", "rhs_VG40OP_red", 50], // RHS
	["VG-400P (Verde)", "rhs_VG40OP_green", 50], // RHS
	["VG-40SZ", "rhs_VG40SZ", 50], // RHS
	["VG-40TB", "rhs_VG40TB", 50], // RHS
	["VOG25", "rhs_VOG25", 50], // RHS
	["VOG25P", "rhs_VOG25P", 50], // RHS*/
	["9K32", "rhs_mag_9k32_rocket", 800], // RHS
	["9K32", "rhs_mag_2Rnd_Igla", 800], // RHS
	["9K38", "rhs_mag_9k38_rocket", 800], // RHS
	["FGM172A SRAW", "rhs_fgm172a_magazine_AT", 500], // RHS
	["FGM172B SRAW-MRV", "rhs_fgm172b_magazine_MPV", 500], // RHS
	["FIM-92F", "rhs_fim92_mag", 800], // RHS
	["Javelin-AT", "rhs_fgm148_magazine_AT", 10000], // RHS
	["Mk.217 Spotting", "rhs_mag_smaw_SR", 500], // RHS
	["HEDP", "rhs_mag_smaw_HEDP", 500], // RHS
	["HEAA", "rhs_mag_smaw_HEAA", 500], // RHS
	
	["FFv441 HE", "rhs_mag_maaws_HE", 1500], // RHS
	["FFv502 HEDP", "rhs_mag_maaws_HEDP", 1600], // RHS
	["FFv51 HEAT", "rhs_mag_maaws_HEAT", 1800], // RHS
	["PCML Anti-Tank Missile",												"NLAW_F",																	12000,	"HIDDEN"],		// Direct damage: very high | Splash damage: low		| Guidance: laser,ground vehicles
	["MAAWS HEAT 75 Rocket", "MRAWS_HEAT_F", 500],            //                 435     |                 14,  2.0m     |           none
	["MAAWS HE 44 Rocket", "MRAWS_HE_F", 400],                //                 200     |                 50,  6.0m     |           none
	["9M135 HEAT Missile", "Vorona_HEAT", 1000],              //                 634     |                 28,  2.5m     |           mouse
	["9M135 HE Missile", "Vorona_HE", 750],                   //                 220     |                 45,  8.0m     |           mouse
	
	// OCULTOS
	["Signal Cylinder (Red)",												"6Rnd_RedSignal_F",															5,	"HIDDEN"],
	["Signal Cylinder (Green)",												"6Rnd_GreenSignal_F",														5,	"HIDDEN"],
	["9mm 10Rnd Mag",														"10Rnd_9x21_Mag",															10,	"HIDDEN"],
	["9mm 16Rnd Mag",														"16Rnd_9x21_Mag",															10,	"HIDDEN"],
	["9mm 30Rnd Mag",														"30Rnd_9x21_Mag",															15,	"HIDDEN"],
	["9mm 30Rnd SMG Mag",													"30Rnd_9x21_Mag_SMG_02",													15,	"HIDDEN"],
	[".45 ACP 6Rnd Cylinder",												"6Rnd_45ACP_Cylinder",														5,	"HIDDEN"],
	[".45 ACP 9Rnd Mag",													"9Rnd_45ACP_Mag",															10,	"HIDDEN"],
	[".45 ACP 11Rnd Mag",													"11Rnd_45ACP_Mag",															15,	"HIDDEN"],
	[".45 ACP 30Rnd Vermin Mag",											"30Rnd_45ACP_MAG_SMG_01",													20,	"HIDDEN"],
	[".45 ACP 30Rnd Tracer (Green) Mag",									"30Rnd_45ACP_Mag_SMG_01_tracer_green",										15,	"HIDDEN"],
	["5.45mm 30Rnd Mag",													"30Rnd_545x39_Mag_F",														20,	"HIDDEN"],
	["5.45mm 30Rnd Tracer (Yellow) Mag",									"30Rnd_545x39_Mag_Tracer_F",												15,	"HIDDEN"],
	["5.45mm 30Rnd Tracer (Green) Mag",										"30Rnd_545x39_Mag_Tracer_Green_F",											15,	"HIDDEN"],
	["5.56mm 20Rnd Underwater Mag",											"20Rnd_556x45_UW_mag",														10,	"HIDDEN"],
	["5.56mm 30Rnd STANAG Mag",												"30Rnd_556x45_Stanag",														20,	"HIDDEN"],
	["5.56mm 30Rnd Tracer (Green) Mag",										"30Rnd_556x45_Stanag_Tracer_Green",											15,	"HIDDEN"],
	["5.56mm 30Rnd Tracer (Yellow) Mag",									"30Rnd_556x45_Stanag_Tracer_Yellow",										15,	"HIDDEN"],
	["5.56mm 30Rnd Tracer (Red) Mag",										"30Rnd_556x45_Stanag_Tracer_Red",											15,	"HIDDEN"],
	["5.56mm 150Rnd Mag",													"150Rnd_556x45_Drum_Mag_F",													100,"HIDDEN"],
	["5.56mm 150Rnd Tracer (Red) Mag",										"150Rnd_556x45_Drum_Mag_Tracer_F",											75,	"HIDDEN"],
	["5.56mm 200Rnd Box",													"200Rnd_556x45_Box_F",														125,"HIDDEN"],
	["5.56mm 200Rnd Tracer (Yellow) Box",									"200Rnd_556x45_Box_Tracer_F",												100,"HIDDEN"],
	["5.56mm 200Rnd Tracer (Red) Box",										"200Rnd_556x45_Box_Tracer_Red_F",											100,"HIDDEN"],
	["5.8mm 30Rnd Mag",														"30Rnd_580x42_Mag_F",														20,	"HIDDEN"],
	["5.8mm 30Rnd Tracer (Green) Mag",										"30Rnd_580x42_Mag_Tracer_F",												15,	"HIDDEN"],
	["5.8mm 100Rnd Mag",													"100Rnd_580x42_Mag_F",														100,"HIDDEN"],
	["5.8mm 100Rnd Tracer (Green) Mag",										"100Rnd_580x42_Mag_Tracer_F",												75,	"HIDDEN"],
	["6.5mm 20Rnd Mag",														"20Rnd_650x39_Cased_Mag_F",													15,	"HIDDEN"],
	["6.5mm 30Rnd STANAG Mag",												"30Rnd_65x39_caseless_mag",													20,	"HIDDEN"],
	["6.5mm 30Rnd Tracer (Red) Mag",										"30Rnd_65x39_caseless_mag_Tracer",											15,	"HIDDEN"],
	["6.5mm 30Rnd Caseless Mag",											"30Rnd_65x39_caseless_green",												20,	"HIDDEN"],
	["6.5mm 30Rnd Tracer (Green) Mag",										"30Rnd_65x39_caseless_green_mag_Tracer",									15,	"HIDDEN"],
	["6.5mm 100Rnd Belt Case",												"100Rnd_65x39_caseless_mag",												75,	"HIDDEN"],
	["6.5mm 100Rnd Tracer (Red) Belt Case",									"100Rnd_65x39_caseless_mag_Tracer",											50,	"HIDDEN"],
	["6.5mm 200Rnd Belt Case",												"200Rnd_65x39_cased_Box",													150,"HIDDEN"],
	["6.5mm 200Rnd Tracer (Yellow) Belt Case",								"200Rnd_65x39_cased_Box_Tracer",											125,"HIDDEN"],
	["7.62mm 10Rnd Mag",													"10Rnd_762x54_Mag",															15,	"HIDDEN"],
	["7.62mm 20Rnd Mag",													"20Rnd_762x51_Mag",															25,	"HIDDEN"],
	["7.62mm 30Rnd Mag",													"30Rnd_762x39_Mag_F",														20,	"HIDDEN"],
	["7.62mm 30Rnd Tracer (Yellow) Mag",									"30Rnd_762x39_Mag_Tracer_F",												15,	"HIDDEN"],
	["7.62mm 30Rnd Tracer (Green) Mag",										"30Rnd_762x39_Ma	g_Tracer_Green_F",										15,	"HIDDEN"],
	["7.62mm 150Rnd Box",													"150Rnd_762x54_Box",														150,"HIDDEN"],
	["7.62mm 150Rnd Tracer (Green) Box",									"150Rnd_762x54_Box_Tracer",													125,"HIDDEN"],
	[".338 LM 10Rnd Mag",													"10Rnd_338_Mag",															50,	"HIDDEN"],
	[".338 NM 130Rnd Belt",													"130Rnd_338_Mag",															300,"HIDDEN"],
	["9.3mm 10Rnd Mag",														"10Rnd_93x64_DMR_05_Mag",													50,	"HIDDEN"],
	["9.3mm 150Rnd Belt",													"150Rnd_93x64_Mag",															300,"HIDDEN"],
	[".408 7Rnd Cheetah Mag",												"7Rnd_408_Mag",																50,	"HIDDEN"],
	["12.7mm 5Rnd Mag",														"5Rnd_127x108_Mag",															50,	"HIDDEN"],
	["12.7mm 5Rnd Armor-Piercing Mag",										"5Rnd_127x108_APDS_Mag",													60,	"HIDDEN"],
	["12.7mm 10Rnd Subsonic Mag",											"10Rnd_127x54_Mag",															75,	"HIDDEN"],
	[".50 BW 10Rnd Mag",													"10Rnd_50BW_Mag_F",															50,	"HIDDEN"],
	["PG-7VM HEAT Grenade",													"RPG7_F",																	250,		"HIDDEN"],		// Direct damage: medium		| Splash damage: low		| Guidance: none
	["RPG-42 Anti-Tank Rocket",												"RPG32_F",																	250,		"HIDDEN"],		// Direct damage: high			| Splash damage: low		| Guidance: none
	["RPG-42 High-Explosive Rocket",										"RPG32_HE_F",																250,		"HIDDEN"],		// Direct damage: medium		| Splash damage: medium | Guidance: none
	["Titan Anti-Tank Missile",												"Titan_AT",																	12500,		"HIDDEN"],		// Direct damage: high			| Splash damage: low		| Guidance: mouse,laser,ground vehicles
	["Titan Anti-Personnel Missile",										"Titan_AP",																	10000,		"HIDDEN"],		// Direct damage: low			 | Splash damage: high	 | Guidance: mouse,laser
	["Titan Anti-Air Missile",												"Titan_AA",																	15000,		"HIDDEN"],		// Direct damage: low			 | Splash damage: medium | Guidance: aircraft
	["40mm HE Grenade Round",												"1Rnd_HE_Grenade_shell",													250,		"HIDDEN"],
	["40mm 3Rnd HE Grenades",												"3Rnd_HE_Grenade_shell",													500,		"HIDDEN"],
	["40mm Smoke Round (White)",											"1Rnd_Smoke_Grenade_shell",													50,		"HIDDEN"],
	["40mm Smoke Round (Purple)",											"1Rnd_SmokePurple_Grenade_shell",											50,		"HIDDEN"],
	["40mm Smoke Round (Blue)",												"1Rnd_SmokeBlue_Grenade_shell",												50,		"HIDDEN"],
	["40mm Smoke Round (Green)",											"1Rnd_SmokeGreen_Grenade_shell",											50,		"HIDDEN"],
	["40mm Smoke Round (Yellow)",											"1Rnd_SmokeYellow_Grenade_shell",											50,		"HIDDEN"],
	["40mm Smoke Round (Orange)",											"1Rnd_SmokeOrange_Grenade_shell",											50,		"HIDDEN"],
	["40mm Smoke Round (Red)",												"1Rnd_SmokeRed_Grenade_shell",												50,		"HIDDEN"],
	["40mm 3Rnd Smokes (White)",											"3Rnd_Smoke_Grenade_shell",													100,		"HIDDEN"],
	["40mm 3Rnd Smokes (Purple)",											"3Rnd_SmokePurple_Grenade_shell",											100,		"HIDDEN"],
	["40mm 3Rnd Smokes (Blue)",												"3Rnd_SmokeBlue_Grenade_shell",												100,		"HIDDEN"],
	["40mm 3Rnd Smokes (Green)",											"3Rnd_SmokeGreen_Grenade_shell",											100,		"HIDDEN"],
	["40mm 3Rnd Smokes (Yellow)",											"3Rnd_SmokeYellow_Grenade_shell",											100,		"HIDDEN"],
	["40mm 3Rnd Smokes (Orange)",											"3Rnd_SmokeOrange_Grenade_shell",											100,		"HIDDEN"],
	["40mm 3Rnd Smokes (Red)",												"3Rnd_SmokeRed_Grenade_shell",												100,		"HIDDEN"],
	["40mm Flare Round (White)",											"UGL_FlareWhite_F",															25,		"HIDDEN"],
	["40mm Flare Round (Green)",											"UGL_FlareGreen_F",															25,		"HIDDEN"],
	["40mm Flare Round (Yellow)",											"UGL_FlareYellow_F",														25,		"HIDDEN"],
	["40mm Flare Round (Red)",												"UGL_FlareRed_F",															25,		"HIDDEN"],
	["40mm Flare Round (IR)",												"UGL_FlareCIR_F",															25,		"HIDDEN"],
	["40mm 3Rnd Flares (White)",											"3Rnd_UGL_FlareWhite_F",													50,		"HIDDEN"],
	["40mm 3Rnd Flares (Green)",											"3Rnd_UGL_FlareGreen_F",													50,		"HIDDEN"],
	["40mm 3Rnd Flares (Yellow)",											"3Rnd_UGL_FlareYellow_F",													50,		"HIDDEN"],
	["40mm 3Rnd Flares (Red)",												"3Rnd_UGL_FlareRed_F",														50,		"HIDDEN"],
	["40mm 3Rnd Flares (IR)",												"3Rnd_UGL_FlareCIR_F",														50,		"HIDDEN"]
];

//Gun Store item List
//Text name,classname,buy cost,item class
accessoriesArray = compileFinal str
[
	["Red Laser", "ACE_acc_pointer_red", 25, "item"],
	["Green Laser", "ACE_acc_pointer_green", 25, "item"],
	["Green Laser w/ IR Laser", "ACE_acc_pointer_green_IR", 30, "item"],
	["Yorris Sight (Zubr Revolver)", "optic_Yorris", 50, "item"],
	["SF3P-556-1/2-28", "rhsusf_acc_SF3P556", 250, "item"],  // RHS
	["SFMB-556-1/2-28", "rhsusf_acc_SFMB556", 250, "item"],  // RHS
	["Rotex II MP7 4.6mm Black", "rhsusf_acc_rotex_mp7", 250, "item"],  // RHS
	["Rotex II MP7 4.6mm Desert", "rhsusf_acc_rotex_mp7_desert", 250, "item"],  // RHS
	["Rotex II MP7 4.6mm AOR1", "rhsusf_acc_rotex_mp7_aor1", 250, "item"],  // RHS
	["Rotex-5 (Gris)", "rhsusf_acc_rotex5_grey", 250, "item"],  // RHS
	["Suppressor Glock17", "rhsusf_acc_omega9k", 250, "item"],  // RHS
	["NT4 QDSS", "rhsusf_acc_nt4_black", 500, "item"],  // RHS
	["Suppressor SR-25 Rifle", "rhsusf_acc_SR25S", 700, "item"],  // RHS
	["Suppressor PBS-1", "rhs_acc_pbs1", 500, "item"],  // RHS
	["Suppressor PBS-4", "rhs_acc_pbs4", 500, "item"],  // RHS
	["Suppressor DTK-4(7.62mm)M", "rhs_acc_dtk4screws", 250, "item"],  // RHS
	["Suppressor TGP-A(5.45mm)", "rhs_acc_tgpa", 500, "item"],  // RHS
	["Suppressor TGP-V(SVD)", "rhs_acc_tgpv", 500, "item"],  // RHS
	["AFG Grip", "rhsusf_acc_grip2", 150, "item"],  // RHS
	["TD Vertical Grip", "rhsusf_acc_grip3", 150, "item"],  // RHS
	["Grip Pod", "rhsusf_acc_grip1", 150, "item"],  // RHS
	["Grip RK-2", "rhs_acc_grip_rk2", 150, "item"],  // RHS
	["Grip RK-6", "rhs_acc_grip_rk6", 150, "item"],  // RHS
	["Grip FFG-2", "rhs_acc_grip_ffg2", 150, "item"],  // RHS
	["SAW (M249 VFG) Grip", "rhsusf_acc_grip4", 150, "item"],  // RHS
	["Harris Bipod", "rhsusf_acc_harris_bipod", 150, "item"],  // RHS
	["Harris Bipod Ruso", "rhs_acc_harris_swivel", 150, "item"],  // RHS
	["AN/PEQ-15 Black", "rhsusf_acc_anpeq15side_bk", 100, "item"],  // RHS
	["AN/PEQ-15 Top Black", "rhsusf_acc_anpeq15_bk_top", 100, "item"],  // RHS
	["AN/PEQ-15 + M952V", "rhsusf_acc_anpeq15_bk", 100, "item"],  // RHS
	["AN/PEQ-15A", "rhsusf_acc_anpeq15A", 100, "item"],  // RHS
	["Flashlight", "rhsusf_acc_M952V", 100, "item"],  // RHS
	["Perst-3", "rhs_acc_perst3", 100, "item"],  // RHS
	["M2A1 GL RCO Shigt", "rhsusf_acc_M2A1", 200, "item"],  // RHS
	["Rakurus PM", "rhs_acc_rakursPM", 150, "item"],  // RHS
	["M68 RCO", "rhsusf_acc_compm4", 200, "item"],  // RHS
	["XPS3", "rhsusf_acc_EOTECH", 250, "item"],  // RHS
	["M552 CCO", "rhsusf_acc_eotech_552", 250, "item"],  // RHS
	["TA31RCO-RMR", "rhsusf_acc_ACOG_RMR", 400, "item"],  // RHS
	["SU-230A", "rhsusf_acc_SpecterDR_A", 400, "item"],  // RHS
	["SU-260/P MDO 6x", "rhsusf_acc_ACOG_MDO", 500, "item"],  // RHS
	["M150RCO+AN/PVS-27 NVS", "rhsusf_acc_ACOG_anpvs27", 500, "item"],  // RHS
	["M8541A+AN/PVS-27 NVS", "rhsusf_acc_premier_anpvs27", 1500, "item"],  // RHS
	["SMAW Shigt (Mira del SMAW)", "rhs_weap_optic_smaw", 200, "item"],  // RHS
	["1P63", "rhs_acc_1p63", 400, "item"],  // RHS
	["1P78", "rhs_acc_1p78", 400, "item"],  // RHS
	["PK-AS", "rhs_acc_pkas", 400, "item"],  // RHS
	["EKP-1S-03", "rhs_acc_ekp1", 400, "item"],  // RHS
	["PSO-1M2-1", "rhs_acc_pso1m21", 400, "item"],  // RHS
	["PGO-7V3 (RPG-7)", "rhs_acc_pgo7v3", 400, "item"],  // RHS
	["1PN93-2 NVS (le sirve al RPG-7)", "rhs_acc_1pn93_2", 500, "item"],  // RHS
	
	["Suppressor 9mm",														"muzzle_snds_L",															50,								"item",		"HIDDEN"],
	["Suppressor .45 ACP",													"muzzle_snds_acp",															75,								"item",		"HIDDEN"],
	["Suppressor 5.56mm",													"muzzle_snds_M",															100,							"item",		"HIDDEN"],
	["Suppressor 5.56mm (Khaki)",											"muzzle_snds_m_khk_F",														100,							"item",		"HIDDEN"],
	["Suppressor 5.56mm (Sand)",											"muzzle_snds_m_snd_F",														100,							"item",		"HIDDEN"],
	["Suppressor 5.8mm",													"muzzle_snds_58_blk_F",														100,							"item",		"HIDDEN"],
	["Suppressor 5.8mm (G Hex)",											"muzzle_snds_58_wdm_F",														100,							"item",		"HIDDEN"],
	["Suppressor 6.5mm",													"muzzle_snds_H",															100,							"item",		"HIDDEN"],
	["Suppressor 6.5mm (Khaki)",											"muzzle_snds_H_khk_F",														100,							"item",		"HIDDEN"],
	["Suppressor 6.5mm (Sand)",												"muzzle_snds_H_snd_F",														100,							"item",		"HIDDEN"],
	["Suppressor 6.5mm LMG",												"muzzle_snds_H_MG",															125,							"item",		"HIDDEN"],
	["Suppressor 6.5mm LMG (Black)",										"muzzle_snds_H_MG_blk_F",													125,							"item",		"HIDDEN"],
	["Suppressor 6.5mm LMG (Khaki)",										"muzzle_snds_H_MG_khk_F",													125,							"item",		"HIDDEN"],
	["Suppressor Type 115",													"muzzle_snds_65_TI_blk_F",													125,							"item",		"HIDDEN"],
	["Suppressor Type 115 (Hex)",											"muzzle_snds_65_TI_hex_F",													125,							"item",		"HIDDEN"],
	["Suppressor Type 115 (G Hex)",											"muzzle_snds_65_TI_ghex_F",													125,							"item",		"HIDDEN"],
	["Suppressor 7.62mm",													"muzzle_snds_B",															125,							"item",		"HIDDEN"],
	["Suppressor 7.62mm (Khaki)",											"muzzle_snds_B_khk_F",														125,							"item",		"HIDDEN"],
	["Suppressor 7.62mm (Sand)",											"muzzle_snds_B_snd_F",														125,							"item",		"HIDDEN"],
	["Suppressor .338",														"muzzle_snds_338_black",													150,							"item",		"HIDDEN"],
	["Suppressor .338 (Green)",												"muzzle_snds_338_green",													150,							"item",		"HIDDEN"],
	["Suppressor .338 (Sand)",												"muzzle_snds_338_sand",														175,							"item",		"HIDDEN"],
	["Suppressor 9.3mm",													"muzzle_snds_93mmg",														175,							"item",		"HIDDEN"],
	["Suppressor 9.3mm (Tan)",												"muzzle_snds_93mmg_tan",													175,							"item",		"HIDDEN"],
	["Bipod (NATO)",														"bipod_01_F_blk",															100,							"item",								"noDLC",		"HIDDEN"],
	["Bipod (CSAT)",														"bipod_02_F_blk",															100,							"item",								"noDLC",		"HIDDEN"],
	["Bipod (AAF)",															"bipod_03_F_blk",															100,							"item",								"noDLC",		"HIDDEN"],
	["Bipod (MTP)",															"bipod_01_F_mtp",															100,							"item",								"noDLC",		"HIDDEN"],
	["Bipod (Hex)",															"bipod_02_F_hex",															100,							"item",								"noDLC",		"HIDDEN"],
	["Bipod (Olive)",														"bipod_03_F_oli",															100,							"item",								"noDLC",		"HIDDEN"],
	["Bipod (Sand)",														"bipod_01_F_snd",															100,							"item",								"noDLC",		"HIDDEN"],
	["Bipod (Tan)",															"bipod_02_F_tan",															100,							"item",								"noDLC",		"HIDDEN"],
	["Bipod (Khaki)",														"bipod_01_F_khk",															100,							"item",		"HIDDEN"],
	["Rifle Flashlight",													"acc_flashlight",															25,								"item",		"HIDDEN"],
	["Pistol Flashlight",													"acc_flashlight_pistol",													25,								"item",		"HIDDEN"],
	["IR Laser Pointer",													"acc_pointer_IR",															25,								"item"],
	["Yorris Sight (Zubr Revolver)",										"optic_Yorris",																50,								"item",		"HIDDEN"],
	["MRD Sight (4-Five Pistol)",											"optic_MRD",																50,								"item",		"HIDDEN"],
	["ACO SMG (Red)",														"optic_aco_smg",															50,								"item",		"HIDDEN"],
	["ACO SMG (Green)",														"optic_ACO_grn_smg",														50,								"item",		"HIDDEN"],
	["ACO (Red)",															"optic_Aco",																75,								"item",		"HIDDEN"],
	["ACO (Green)",															"optic_Aco_grn",															75,								"item",		"HIDDEN"],
	["Holosight SMG",														"optic_Holosight_smg",														50,								"item",		"HIDDEN"],
	["Holosight",															"optic_Holosight",															75,								"item",		"HIDDEN"],
	["MRCO",																"optic_MRCO",																100,							"item",		"HIDDEN"],
	["ERCO",																"optic_ERCO_blk_F",															100,							"item",		"HIDDEN"],
	["ERCO (Khaki)",														"optic_ERCO_khk_F",															100,							"item",		"HIDDEN"],
	["ERCO (Sand)",															"optic_ERCO_snd_F",															100,							"item",		"HIDDEN"],
	["ARCO",																"optic_Arco",																125,							"item",		"HIDDEN"],
	["ARCO (Black)",														"optic_Arco_blk_F",															125,							"item",		"HIDDEN"],
	["ARCO (G Hex)",														"optic_Arco_ghex_F",														125,							"item",		"HIDDEN"],
	["RCO",																	"optic_Hamr",																150,							"item",		"HIDDEN"],
	["RCO (Khaki)",															"optic_Hamr_khk_F",															150,							"item",		"HIDDEN"],
	["MOS",																	"optic_SOS",																150,							"item",		"HIDDEN"],
	["MOS (Khaki)",															"optic_SOS_khk_F",															150,							"item",		"HIDDEN"],
	["DMS",																	"optic_DMS",																175,							"item",		"HIDDEN"],
	["DMS (G Hex)",															"optic_DMS_ghex_F",															175,							"item",		"HIDDEN"],
	["Kahlia (Sightless)",													"optic_KHS_old",															200,							"item",		"HIDDEN"],
	["Kahlia",																"optic_KHS_blk",															225,							"item",		"HIDDEN"],
	["Kahlia (Hex)",														"optic_KHS_hex",															225,							"item",		"HIDDEN"],
	["Kahlia (Tan)",														"optic_KHS_tan",															225,							"item",		"HIDDEN"],
	["AMS",																	"optic_AMS",																250,							"item",		"HIDDEN"],
	["AMS (Khaki)",															"optic_AMS_khk",															250,							"item",		"HIDDEN"],
	["AMS (Sand)",															"optic_AMS_snd",															250,							"item",		"HIDDEN"],
	["LRPS",																"optic_LRPS",																300,							"item",		"HIDDEN"],
	["LRPS (G Hex)",														"optic_LRPS_ghex_F",														300,							"item",		"HIDDEN"],
	["LRPS (Tropic)",														"optic_LRPS_tna_F",															300,							"item",		"HIDDEN"],
	["NVS",																	"optic_NVS",																500,							"item"],
	["TWS",																	"optic_tws",																10000,							"item",		"HIDDEN"],// To hide from store list,add "HIDDEN" after "item",like "item","HIDDEN"
	["TWS MG",																"optic_tws_mg",																10000,							"item",		"HIDDEN"],
	["Nightstalker",														"optic_Nightstalker",														10000,							"item",		"HIDDEN"]
];

// If commented,means the color/camo isn't implemented or is a duplicate of another hat
headArray = compileFinal str
[	
	// RHS
	["Casco 6B26 (Green)", 					"rhs_6b26_green", 							400, 								"hat"],
	["Casco 6B26 (Flora)", 					"rhs_6b26", 								400, 								"hat"],
	["Casco 6B26 ESS (Green)", 				"rhs_6b26_ess_green", 						400, 								"hat"],
	["Casco 6B26 ESS (Flora)", 				"rhs_6b26_ess", 							400, 								"hat"],
	["Casco 6B27M (Green)",					"rhs_6b27m_green", 							400, 								"hat"],
	["Casco 6B27M (Flora)",					"rhs_6b27m", 								400, 								"hat"],
	["Casco 6B27M (EMR Summer)", 			"rhs_6b27m_digi", 							400, 								"hat"],
	["Casco 6B27M (Mountain)", 				"rhs_6b27m_ml", 							400, 								"hat"],
	["Casco 6B27M ESS (Green)", 			"rhs_6b27m_green_ess", 						400, 								"hat"],
	["Casco 6B27M ESS (Flora)", 			"rhs_6b27m_ess", 							400, 								"hat"],
	["Casco 6B27M ESS (EMR Summer)",		"rhs_6b27m_digi_ess", 						400, 								"hat"],
	["Casco 6B27M ESS (Mountain)", 			"rhs_6b27m_ml_ess", 						400, 								"hat"],
	["Casco 6B28 (Green)", 					"rhs_6b28_green", 							400, 								"hat"],
	["Casco 6B28 (Flora)", 					"rhs_6b28_flora", 							400, 								"hat"],
	["Casco 6B28 (EMR Summer)", 			"rhs_6b28", 								400, 								"hat"],
	["Casco 6B28 ESS (Green)", 				"rhs_6b28_green_ess", 						400, 								"hat"],
	["Casco 6B28 ESS (Flora)", 				"rhs_6b28_flora_ess", 						400, 								"hat"],
	["Casco 6B28 ESS (EMR Summer)", 		"rhs_6b28_ess", 							400, 								"hat"],
	["Casco 6B47", 							"rhs_6b47", 								400, 								"hat"],
	["Casco 6B47 ESS", 						"rhs_6b47_ess", 							400, 								"hat"],
	["Casco 6B7-1M (Green)",				"rhs_6b7_1m",								400,								"hat"],
	["Casco 6B7-1M (Flora)",				"rhs_6b7_1m_flora",							400, "hat"],
	["Casco 6B7-1M (EMR Summer)",			"rhs_6b7_1m_emr", 							400, "hat"],
	["Casco 6B7-1M ESS (Green)", 			"rhs_6b7_1m_ess", 							400, "hat"],
	["Casco 6B7-1M NS-3 (Flora)",			"rhs_6b7_1m_flora_ns3", 					400, "hat"],
	["Casco 6B7-1M ESS (EMR Summer)",		"rhs_6b7_1m_emr_ess", 						400, "hat"],
	["Casco 6B7-1M (Olive)",				"rhs_6b7_1m_olive", 						400, "hat"],
	["Casco Altyn",							"rhs_altyn_novisor", 						400, "hat"],
	["Casco Altyn ESS", 					"rhs_altyn_novisor_ess", 					400, "hat"],
	["Casco Altyn (Visor Down)", 			"rhs_altyn_visordown", 						400, "hat"],
	["Casco Altyn (Visor Up)", 				"rhs_altyn", 								400, "hat"],
	["Beanie", 								"rhs_beanie_green", 						50, "hat"],
	["Beanie Flora", 						"rhs_beanie", 								50, "hat"],
	["Beret (MP)", 							"rhs_beret_mp2", 							50, "hat"],
	["Beret (VDV)", 						"rhs_beret_vdv1", 							50, "hat"],
	["Beret (VD)", 							"rhs_beret_milp", 							50, "hat"],
	["Chambergo EMR-Verano",				"rhs_Booniehat_digi", 						400, "hat"],
	["Chambergo Flora", 					"rhs_Booniehat_flora", 						400, "hat"],
	["Gorra", 								"rhs_fieldcap", 							50, "hat"],
	["Gorra EMR-desierto", 					"rhs_fieldcap_digi_des", 					50, "hat"],
	["Gorra EMR-Verano", 					"rhs_fieldcap_digi", 						50, "hat"],
	["Gorra EMR-Verano 2",					"rhs_fieldcap_digi2", 						50, "hat"],
	["Gorra Les de Montaña", 				"rhs_fieldcap_ml", 							50, "hat"],
	["Gorra Oliva", 						"rhs_fieldcap_khk", 						50, "hat"],
	["Gorra VSR", 							"rhs_fieldcap_vsr", 						50, "hat"],
	["GSSh-A-18", 							"rhs_gssh18", 								50, "hat"],
	["TSh-4", 								"rhs_tsh4", 								75, "hat"],
	["TSh-4 (ESS)", 						"rhs_tsh4_ess", 							75, "hat"],
	["Zsh-1-2", 							"rhs_zsh12", 								400, "hat"],
	["Zsh-7A Verde", 						"rhs_zsh7a_mike_green_alt", 				400, "hat"],
	["ZSh-7A (KM-35)", 						"rhs_zsh7a", 								400, "hat"],
	["Zsh-7A (KM-35) Alt", 					"rhs_zsh7a_alt", 							400, "hat"],
	["Casco MICH",							"rhsusf_mich_bare", 						400, "hat"],
	["Casco MICH Headset", 					"rhsusf_mich_bare_norotos_arc_alt", 		400, "hat"],
	["Casco MICH (Semi-Arid)", 				"rhsusf_mich_bare_semi", 					400, "hat"],
	["Casco MICH Headset (Semi-Arid)", 		"rhsusf_mich_bare_norotos_alt_semi", 		400, "hat"],
	["Casco MICH (Tan)", 					"rhsusf_mich_bare_tan", 					400, "hat"],
	["Casco MICH Headset (Tan)", 			"rhsusf_mich_bare_alt_tan", 				400, "hat"],
	["Casco MICH MARPAT (Desert)", 			"rhsusf_mich_helmet_marpatd", 				400, "hat"],
	["Casco MICH Headset MARPAT (Desert)", 	"rhsusf_mich_helmet_marpatd_headset", 		400, "hat"],
	["Casco MICH MARPAT (Woodland)",		"rhsusf_mich_helmet_marpatwd", 				400, "hat"],
	["Casco MICH Headset MARPAT (Woodland)","rhsusf_mich_helmet_marpatwd_headset", 		400, "hat"],
	["Casco ACH (Desert)", 					"rhsusf_ach_bare_des", 						400, "hat"],
	["Casco ACH Headset (Desert)", 			"rhsusf_ach_bare_des_headset_ess", 			400, "hat"],
	["Casco ACH (Woodland)", 				"rhsusf_ach_bare_wood", 					400, "hat"],
	["Casco ACH Headset (Woodland)", 		"rhsusf_ach_bare_wood_headset_ess", 		400, "hat"],
	["Casco ACH M81", 						"rhsusf_ach_helmet_M81", 					400, "hat"],
	["Casco OPC", 							"rhsusf_ach_helmet_ocp", 					400, "hat"],
	["Casco Headset OPC", 					"rhsusf_ach_helmet_headset_ess_ocp", 		400, "hat"],
	["Casco Netting OPC", 					"rhsusf_ach_helmet_camo_ocp", 				400, "hat"],
	["Casco UPC", 							"rhsusf_ach_helmet_ucp", 					400, "hat"],
	["Casco Headset UPC", 					"rhsusf_ach_helmet_headset_ess_ucp", 		400, "hat"],
	["Casco LWH M1942", 					"rhsusf_lwh_helmet_M1942", 					400, "hat"],
	["Casco LWH (Desert)", 					"rhsusf_lwh_helmet_marpatd_headset", 		400, "hat"],
	["Casco LWH (Woodland)", 				"rhsusf_lwh_helmet_marpatwd_headset", 		400, "hat"],
	["Casco FAST (AOR1)",					"rhsusf_opscore_aor1", 						400, "hat"],
	["Casco FAST Headset (AOR1)", 			"rhsusf_opscore_aor1_pelt_nsw", 			400, "hat"],
	["Casco FAST (AOR2)", 					"rhsusf_opscore_aor2", 						400, "hat"],
	["Casco FAST Headset (AOR2)", 			"rhsusf_opscore_aor2_pelt_nsw", 			400, "hat"],
	["Casco FAST (Black)", 					"rhsusf_opscore_bk_pelt", 					400, "hat"],
	["Casco FAST (Coyote)", 				"rhsusf_opscore_coy_cover_pelt", 			400, "hat"],
	["Casco FAST (Folliage Green)",			"rhsusf_opscore_fg", 						400, "hat"],
	["Casco FAST Headset (Folliage Green)", "rhsusf_opscore_fg_pelt_cam", 				400, "hat"],
	["Casco FAST (Multicam)", 				"rhsusf_opscore_mc_cover", 					400, "hat"],
	["Casco FAST Headset (Multicam)", 		"rhsusf_opscore_mc_cover_pelt_cam", 		400, "hat"],
	["Casco FAST (Multicam Paint)", 		"rhsusf_opscore_mc", 						400, "hat"],
	["Casco FAST Headset (Multicam Paint)", "rhsusf_opscore_mc_pelt_nsw", 				400, "hat"],
	["Casco FAST (Paint)", 					"rhsusf_opscore_paint", 					400, "hat"],
	["Casco FAST Headset (Paint)",			"rhsusf_opscore_paint_pelt_nsw_cam", 		400, "hat"],
	["Casco FAST (Ranger Green)",			"rhsusf_opscore_rg_cover_pelt", 			400, "hat"],
	["Casco FAST (Urban Tan)", 				"rhsusf_opscore_ut", 						400, "hat"],
	["Casco FAST Headset (Urban Tan)", 		"rhsusf_opscore_ut_pelt_nsw_cam", 			400, "hat"],
	["Casco FAST (Maritime Green)", 		"rhsusf_opscore_mar_fg_pelt", 				400, "hat"],
	["Casco FAST (Maritime Tan)", 			"rhsusf_opscore_mar_ut_pelt", 				400, "hat"],
	["Casco ACVC-H", 						"rhsusf_cvc_green_ess", 					400, "hat"],
	["Casco ACVC-H (Tan)", 					"rhsusf_cvc_ess", 							400, "hat"],
	["Pro Tech-SF", 						"rhsusf_protech_helmet_rhino_ess", 			400, "hat"],
	["Patrol Cap OPC", 						"rhsusf_patrolcap_ocp", 					50, "hat"],
	["Patrol Cap UPC", 						"rhsusf_patrolcap_ucp", 					50, "hat"],
	["Gorra de Marino (Desert)", 			"rhs_8point_marpatd", 						50, "hat"],
	["Gorra de Marino (Woodland)", 			"rhs_8point_marpatwd", 						50, "hat"],
	["Gorra Bowman Elite II", 				"rhsusf_bowman_cap", 						50, "hat"],
	["Kaska K93 Digi", 						"rhsgref_6b27m_ttsko_digi", 				400, "hat"],
	["Kaska K93 Forest", 					"rhsgref_6b27m_ttsko_forest", 				400, "hat"],
	["Kaska K93 Mountain",					"rhsgref_6b27m_ttsko_mountain", 			400, "hat"],
	["Kaska K93 Urban", 					"rhsgref_6b27m_ttsko_urban", 				400, "hat"],
	["M1 (OG-107)", 						"rhsgref_helmet_M1_bare", 					400, "hat"],
	["M1 (Painted)", 						"rhsgref_helmet_M1_painted", 				400, "hat"],
	["PASGT (ERDL)", 						"rhsgref_helmet_pasgt_erdl_rhino", 			400, "hat"],
	["PASGT (Flecktarn)", 					"rhsgref_helmet_pasgt_flecktarn", 			400, "hat"],
	["PASGT (Woodland)", 					"rhsgref_helmet_pasgt_woodland_rhino", 		400, "hat"],
	["SSh-68", 								"rhs_ssh68", 								400, "hat"],
	["SSh-68 TTsKO EMR Summer", 			"rhsgref_ssh68_emr", 						400, "hat"],
	["SSh-68 TTsKO Digi", 					"rhsgref_ssh68_ttsko_digi", 				400, "hat"],
	["SSh-68 TTsKO Forest", 				"rhsgref_ssh68_ttsko_forest", 				400, "hat"],
	["SSh-68 TTsKO Mountain", 				"rhsgref_ssh68_ttsko_mountain", 			400, "hat"],
	["SSh-68 TTsKO Urban", 					"rhsgref_ssh68_ttsko_dark", 				400, "hat"],
	["SSh-68 TTsKO VSR", 					"rhsgref_ssh68_vsr", 						400, "hat"],
	["SSh-68 UN", 							"rhsgref_ssh68_un", 						400, "hat"],
	["UN Beret", 							"rhsgref_un_beret", 						50, "hat"],
	["Gorra TTsKO Digi", 					"rhsgref_fieldcap_ttsko_digi", 				50, "hat"],
	["Gorra TTsKO Forest", 					"rhsgref_fieldcap_ttsko_forest", 			50, "hat"],
	["Gorra TTsKO Mountain", 				"rhsgref_fieldcap_ttsko_mountain", 			50, "hat"],
	["Gorra TTsKO Urban", 					"rhsgref_fieldcap_ttsko_urban", 			50, "hat"],
	["M97 Digital", 						"rhssaf_helmet_m97_digital", 				400, "hat"],
	["M97 ESS Digital", 					"rhssaf_helmet_m97_digital_black_ess_bare", 400, "hat"],
	["M97 MDU", 							"rhssaf_helmet_m97_md2camo", 				400, "hat"],
	["M97 ESS MDU", 						"rhssaf_helmet_m97_md2camo_black_ess_bare", 400, "hat"],
	["M97 Oakleaf", 						"rhssaf_helmet_m97_oakleaf", 				400, "hat"],
	["M97 ESS Oakleaf", 					"rhssaf_helmet_m97_oakleaf_black_ess_bare", 400, "hat"],
	["M97 Woodland", 						"rhssaf_helmet_m97_woodland", 				400, "hat"],
	["M97 ESS Woodland", 					"rhssaf_helmet_m97_woodland_black_ess_bare", 400, "hat"],
	["M97 Olive", 							"rhssaf_helmet_m97_olive_nocamo", 			400, "hat"],
	["M97 ESS Olive", 						"rhssaf_helmet_m97_olive_nocamo_black_ess_bare", 400, "hat"],
	["M97 Black", 							"rhssaf_helmet_m97_black_nocamo", 			400, "hat"],
	["M97 ESS Black", 						"rhssaf_helmet_m97_black_nocamo_black_ess_bare", 400, "hat"],
	["M97 UN", 								"rhssaf_helmet_m97_nostrap_blue", 			400, "hat"],
	["M97 ESS UN", 							"rhssaf_helmet_m97_nostrap_blue_tan_ess_bare", 400, "hat"],
	["M59/85 Olive", 						"rhssaf_helmet_m59_85_nocamo", 				400, "hat"],
	["M59/85 Oakleaf", 						"rhssaf_helmet_m59_85_oakleaf", 			400, "hat"],
	["Booniehat Digital", 					"rhssaf_booniehat_digital", 				50, "hat"],
	["Booniehat MDU", 						"rhssaf_booniehat_md2camo", 				50, "hat"],
	["Booniehat Woodland", 					"rhssaf_booniehat_woodland", 				50, "hat"],
	["Beret Airbone", 						"rhssaf_beret_para", 						50, "hat"],
	["Beret Army", 							"rhssaf_beret_green", 						50, "hat"],
	["Beret MP", 							"rhssaf_beret_black", 						50, "hat"],
	["Beret Recon", 						"rhssaf_beret_red", 						50, "hat"],
	["Beret UN", 							"rhssaf_beret_blue_un", 					50, "hat"],
	// Vanilla
	/*["Assassin Helmet (Black)",												"H_HelmetSpecO_blk",														75,								"hat"],
	["Assassin Helmet (Hex)",												"H_HelmetSpecO_ocamo",														75,								"hat"],
	["Assassin Helmet (G Hex)",												"H_HelmetSpecO_ghex_F",														75,								"hat"],
	["Bandana (Black)",														"H_Bandanna_gry",															10,								"hat"],
	["Bandana (Sand)",														"H_Bandanna_sand",															10,								"hat"],
	["Bandana (Surfer)",													"H_Bandanna_surfer",														10,								"hat"],
	["Bandana (Surfer,Black)",												"H_Bandanna_surfer_blk",													10,								"hat"],
	["Bandanna (Camo)",														"H_Bandanna_camo",															10,								"hat"],
	["Bandanna (Coyote)",													"H_Bandanna_cbr",															10,								"hat"],
	["Bandanna (Gray)",														"H_Bandanna_gry",															10,								"hat"],
	["Bandanna (Khaki)",													"H_Bandanna_khk",															10,								"hat"],
	["Bandanna (MTP)",														"H_Bandanna_mcamo",															10,								"hat"],
	["Bandanna (Sage)",														"H_Bandanna_sgg",															10,								"hat"],
	["Bandanna Mask (Black)",												"H_BandMask_blk",															10,								"hat"],
	["Bandanna Mask (Demon)",												"H_BandMask_demon",															10,								"hat"],
	["Bandanna Mask (Khaki)",												"H_BandMask_khk",															10,								"hat"],
	["Bandanna Mask (Reaper)",												"H_BandMask_reaper",														10,								"hat"],
	["Basic Combat Helmet (Blue)",											"H_PASGT_basic_blue_F",														25,								"hat"],
	["Basic Combat Helmet (Olive)",											"H_PASGT_basic_olive_F",													25,								"hat"],
	["Basic Combat Helmet (Press Neck Protection)",							"H_PASGT_neckprot_blue_press_F",											25,								"hat"],
	["Basic Combat Helmet (Press)",											"H_PASGT_basic_blue_press_F",												25,								"hat"],
	["Basic Combat Helmet (White)",											"H_PASGT_basic_white_F",													25,								"hat"],
	["Beanie (Black)",														"H_Watchcap_blk",															10,								"hat"],
	["Beanie (Dark blue)",													"H_Watchcap_sgg",															10,								"hat"],
	["Beanie (Dark brown)",													"H_Watchcap_cbr",															10,								"hat"],
	["Beanie (Dark green)",													"H_Watchcap_camo",															10,								"hat"],
	["Beanie (Dark khaki)",													"H_Watchcap_khk",															10,								"hat"],
	["Beret (Black)",														"H_Beret_blk",																10,								"hat"],
	["Beret (Colonel)",														"H_Beret_Colonel",															10,								"hat"],
	["Beret (Gendarmerie)",													"H_Beret_gen_F",															10,								"hat"],
	["Beret (Green)",														"H_Beret_grn",																10,								"hat"],
	["Beret (NATO)",														"H_Beret_02",																10,								"hat"],
	["Beret (Police)",														"H_Beret_blk_POLICE",														10,								"hat"],
	["Beret (RED)",															"H_Beret_ocamo",															10,								"hat"],
	["Beret (Red)",															"H_Beret_red",																10,								"hat"],
	["Beret (SAS)",															"H_Beret_brn_SF",															10,								"hat"],
	["Beret (SF)",															"H_Beret_grn_SF",															10,								"hat"],
	["Black Turban",														"H_TurbanO_blk",															50,								"hat"],
	["Bluetooth Headset",													"H_WirelessEarpiece_F",														25,								"hat"],
	["Booniehat (AAF)",														"H_Booniehat_dgtl",															10,								"hat"],
	["Booniehat (Digi)",													"H_Booniehat_dgtl",															10,								"hat"],
	["Booniehat (Dirty)",													"H_Booniehat_dirty",														10,								"hat"],
	["Booniehat (Green)",													"H_Booniehat_grn",															10,								"hat"],
	["Booniehat (Headset)",													"H_Booniehat_khk_hs",														10,								"hat"],
	["Booniehat (Khaki)",													"H_Booniehat_indp",															10,								"hat"],
	["Booniehat (Khaki)",													"H_Booniehat_khk",															10,								"hat"],
	["Booniehat (MTP)",														"H_Booniehat_mcamo",														10,								"hat"],
	["Booniehat (Olive)",													"H_Booniehat_oli",															10,								"hat"],
	["Booniehat (Sand)",													"H_Booniehat_tan",															10,								"hat"],
	["Booniehat (Tan)",														"H_Booniehat_tan",															10,								"hat"],
	["Booniehat (Tropic)",													"H_Booniehat_tna_F",														10,								"hat"],
	["Cap (BI)",															"H_Cap_grn_BI",																10,								"hat"],
	["Cap (BI)",															"H_Cap_grn_BI",																10,								"hat"],
	["Cap (Black)",															"H_Cap_blk",																10,								"hat"],
	["Cap (Blue)",															"H_Cap_blu",																10,								"hat"],
	["Cap (CMMG)",															"H_Cap_blk_CMMG",															10,								"hat"],
	["Cap (CMMG)",															"H_Cap_blk_CMMG",															10,								"hat"],
	["Cap (Green)",															"H_Cap_grn",																10,								"hat"],
	["Cap (ION)",															"H_Cap_blk_ION",															10,								"hat"],
	["Cap (ION)",															"H_Cap_blk_ION",															10,								"hat"],
	["Cap (Olive)",															"H_Cap_oli",																10,								"hat"],
	["Cap (Olive,Headset)",													"H_Cap_oli_hs",																10,								"hat"],
	["Cap (Police)",														"H_Cap_police",																10,								"hat"],
	["Cap (Press)",															"H_Cap_press",																10,								"hat"],
	["Cap (Raven Security)",												"H_Cap_blk_Raven",															10,								"hat"],
	["Cap (Red)",															"H_Cap_red",																10,								"hat"],
	["Cap (SAS)",															"H_Cap_khaki_specops_UK",													10,								"hat"],
	["Cap (SF)",															"H_Cap_tan_specops_US",														10,								"hat"],
	["Cap (SPECOPS)",														"H_Cap_brn_SPECOPS",														10,								"hat"],
	["Cap (Surfer)",														"H_Cap_surfer",																10,								"hat"],
	["Cap (Tan)",															"H_Cap_tan",																10,								"hat"],
	["Combat Helmet",														"H_HelmetB",																50,								"hat"],
	["Combat Helmet (Black)",												"H_HelmetB_black",															50,								"hat"],
	["Combat Helmet (Camonet)",												"H_HelmetB_camo",															50,								"hat"],
	["Combat Helmet (Desert)",												"H_HelmetB_desert",															50,								"hat"],
	["Combat Helmet (Grass)",												"H_HelmetB_grass",															50,								"hat"],
	["Combat Helmet (Sand)",												"H_HelmetB_sand",															50,								"hat"],
	["Combat Helmet (Snakeskin)",											"H_HelmetB_snakeskin",														50,								"hat"],
	["Combat Helmet (Tropic)",												"H_HelmetB_tna_F",															50,								"hat"],
	["Contstruction Helmet (Black EarPro)",									"H_Construction_earprot_black_F",											25,								"hat"],
	["Contstruction Helmet (Black Headset)",								"H_Construction_headset_black_F",											25,								"hat"],
	["Contstruction Helmet (Black)",										"H_Construction_basic_black_F",												25,								"hat"],
	["Contstruction Helmet (Orange EarPro)",								"H_Construction_earprot_orange_F",											25,								"hat"],
	["Contstruction Helmet (Orange Headset)",								"H_Construction_headset_orange_F",											25,								"hat"],
	["Contstruction Helmet (Orange)",										"H_Construction_basic_orange_F",											25,								"hat"],
	["Contstruction Helmet (Red EarPro)",									"H_Construction_earprot_red_F",												25,								"hat"],
	["Contstruction Helmet (Red Headset)",									"H_Construction_headset_red_F",												25,								"hat"],
	["Contstruction Helmet (Red)",											"H_Construction_basic_red_F",												25,								"hat"],
	["Contstruction Helmet (Vrana EarPro)",									"H_Construction_earprot_vrana_F",											25,								"hat"],
	["Contstruction Helmet (Vrana Headset)",								"H_Construction_headset_vrana_F",											25,								"hat"],
	["Contstruction Helmet (Vrana)",										"H_Construction_basic_vrana_F",												25,								"hat"],
	["Contstruction Helmet (White EarPro)",									"H_Construction_earprot_white_F",											25,								"hat"],
	["Contstruction Helmet (White Headset)",								"H_Construction_headset_white_F",											25,								"hat"],
	["Contstruction Helmet (White)",										"H_Construction_basic_white_F",												25,								"hat"],
	["Contstruction Helmet (Yellow EarPro)",								"H_Construction_earprot_yellow_F",											25,								"hat"],
	["Contstruction Helmet (Yellow Headset)",								"H_Construction_headset_yellow_F",											25,								"hat"],
	["Contstruction Helmet (Yellow)",										"H_Construction_basic_yellow_F",											25,								"hat"],
	["Crew Helmet (AAF)",													"H_HelmetCrew_I",															50,								"hat"],
	["Crew Helmet (CSAT)",													"H_HelmetCrew_O",															50,								"hat"],
	["Crew Helmet (G Hex)",													"H_HelmetCrew_O_ghex_F",													50,								"hat"],
	["Crew Helmet (NATO)",													"H_HelmetCrew_B",															50,								"hat"],
	["Defender Helmet (G Hex)",												"H_HelmetLeaderO_ghex_F",													100,							"hat",								"noDLC"],
	["Defender Helmet (Hex)",												"H_HelmetLeaderO_ocamo",													100,							"hat"],
	["Defender Helmet (Urban)",												"H_HelmetLeaderO_oucamo",													100,							"hat"],
	["Ear Protection (Black)",												"H_EarProtectors_black_F",													25,								"hat"],
	["Ear Protection (Orange)",												"H_EarProtectors_orange_F",													25,								"hat"],
	["Ear Protection (Red)",												"H_EarProtectors_red_F",													25,								"hat"],
	["Ear Protection (White)",												"H_EarProtectors_white_F",													25,								"hat"],
	["Ear Protection (Yellow)",												"H_EarProtectors_yellow_F",													25,								"hat"],
	["Enhanced Combat Helmet",												"H_HelmetSpecB",															75,								"hat"],
	["Enhanced Combat Helmet (Black)",										"H_HelmetSpecB_blk",														75,								"hat"],
	["Enhanced Combat Helmet (Desert)",										"H_HelmetSpecB_paint2",														75,								"hat"],
	["Enhanced Combat Helmet (Grass)",										"H_HelmetSpecB_paint1",														75,								"hat"],
	["Enhanced Combat Helmet (Sand)",										"H_HelmetSpecB_sand",														75,								"hat"],
	["Enhanced Combat Helmet (Snakeskin)",									"H_HelmetSpecB_snakeskin",													75,								"hat"],
	["Enhanced Combat Helmet (Tropic)",										"H_HelmetB_Enh_tna_F",														75,								"hat",								"noDLC"],
	["Fedora (Blue)",														"H_Hat_blue",																10,								"hat"],
	["Fedora (Brown)",														"H_Hat_brown",																10,								"hat"],
	["Fedora (Camo)",														"H_Hat_camo",																10,								"hat"],
	["Fedora (Checker)",													"H_Hat_checker",															10,								"hat"],
	["Fedora (Gray)",														"H_Hat_grey",																10,								"hat"],
	["Fedora (Tan)",														"H_Hat_tan",																10,								"hat"],
	["Hat (IDAP Black)",													"H_Cap_Black_IDAP_F",														25,								"hat"],
	["Hat (IDAP Orange)",													"H_Cap_Orange_IDAP_F",														25,								"hat"],
	["Hat (IDAP WHite)",													"H_Cap_White_IDAP_F",														25,								"hat"],
	["Headbandage (Bloody)",												"H_HeadBandage_bloody_F",													25,								"hat"],
	["Headbandage (Clean)",													"H_HeadBandage_clean_F",													25,								"hat"],
	["Headbandage (Stained)",												"H_HeadBandage_stained_F",													25,								"hat"],
	["Headset (Black)",														"H_HeadSet_black_F",														25,								"hat"],
	["Headset (Orange)",													"H_HeadSet_orange_F",														25,								"hat"],
	["Headset (Red)",														"H_HeadSet_red_F",															25,								"hat"],
	["Headset (White)",														"H_HeadSet_white_F",														25,								"hat"],
	["Headset (Yellow)",													"H_HeadSet_yellow_F",														25,								"hat"],
	["Heli Crew Helmet (AAF)",												"H_CrewHelmetHeli_I",														50,								"hat"],
	["Heli Crew Helmet (CSAT)",												"H_CrewHelmetHeli_O",														50,								"hat"],
	["Heli Crew Helmet (G Hex)",											"H_HelmetCrew_O_ghex_F",													50,								"hat"],
	["Heli Crew Helmet (NATO)",												"H_CrewHelmetHeli_B",														50,								"hat"],
	["Heli Pilot Helmet (AAF)",												"H_PilotHelmetHeli_I",														50,								"hat"],
	["Heli Pilot Helmet (CSAT)",											"H_PilotHelmetHeli_O",														50,								"hat"],
	["Heli Pilot Helmet (NATO)",											"H_PilotHelmetHeli_B",														50,								"hat"],
	["Light Combat Helmet",													"H_HelmetB_light",															30,								"hat"],
	["Light Combat Helmet (Black)",											"H_HelmetB_light_black",													30,								"hat"],
	["Light Combat Helmet (Desert)",										"H_HelmetB_light_desert",													30,								"hat"],
	["Light Combat Helmet (Grass)",											"H_HelmetB_light_grass",													30,								"hat"],
	["Light Combat Helmet (Sand)",											"H_HelmetB_light_sand",														30,								"hat"],
	["Light Combat Helmet (Snakeskin)",										"H_HelmetB_light_snakeskin",												30,								"hat"],
	["Light Combat Helmet (Tropic)",										"H_HelmetB_Light_tna_F",													30,								"hat"],
	["MICH (Camo)",															"H_HelmetIA_net",															50,								"hat"],
	["MICH 2 (Camo)",														"H_HelmetIA_camo",															50,								"hat"],
	["Military Cap (AAF)",													"H_MilCap_dgtl",															25,								"hat"],
	["Military Cap (Blue)",													"H_MilCap_blue",															25,								"hat"],
	["Military Cap (Gray)",													"H_MilCap_gry",																25,								"hat"],
	["Military Cap (Hex)",													"H_MilCap_ocamo",															25,								"hat"],
	["Military Cap (MTP)",													"H_MilCap_mcamo",															25,								"hat"],
	["Military Cap (Russia)",												"H_MilCap_rucamo",															25,								"hat"],
	["Military Cap (Tropic)",												"H_MilCap_tna_F",															25,								"hat"],
	["Military Cap (Urban)",												"H_MilCap_oucamo",															25,								"hat"],
	["Modular Helmet (Digi)",												"H_HelmetIA",																50,								"hat"],
	["Pilot Helmet (AAF)",													"H_PilotHelmetFighter_I",													50,								"hat"],
	["Pilot Helmet (CSAT)",													"H_PilotHelmetFighter_O",													50,								"hat"],
	["Pilot Helmet (NATO)",													"H_PilotHelmetFighter_B",													50,								"hat"],
	["Protector Helmet (Hex)",												"H_HelmetO_ocamo",															60,								"hat"],
	["Protector Helmet (G Hex)",											"H_HelmetO_ghex_F",															60,								"hat"],
	["Protector Helmet (Urban)",											"H_HelmetO_oucamo",															60,								"hat"],
	["Racing Helmet (Black)",												"H_RacingHelmet_1_black_F",													25,								"hat"],
	["Racing Helmet (Blue)",												"H_RacingHelmet_1_blue_F",													25,								"hat"],
	["Racing Helmet (Bluking)",												"H_RacingHelmet_2_F",														25,								"hat"],
	["Racing Helmet (Fuel)",												"H_RacingHelmet_1_F",														25,								"hat"],
	["Racing Helmet (Green)",												"H_RacingHelmet_1_green_F",													25,								"hat"],
	["Racing Helmet (Orange)",												"H_RacingHelmet_1_orange_F",												25,								"hat"],
	["Racing Helmet (Red)",													"H_RacingHelmet_1_red_F",													25,								"hat"],
	["Racing Helmet (Redstone)",											"H_RacingHelmet_3_F",														25,								"hat"],
	["Racing Helmet (Vrana)",												"H_RacingHelmet_4_F",														25,								"hat"],
	["Racing Helmet (White)",												"H_RacingHelmet_1_white_F",													25,								"hat"],
	["Racing Helmet (Yellow)",												"H_RacingHelmet_1_yellow_F",												25,								"hat"],
	["Rangemaster Cap",														"H_Cap_headphones",															25,								"hat"],
	["Safari Hat (Olive)",													"H_Hat_Safari_olive_F",														25,								"hat"],
	["Safari Hat (Sand)",													"H_Hat_Safari_sand_F",														25,								"hat"],
	["Shemag (Brown)",														"H_ShemagOpen_tan",															25,								"hat"],
	["Shemag (Olive)",														"H_Shemag_olive",															25,								"hat"],
	["Shemag (Olive,Headset)",												"H_Shemag_olive_hs",														25,								"hat"],
	["Shemag (White)",														"H_ShemagOpen_khk",															25,								"hat"],
	["Shemag mask (Khaki)",													"H_Shemag_khk",																25,								"hat"],
	["Shemag mask (Olive)",													"H_Shemag_olive",															25,								"hat"],
	["Shemag mask (Tan)",													"H_Shemag_tan",																25,								"hat"],*/
	["Special Purposes Hemet (Green Hex)",									"H_HelmetO_ViperSP_ghex_F",													8000],
	["Special Purposes Hemet (Hex)",										"H_HelmetO_ViperSP_hex_F",													8000],
	["Stealth Combat Helmet",												"H_HelmetB_TI_tna_F",														500],
	["Stealth Combat Helmet",												"H_HelmetB_TI_tna_F",														75,								"hat"]
];

uniformArray = compileFinal str
[
	/*["Bandit Clothes 1",													"U_I_C_Soldier_Bandit_1_F",												25],
	["Bandit Clothes 2",													"U_I_C_Soldier_Bandit_2_F",												25],
	["Bandit Clothes 3",													"U_I_C_Soldier_Bandit_3_F",												25],
	["Bandit Clothes 4",													"U_I_C_Soldier_Bandit_4_F",												25],
	["Bandit Clothes 5",													"U_I_C_Soldier_Bandit_5_F",												25],
	["CTRG Combat Uniform (Rolled-up)",										"U_B_CTRG_3",															25,								"uni"],
	["CTRG Combat Uniform (Tee)",											"U_B_CTRG_2",															25,								"uni"],
	["CTRG Combat Uniform",													"U_B_CTRG_1",															25,								"uni"],
	["CTRG Stealth Uniform",												"U_B_CTRG_Soldier_F",													10000,							"uni"],
	["Combat Fatigues (Gangsta)",											"U_I_G_resistanceLeader_F",												25,								"uni"],
	["Combat Fatigues (Rolled-up)",											"U_I_CombatUniform_shortsleeve",										25,								"uni"],
	["Combat Fatigues (Tee)",												"U_B_CombatUniform_mcam_tshirt",										25,								"uni"],
	["Combat Fatigues (Tropic)",											"U_B_T_Soldier_F",														25,								"uni","noDLC"],
	["Construction Uniform (Black)",										"U_C_ConstructionCoverall_Black_F",										25,								"uni"],
	["Construction Uniform (Blue)",											"U_C_ConstructionCoverall_Blue_F",										25,								"uni"],
	["Construction Uniform (Red)",											"U_C_ConstructionCoverall_Red_F",										25,								"uni"],
	["Construction Uniform (Vrana)",										"U_C_ConstructionCoverall_Vrana_F",										25,								"uni"],
	["Default Uniform (AAF)",												"U_I_CombatUniform",													25,								"uni"],
	["Default Uniform (CSAT)",												"U_O_OfficerUniform_ocamo",												25,								"uni"],
	["Light Fatigues (CSAT)",												"U_O_officer_noInsignia_hex_F",											25,								"uni"],
	["Default Uniform (G hex)",												"U_O_T_Officer_F",														25,								"uni"],
	["Default Uniform (NATO)",												"U_B_CombatUniform_mcam",												25,								"uni"],
	["Fatigues (G Hex)",													"U_O_T_Soldier_F",														50,								"uni","noDLC"],
	["Fatigues (Hex)",														"U_O_CombatUniform_ocamo",												50,								"uni"],
	["Fatigues (Urban)",													"U_O_CombatUniform_oucamo",												50,								"uni"],
	["Full Ghillie (NATO-Arid)",											"U_B_FullGhillie_ard",													12500,							"uni"],
	["Full Ghillie (AAF-Arid)",												"U_I_FullGhillie_ard",													12500,							"uni"],
	["Full Ghillie (CSAT-Arid)",											"U_O_FullGhillie_ard",													12500,							"uni"],
	["Full Ghillie (NATO-Jungle)",											"U_B_T_FullGhillie_tna_F",												12500,							"uni"],
	["Full Ghillie (CSAT-Jungle)",											"U_O_T_FullGhillie_tna_F",												12500,							"uni"],
	["Full Ghillie (NATO-Lush)",											"U_B_FullGhillie_lsh",													12500,							"uni"],
	["Full Ghillie (AAF-Lush)",												"U_I_FullGhillie_lsh",													12500,							"uni"],
	["Full Ghillie (CSAT-Lush)",											"U_O_FullGhillie_lsh",													12500,							"uni"],
	["Full Ghillie (NATO-Semi-Arid)",										"U_B_FullGhillie_sard",													12500,							"uni"],
	["Full Ghillie (AAF-Semi-Arid)",										"U_I_FullGhillie_sard",													12500,							"uni"],
	["Full Ghillie (CSAT-Semi-Arid)",										"U_O_FullGhillie_sard",													12500,							"uni"],
	["Gendarmerie Commander",												"U_B_GEN_Commander_F",													25],
	["Gendarmerie",															"U_B_GEN_Soldier_F",													25],
	["Geurilla Uniform 2",													"U_BG_Guerilla1_2_F",													25,								"uni"],
	["Guerilla Apparel",													"U_BG_Guerrilla_6_1",													25,								"uni"],
	["Guerilla Apparel",													"U_IG_Guerrilla_6_1",													25,								"uni"],
	["Guerilla Apparel",													"U_OG_Guerrilla_6_1",													25,								"uni"],
	["Guerilla Garment",													"U_BG_Guerilla1_1",														25,								"uni"],// BLUFOR
	["Guerilla Garment",													"U_IG_Guerilla1_1",														25,								"uni"],// Independent
	["Guerilla Garment",													"U_OG_Guerilla1_1",														25,								"uni"],// OPFOR
	["Guerilla Outfit (Pattern)",											"U_BG_Guerilla2_2",														25,								"uni"],
	["Guerilla Outfit (Pattern)",											"U_IG_Guerilla2_2",														25,								"uni"],
	["Guerilla Outfit (Pattern)",											"U_OG_Guerilla2_2",														25,								"uni"],
	["Guerilla Outfit (Plain,Dark)",										"U_BG_Guerilla2_1",														25,								"uni"],
	["Guerilla Outfit (Plain,Dark)",										"U_IG_Guerilla2_1",														25,								"uni"],
	["Guerilla Outfit (Plain,Dark)",										"U_OG_Guerilla2_1",														25,								"uni"],
	["Guerilla Outfit (Plain,Light)",										"U_BG_Guerilla2_3",														25,								"uni"],
	["Guerilla Outfit (Plain,Light)",										"U_IG_Guerilla2_3",														25,								"uni"],
	["Guerilla Outfit (Plain,Light)",										"U_OG_Guerilla2_3",														25,								"uni"],
	["Guerilla Smocks",														"U_BG_Guerilla3_1",														25,								"uni"],
	["Guerilla Smocks",														"U_IG_Guerilla3_1",														25,								"uni"],
	["Guerilla Smocks",														"U_OG_Guerilla3_1",														25,								"uni"],
	["Guerilla Uniform",													"U_BG_leader",															25,								"uni"],
	["Guerilla Uniform",													"U_IG_leader",															25,								"uni"],
	["Guerilla Uniform",													"U_OG_leader",															25,								"uni"],
	["Heli Pilot Coveralls",												"U_B_HeliPilotCoveralls",												25,								"uni"],
	["Heli Pilot Coveralls",												"U_I_HeliPilotCoveralls",												25,								"uni"],
	["IDAP Cargo Pants",													"U_C_IDAP_Man_cargo_F",													25,								"uni"],
	["IDAP Casual",															"U_C_IDAP_Man_casual_F",												25,								"uni"],
	["IDAP Jeans",															"U_C_IDAP_Man_Jeans_F",													25,								"uni"],
	["IDAP Shorts",															"U_C_IDAP_Man_shorts_F",												25,								"uni"],
	["IDAP T-Shirt and Shorts",												"U_C_IDAP_Man_TeeShorts_F",												25,								"uni"],
	["IDAP T-shirt",														"U_C_IDAP_Man_Tee_F",													25,								"uni"],
	["Light Ghillie (Jungle)",												"U_B_T_Sniper_F",														200,							"uni"],
	["Light Ghillie (Jungle)",												"U_O_T_Sniper_F",														200,							"uni"],
	["Light Ghillie",														"U_B_GhillieSuit",														200,							"uni"],
	["Light Ghillie",														"U_I_GhillieSuit",														200,							"uni"],
	["Light Ghillie",														"U_O_GhillieSuit",														200,							"uni"],
	["Mechanic Clothes",													"U_C_Mechanic_01_F",													25,								"uni"],
	["Officer Fatigues",													"U_I_OfficerUniform",													25,								"uni"],
	["Paramedic",															"U_C_Paramedic_01_F",													25,								"uni"],
	["Paramilitary Garb 1",													"U_I_C_Soldier_Para_1_F",												25],
	["Paramilitary Garb 2",													"U_I_C_Soldier_Para_2_F",												25],
	["Paramilitary Garb 3",													"U_I_C_Soldier_Para_3_F",												25],
	["Paramilitary Garb 4",													"U_I_C_Soldier_Para_4_F",												25],
	["Paramilitary Garb 5",													"U_I_C_Soldier_Para_5_F",												25],
	["Pilot Coveralls",														"U_B_PilotCoveralls",													25,								"uni"],
	["Pilot Coveralls",														"U_I_pilotCoveralls",													25,								"uni"],
	["Pilot Coveralls",														"U_O_PilotCoveralls",													25,								"uni"],
	["Polo (Blue/green)",													"U_C_Poloshirt_stripped",												25,								"uni"],
	["Polo (Burgundy)",														"U_C_Poloshirt_burgundy",												25,								"uni"],
	["Polo (Competitor)",													"U_Competitor",															25,								"uni"],
	["Polo (Navy)",															"U_C_Poloshirt_blue",													25,								"uni"],
	["Polo (Rangemaster)",													"U_Rangemaster",														25,								"uni"],
	["Polo (Red/white)",													"U_C_Poloshirt_redwhite",												25,								"uni"],
	["Polo (Salmon)",														"U_C_Poloshirt_salmon",													25,								"uni"],
	["Polo (Tri-color)",													"U_C_Poloshirt_tricolour",												25,								"uni"],
	["Racing Suit (Black)",													"U_C_Driver_1_black",													25,								"uni"],
	["Racing Suit (Blue)",													"U_C_Driver_1_blue",													25,								"uni"],
	["Racing Suit (Bluking)",												"U_C_Driver_2",															25,								"uni"],
	["Racing Suit (Fuel)",													"U_C_Driver_1",															25,								"uni"],
	["Racing Suit (Green)",													"U_C_Driver_1_green",													25,								"uni"],
	["Racing Suit (Orange)",												"U_C_Driver_1_orange",													25,								"uni"],
	["Racing Suit (Red)",													"U_C_Driver_1_red",														25,								"uni"],
	["Racing Suit (Redstone)",												"U_C_Driver_3",															25,								"uni"],
	["Racing Suit (Vrana)",													"U_C_Driver_4",															25,								"uni"],
	["Racing Suit (White)",													"U_C_Driver_1_white",													25,								"uni"],
	["Racing Suit (Yellow)",												"U_C_Driver_1_yellow",													25,								"uni"],
	["Recon Fatigues (MTP)",												"U_B_CombatUniform_mcam_vest",											25,								"uni"],
	["Special Purpose Suit (G Hex)",										"U_O_V_Soldier_Viper_F",												15000,							"uni"],
	["Special Purpose Suit (Hex)",											"U_O_V_Soldier_Viper_hex_F",											15000,							"uni"],
	["Survival Fatigues (NATO)",											"U_B_survival_uniform",													200,							"uni"],
	["Syndikat Uniform",													"U_I_C_Soldier_Camo_F",													25],
	["T-Shirt (Blue)",														"U_C_Poor_1",															25,								"uni"],*/
	/*
	["Tron Light Suit (Blue)",												"U_B_Protagonist_VR",													5000,							"uni"],
	["Tron Light Suit (Green)",												"U_I_Protagonist_VR",													5000,							"uni"],
	["Tron Light Suit (Red)",												"U_O_Protagonist_VR",													5000,							"uni"],
	*/
	["Wetsuit",																"U_B_Wetsuit",															200,							"uni"],
	["Wetsuit",																"U_I_Wetsuit",															200,							"uni"],
	["Wetsuit",																"U_O_Wetsuit",															200,							"uni"],
	/*["Worker Coveralls",													"U_C_WorkerCoveralls",													25,								"uni"],*/
	
	["EMR Desierto VDV", "rhs_uniform_vdv_emr_des", 400, "uni"],
	["EMR Verano VDV", "rhs_uniform_vdv_emr", 400, "uni"],
	["Flora RVA", "rhs_uniform_rva_flora", 400, "uni"],
	["Flora (Alternativo)", "rhs_uniform_flora_patchless_alt", 400, "uni"],
	["Flora de Montaña", "rhs_uniform_mflora_patchless", 400, "uni"],
	["GORKA-R (Green)", "rhs_uniform_gorka_r_g", 400, "uni"],
	["GORKA-R (Yellow)", "rhs_uniform_gorka_r_y", 400, "uni"],
	["Uniform Izlom", "rhs_uniform_mvd_izlom", 400, "uni"],
	["M88", "rhs_uniform_m88_patchless", 400, "uni"],
	["DF-15-2", "rhs_uniform_df15", 400, "uni" ],
	["DF-15-2 (Tan)", "rhs_uniform_df15_tan", 400, "uni"],
	["Combat Uniform OCP MTP", "rhs_uniform_cu_ocp_101st", 400, "uni"],
	["Combat Uniform UCP Urban", "rhs_uniform_cu_ucp_82nd", 400, "uni"],
	["FROG MARPAT-D", "rhs_uniform_FROG01_d", 400, "uni"],
	["FROG MARPAT-WD", "rhs_uniform_FROG01_wd", 400, "uni"],
	["G3 (Black)", "rhs_uniform_g3_blk", 400, "uni"],
	["G3 (M81)", "rhs_uniform_g3_m81", 400, "uni"],
	["G3 (Multicam)", "rhs_uniform_g3_mc", 400, "uni"],
	["G3 (Ranger)", "rhs_uniform_g3_rgr", 400, "uni"],
	["G3 (Tan)", "rhs_uniform_g3_tan", 400, "uni"],
	["M10 (Mountain)", "rhsgref_uniform_para_ttsko_mountain", 400, "uni"],
	["M10 (OxBlood)", "rhsgref_uniform_para_ttsko_oxblood", 400, "uni"],
	["M10 (Urban)", "rhsgref_uniform_para_ttsko_urban", 400, "uni"],
	["M88 (VSR)", "rhsgref_uniform_vsr", 400, "uni"],
	["M88 (Forest)", "rhsgref_uniform_ttsko_forest", 400, "uni"],
	["M88 (Mountain)", "rhsgref_uniform_ttsko_mountain", 400, "uni"],
	["M88 (Urban)", "rhsgref_uniform_ttsko_urban", 400, "uni"],
	["M93 (Tiger Stripe)", "rhsgref_uniform_tigerstripe", 400, "uni"],
	["M93 (Woodland)", "rhsgref_uniform_woodland", 400, "uni"],
	["M93 (Woodland Olive)", "rhsgref_uniform_woodland_olive", 400, "uni"],
	["M93 (Appleflage)", "rhsgref_uniform_alpenflage", 400, "uni"],
	["M93 (Flecktarn)", "rhsgref_uniform_flecktarn_full", 400, "uni"],
	["M93 (Flecktarn Jacket)", "rhsgref_uniform_flecktarn", 400, "uni"],
	["M93 (Urban Reed)", "rhsgref_uniform_reed", 400, "uni"],
	["M93 (ERDL)", "rhsgref_uniform_ERDL", 400, "uni"],
	["Spectre SKWO", "rhsgref_uniform_specter", 400, "uni"],
	["M10 (Digital)", "rhssaf_uniform_m10_digital", 400, "uni"],
	["M10 (Digital Summer)", "rhssaf_uniform_m10_digital_summer", 400, "uni"],
	["M10 (Digital Desert)", "rhssaf_uniform_m10_digital_desert", 400, "uni"],
	["M93 (Oakleaf)", "rhssaf_uniform_m93_oakleaf", 400, "uni"],
	["M93 (Oakleaf Summer)", "rhssaf_uniform_m93_oakleaf_summer", 400, "uni"]
];

vestArray = compileFinal str
[
	/*["Carrier GL Rig (Black)",												"V_PlateCarrierGL_blk",													-1,							"vest"],
	["Carrier GL Rig (Green)",												"V_PlateCarrierGL_rgr",													-1,							"vest"],
	["Carrier GL Rig (MTP)",												"V_PlateCarrierGL_mtp",													-1,							"vest"],
	["Carrier GL Rig (Tropic)",												"V_PlateCarrierGL_tna_F",												-1,							"vest",							"noDLC"],
	["Carrier Lite (Black)",												"V_PlateCarrier1_blk",													-1,							"vest"],
	["Carrier Lite (CTRG)",													"V_PlateCarrierL_CTRG",													-1,							"vest"],
	["Carrier Lite (Green No Flag)",										"V_PlateCarrier1_rgr_noflag_F",											-1,							"vest"],
	["Carrier Lite (Green)",												"V_PlateCarrier1_rgr",													-1,							"vest"],
	["Carrier Lite (Tropic)",												"V_PlateCarrier1_tna_F",												-1,							"vest",							"noDLC"],
	["Carrier Rig (Black)",													"V_PlateCarrier2_blk",													-1,							"vest"],
	["Carrier Rig (CTRG)",													"V_PlateCarrierH_CTRG",													-1,							"vest"],
	["Carrier Rig (Green)",													"V_PlateCarrier2_rgr",													-1,							"vest"],
	["Carrier Rig (Tropic)",												"V_PlateCarrier2_tna_F",												-1,							"vest",							"noDLC"],
	["Carrier Special Rig (Black)",											"V_PlateCarrierSpec_blk",												-1,							"vest"],
	["Carrier Special Rig (Green)",											"V_PlateCarrierSpec_rgr",												-1,							"vest"],
	["Carrier Special Rig (MTP)",											"V_PlateCarrierSpec_mtp",												-1,							"vest"],
	["Carrier Special Rig (Tropic)",										"V_PlateCarrierSpec_tna_F",												-1,							"vest",							"noDLC"],
	["Chest Rig (Green)",													"V_Chestrig_rgr",														-1,							"vest"],
	["Chest Rig (Khaki)",													"V_Chestrig_khk",														-1,							"vest"],
	["Deck Crew Vest (Blue)",												"V_DeckCrew_blue_F",													-1,							"vest"],
	["Deck Crew Vest (Brown)",												"V_DeckCrew_brown_F",													-1,							"vest"],
	["Deck Crew Vest (Green)",												"V_DeckCrew_green_F",													-1,							"vest"],
	["Deck Crew Vest (Red)",												"V_DeckCrew_red_F",														-1,							"vest"],
	["Deck Crew Vest (Violet)",												"V_DeckCrew_violet_F",													-1,							"vest"],
	["Deck Crew Vest (White)",												"V_DeckCrew_white_F",													-1,							"vest"],
	["Deck Crew Vest (Yellow)",												"V_DeckCrew_yellow_F",													-1,							"vest"],
	["ELBV Harness (Gray)",													"V_HarnessOSpec_gry",													-1,							"vest"],
	["ELBV Harness (Green Hex)",											"V_HarnessO_ghex_F",													-1,							"vest"],
	["ELBV Harness",														"V_HarnessOSpec_brn",													-1,							"vest"],
	["EOD Vest (Blue IDAP)",												"V_EOD_IDAP_blue_F",													-1,							"vest"],
	["EOD Vest (Blue)",														"V_EOD_blue_F",															-1,							"vest"],
	["EOD Vest (Coyote)",													"V_EOD_coyote_F",														-1,							"vest"],
	["EOD Vest (Ollive)",													"V_EOD_olive_F",														-1,							"vest"],
	["Fighter Chestrig (Black)",											"V_Chestrig_blk",														-1,							"vest"],
	["Fighter Chestrig (Olive)",											"V_Chestrig_oli",														-1,							"vest"],
	["Fleece Vest (Black)",													"V_Pocketed_black_F",													-1,							"vest"],
	["Fleece Vest (Coyote)",												"V_Pocketed_coyote_F",													-1,							"vest"],
	["Fleece Vest (Olive)",													"V_Pocketed_olive_F",													-1,							"vest"],
	["GA Carrier GL Rig (Digi)",											"V_PlateCarrierIAGL_dgtl",												-1,							"vest"],
	["GA Carrier GL Rig (Olive)",											"V_PlateCarrierIAGL_oli",												-1,							"vest"],
	["GA Carrier Lite (Digi)",												"V_PlateCarrierIA1_dgtl",												-1,							"vest"],
	["GA Carrier Rig (Digi)",												"V_PlateCarrierIA2_dgtl",												-1,							"vest"],
	["Gendarmerie Vest",													"V_TacVest_gen_F",														-1,							"vest"],
	["Identification Vest (IDAP)",											"V_Plain_crystal_F",													-1,							"vest"],
	["Identification Vest (Medic)",											"V_Plain_medical_F",													-1,							"vest"],
	["LBV Grenadier Harness (Gray)",										"V_HarnessOGL_gry",														-1,							"vest"],
	["LBV Grenadier Harness (Green Hex)",									"V_HarnessOGL_ghex_F",													-1,							"vest"],
	["LBV Grenadier Harness",												"V_HarnessOGL_brn",														-1,							"vest"],
	["LBV Harness (Gray)",													"V_HarnessO_gry",														-1,							"vest"],
	["LBV Harness",															"V_HarnessO_brn",														-1,							"vest"],
	["Legstrap (Black)",													"V_LegStrapBag_black_F",												-1,							"vest"],
	["Legstrap (Coyote)",													"V_LegStrapBag_coyote_F",												-1,							"vest"],
	["Legstrap (Ollive)",													"V_LegStrapBag_olive_F",												-1,							"vest"],
	["Press Vest",															"V_Press_F",															-1,							"vest"],
	["Raven Night Vest",													"V_TacVestIR_blk",														-1,							"vest"],*/
	["Rebreather (AAF)",													"V_RebreatherIA",														200,						"vest"],
	["Rebreather (CSAT)",													"V_RebreatherIR",														200,						"vest"],
	["Rebreather (NATO)",													"V_RebreatherB",														200,						"vest"],
	/*["Safety Vest (Blue)",													"V_Safety_blue_F",														-1,							"vest"],
	["Safety Vest (Orange)",												"V_Safety_orange_F",													-1,							"vest"],
	["Safety Vest (Yellow)",												"V_Safety_yellow_F",													-1,							"vest"],
	["Slash Bandolier (Black)",												"V_BandollierB_blk",													-1,							"vest"],
	["Slash Bandolier (Coyote)",											"V_BandollierB_cbr",													-1,							"vest"],
	["Slash Bandolier (Green Hex)",											"V_BandollierB_ghex_F",													-1,							"vest"],
	["Slash Bandolier (Green)",												"V_BandollierB_rgr",													-1,							"vest"],
	["Slash Bandolier (Khaki)",												"V_BandollierB_khk",													-1,							"vest"],
	["Slash Bandolier (Olive)",												"V_BandollierB_oli",													-1,							"vest"],
	["Tactical Chest Rig (Coyote)",											"V_TacChestrig_cbr_F",													-1,							"vest"],
	["Tactical Chest Rig (Green)",											"V_TacChestrig_grn_F",													-1,							"vest"],
	["Tactical Chest Rig (Olive)",											"V_TacChestrig_oli_F",													-1,							"vest"],
	["Tactical Vest (Black)",												"V_TacVest_blk",														-1,							"vest"],
	["Tactical Vest (Brown)",												"V_TacVest_brn",														-1,							"vest"],
	["Tactical Vest (Camo)",												"V_TacVest_camo",														-1,							"vest"],
	["Tactical Vest (Khaki)",												"V_TacVest_khk",														-1,							"vest"],
	["Tactical Vest (Olive)",												"V_TacVest_oli",														-1,							"vest"],
	["Tactical Vest (Police)",												"V_TacVest_blk_POLICE",													-1,							"vest"],*/
	["6B13 Flora", "rhs_6b13_flora", -1, "vest"],
	["6B13 EMR Summer", "rhs_6b13_emr", -1, "vest"],
	["6B13 VSR", "rhs_6b13", -1, "vest"],
	["6B13 (6sh92/VOG) Flora", "rhs_6b13_Flora_6sh92_vog", -1, "vest"],
	["6B13 (6sh92/VOG) EMR Summer", "rhs_6b13_emr_6sh92_vog", -1, "vest"],
	["6B13 (6sh92/VOG) VSR", "rhs_6b13_6sh92_vog", -1, "vest"],
	["6B23 Flora", "rhs_6b23", -1, "vest"],
	["6B23 EMR Summer", "rhs_6b23_digi", -1, "vest"],
	["6B23 (Rifleman) Flora", "rhs_6b23_rifleman", -1, "vest"],
	["6B23 (Rifleman) EMR Summer", "rhs_6b23_digi_rifleman", -1, "vest"],
	["6B23 (6sh92/VOG) Flora", "rhs_6b23_6sh92_vog", -1, "vest"],
	["6B23 (6sh92/VOG) EMR Summer", "rhs_6b23_digi_6sh92_vog", -1, "vest"],
	["6B23 (6Sh116) Olive", "rhs_6b23_6sh116_vog_od", -1, "vest"],
	["6B23 (6Sh116) Flora", "rhs_6b23_6sh116_vog_flora", -1, "vest"],
	["6B23 (6Sh116) EMR Summer", "rhs_6b23_6sh116_vog", -1, "vest"],
	["Vydra 3M", "rhs_vydra_3m", -1, "vest"],
	["6B23 Vydra 3M", "rhs_6b23_vydra_3m", -1, "vest"],
	["6b43 EMR Summer", "rhs_6b43", -1, "vest"],
	["6sh92 Flora", "rhs_6sh92", -1, "vest"],
	["6sh92 EMR Summer", "rhs_6sh92_digi", -1, "vest"],
	["6sh92 VSR", "rhs_6sh92_vsr", -1, "vest"],
	["6sh46", "rhs_6sh46", -1, "vest"],
	["IOTV UCP", "rhsusf_iotv_ucp", -1, "vest"],
	["IOTV OCP", "rhsusf_iotv_ocp", -1, "vest"],
	["IOTV Rifleman UCP", "rhsusf_iotv_ucp_Rifleman", -1, "vest"],
	["IOTV Rifleman OCP", "rhsusf_iotv_ocp_Rifleman", -1, "vest"],
	["IOTV SquadLeader UCP", "rhsusf_iotv_ucp_Squadleader", -1, "vest"],
	["IOTV SquadLeader OCP", "rhsusf_iotv_ocp_Squadleader", -1, "vest"],
	["SPC Rifleman", "rhsusf_spc_rifleman", -1, "vest"],
	["SPC Marksman", "rhsusf_spc_marksman", -1, "vest"],
	["SPC MachineGurner", "rhsusf_spc_mg", -1, "vest"],
	["SPC SquadLeader", "rhsusf_spc_squadleader", -1, "vest"],
	["SPC Air", "rhsusf_spc_iar", -1, "vest"],
	["SPC TeamLeader", "rhsusf_spc_teamleader", -1, "vest"],
	["SPCS UCP", "rhsusf_spcs_ucp_rifleman", -1, "vest"],
	["SPCS OCP", "rhsusf_spcs_ocp_rifleman", -1, "vest"],
	["6B23 Rifleman TTsKO-Khaki", "rhsgref_6b23_khaki_rifleman", -1, "vest"],
	["6B23 Rifleman TTsKO-Digi", "rhsgref_6b23_ttsko_digi_rifleman", -1, "vest"],
	["6B23 Rifleman TTsKO-Forest", "rhsgref_6b23_ttsko_forest_rifleman", -1, "vest"],
	["6B23 Rifleman TTsKO-Mountain", "rhsgref_6b23_ttsko_mountain_rifleman", -1, "vest"],
	["6B23 Sniper TTsKO-Khaki", "rhsgref_6b23_khaki_sniper", -1, "vest"],
	["6B23 Sniper TTsKO-Digi", "rhsgref_6b23_ttsko_digi_sniper", -1, "vest"],
	["6B23 Sniper TTsKO-Forest", "rhsgref_6b23_ttsko_forest", -1, "vest"],
	["6B23 Sniper TTsKO-Mountain", "rhsgref_6b23_ttsko_mountain_sniper", -1, "vest"],
	["6B5-19 Khaki", "rhs_6b5_khaki", -1, "vest"],
	["6B5-19 Olive", "rhs_6b5", -1, "vest"],
	["6B5-19 TTsKO", "rhs_6b5_ttsko", -1, "vest"],
	["6B5-19 VSR", "rhs_6b5_vsr", -1, "vest"],
	["OTV Digital", "rhsgref_otv_digi", -1, "vest"],
	["OTV Khaki", "rhsgref_otv_khaki", -1, "vest"],
	["Tactical Vest ERDL", "rhsgref_TacVest_ERDL", -1, "vest"],
	["PB MD99 Digital", "rhssaf_vest_md99_digital", -1, "vest"],
	["PB MD99 Digital/Rifleman", "rhssaf_vest_md99_digital_rifleman", -1, "vest"],
	["PB MD99 MDU", "rhssaf_vest_md99_md2camo", -1, "vest"],
	["PB MD99 MDU/Rifleman", "rhssaf_vest_md99_md2camo_rifleman", -1, "vest"],
	["PB MD99 Woodland", "rhssaf_vest_md99_woodland", -1, "vest"],
	["PB MD99 Woodland/Rifleman", "rhssaf_vest_md99_woodland_rifleman", -1, "vest"],
	["PBB MD98 Digital", "rhssaf_vest_md98_digital", -1, "vest"],
	["PBB MD98 MDU", "rhssaf_vest_md98_md2camo", -1, "vest"],
	["PBB MD98 Woodland", "rhssaf_vest_md98_woodland", -1, "vest"],
	["PBB MD98 Woodland/Rifleman", "rhssaf_vest_md98_rifleman", -1, "vest"],
	["OTV MDU", "rhssaf_vest_otv_md2camo", -1, "vest"]
];

backpackArray = compileFinal str
[
	["Paracaídas","B_Parachute",200,"backpack"],
	["Paracaídas (no dirigible)", "ACE_NonSteerableParachute", 10, "backpack"],
	
	["Eagle A-III Coyote", "rhsusf_assault_eagleaiii_coy", 640, "backpack"],
	["Eagle A-III OCP", "rhsusf_assault_eagleaiii_ocp", 640, "backpack"],
	["Eagle A-III UPC", "rhsusf_assault_eagleaiii_ucp", 640, "backpack"],
	["Mochila UMBTS", "rhs_assault_umbts", 640, "backpack"],
	["Mochila UMBTS (Ingeniero)", "rhs_assault_umbts_engineer_empty", 640, "backpack"],
	["Sidor", "rhs_sidor", 640, "backpack"],
	["RPG Backpack", "rhs_rpg_empty", 640, "backpack"],
	
	["Falcon II (Coyote)", "rhsusf_falconii_coy", 640, "backpack"],
	["Falcon II (MC)", "rhsusf_falconii_mc", 640, "backpack"],
	["Falcon II (RGR)", "rhsusf_falconii", 640, "backpack"],
	
	["Gunbag Green", "ACE_gunbag", 50, "backpack"],
	["Gunbag Tan", "ACE_gunbag_Tan", 50, "backpack"],
	["Tactical Ladder Pack", "ACE_TacticalLadder_Pack", 150, "backpack"],
	
	["Leg Strap (Black)",														"B_LegStrapBag_black_F",											50,							"backpack"],
	["Leg Strap (Coyote)",														"B_LegStrapBag_coyote_F",											50,							"backpack"],
	["Leg Strap (Olive)",														"B_LegStrapBag_olive_F",											50,							"backpack"],

	["Messanger Bag (Black)",													"B_Messenger_Black_F",												100,						"backpack"],
	["Messanger Bag (Coyote)",													"B_Messenger_Coyote_F",												100,						"backpack"],
	["Messanger Bag (Gray)",													"B_Messenger_Gray_F",												100,						"backpack"],
	["Messanger Bag (Olive)",													"B_Messenger_Olive_F",												100,						"backpack"],
	["Messanger Bag (IDAP)",													"B_Messenger_IDAP_F",												100,						"backpack"],

	["Assault Pack (Black)",													"B_AssaultPack_blk",												100,						"backpack"],
	["Assault Pack (Green)",													"B_AssaultPack_rgr",												100,						"backpack"],
	["Assault Pack (MTP)",														"B_AssaultPack_mcamo",												100,						"backpack"],
	["Assault Pack (Hex)",														"B_AssaultPack_ocamo",												100,						"backpack"],
	["Assault Pack (Tropic)",													"B_AssaultPack_tna_F",												100,						"backpack",						"noDLC"],

	["Field Pack (Black)",														"B_FieldPack_blk",													200,						"backpack"],
	["Field Pack (Coyote)",														"B_FieldPack_cbr",													200,						"backpack"],
	["Field Pack (Khaki)",														"B_FieldPack_khk",													200,						"backpack"],
	["Field Pack (Urban)",														"B_FieldPack_oucamo",												200,						"backpack"],
	["Field Pack (Hex)",														"B_FieldPack_ocamo",												200,						"backpack"],
	["Field Pack (G Hex)",														"B_FieldPack_ghex_F",												200,						"backpack",						"noDLC"],

	["Kitbag (Coyote)",															"B_Kitbag_cbr",														350,						"backpack"],
	["Kitbag (Green)",															"B_Kitbag_rgr",														350,						"backpack"],
	["Kitbag (MTP)",															"B_Kitbag_mcamo",													350,						"backpack"],
	["Kitbag (Sage)",															"B_Kitbag_sgg",														350,						"backpack"],

	["Tactical Pack (Black)",													"B_TacticalPack_blk",												350,						"backpack"],
	["Tactical Pack (Green)",													"B_TacticalPack_rgr",												350,						"backpack"],
	["Tactical Pack (Hex)",														"B_TacticalPack_ocamo",												350,						"backpack"],
	["Tactical Pack (Multi)",													"B_TacticalPack_mcamo",												350,						"backpack"],
	["Tactical Pack (Olive)",													"B_TacticalPack_oli",												350,						"backpack"],


	["Viper Light Harness (Black)",												"B_ViperLightHarness_blk_F",										350,						"backpack",						"noDLC"],
	["Viper Light Harness (Hex)",												"B_ViperLightHarness_hex_F",										350,						"backpack",						"noDLC"],
	["Viper Light Harness (G Hex)",												"B_ViperLightHarness_ghex_F",										350,						"backpack",						"noDLC"],
	["Viper Light Harness (Khaki)",												"B_ViperLightHarness_khk_F",										350,						"backpack",						"noDLC"],
	["Viper Light Harness (Olive)",												"B_ViperLightHarness_oli_F",										350,						"backpack",						"noDLC"],

	["Viper Harness (Black)",													"B_ViperHarness_blk_F",												425,						"backpack",						"noDLC"],
	["Viper Harness (Hex)",														"B_ViperHarness_hex_F",												425,						"backpack",						"noDLC"],
	["Viper Harness (G Hex)",													"B_ViperHarness_ghex_F",											425,						"backpack",						"noDLC"],
	["Viper Harness (Khaki)",													"B_ViperHarness_khk_F",												425,						"backpack",						"noDLC"],
	["Viper Harness (Olive)",													"B_ViperHarness_oli_F",												425,						"backpack",						"noDLC"],

	["Carryall (Khaki)",														"B_Carryall_khk",													500,						"backpack"],
	["Carryall (Coyote)",														"B_Carryall_cbr",													500,						"backpack"],
	["Carryall (MTP)",															"B_Carryall_mcamo",													500,						"backpack"],
	["Carryall (Olive)",														"B_Carryall_oli",													500,						"backpack"],
	["Carryall (Urban)",														"B_Carryall_oucamo",												500,						"backpack"],
	["Carryall (G Hex)",														"B_Carryall_ghex_F",												500,						"backpack",						"noDLC"],

	["Bergen (Digital)",														"B_Bergen_dgtl_F",													1000,						"backpack",						"noDLC"],
	["Bergen (Hex)",															"B_Bergen_hex_F",													1000,						"backpack",						"noDLC"],
	["Bergen (MTP)",															"B_Bergen_mcamo_F",													1000,						"backpack",						"noDLC"],
	["Bergen (Tropic)",															"B_Bergen_tna_F",													1000,						"backpack",						"noDLC"]
];

genItemArray = compileFinal str
[
	
	["Binoculars",																"Binocular",														50,							"binoc"],
	// Radios
	["PNR-1000A", 					"tf_pnr1000a", 				500, 		"item", 		"EAST"], 	// 2KM
	["RF-7800-TR", 					"tf_rf7800str", 			500, 		"item", 		"WEST"], 	// 2KM
	["AN/PRC-154", 					"tf_anprc154", 				500, 		"item", 		"GUER"], 	// 2KM
	
	["FADAK", 						"tf_fadak", 				1500, 		"item", 		"EAST"], 	// 5KM
	["AN/PRC-152", 					"tf_anprc152", 				1500, 		"item", 		"WEST"], 	// 5KM
	["AN/PRC-148 JEM", 				"tf_anprc148jem", 			1500, 		"item", 		"GUER"], 	// 5KM
	
	["MR3000", 						"tf_mr3000", 				2500, 		"backpack", 	"EAST"], 	// Mochila 20 - 30K
	["MR3000 BWMOD (Flecktarn)", 	"tf_mr3000_bwmod", 			2500, 		"backpack", 	"EAST"], 	// Mochila 20 - 30K
	["MR3000 BWMOD (Tropentarn)", 	"tf_mr3000_bwmod_tropen", 	2500, 		"backpack", 	"EAST"], 	// Mochila 20 - 30K
	["MR3000 BWMOD (Multicam)", 	"tf_mr3000_multicam", 		2500, 		"backpack", 	"EAST"], 	// Mochila 20 - 30K
	["MR3000 BWMOD (RHS)", 			"tf_mr3000_rhs", 			2500, 		"backpack", 	"EAST"], 	// Mochila 20 - 30K
	["MR6000L", 					"tf_mr6000l", 				5500, 		"backpack", 	"EAST"], 	// Mochila 40KM
	
	["RT-1523G (ASIP)", 			"tf_rt1523g_big", 				2500, 		"backpack", 	"WEST"], 	// Mochila 20 - 30K
	["RT-1523G (ASIP) (Flecktarn)", "tf_rt1523g_big_bwmod", 		2500, 		"backpack", 	"WEST"], 	// Mochila 20 - 30K
	["RT-1523G (ASIP) (Tropentarn)","tf_rt1523g_big_bwmod_tropen", 	2500, 		"backpack", 	"WEST"], 	// Mochila 20 - 30K
	["RT-1523G (ASIP) RHS", 		"tf_rt1523g_big_rhs", 			2500, 		"backpack", 	"WEST"], 	// Mochila 20 - 30K
	["AN/ARC-210", 					"tf_anarc210", 					5500, 		"backpack", 	"WEST"], 	// Mochila 40KM
	
	["AN/PRC-155", 					"tf_anprc155", 					2500, 		"backpack", 	"GUER"], 	// Mochila 20 - 30K
	["AN/PRC-155 Coyote", 			"tf_anprc155_coyote", 			2500, 		"backpack", 	"GUER"], 	// Mochila 20 - 30K
	["AN/ARC-164", 					"tf_anarc164", 					5500, 		"backpack", 	"GUER"], 	// Mochila 40KM
	// Equipos
	["",							"ACE_microDAGR",				1895,		"item"],
	["", 							"ACE_ATragMX", 					50, 		"item"],
	["",							"ACE_key_lockpick",				5000, 						"HIDDEN"],
	["", 							"ACE_MX2A", 					1500, 		"binoc"],
	// ["",							"ACE_key_master",				1000000,					"HIDDEN"],
	["Mine Detector",				"MineDetector",					1000,		"item"],
	["",							"ACE_VMH3",						100,		"item"],
	["",							"ACE_VMM3",						100,		"item"],
	
	// Objetos
	["Spray Azul",					"ACE_SpraypaintBlue",			50,			"mag",			"WEST"],
	["Spray Verde",					"ACE_SpraypaintGreen",			50,			"mag",			"GUER"],
	["Spray Rojo",					"ACE_SpraypaintRed",			50,			"mag",			"EAST"],
	["", 							"ACE_EarPlugs", 				100, 		"item"],
	["", 							"ACE_UAVBattery", 				500, 		"item"],
	["", 							"ACE_CableTie", 				50, 		"item"],
	["", 							"ACE_EntrenchingTool", 			300, 		"item"],
	["Sandbag (empty)", 			"ACE_Sandbag_empty", 			10, 		"item"],
	
	// Medical
	["", 	"ACE_quikclot", 			250, 	"item"],
	["", 	"ACE_fieldDressing", 		500, 	"item"],
	["", 	"ACE_elasticBandage", 		500, 	"item"],
	["", 	"ACE_tourniquet", 			500, 	"item"],
	["", 	"ACE_morphine", 			500 ,	"item"],
	["", 	"ACE_epinephrine", 			1400, 	"item"],
	["", 	"ACE_atropine", 			25, 	"item"],
	["", 	"ACE_bloodIV", 				1000, 	"item"],
	["", 	"ACE_bloodIV_500", 			500, 	"item"],
	["", 	"ACE_bloodIV_250", 			250, 	"item"],
	["", 	"ACE_surgicalKit", 			2000, 	"item"],
	["", 	"ACE_personalAidKit", 		3500, 	"item"],
	["", 	"ACE_bodybag", 				25, 	"item"],
	
	
	
	// NVG y TVG
	["", 					"ACE_NVG_Gen1", 		1000, 		"nvg"],
	["", 					"ACE_NVG_Gen2", 		2000, 		"nvg"],
	["NV Goggles (Gen3)",	"NVGoggles",			3000,		"nvg"],
	["", 					"ACE_NVG_Gen4", 		4000, 		"nvg"],
	["", 					"ACE_NVG_Wide", 		5400, 		"nvg"],
	["Compact NVG (G Hex)",	"O_NVGoggles_ghex_F",	1000,		"nvg", "HIDDEN"],
	["Compact NVG (Hex)",	"O_NVGoggles_hex_F",	1000,		"nvg", "HIDDEN"],
	["Compact NVG (Urban)",	"O_NVGoggles_urb_F",	1000,		"nvg", "HIDDEN"],
	["",					"NVGogglesB_blk_F",		10000,		"nvg"],
	["",					"NVGogglesB_grn_F",		10000,		"nvg"],
	["",					"NVGogglesB_gry_F",		10000,		"nvg"],
	
	["", "ACE_Clacker", 550, "item"],
	["", "ACE_M26_Clacker", 755, "item"],
	["", "ACE_DefusalKit", 50, "item"],
	["", "ACE_DeadManSwitch", 1000, "item"],
	["", "ACE_Cellphone", 50, "item"],
	["", "ACE_Altimeter", 25, "item"],
	["", "ACE_RangeCard", 25, "item"],
	["", "ACE_RangeTable_82mm", 35, "item"],
	["", "ACE_Kestrel4500", 50, "item"],
	["", "ACE_HuntIR_monitor", 1200, "item"],
	["", "ACE_DAGR", 850, "item"],
	["", "ACE_MapTools", 25, "item"],
	["", "ACE_SpareBarrel", 1500, "item"],
	["", "ACE_wirecutter", 50, "item"],
	["", "ACE_IR_Strobe_Item", 5, "item"],
	["", "ACE_Flashlight_MX991", 500, "item"],
	["", "ACE_Flashlight_KSF1", 500, "item"],
	["", "ACE_Flashlight_XL50", 500, "item"],
	["", "ACE_SpottingScope", 1750, "item"],
	["", "ACE_Tripod", 1400, "item"],
	
	["Diving Goggles (AAF)",													"G_Diving",															100,						"gogg"],
	["Diving Goggles (Csat)",													"G_O_Diving",														100,						"gogg"],
	["Diving Goggles (Nato)",													"G_B_Diving",														100,						"gogg"],
	["First Aid Kit",															"FirstAidKit",														25,							"item", "HIDDEN"],
	["GPS",																		"ItemGPS",															100,						"gps"],
	["UAV Terminal (AAF)",														"I_UavTerminal",													150,						"gps"],
	["UAV Terminal (CSAT)",														"O_UavTerminal",													150,						"gps"],
	["UAV Terminal (NATO)",														"B_UavTerminal",													150,						"gps"],
	["Granada IR",																"B_IR_Grenade",														50,							"mag",						"WEST"],
	["Granada IR",																"I_IR_Grenade",														50,							"mag",						"GUER"],
	["Granada IR",																"O_IR_Grenade",														50,							"mag",						"EAST"],
	//["Laser Designator (Green Hex)",											"Laserdesignator_02_ghex_F",										5000,						"binoc"],
	//["Laser Designator (Green)",												"Laserdesignator_01_khk_F",											5000,						"binoc"],
	//["Laser Designator (Hex)",													"Laserdesignator_02",												5000,						"binoc",						"noDLC"],
	//["Laser Designator (Olive)",												"Laserdesignator_03",												5000,						"binoc",						"noDLC"],
	//["Laser Designator (Sand)",													"Laserdesignator",													5000,						"binoc",						"noDLC"],
	// DRONES
	["Dron Antiminas",															"C_IDAP_UAV_06_antimine_backpack_F",								50000,						"backpack"],
	["Medical Drone(AAF)",														"I_UAV_06_medical_backpack_F",										5000,						"backpack"],
	["Medical Drone(CIV)",														"C_UAV_06_medical_backpack_F",										5000,						"backpack"],
	["Medical Drone(CSAT)",														"O_UAV_06_medical_backpack_F",										5000,						"backpack"],
	["Medical Drone(IDAP)",														"C_IDAP_UAV_06_medical_backpack_F",									5000,						"backpack"],
	["Medical Drone(NATO)",														"B_UAV_06_medical_backpack_F",										5000,						"backpack"],
	
	["Utility Drone (AAF)",														"I_UAV_06_backpack_F",												5000,						"backpack"],
	["Utility Drone (CIV)",														"C_UAV_06_backpack_F",												5000,						"backpack"],
	["Utility Drone (CSAT)",													"O_UAV_06_backpack_F",												5000,						"backpack"],
	["Utility Drone (IDAP)",													"C_IDAP_UAV_06_backpack_F",											5000,						"backpack"],
	["Utility Drone (NATO)",													"B_UAV_06_backpack_F",												5000,						"backpack"],
	
	["Quadrotor UAV (AAF)",														"I_UAV_01_backpack_F",												5000,						"backpack"],
	["Quadrotor UAV (CSAT)",													"O_UAV_01_backpack_F",												5000,						"backpack"],
	["Quadrotor UAV (IDAP)",													"C_IDAP_UAV_01_backpack_F",											5000,						"backpack"],
	["Quadrotor UAV (NATO)",													"B_UAV_01_backpack_F",												5000,						"backpack"],
	["Medikit",																	"Medikit",															150,						"item", 		"HIDDEN"],
	["NV Goggles (Black)",														"NVGoggles_OPFOR",													100,						"nvg", 			"HIDDEN"],
	["NV Goggles (Green)",														"NVGoggles_INDEP",													100,						"nvg", 			"HIDDEN"],
	["NV Goggles (Tropic)",														"NVGoggles_tna_F",													100,						"nvg", 			"HIDDEN"],
	["Rangefinder",																"Rangefinder",														150,						"binoc", 		"HIDDEN"],
	["Remote Designator (Hex)",													"O_Static_Designator_02_weapon_F",									2500,						"backpack"],
	["Remote Designator (Sand)",												"B_Static_Designator_01_weapon_F",									2500,						"backpack"],
	// Chemlight
	["Chemlight (Blue)",														"Chemlight_blue",													25,							"mag"],
	["Chemlight (Green)",														"Chemlight_green",													25,							"mag"],
	["Chemlight (Red)",															"Chemlight_red",													25,							"mag"],
	["Chemlight (Yellow)",														"Chemlight_yellow",													25,							"mag"],
	["",																		"ACE_Chemlight_IR",													30,							"mag"],
	["",																		"ACE_Chemlight_White",												30,							"mag"],
	["",																		"ACE_Chemlight_Orange",												30,							"mag"],
	["",																		"ACE_Chemlight_HiWhite",											30,							"mag"],
	["",																		"ACE_Chemlight_HiYellow",											30,							"mag"],
	["",																		"ACE_Chemlight_HiRed",												30,							"mag"],
	["",																		"ACE_Chemlight_HiOrange",											30,							"mag"],
	["",																		"ACE_Chemlight_Shield",												50,							"mag"],
	["Toolkit",																	"ToolKit",															150,						"item"],
	// food and drinks
	["Banana",																	"ACE_banana",													15,							"item"],
	["Franta",																	"ACE_Can_Franta",												20,							"item"],
	["RedGull",																	"ACE_Can_RedGull",												20,							"item"],
	["Spirit",																	"ACE_Can_Spirit",												20,							"item"],
	["Water Bottle",															"ACE_WaterBottle",												200,						"item",			"HIDDEN"],
	["Canteen",																	"ACE_Canteen",													200,						"item",			"HIDDEN"],
	["Humanitarian Ration",														"ACE_Humanitarian_Ration",										150,						"item",			"HIDDEN"],
	["MRE Beef Stew",															"ACE_MRE_BeefStew",												200,						"item",			"HIDDEN"],
	["MRE Chicken Tikka Masala",												"ACE_MRE_ChickenTikkaMasala",									200,						"item",			"HIDDEN"],
	["MRE Chicken Herb Dumplings",												"ACE_MRE_ChickenHerbDumplings",									200,						"item",			"HIDDEN"],
	["MRE Cream Chicken Soup",													"ACE_MRE_CreamChickenSoup",										200,						"item",			"HIDDEN"],
	["MRE Cream Tomato Soup",													"ACE_MRE_CreamTomatoSoup",										200,						"item", 		"HIDDEN"],
	["MRE Lamb Curry",															"ACE_MRE_LambCurry",											200,						"item",			"HIDDEN"],
	["MRE Meatballs Pasta",														"ACE_MRE_MeatballsPasta",										200,						"item", 		"HIDDEN"],
	["MRE Steak Vegetables",													"ACE_MRE_SteakVegetables",										200,						"item", 		"HIDDEN"],
	// ACCESORIOS Y GAFAS
	["Stealth Balaclava (Black)",												"rhs_balaclava",													22000,						"gogg"],
	["Stealth Balaclava (Black)",												"rhs_balaclava1_olive",												22500,						"gogg"],
	["Stealth Balaclava (Black)",												"G_Balaclava_TI_blk_F",												23000,						"gogg"],
	["Stealth Balaclava (Black, Goggles)",										"G_Balaclava_TI_G_blk_F",											30000,						"gogg"],
	["Aviator Glasses",															"G_Aviator",														10,							"gogg"],
	["Balaclava (Black)",														"G_Balaclava_blk",													25,							"gogg"],
	["Balaclava (Combat Goggles)",												"G_Balaclava_combat",												25,							"gogg"],
	["Balaclava (Low Profile Goggles)",											"G_Balaclava_lowprofile",											25,							"gogg"],
	["Balaclava (Olive)",														"G_Balaclava_oli",													25,							"gogg"],
	["Bandana (Aviator)",														"G_Bandanna_aviator",												25,							"gogg"],
	["Bandana (Beast)",															"G_Bandanna_beast",													25,							"gogg"],
	["Bandana (Black)",															"G_Bandanna_blk",													25,							"gogg"],
	["Bandana (Khaki)",															"G_Bandanna_khk",													25,							"gogg"],
	["Bandana (Olive)",															"G_Bandanna_oli",													25,							"gogg"],
	["Bandana (Shades)",														"G_Bandanna_shades",												25,							"gogg"],
	["Bandana (Sport)",															"G_Bandanna_sport",													25,							"gogg"],
	["Bandana (Tan)",															"G_Bandanna_tan",													25,							"gogg"],
	/*["Bluetooth Earpiece",														"G_WirelessEarpiece_F",												10,							"gogg"],
	["Combat Goggles (Green)",													"G_Combat_Goggles_tna_F",											25,							"gogg",						"noDLC"],
	["Combat Goggles",															"G_Combat",															25,							"gogg"],
	["Dust Mask (Blue)",														"G_Respirator_blue_F",												10,							"gogg"],
	["Dust Mask (White)",														"G_Respirator_white_F",												10,							"gogg"],
	["Dust Mask (Yellow)",														"G_Respirator_yellow_F",											10,							"gogg"],
	["Ladies Shades (Fire)",													"G_Lady_Red",														10,							"gogg"],
	["Ladies Shades (Iridium)",													"G_Lady_Mirror",													10,							"gogg"],
	["Ladies Shades (Sea)",														"G_Lady_Dark",														10,							"gogg"],
	["Ladies Shades",															"G_Lady_Blue",														10,							"gogg"],
	["Low Profile Goggles",														"G_Lowprofile",														10,							"gogg"],
	["Protective Googles (Earpiece)",											"G_EyeProtectors_Earpiece_F",										10,							"gogg"],
	["Protective Googles",														"G_EyeProtectors_F",												10,							"gogg"],
	["Shades (Black)",															"G_Shades_Black",													10,							"gogg"],
	["Shades (Blue)",															"G_Shades_Blue",													10,							"gogg"],
	["Shades (Green)",															"G_Shades_Green",													10,							"gogg"],
	["Shades (Red)",															"G_Shades_Red",														10,							"gogg"],
	["Spectacle Glasses",														"G_Spectacles",														10,							"gogg"],
	["Sport Shades (Fire)",														"G_Sport_Red",														10,							"gogg"],
	["Sport Shades (Poison)",													"G_Sport_Blackyellow",												10,							"gogg"],
	["Sport Shades (Shadow)",													"G_Sport_BlackWhite",												10,							"gogg"],
	["Sport Shades (Style)",													"G_Sport_Checkered",												10,							"gogg"],
	["Sport Shades (Vulcan)",													"G_Sport_Blackred",													10,							"gogg"],
	["Sport Shades (Yetti)",													"G_Sport_Greenblack",												10,							"gogg"],
	["Square Shades",															"G_Squares_Tinted",													10,							"gogg"],
	["Square Spectacles",														"G_Squares",														10,							"gogg"],
	
	["Tactical Glasses",														"G_Tactical_Clear",													10,							"gogg"],
	["Tactical Glasses",														"G_Tactical_Clear",													100,						"gogg"],
	["Tactical Shades",															"G_Tactical_Black",													10,							"gogg"],
	["Tinted Spectacles",														"G_Spectacles_Tinted",												10,							"gogg"],*/
	["VR Goggles",																"G_Goggles_VR",														25,							"gogg"]
];
gencratesArray = compilefinal str
[
	["Ammo Cache (AAF)",															"Box_FIA_Ammo_F",													50],
	["Basic Ammo Crate (CSAT Pacific)",												"Box_T_East_Ammo_F",												50],
	["Basic Ammo Crate (CSAT)",														"Box_East_Ammo_F",													50],
	["Basic Ammo Crate (IND)",														"Box_IND_Ammo_F",													50],
	["Basic Ammo Crate (NATO)",														"Box_NATO_Ammo_F",													50],
	["Basic Ammo Crate (SYN)",														"Box_Syndicate_Ammo_F",												50],
	["Basic Weapons Crate (CSAT Pacific)",											"Box_T_East_Wps_F",													50],
	["Basic Weapons Crate (CSAT)",													"Box_East_Wps_F",													50],
	["Basic Weapons Crate (IND)",													"Box_IND_Wps_F",													50],
	["Basic Weapons Crate (NATO Pacific)",											"Box_T_NATO_Wps_F",													50],
	["Basic Weapons Crate (NATO)",													"Box_NATO_Wps_F",													50],
	["Basic Weapons Crate (SYN)",													"Box_Syndicate_Wps_F",												50],
	["Equipment Cache (AAF)",														"Box_FIA_Support_F",												50],
	["Equipment Case (CSAT)",														"Box_CSAT_Equip_F",													50],
	["Equipment Case (IDAP)",														"Box_IDAP_Equip_F",													50],
	["Equipment Case (IND)",														"Box_AAF_Equip_F",													50],
	["Equipment Case (NATO)",														"Box_NATO_Equip_F",													50],
	["Explosives Crate (CSAT)",														"Box_East_AmmoOrd_F",												50],
	["Explosives Crate (IDAP)",														"Box_IDAP_AmmoOrd_F",												50],
	["Explosives Crate (IND)",														"Box_IND_AmmoOrd_F",												50],
	["Explosives Crate (NATO)",														"Box_NATO_AmmoOrd_F",												50],
	["Explosives Crate (SYN)",														"Box_IED_Exp_F",													50],
	["Grenade Crate (CSAT)",														"Box_East_Grenades_F",												50],
	["Grenade Crate (IND)",															"Box_IND_Grenades_F",												50],
	["Grenade Crate (NATO)",														"Box_NATO_Grenades_F",												50],
	["Launchers Crate (CSAT)",														"Box_East_WpsLaunch_F",												50],
	["Launchers Crate (IND)",														"Box_IND_WpsLaunch_F",												50],
	["Launchers Crate (NATO)",														"Box_NATO_WpsLaunch_F",												50],
	["Launchers Crate (SYN)",														"Box_Syndicate_WpsLaunch_F",										50],
	["Special Weapons Crate (CSAT Pacific)",										"Box_T_East_WpsSpecial_F",											50],
	["Special Weapons Crate (CSAT)",												"Box_East_WpsSpecial_F",											50],
	["Special Weapons Crate (IND)",													"Box_IND_WpsSpecial_F",												50],
	["Special Weapons Crate (NATO Pacific)",										"Box_T_NATO_WpsSpecial_F",											50],
	["Special Weapons Crate (NATO)",												"Box_NATO_WpsSpecial_F",											50],
	["Supply Crate (GEN)",															"Box_GEN_Equip_F",													50],
	["Supply Crate (IDAP)",															"C_IDAP_supplyCrate_F",												50],
	["Supply Crate",																"I_supplyCrate_F",													50],
	["Support Crate (CSAT)",														"Box_East_Support_F",												50],
	["Support Crate (IND)",															"Box_IND_Support_F",												50],
	["Support Crate (NATO)",														"Box_NATO_Support_F",												50],
	["Uniforms Crate (CSAT)",														"Box_CSAT_Uniforms_F",												50],
	["Uniforms Crate (IDAP)",														"Box_IDAP_Uniforms_F",												50],
	["Uniforms Crate (IND)",														"Box_AAF_Uniforms_F",												50],
	["Uniforms Crate (NATO)",														"Box_NATO_Uniforms_F",												50],
	["Weapons Cache (AAF)",															"Box_FIA_Wps_F",													50]
];
allStoreMagazines = compileFinal str (call ammoArray + call throwputArray + call genItemArray);
allRegularStoreItems = compileFinal str (call allGunStoreFirearms + call allStoreMagazines + call accessoriesArray);
allStoreGear = compileFinal str (call headArray + call uniformArray + call vestArray + call backpackArray);
allGenStoreVanillaItems = compileFinal str (call genItemArray + call allStoreGear);

BaseManagementArray = compileFinal str
[
	["Base Manager",															"Land_SatellitePhone_F",											500000]
];
BuildingsArray = compileFinal str
[
	["Bunker (Large)",															"Land_Bunker_01_big_F",												50000],
	["Bunker (Small)",															"Land_Bunker_01_small_F",											15000],
	["Bunker (Tall)",															"Land_Bunker_01_tall_F",											25000],
	["Bunker,HQ",																"Land_Bunker_01_HQ_F",												50000],
	["Barracks (Camo)",															"Land_i_Barracks_V1_F",												10000],
	["Barracks (Old)",															"Land_u_Barracks_V2_F",												7500],
	["Barracks (White)",														"Land_i_Barracks_V2_F",												10000],
	["Cobblestone Bungalow(Small,White)",										"Land_i_House_Small_01_V3_F",										5000],
	["Cobblestone Cottage (Small,White)",										"Land_i_House_Small_02_V3_F",										5000],
	["Cobblestone Shop (Large)",												"Land_i_Shop_01_V3_F",												10000],
	["Cobblestone Store (Large)",												"Land_i_Shop_02_V3_F",												10000],
	["Cobblestone with Balcony 2 Story (Large,White)",							"Land_i_House_Big_02_V3_F",											10000],
	["Cobblestone with Porch 2 Story (Large,White)",							"Land_i_House_Big_01_V3_F",											10000],
	["Concrete with Porch 1 Story (Large)",										"Land_i_House_Small_03_V1_F",										5000],
	// ["Construction (Huge)",													"Land_WIP_F",														7000],
	// ["Construction (Large)",													"Land_Unfinished_Building_02_F",									5000],
	// ["Construction (Small)",													"Land_Unfinished_Building_01_F",									3000],
	["Dome (Large)",															"Land_Dome_Big_F",													25000],
	["Dome (Small)",															"Land_Dome_Small_F",												15000],
	["Fuel Station (Sun Oil)",													"Land_FuelStation_Build_F",											500],
	["Ghost Hotel Gazebo",														"Land_GH_Gazebo_F",													700],
	["Ghost Hotel House (1 Story)",												"Land_GH_House_1_F",												500],
	["Ghost Hotel House (2 Story)",												"Land_GH_House_2_F",												1000],
	["Hanger",																	"Land_Hangar_F",													50000],
	["Hanger, Tent",															"Land_TentHangar_V1_F",												5000],
	["Industrial Shed",															"Land_i_Shed_Ind_F",												5000],
	["Kiosk (BluKing)",															"Land_Kiosk_blueking_F",											500],
	["Kiosk (Gyro)",															"Land_Kiosk_gyros_F",												500],
	["Kiosk (Newspaper)",														"Land_Kiosk_papers_F",												500],
	["Kiosk (Red Burger)",														"Land_Kiosk_redburger_F",											500],
	// ["Lighthouse (Large)",														"Land_LightHouse_F",												75000],
	// ["Lighthouse (Medium,Green)",												"Land_Lighthouse_03_green_F",										7500],
	// ["Lighthouse (Medium,Red)",													"Land_Lighthouse_03_red_F",											7500],
	// ["Lighthouse (Small)",														"Land_Lighthouse_small_F",											3000],
	["Mechanic Garage",															"Land_CarService_F",												500],
	["Military Cargo (Biohazard)",												"Land_Research_house_V1_F",											1500],
	["Military Cargo (Brown)",													"Land_Cargo_House_V3_F",											1000],
	["Military Cargo (Green)",													"Land_Cargo_House_V1_F",											1000],
	["Military Cargo (Medical)",												"Land_Medevac_house_V1_F",											1250],
	["Military Cargo (Rusty)",													"Land_Cargo_House_V2_F",											750],
	["Military Cargo HQ (Biohazard)",											"Land_Research_HQ_F",												5000],
	["Military Cargo HQ (Brown)",												"Land_Cargo_HQ_V3_F",												3000],
	["Military Cargo HQ (Green)",												"Land_Cargo_HQ_V1_F",												3000],
	["Military Cargo HQ (Medical)",												"Land_Medevac_HQ_V1_F",												4000],
	["Military Cargo HQ (Rusty)",												"Land_Cargo_HQ_V2_F",												2500],
	["Military Offices",														"Land_MilOffices_V1_F",												25000],
	["Military Post (Brown)",													"Land_Cargo_Patrol_V3_F",											1000],
	["Military Post (Green)",													"Land_Cargo_Patrol_V2_F",											1000],
	["Military Post (Rusty)",													"Land_Cargo_Patrol_V1_F",											750],
	["Office",																	"Land_Offices_01_V1_F",												100000],
	// ["Shack,Corrugated (Slum)",													"Land_Slum_House01_F",												50],
	// ["Shack,Wood (Large,Slum)",													"Land_Slum_House03_F",												100],
	// ["Shack,Wood (Small,Slum)",													"Land_Slum_House02_F",												50],
	// ["Shed,Open Sided (Large)",													"Land_Shed_Big_F",													3000],
	// ["Shed,Open Sided (Small)",													"Land_Shed_Small_F",												1000],
	// ["Shipping Container (Slum)",												"Land_cargo_house_slum_F",											100],
	["Stone 2 Story with Balcony (Large,Brown)",								"Land_i_Stone_HouseBig_V3_F",										3000],
	["Stone 2 Story with Balcony (Large,Grey)",									"Land_i_Stone_HouseBig_V1_F",										3000],
	["Stone 2 Story with Balcony (Large,Sand)",									"Land_i_Stone_HouseBig_V2_F",										3000],
	// ["Stone Barn (Brown)",														"Land_Barn_01_brown_F",												20000],
	// ["Stone Barn (Grey)",														"Land_Barn_01_grey_F",												20000],
	["Stone Cottage (Small,Brown)",												"Land_i_Stone_Shed_V3_F",											1500],
	["Stone Cottage (Small,Grey)",												"Land_i_Stone_Shed_V1_F",											1500],
	["Stone Cottage (Small,Sand)",												"Land_i_Stone_Shed_V2_F",											1500],
	["Stone Townhouse (Large,Brown)",											"Land_i_Stone_HouseSmall_V3_F",										2000],
	["Stone Townhouse (Large,Grey)",											"Land_i_Stone_HouseSmall_V1_F",										2000],
	["Stone Townhouse (Large,Sand)",											"Land_i_Stone_HouseSmall_V2_F",										2000],
	["Stucco 2 Story with Balcony (Large,Slum)",								"Land_u_House_Big_02_V1_F",											3000],
	["Stucco 2 Story with Balcony (Large,White)",								"Land_i_House_Big_02_V1_F",											5000],
	["Stucco 2 Story with Balcony (Large,Yellow)",								"Land_i_House_Big_02_V2_F",											5000],
	["Stucco 2 Story with Porch (Large,Slum)",									"Land_u_House_Big_01_V1_F",											3000],
	["Stucco 2 Story with Porch (Large,White)",									"Land_i_House_Big_01_V1_F",											5000],
	["Stucco 2 Story with Porch (Large,Yellow)",								"Land_i_House_Big_01_V2_F",											5000],
	["Stucco Addition 1 Story (White)",											"Land_i_Addon_02_V1_F",												2500],
	["Stucco Bungalow(Small,Slum)",												"Land_u_House_Small_01_V1_F",										1500],
	["Stucco Bungalow(Small,White)",											"Land_i_House_Small_01_V1_F",										2500],
	["Stucco Bungalow(Small,Yellow)",											"Land_i_House_Small_01_V2_F",										2500],
	["Stucco Cottage (Small,Slum)",												"Land_u_House_Small_02_V1_F",										1500],
	["Stucco Cottage (Small,White)",											"Land_i_House_Small_02_V1_F",										2500],
	["Stucco Cottage (Small,Yellow)",											"Land_i_House_Small_02_V2_F",										2500],
	["Stucco Garage (Small,Slum)",												"Land_i_Garage_V2_F",												1500],
	["Stucco Garage (Small,White)",												"Land_i_Garage_V1_F",												2500],
	["Stucco Shop (Large,Slum)",												"Land_u_Shop_01_V1_F",												3000],
	["Stucco Shop (Large,White)",												"Land_i_Shop_01_V1_F",												5000],
	["Stucco Shop (Large,Yellow)",												"Land_i_Shop_01_V2_F",												5000],
	["Stucco Store (Large,Slum)",												"Land_u_Shop_02_V1_F",												3000],
	["Stucco Store (Large,White)",												"Land_i_Shop_02_V1_F",												5000],
	["Stucco Store (Large,Yellow)",												"Land_i_Shop_02_V2_F",												5000],
	["Supermarket",																"Land_Supermarket_01_malden_F",										50000]
];
FencesAndWallsArray = compileFinal str
[
	["HBarrier (1 block)",														"Land_HBarrier_1_F",												150],
	["HBarrier (3 blocks)",														"Land_HBarrier_3_F",												200],
	["HBarrier (5 blocks)",														"Land_HBarrier_5_F",												250],
	["HBarrier (Big)",															"Land_HBarrierBig_F",												500],
	["HBarrier Corridor",														"Land_HBarrierWall_corridor_F",										250],
	["HBarrier Wall (4 blocks)",												"Land_HBarrierWall4_F",												400],
	["HBarrier Wall (6 blocks)",												"Land_HBarrierWall6_F",												500],
	["HBarrier Wall Corner",													"Land_HBarrierWall_corner_F",										500],
	["Hedge (2m)",																"Land_Hedge_01_s_2m_F",												10],
	["Hedge (4m)",																"Land_Hedge_01_s_4m_F",												20],
	["Bag Barricade (Short)",													"Land_SandbagBarricade_01_half_F",									100],
	["Bag Barricade (Tall)",													"Land_SandbagBarricade_01_F",										200],
	["Bag Barricade,Shoot Hole",												"Land_SandbagBarricade_01_hole_F",									200],
	["Bag Bunker (Large)",														"Land_BagBunker_Large_F",											500],
	["Bag Bunker (Small)",														"Land_BagBunker_Small_F",											250],
	["Barrier, Concrete (Post)",												"Land_VergePost_01_F",												100],
	["Barrier,Concrete (Long)",													"Land_CncBarrierMedium4_F",											500],
	["Barrier,Concrete (Medium)",												"Land_CncBarrierMedium_F",											350],
	["Barrier,Concrete (Yellow Post)",											"Land_Bollard_01_F",												100],
	["Barrier,Concrete Traffic",												"Land_Mil_ConcreteWall_F",											200],
	["Barrier,Concrete",														"Land_CncBarrier_F",												200],
	["Barrier,Construction",													"RoadBarrier_F",													100],
	["Barrier,GoKart (x1 Red and White)",										"PlasticBarrier_01_red_F",											50],
	["Barrier,GoKart (x1 White and Red)",										"PlasticBarrier_01_white_F",										50],
	["Barrier,GoKart (x2 Red and White)",										"Land_PlasticBarrier_01_line_x2_F",									100],
	["Barrier,GoKart (x4 Red and White)",										"Land_PlasticBarrier_01_line_x4_F",									200],
	["Barrier,GoKart (x6 Red and White)",										"Land_PlasticBarrier_01_line_x6_F",									300],
	["Barrier,Runway (Red and White)",											"Land_LandMark_F",													100],
	["Barrier,Steel Traffic",													"Land_GuardRailing_01_F",											100],
	["Barrier,Tire (x1 Black)",													"TyreBarrier_01_black_F",											100],
	["Barrier,Tire (x1 White)",													"TyreBarrier_01_white_F",											100],
	["Barrier,Tire (x4 Black and White)",										"Land_TyreBarrier_01_line_x4_F",									400],
	["Barrier,Tire (x6 Black and White)",										"Land_TyreBarrier_01_line_x6_F",									600],
	["Barrier,Traffic (Grey)",													"PlasticBarrier_02_grey_F",											50],
	["Barrier,Traffic (Yellow Stripes)",										"Land_CncBarrier_stripes_F",										100],
	["Barrier,Traffic (Yellow)",												"Land_PlasticBarrier_02_F",											50],
	["Bag Fence (Corner)",														"Land_BagFence_Corner_F",											150],
	["Bag Fence (End)",															"Land_BagFence_End_F",												150],
	["Bag Fence (Long)",														"Land_BagFence_Long_F",												200],
	["Bag Fence (Round)",														"Land_BagFence_Round_F",											150],
	["Bag Fence (Short)",														"Land_BagFence_Short_F",											150],
	["Bamboo (4m)",																"Land_BambooFence_01_s_4m_F",										100],
	["Bamboo (8m)",																"Land_BambooFence_01_s_8m_F",										200],
	["Bamboo (Pole)",															"Land_BambooFence_01_s_pole_F",										50],
	["Barbed Wire (16m)",														"Land_WiredFence_01_16m_F",											300],
	["Barbed Wire (4m)",														"Land_WiredFence_01_4m_F",											100],
	["Barbed Wire (8m)",														"Land_WiredFence_01_8m_F",											200],
	["Barbed Wire (Gate)",														"Land_WiredFence_01_gate_F",										300],
	["Barbed Wire (Pole)",														"Land_WiredFence_01_pole_F",										100],
	["Barbed Wire,Tall (Corner)",												"Land_IndFnc_Corner_F",												200],
	["Barbed Wire,Tall (Post)",													"Land_IndFnc_Pole_F",												100],
	["Barbed Wire,Tall",														"Land_IndFnc_3_F",													200],
	["Barrier,Guardrail (4m)",													"Land_CrashBarrier_01_4m_F",										200],
	["Barrier,Guardrail (8m Rusty)",											"Land_Crash_barrier_F",												300],
	["Barrier,Guardrail (8m)",													"Land_CrashBarrier_01_8m_F",										400],
	["Barrier,Guardrail (Left End)",											"Land_CrashBarrier_01_end_L_F",										100],
	["Barrier,Guardrail (Right End)",											"Land_CrashBarrier_01_end_R_F",										100],
	["Bunker Wall (1 Block)",													"Land_Bunker_01_blocks_1_F",										1000],
	["Bunker Wall (3 Blocks)",													"Land_Bunker_01_blocks_3_F",										2500],
	["Canal (Large)",															"Land_Canal_Wall_10m_F",											2500],
	["Canal (Small)",															"Land_Canal_WallSmall_10m_F",										1000],
	["Canal (Stairs)",															"Land_Canal_Wall_Stairs_F",											2500],
	["Caution Tape",															"TapeSign_F",														50],
	["Caution,Plastic (Blue)",													"PlasticBarrier_03_blue_F",											50],
	["Caution,Plastic (Orange)",												"Land_PlasticBarrier_03_F",											50],
	["Chainlink Panel (Tall)",													"Land_SportGround_fence_F",											100],
	["Chainlink,Rusty (Gate)",													"Land_NetFence_01_m_gate_F",										300],
	["Chainlink,Rusty (Post)",													"Land_NetFence_01_m_pole_F",										100],
	["Chainlink,Short (4m)",													"Land_Net_Fence_4m_F",												100],
	["Chainlink,Short (8m)",													"Land_Net_Fence_8m_F",												300],
	["Chainlink,Short (Gate)",													"Land_Net_Fence_Gate_F",											200],
	["Chainlink,Short (Post)",													"Land_Net_Fence_pole_F",											100],
	["Chainlink,Slum (4m)",														"Land_Slums02_4m",													20],
	["Chainlink,Slum (8m)",														"Land_Slums01_8m",													20],
	["Chainlink,Slum (Pole)",													"Land_Slums02_pole",												10],
	["Chainlink,Tall (1m)",														"Land_BackAlley_01_l_1m_F",											100],
	["Chainlink,Tall (Gap)",													"Land_BackAlley_01_l_gap_F",										150],
	["Chainlink,Tall (Gate)",													"Land_BackAlley_01_l_gate_F",										200],
	["Chickenwire (4m)",														"Land_Wired_Fence_8m_F",											10],
	["Chickenwire (Post)",														"Land_Wired_Fence_4mD_F",											20],
	["City (4m)",																"Land_City2_4m_F",													600],
	["City (8m)",																"Land_City2_8m_F",													300],
	["City (Pillar)",															"Land_City2_PillarD_F",												200],
	["City,Decorative (4m)",													"Land_City_4m_F",													300],
	["City,Decorative(8m)",														"Land_City_8m_F",													600],
	["City,Decorative(Gate)",													"Land_City_Gate_F",													500],
	["City,Decorative(Pillar)",													"Land_City_Pillar_F",												200],
	["Cobblestone (4m)",														"Land_Stone_4m_F",													200],
	["Cobblestone (8m)",														"Land_Stone_8m_F",													400],
	["Cobblestone (Gate)",														"Land_Stone_Gate_F",												500],
	["Cobblestone (Pillar)",													"Land_Stone_pillar_F",												200],
	["Concrete and Chainlink (2m)",												"Land_NetFence_02_m_2m_F",											200],
	["Concrete and Chainlink (4m)",												"Land_NetFence_02_m_4m_F",											400],
	["Concrete and Chainlink (8m)",												"Land_NetFence_02_m_8m_F",											800],
	["Concrete and Chainlink (Gate)",											"Land_NetFence_02_m_gate_v1_F",										500],
	["Concrete and Chainlink (Post)",											"Land_NetFence_02_m_pole_F",										100],
	["Concrete, Acoustic Panel",												"Land_Wall_IndCnc_2deco_F",											250],
	["Concrete,Decorative (2m)",												"Land_ConcreteWall_02_m_2m_F",										200],
	["Concrete,Decorative (4m)",												"Land_ConcreteWall_02_m_4m_F",										400],
	["Concrete,Decorative (8m)",												"Land_ConcreteWall_02_m_8m_F",										600],
	["Concrete,Decorative (Gate)",												"Land_ConcreteWall_02_m_gate_F",									500],
	["Concrete,Decorative (Post)",												"Land_ConcreteWall_02_m_pole_F",									100],
	["Concrete,Layered (Post)",													"Land_Wall_IndCnc_Pole_F",											100],
	["Concrete,Layered",														"Land_Wall_IndCnc_4_F",												300],
	["Concrete,Medium (4m)",													"Land_ConcreteWall_01_m_4m_F",										300],
	["Concrete,Medium (8m)",													"Land_ConcreteWall_01_m_8m_F",										600],
	["Concrete,Medium (Gate)",													"Land_ConcreteWall_01_m_gate_F",									1000],
	["Concrete,Medium (Post)",													"Land_ConcreteWall_01_m_pole_F",									200],
	["Concrete,Reinforced (x1 Tall)",											"Land_CncWall1_F",													400],
	["Concrete,Reinforced (x4 Tall)",											"Land_CncWall4_F",													600],
	["Concrete,Small (4m)",														"Land_Concrete_SmallWall_4m_F",										200],
	["Concrete,Small (8m)",														"Land_Concrete_SmallWall_8m_F",										400],
	["Concrete,Tall (4m)",														"Land_ConcreteWall_01_l_4m_F",										600],
	["Concrete,Tall (8m)",														"Land_ConcreteWall_01_l_8m_F",										1200],
	["Concrete,Tall (Gate)",													"Land_ConcreteWall_01_l_gate_F",									2500],
	["Concrete,Tall (Post)",													"Land_ConcreteWall_01_l_pole_F",									400],
	["Corrugated (4m Rusty)",													"Land_TinWall_01_m_4m_v1_F",										20],
	["Corrugated (4m)",															"Land_TinWall_01_m_4m_v2_F",										30],
	["Corrugated (Gate,Narrow)",												"Land_TinWall_01_m_gate_v1_F",										30],
	["Corrugated (Gate,Wide)",													"Land_TinWall_01_m_gate_v2_F",										40],
	["Corrugated (Pole)",														"Land_TinWall_01_m_pole_F",											10],
	["Corrugated (Rusty,Pole)",													"Land_Wall_Tin_Pole",												10],
	["Corrugated,Blue (4m Rusty)",												"Land_Wall_Tin_4",													50],
	["Corrugated,Slum (2m)",													"Land_SlumWall_01_s_2m_F",											20],
	["Corrugated,Slum (4m)",													"Land_SlumWall_01_s_4m_F",											20],
	["Corrugated,Slum (Pole)",													"Land_Slums01_pole",												20],
	["Corrugated,Tall (4m)",													"Land_TinWall_02_l_4m_F",											100],
	["Corrugated,Tall (8m)",													"Land_TinWall_02_l_8m_F",											200],
	["Corrugated,Tall (Post)",													"Land_TinWall_02_l_pole_F",											50],
	["Corrugated,Tall (Slum)",													"Land_BackAlley_02_l_1m_F",											50],
	["Military (4m Green)",														"Land_Mil_WallBig_4m_F",											300],
	["Military (Corner,Green)",													"Land_Mil_WallBig_Corner_F",										150],
	["Picket (2m)",																"Land_WoodenWall_02_s_2m_F",										100],
	["Picket (4m)",																"Land_WoodenWall_02_s_4m_F",										200],
	["Picket (8m)",																"Land_WoodenWall_02_s_8m_F",										300],
	["Picket (Gate)",															"Land_WoodenWall_02_s_gate_F",										300],
	["Pipe (4m)",																"Land_PipeFence_02_s_4m_F",											50],
	["Pipe (8m)",																"Land_PipeFence_02_s_8m_F",											100],
	["Pipe and Concrete (Short)",												"Land_Pipe_fence_4m_F",												100],
	["Pipe and Concrete (Tall)",												"Land_PipeWall_concretel_8m_F",										200],
	["Plank (4m)",																"Land_WoodenWall_01_m_4m_F",										100],
	["Plank (8m)",																"Land_WoodenWall_01_m_8m_F",										200],
	["Plank (Pole)",															"Land_WoodenWall_01_m_pole_F",										50],
	["Razorwire (10m)",															"Land_New_WiredFence_10m_F",										800],
	["Razorwire (5m)",															"Land_New_WiredFence_5m_F",											400],
	["Razorwire (Gate)",														"Land_Mil_WiredFence_Gate_F",										500],
	["Rope	(3m)",																"Land_PoleWall_01_3m_F",											100],
	["Rope	(6m)",																"Land_PoleWall_01_6m_F",											200],
	["Rope	(Post)",															"Land_PoleWall_01_pole_F",											50],
	["Stones,Piled (Low,Long)",													"Land_StoneWall_01_s_10m_F",										100],
	["Vineyard",																"Land_VineyardFence_01_F",											100],
	["Wrought Iron (2m)",														"Land_PipeFence_01_m_2m_F",											200],
	["Wrought Iron (4m)",														"Land_PipeFence_01_m_4m_F",											400],
	["Wrought Iron (8m)",														"Land_PipeFence_01_m_8m_F",											600],
	["Wrought Iron (Gate Double)",												"Land_PipeFence_01_m_gate_v2_F",									750],
	["Wrought Iron (Gate Single)",												"Land_PipeFence_01_m_gate_v1_F",									500]


];

lightsArray = compileFinal str
[
	["Metal Barrel Burning",													"MetalBarrel_burning_F",											500],
	["Airport Pole Lamp (3 Halogen 1 Red)",										"Land_LampAirport_F",												2500],
	["Halogen Light Pole",														"Land_LampHalogen_F",												1000],
	["Harbor Lamp",																"Land_LampHarbour_F",												500],
	["Helipad,Blinking (Blue)",													"PortableHelipadLight_01_blue_F",									250],
	["Helipad,Blinking (Green)",												"PortableHelipadLight_01_green_F",									250],
	["Helipad,Blinking (Pink)",													"Land_PortableHelipadLight_01_F",									250],
	["Helipad,Blinking (Red)",													"PortableHelipadLight_01_red_F",									250],
	["Helipad,Blinking (White)",												"PortableHelipadLight_01_white_F",									250],
	["Helipad,Blinking (Yellow)",												"PortableHelipadLight_01_yellow_F",									250],
	["Lantern",																	"Land_Camping_Light_F",												50],
	["Light,Wood Pole (Shabby)",												"Land_LampShabby_F",												300],
	["Portable Flood (Double)",													"Land_PortableLight_double_F",										200],
	["Portable Flood (Single)",													"Land_PortableLight_single_F",										100],
	["Power Pole w/Light",														"Land_PowerPoleWooden_L_F",											500],
	["Solar Pole",																"Land_LampSolar_F",													1000],
	["Street Light,Globes",														"Land_LampDecor_F",													500],
	["Street Light (Small)",													"Land_LampStreet_small_F",											500],
	["Street Light (Large)",													"Land_LampStreet_F",												700],
	["Traffic Cone with Light",													"RoadCone_L_F",														100]
];
ObjectsArray = compileFinal str
[

	["Escritorio de Madera grande",																"Land_TableDesk_F",									400],
	["Escritorio de Madera pequeño, nuevo",														"OfficeTable_01_new_F",								300],
	["Escritorio de Madera pequeño, viejo",														"OfficeTable_01_old_F",								100],
	["Bandera AAF",																				"Flag_AAF_F",										1000],
	["Bandera,Altis Colonial",																	"Flag_AltisColonial_F",								1000],
	["Bandera,Altis",																			"Flag_Altis_F",										1000],
	["Bandera,Blue",																			"Flag_Blue_F",										1000],
	["Bandera,CSAT",																			"Flag_CSAT_F",										1000],
	["Bandera,CTRG",																			"Flag_CTRG_F",										1000],
	["Bandera,FIA",																				"Flag_FIA_F",										1000],
	["Bandera,Fuel",																			"Flag_Fuel_F",										1000],
	["Bandera,Gendarmerie",																		"Flag_Gendarmerie_F",								1000],
	["Bandera,Green",																			"Flag_Green_F",										1000],
	["Bandera,Medical",																			"Flag_RedCrystal_F",								1000],
	["Bandera,NATO",																			"Flag_NATO_F",										1000],
	["Bandera,POW MIA",																			"Flag_POWMIA_F",									777],
	["Bandera,Red",																				"Flag_Red_F",										1000],
	["Bandera,Syndikat",																		"Flag_Syndikat_F",									1000],
	["Bandera,UK",																				"Flag_UK_F",										1066],
	["Bandera,UN",																				"Flag_UNO_F",										1984],
	["Bandera,US",																				"Flag_US_F",										1776],
	["Bandera,Viper",																			"Flag_Viper_F",										1000],
	["Bandera,White",																			"Flag_White_F",										100000],
	["Techo de gasolinera (Malden)",															"Land_FuelStation_01_roof_malevil_F",				5000],
	["Techo de gasolinera (Sun Oil)",															"Land_FuelStation_Shed_F",							800],
	["Techo de gasolinera",																		"Land_fs_roof_F",									500],
	["Señal de gasolinera (Malden)",															"Land_FuelStation_01_prices_malevil_F",				25000],
	
	//
	["Puerta Gate Boom",																		"Land_BarGate_F",									500],
	["Hedgehog (Yaki anti carro)",																"Land_CzechHedgehog_01_new_F",						500],
	["Escalera",																				"Land_PierLadder_F",								500],
	["Rampa de concreto (alta)",																"Land_RampConcreteHigh_F",							500],
	["Rampa de concreto (baja)",																"Land_RampConcrete_F",								500],
	["Andamio",																					"Land_Scaffolding_F",								100],
	["Estante,Industrial",																		"Land_Metal_wooden_rack_F",							250],
	["Estante,Metal (4 Shelves)",																"Land_Metal_rack_F",								100],
	["Estante,Metal (5 Shelves)",																"Land_Metal_rack_Tall_F",							150],
	["Estante,Comercial",																		"Land_ShelvesMetal_F",								100],
	["Estante,Madera (Slum)",																	"Land_Rack_F",										20],
	["Estante,Madera (Small)",																	"Land_ShelvesWooden_F",								50],
	["Estante,Madera (Small,Blue)",																"Land_ShelvesWooden_blue_F",						50],
	["Estante,Madera (Small,Green)",															"Land_ShelvesWooden_khaki_F",						50],
	["Estante,Madera with Cabinet",																"Land_OfficeCabinet_01_F",							300],
	["Shoot House Corner (Crouch)",																"Land_Shoot_House_Corner_Crouch_F",					100],
	["Shoot House Corner (Prone)",																"Land_Shoot_House_Corner_Prone_F",					100],
	["Shoot House Corner (Stand)",																"Land_Shoot_House_Corner_Stand_F",					100],
	["Shoot House Corner",																		"Land_Shoot_House_Corner_F",						100],
	["Shoot House Panel (Crouch)",																"Land_Shoot_House_Panels_Crouch_F",					100],
	["Shoot House Panel (Prone)",																"Land_Shoot_House_Panels_Prone_F",					100],
	["Shoot House Panel (Vault)",																"Land_Shoot_House_Panels_Vault_F",					100],
	["Shoot House Panel (Window)",																"Land_Shoot_House_Panels_Window_F",					100],
	["Shoot House Panel (Windows)",																"Land_Shoot_House_Panels_Windows_F",				100],
	["Shoot House Panel",																		"Land_Shoot_House_Panels_F",						100],
	["Shoot House Tunnel (Crouch)",																"Land_Shoot_House_Tunnel_Crouch_F",					100],
	["Shoot House Tunnel (Prone)",																"Land_Shoot_House_Tunnel_Prone_F",					100],
	["Shoot House Tunnel (Stand)",																"Land_Shoot_House_Tunnel_Stand_F",					100],
	["Shoot House Tunnel",																		"Land_Shoot_House_Tunnel_F",						100],
	["Shoot House Wall (Crouch)",																"Land_Shoot_House_Wall_Crouch_F",					100],
	["Shoot House Wall (Long Crouch)",															"Land_Shoot_House_Wall_Long_Crouch_F",				100],
	["Shoot House Wall (Long Prone)",															"Land_Shoot_House_Wall_Long_Prone_F",				100],
	["Shoot House Wall (Long Stand)",															"Land_Shoot_House_Wall_Long_Stand_F",				100],
	["Shoot House Wall (Long)",																	"Land_Shoot_House_Wall_Long_F",						100],
	["Shoot House Wall (Prone)",																"Land_Shoot_House_Wall_Prone_F",					100],
	["Shoot House Wall (Stand)",																"Land_Shoot_House_Wall_Stand_F",					100],
	["Shoot House Wall",																		"Land_Shoot_House_Wall_F",							100],
	["Cartel,For Rent",																			"Land_SignM_forRent_F",								100],
	["Cartel,For Sale",																			"Land_SignM_forSale_F",								100],
	["Cartel,Military Area (Greek/English)",													"Land_Sign_WarningMilitaryArea_F",					200],
	["Cartel,Military Area (Small)",															"Land_Sign_WarningMilAreaSmall_F",					100],
	["Cartel,Military Area (Small,Greek/English)",												"Land_Sign_WarningMilAreaSmall_F",					100],
	["Cartel,Military Area",																	"Land_Sign_WarningMilitaryArea_F",					100],
	["Cartel,Military Vehicles (Greek/English)",												"Land_Sign_WarningMilitaryVehicles_F",				100],
	["Cartel,Military Vehicles",																"Land_Sign_WarningMilitaryVehicles_F",				100],
	["Cartel,Mines",																			"Land_Sign_Mines_F",								100],
	["Cartel,Traffic Direction (Left)",															"ArrowDesk_L_F",									200],
	["Cartel,Traffic Direction (Right)",														"ArrowDesk_R_F",									200],
	["Cartel,Unexploded Ammo",																	"Land_Sign_WarningUnexplodedAmmo_F",				100],
	["Escaleras,Concrete",																		"Land_GH_Stairs_F",									500],
	["Mesa,Folding (Large)",																	"Land_CampingTable_F",								40],
	["Mesa,Folding (Small)",																	"Land_CampingTable_small_F",						20],
	["Mesa,Plastic Patio",																		"Land_TablePlastic_01_F",							20],
	["Mesa,Rattan",																				"Land_RattanTable_01_F",							50],
	["Mesa,Wood (Large,Slum)",																	"Land_WoodenTable_large_F",							20],
	["Mesa,Wood (Small,Slum)",																	"Land_WoodenTable_small_F",							10],
	["Mesa de Trabajo con Prensa",																"Land_Workbench_01_F",								50]

];
ServiceObjectsArray = compileFinal str
[
	// ACE Water
	["Barril Plástico (Azul) 160L",																"Land_BarrelWater_F",								1600],
	["Barril Plástico (Gris) 160L",																"Land_BarrelWater_grey_F",							1600],
	["Dispensador de Agua Fría (Viejo) 20L",													"Land_WaterCooler_01_old_F",						200],
	["Dispensador de Agua Fría (Nuevo) 20L",													"Land_WaterCooler_01_new_F",						200],
	["Barril de Agua (Marrón) 200L",															"Land_WaterBarrel_F",								2000],
	["Tanque de Agua Acostado 600L",															"Land_WaterTank_F",									6000],
	["Tanque de Agua Grande 2400L",																"Land_WaterTank_01_F",								24000],
	["Tanque de Agua Grande Elevado 2400L",														"Land_WaterTank_02_F",								24000],
	["Tanque de Agua Pequeño 200L",																"Land_WaterTank_03_F",								2000],
	["Tanque de Agua Pequeño Elevado 200L",														"Land_WaterTank_04_F",								2000],
	["Vejiga de Agua (Arena) 10KL",																"StorageBladder_02_water_sand_F",					10000],
	["Vejiga de Agua (Oliva) 10KL",																"StorageBladder_02_water_forest_F",					10000],
	["Bomba de Agua (Arena) Fuente Ilimitada",													"WaterPump_01_sand_F",								25000],
	["Bomba de Agua (Olivo) Fuente Ilimitada",													"WaterPump_01_forest_F",							25000],
	// ACE Fuels
	["Vejiga de Combustible (arena)60KL",														"StorageBladder_01_fuel_sand_F",					50000],
	["Vejiga de Combustible (oliva)60KL",														"StorageBladder_01_fuel_forest_F",					50000],
	["Tanque Flexible de Combustible (arena)300L",												"FlexibleTank_01_sand_F",							300],
	["Tanque Flexible de Combustible (oliva)300L",												"FlexibleTank_01_forest_F",							300],
	["Canistra (verde) 20L",																	"Land_CanisterFuel_F",								50],
	["Canistra (azul) 20L",																		"Land_CanisterFuel_Blue_F",							50],
	["Canistra (roja) 20L",																		"Land_CanisterFuel_Red_F",							50],
	["Canistra (blanca) 20L",																	"Land_CanisterFuel_White_F",						50],
	
	["Camo Ammo Cache",																			"Box_FIA_Support_F",								1000],
	["Sling Box",																				"CargoNet_01_box_F",								10000],
	["Sling Boxes (NATO)",																		"B_CargoNet_01_ammo_F",								10000],
	["Support Crate",																			"Box_NATO_Support_F",								100],
	["Taru Pod (Transport)",																	"Land_Pod_Heli_Transport_04_box_F",					1000],
	["Container,Cargo",																			"B_Slingload_01_Cargo_F",							5000],
	["Container,Fuel",																			"B_Slingload_01_Fuel_F",							20000],
	["Container,Medical",																		"B_Slingload_01_Medevac_F",							20000],
	["Container,Repair",																		"B_Slingload_01_Repair_F",							50000],
	["Taru Pod (Fuel)",																			"Land_Pod_Heli_Transport_04_fuel_F",				10000],
	["Taru Pod (Repair)",																		"Land_Pod_Heli_Transport_04_repair_F",				25000]
];
TowersArray = compileFinal str
[
	["Air Traffic Control",																					"Land_Airport_Tower_F",					10000],
	["Bag Bunker",																							"Land_BagBunker_Tower_F",				1000],
	["Castle (Stone)",																						"Land_Castle_01_tower_F",				5000],
	["HBarrier Watchtower",																					"Land_HBarrierTower_F",					2500],
	["Military Cargo (Brown)",																				"Land_Cargo_Tower_V3_F",				10000],
	["Military Cargo (Green)",																				"Land_Cargo_Tower_V1_F",				10000],
	["Military Cargo (Rusty)",																				"Land_Cargo_Tower_V2_F",				10000],
	["Military Cargo (No.1)",																				"Land_Cargo_Tower_V1_No1_F",			10000],
	["Military Cargo (No.2)",																				"Land_Cargo_Tower_V1_No2_F",			10000],
	["Military Cargo (No.3)",																				"Land_Cargo_Tower_V1_No3_F",			10000],
	["Military Cargo (No.4)",																				"Land_Cargo_Tower_V1_No4_F",			10000],
	["Military Cargo (No.5)",																				"Land_Cargo_Tower_V1_No5_F",			10000],
	["Military Cargo (No.6)",																				"Land_Cargo_Tower_V1_No6_F",			10000],
	["Military Cargo (No.7)",																				"Land_Cargo_Tower_V1_No7_F",			10000],
	["Radio Tower (Narrow)",																				"Land_TTowerBig_2_F",					10000],
	["Radio Tower (Wide)",																					"Land_TTowerBig_1_F",					10000]
];
AllBaseParts =	compileFinal str ( call TowersArray + call ServiceObjectsArray + call ObjectsArray + call lightsArray + call FencesAndWallsArray + call BuildingsArray + call BaseManagementArray);
//Text name,classname,buy cost,spawn type,sell price (selling not implemented) or spawning color
landArray = compileFinal str
[
	// RHS
	["MRZR",						"rhsusf_mrzr4_d",						3900,				"vehicle", 		"WEST"],
	["M1025A2",						"rhsusf_m1025_d",						5000,				"vehicle", 		"WEST"],
	["M1025A2 (Snorkel)",			"rhsusf_m1025_d_s",						5050,				"vehicle", 		"WEST"],
	["M1097A2 (2D)",				"rhsusf_m998_d_2dr_fulltop",			4000,				"vehicle", 		"WEST"],
	["M1097A2 (2D/Snorkel)",		"rhsusf_m998_d_s_2dr_fulltop",			4050,				"vehicle", 		"WEST"],
	["M1097A2 (2D/Half)",			"rhsusf_m998_d_2dr_halftop",			4000,				"vehicle", 		"WEST"],
	["M1097A2 (2D/Half/Snorkel)",	"rhsusf_m998_d_s_2dr_halftop",			4050,				"vehicle", 		"WEST"],
	["M1097A2 (2D/Open)",			"rhsusf_m998_d_2dr",					4000,				"vehicle", 		"WEST"],
	["M1097A2 (2D/Open/Snorkel)",	"rhsusf_m998_d_s_2dr",					4050,				"vehicle", 		"WEST"],
	["M1097A2 (4D)",				"rhsusf_m998_d_4dr_fulltop",			4500,				"vehicle", 		"WEST"],
	["M1097A2 (4D/Snorkel)",		"rhsusf_m998_d_s_4dr_fulltop",			4550,				"vehicle", 		"WEST"],
	["M1097A2 (4D/Half)",			"rhsusf_m998_d_4dr_halftop",			4500,				"vehicle", 		"WEST"],
	["M1097A2 (4D/Half/Snorkel)",	"rhsusf_m998_d_s_4dr_halftop",			4550,				"vehicle", 		"WEST"],
	["M1097A2 (4D/Open)",			"rhsusf_m998_d_4dr",					4500,				"vehicle", 		"WEST"],
	["M1097A2 (4D/Open/Snorkel)",	"rhsusf_m998_d_s_4dr",					4550,				"vehicle", 		"WEST"],
	["UAZ-3151",					"rhsgref_ins_uaz",						4000,				"vehicle", 		"EAST"],
	["UAZ-3151 (Open)",				"rhsgref_ins_uaz_open",					3800,				"vehicle", 		"EAST"],
	// camiones RHS
	["M1078A1P2",							"rhsusf_M1078A1P2_D_fmtv_usarmy",				5500,					"vehicle", "WEST"], // 100
	["M1078A1P2 (Flat)",					"rhsusf_M1078A1P2_D_flatbed_fmtv_usarmy",		6000,					"vehicle", "WEST"], // 200
	["M1078A1P2-B",							"rhsusf_M1078A1P2_B_D_fmtv_usarmy",				7000,					"vehicle", "WEST"], // 100
	["M1078A1P2-B (Flat)",					"rhsusf_M1078A1P2_B_D_flatbed_fmtv_usarmy",		7500,					"vehicle", "WEST"], // 200
	["M1078A1P2-B (M2)",					"rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy",			9000,					"vehicle", "WEST"], // 100
	["M1078A1P2-B (M2/Flat)",				"rhsusf_M1078A1P2_B_M2_D_flatbed_fmtv_usarmy",	9500,					"vehicle", "WEST"], // 200
	["M1078A1P2-B CP BOX",					"rhsusf_M1078A1P2_B_D_CP_fmtv_usarmy",			10000,					"vehicle", "WEST"], // 300
	["M1083A1P2",							"rhsusf_M1083A1P2_D_fmtv_usarmy",				6500,					"vehicle", "WEST"], // 120
	["M1083A1P2 (Flat)",					"rhsusf_M1083A1P2_D_flatbed_fmtv_usarmy",		7000,					"vehicle", "WEST"], // 220
	["M1083A1P2-B",							"rhsusf_M1083A1P2_B_D_fmtv_usarmy",				8000,					"vehicle", "WEST"], // 120
	["M1083A1P2-B (Flat)",					"rhsusf_M1083A1P2_B_D_flatbed_fmtv_usarmy",		8500,					"vehicle", "WEST"], // 220
	["M1083A1P2-B (M2)",					"rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy",			10000,					"vehicle", "WEST"], // 120
	["M1083A1P2-B (M2/Flat)",				"rhsusf_M1083A1P2_B_M2_D_flatbed_fmtv_usarmy",	10500,					"vehicle", "WEST"], // 220
	["M1084A1P2 (Flat)",					"rhsusf_M1084A1P2_D_fmtv_usarmy",				7500,					"vehicle", "WEST"], // 250
	["M1084A1P2-B (Flat)",					"rhsusf_M1084A1P2_B_D_fmtv_usarmy",				9000,					"vehicle", "WEST"], // 250
	["M1084A1P2-B (M2/Flat)",				"rhsusf_M1084A1P2_B_M2_D_fmtv_usarmy",			11000,					"vehicle", "WEST"],	// 250
	["M1085A1P2-B CBPS (Médico)",			"rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy",		12000,					"vehicle", "WEST"], // 30
	["M977A4 (Flat)",						"rhsusf_M977A4_usarmy_d",						6000,					"vehicle", "WEST"], // 300
	["M977A4-B (Flat)",						"rhsusf_M977A4_BKIT_usarmy_d",					6500,					"vehicle", "WEST"], // 300
	["M977A4-B (M2/Flat)",					"rhsusf_M977A4_BKIT_M2_usarmy_d",				8000,					"vehicle", "WEST"], // 300
	["M977A4 (Ammo)",						"rhsusf_M977A4_AMMO_usarmy_d",					625000,					"vehicle", "WEST"], // 30
	["M977A4-B (Ammo)",						"rhsusf_M977A4_AMMO_BKIT_usarmy_d",				626000,					"vehicle", "WEST"], // 30
	["M977A4-B (Ammo/M2)",					"rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d",			630000,					"vehicle", "WEST"], // 30
	["M977A4 (Repair)",						"rhsusf_M977A4_REPAIR_usarmy_d",				255000,					"vehicle", "WEST"], // 30
	["M977A4-B (Repair)",					"rhsusf_M977A4_REPAIR_BKIT_usarmy_d",			260000,					"vehicle", "WEST"], // 30
	["M977A4-B (Repair/M2)",				"rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d",		290000,					"vehicle", "WEST"], // 30
	["M978A4 (Fuel)",						"rhsusf_M978A4_usarmy_d",						130000,					"vehicle", "WEST"], // 30
	["M978A4-B (Fuel)",						"rhsusf_M978A4_BKIT_usarmy_d",					150000,					"vehicle", "WEST"], // 30
	
	["GAZ-66 (Open)",								"rhs_gaz66o_msv",						5000,				"vehicle", "EAST"],
	["GAZ-66 (Cover)",								"rhs_gaz66_msv",						5500,				"vehicle", "EAST"],
	["GAZ-66 (Flat/Open)",							"rhs_gaz66o_flat_msv",					5500,				"vehicle", "EAST"],
	["GAZ-66 (Flat/Cover)",							"rhs_gaz66_flat_msv",					6500,				"vehicle", "EAST"],
	["GAZ-66 (Ammo)",								"rhs_gaz66_ammo_msv",					50000,				"vehicle", "EAST"],
	["GAZ-66 (Médico)",								"rhs_gaz66_ap2_msv",					101000,				"vehicle", "EAST"],
	["GAZ-66 ESB-8IM (Repair)",						"rhs_gaz66_repair_msv",					205000,				"vehicle", "EAST"],
	["GAZ-66 (R-142N Base Cracker)",				"rhs_gaz66_r142_msv",					5000,				"vehicle"], // EL DE LAS ANTENAS
	["KamAZ-5350 (Cover)",							"rhs_kamaz5350_msv",					5500,				"vehicle", "EAST"], // 
	["KamAZ-5350 (Cover/Flat)",						"rhs_kamaz5350_flatbed_cover_msv",		6000,				"vehicle", "EAST"], // 
	["KamAZ-5350 (Open)",							"rhs_kamaz5350_open_msv",				5000,				"vehicle", "EAST"], // 
	["KamAZ-5350 (Open/Flat)",						"rhs_kamaz5350_flatbed_msv",			5500,				"vehicle", "EAST"], // 
	["Ural 4320 (Cover)",							"RHS_Ural_MSV_01",						5000,				"vehicle", "EAST"],
	["Ural 4320 (Cover/Flat)",						"RHS_Ural_Flat_MSV_01",					5500,				"vehicle", "EAST"],
	["Ural 4320 (Open)",							"RHS_Ural_Open_MSV_01",					5000,				"vehicle", "EAST"],
	["Ural 4320 (Open/Flat)",						"RHS_Ural_Open_Flat_MSV_01",			5500,				"vehicle", "EAST"],
	["PTS-M",										"rhs_pts_vmf",							15500,				"vehicle", "EAST"], // anfibio carga carros

	// ["Kart",																	"C_Kart_01_F",														500,						"vehicle"],
	["Quadbike (Civilian)",														"C_Quadbike_01_F",													600,						"vehicle"],
	["Quadbike (NATO)",															"B_Quadbike_01_F",													650,						"vehicle"],
	["Quadbike (CSAT)",															"O_Quadbike_01_F",													650,						"vehicle"],
	["Quadbike (AAF)",															"I_Quadbike_01_F",													650,						"vehicle"],
	["Quadbike (FIA)",															"B_G_Quadbike_01_F",												650,						"vehicle"],
	
	["Hatchback",																"C_Hatchback_01_F",													800,						"vehicle"],
	["Hatchback Sport",															"C_Hatchback_01_sport_F",											1000,						"vehicle"],

	["SUV",																		"C_SUV_01_F",														1100,						"vehicle"],

	["MB 4WD",																	"I_C_Offroad_02_unarmed_F",											1100,						"vehicle"],
	["MB 4WD (Rollcage)",														"C_Offroad_02_unarmed_F",											1100,						"vehicle"],

	["Offroad",																	"C_Offroad_01_F",													1100,						"vehicle"],
	["Offroad (Gendarmerie)",													"B_GEN_Offroad_01_gen_F",											1100,						"vehicle"],
	["Offroad Camo",															"B_G_Offroad_01_F",													1250,						"vehicle"],
	["Offroad Repair",															"C_Offroad_01_repair_F",											6100,						"vehicle"],
	["Offroad HMG",																"B_G_Offroad_01_armed_F",											2500,						"vehicle"],

	["Truck",																	"C_Van_01_transport_F",												700,						"vehicle"],
	["Truck (Camo)",															"B_G_Van_01_transport_F",											800,						"vehicle"],
	["Truck Box",																"C_Van_01_box_F",													900,						"vehicle"],
	["Fuel Truck",																"C_Van_01_fuel_F",													6000,						"vehicle"],
	["Fuel Truck (Camo)",														"B_G_Van_01_fuel_F",												6000,						"vehicle"],

	["Van (Ambulance)",															"C_Van_02_medevac_F",												2100,						"vehicle"],
	["Van (Civilian Cargo)",													"C_Van_02_vehicle_F",												2100,						"vehicle"],
	["Van (Civilian Transport)",												"C_Van_02_transport_F",												2100,						"vehicle"],
	["Van (Military Cargo)",													"I_G_Van_02_vehicle_F",												2100,						"vehicle"],
	["Van (Military Transport)",												"B_G_Van_02_transport_F",											2100,						"vehicle"],
	["Van (Repair)",															"C_Van_02_service_F",												12000,						"vehicle"],

	["HEMTT Tractor",															"B_Truck_01_mover_F",												4000,						"vehicle",	"HIDDEN"],
	["HEMTT Box",																"B_Truck_01_box_F",													5000,						"vehicle",	"HIDDEN"],
	["HEMTT Transport",															"B_Truck_01_transport_F",											6000,						"vehicle",	"HIDDEN"],
	["HEMTT Covered",															"B_Truck_01_covered_F",												7500,						"vehicle",	"HIDDEN"],
	["HEMTT Fuel",																"B_Truck_01_fuel_F",												130000,						"vehicle",	"HIDDEN"],
	["HEMTT Medical",															"B_Truck_01_medical_F",												10000,						"vehicle",	"HIDDEN"],
	["HEMTT Repair",															"B_Truck_01_Repair_F",												255000,						"vehicle",	"HIDDEN"],
	["HEMTT Ammo",																"B_Truck_01_ammo_F",												625000,						"vehicle",	"HIDDEN"],
	["Base Cracker",															"O_Truck_03_device_F",												1000000,					"vehicle"],
	["Tempest Transport",														"O_Truck_03_transport_F",											6000,						"vehicle",	"HIDDEN"],
	["Tempest Covered",															"O_Truck_03_covered_F",												7500,						"vehicle",	"HIDDEN"],
	["Tempest Fuel",															"O_Truck_03_fuel_F",												103000,						"vehicle",	"HIDDEN"],
	["Tempest Medical",															"O_Truck_03_medical_F",												10000,						"vehicle",	"HIDDEN"],
	["Tempest Repair",															"O_Truck_03_repair_F",												12500,						"vehicle",	"HIDDEN"],
	["Tempest Ammo",															"O_Truck_03_ammo_F",												203000,						"vehicle",	"HIDDEN"],

	["Zamak Transport",															"I_Truck_02_transport_F",											4000,						"vehicle",	"HIDDEN"],
	["Zamak Covered",															"I_Truck_02_covered_F",												5000,						"vehicle",	"HIDDEN"],
	["Zamak Fuel",																"I_Truck_02_fuel_F",												72500,						"vehicle",	"HIDDEN"],
	["Zamak Medical",															"I_Truck_02_medical_F",												9000,						"vehicle",	"HIDDEN"],
	["Zamak Repair",															"I_Truck_02_box_F",													152500,						"vehicle",	"HIDDEN"],
	["Zamak Ammo",																"I_Truck_02_ammo_F",												505000,						"vehicle",	"HIDDEN"],

	["Prowler (Unarmed)",														"B_T_LSV_01_unarmed_F",												900,						"vehicle"],
	["Prowler (Armed)",															"B_T_LSV_01_armed_F",												5000,						"vehicle"],
	["Qilin (Unarmed)",															"O_T_LSV_02_unarmed_F",												900,						"vehicle"],
	["Qilin (Armed)",															"O_T_LSV_02_armed_F",												5000,						"vehicle"],

	["UGV Stomper (NATO)",														"B_UGV_01_F",														2500,						"vehicle",	"HIDDEN"],
	["UGV Stomper RCWS (NATO)",													"B_UGV_01_rcws_F",													45000,						"vehicle",	"HIDDEN"],
	["UGV Stomper (AAF)",														"I_UGV_01_F",														2500,						"vehicle",	"HIDDEN"],
	["UGV Stomper RCWS (AAF)",													"I_UGV_01_rcws_F",													45000,						"vehicle",	"HIDDEN"],
	["UGV Saif (CSAT)",															"O_UGV_01_F",														2500,						"vehicle",	"HIDDEN"],
	["UGV Saif RCWS (CSAT)",													"O_UGV_01_rcws_F",													45000,						"vehicle",	"HIDDEN"]
];
armoredArray = compileFinal str
[
	["M1084A1R SOV (M2)",					"rhsusf_M1084A1R_SOV_M2_D_fmtv_socom",	1000000,		"vehicle", 		"WEST"], // Para sustituir al Bobcat
	["M113A3 (Desarmado)", 					"rhsusf_m113_usarmy_unarmed", 		40500, 				"vehicle", 		"WEST"],
	
	["M113A3 (Ammo/Cal. 30)", 				"rhsusf_m113_usarmy_supply", 		60000, 				"vehicle", "WEST"],
	["M113A3 (M2)",							"rhsusf_m113_usarmy",				62000,				"vehicle", "WEST"],
	["M113A3 (M240)",						"rhsusf_m113_usarmy_M240",			62500,				"vehicle", "WEST"],
	["M113A3 (MEV)",						"rhsusf_m113_usarmy_medical",		50000,				"vehicle", "WEST"],
	["M113A3 (Mk19)",						"rhsusf_m113_usarmy_MK19",			65500,				"vehicle", "WEST"],
	
	["M1025A2 (M2)",						"rhsusf_m1025_d_m2",				28500,				"vehicle", "WEST"],
	["M1025A2 (M2/Snorkel)",				"rhsusf_m1025_d_s_m2",				28500,				"vehicle", "WEST"],
	["M1025A2 (Mk19)",						"rhsusf_m1025_d_Mk19",				30500,				"vehicle", "WEST"],
	["M1025A2 (Mk19/Snorkel)",				"rhsusf_m1025_d_s_Mk19",			30500,				"vehicle", "WEST"],
	["UAZ-3151 (Open/AGS-30)",				"rhsgref_ins_uaz_ags",				15000,				"vehicle", "EAST"], // TIRAGRANADAS TIPO MK19
	["UAZ-3151 (Open/DShKM)",				"rhsgref_ins_uaz_dshkm",			10000,				"vehicle", "EAST"], // AMETRALLADORA CAL.50
	["UAZ-3151 (Open/SPG-9)",				"rhsgref_ins_uaz_spg9",				17000,				"vehicle", "EAST"], // TIRA COHETES HE-FRAG Y HEAT BALISTICOS, NO COLIMA
	["GAZ-233011",							"rhs_tigr_msv",						9000,				"vehicle", "EAST"], // NORMAL
	["GAZ-233114",							"rhs_tigr_m_msv",					9500,				"vehicle", "EAST"], // CON ESCOTILLA
	["GAZ-233014",							"rhs_tigr_sts_msv",					25000,				"vehicle", "EAST"], // aRTILLADO CON CAL. 30 Y TIRAGRANADAS
	
	["ZSU-23-4V",					"rhsgref_ins_zsu234",			165000,				"vehicle", "EAST"],
	["Ural-4320 (ZU-23-2)",			"RHS_Ural_Zu23_MSV_01",			150000,				"vehicle", "EAST"],
	["BTR-60PB",					"rhsgref_ins_btr60",			65000,				"vehicle", "EAST"],
	["BTR-70",						"rhsgref_ins_btr70",			70000,				"vehicle", "EAST"],
	["BTR-80A",						"rhs_btr80a_msv",				85000,				"vehicle", "EAST"], // ANTI CARRO LIGERO
	
	["BMP-1",					"rhs_bmp1_msv",						95000,				"vehicle", "EAST"], // 9K11 COHETE BLANCO AT
	["BMP-1P",					"rhs_bmp1p_msv",					97000,				"vehicle", "EAST"], // 9M113 EXTERNO GUNNER EXPUESTO
	["BMP-2D",					"rhs_bmp2d_msv",					100000,				"vehicle", "EAST"], // 9M113 EXTERNO GUNNER INTERNO 3.5KM ALCANCE
	["BMP-3 (late)",			"rhs_bmp3_late_msv",				120000,				"vehicle", "EAST"], // Tiene ATGM el misil teledirigido por el anima del cañón
	["BMP-3 (Vesna-K)",			"rhs_bmp3m_msv",					122000,				"vehicle", "EAST"], // 		''
	["Obyekt-681-1",			"rhs_Ob_681_2",						155000,				"vehicle", "EAST"], //
	["BRDM-2UM",				"rhsgref_BRDM2UM_ins_g",			9000,				"vehicle", "EAST"], // 	desarmado
	["BRDM-2UM (Armado)",		"rhsgref_BRDM2_HQ_ins_g",			10000,				"vehicle", "EAST"], // 	ametralladora con gunner expuesto
	["BRDM-2",					"rhsgref_BRDM2_ins_g",				11000,				"vehicle", "EAST"], // 	torreta
	["BRDM-2 (9P148)",			"rhsgref_BRDM2_ATGM_ins_g",			113000,				"vehicle", "EAST"], // 	ATGM 9M113

	//IFV
	["M2A2ODS Bradley  (TOW)",				"RHS_M2A2",							77000,				"vehicle", "WEST"],
	["M2A2ODS Bradley  (TOW)",				"RHS_M2A2_BUSKI",					80000,				"vehicle", "WEST"],
	["M2A3 Bradley (TOW/Moderno)",			"RHS_M2A3",							90500,				"vehicle", "WEST"],
	["M2A3 Bradley BUSK I (TOW/Moderno)",	"RHS_M2A3_BUSKI",					92000,				"vehicle", "WEST"],
	["M2A3 Bradley BUSK III (TOW/Moderno)",	"RHS_M2A3_BUSKIII",					95000,				"vehicle", "WEST"],
	["M6A2 Bradley (Stinger AA)",			"RHS_M6",							95000,				"vehicle", "WEST"],
	// MRAP
	["M1117 ASV",							"rhsusf_M1117_D",					55000,				"vehicle", "WEST"],
	["RG-33",								"rhsusf_rg33_usmc_d",				4000,				"vehicle", 		"WEST"],
	["RG-33 (M2)",							"rhsusf_rg33_m2_usmc_d",			43000,				"vehicle", "WEST"],
	["M1220",								"rhsusf_M1220_usarmy_d",			5000,				"vehicle", "WEST"],
	["M1220 (M2 CROWS)",					"rhsusf_M1220_M153_M2_usarmy_d",	50000,				"vehicle", "WEST"],
	["M1220 (M2)",							"rhsusf_M1220_M2_usarmy_d",			47000,				"vehicle", "WEST"],
	["M1220 (Mk19)",						"rhsusf_M1220_MK19_usarmy_d",		49000,				"vehicle", "WEST"],
	["M1230A1 MEV",							"rhsusf_M1230a1_usarmy_d",			6500,				"vehicle", "WEST"],
	["M1230 (M2)",							"rhsusf_M1230_M2_usarmy_d",			47500,				"vehicle", "WEST"],
	["M1230 (Mk19)",						"rhsusf_M1230_MK19_usarmy_d",		50500,				"vehicle", "WEST"],
	["M1232",								"rhsusf_M1232_usarmy_d",			6000,				"vehicle", "WEST"],
	["M1232 (M2)",							"rhsusf_M1232_M2_usarmy_d",			50500,				"vehicle", "WEST"],
	["M1232 (Mk19)",						"rhsusf_M1232_MK19_usarmy_d",		52500,				"vehicle", "WEST"],
	["M1237 (M2)",							"rhsusf_M1237_M2_usarmy_d",			53500,				"vehicle", "WEST"],
	["M1237 (Mk19)",						"rhsusf_M1237_MK19_usarmy_d",		55000,				"vehicle", "WEST"],
	
	["Rhino MGS", 																"B_AFV_Wheeled_01_cannon_F", 										45000, 						"vehicle",	"HIDDEN"],
	["Rhino MGS UP", 															"B_AFV_Wheeled_01_up_cannon_F", 									55000, 						"vehicle",	"HIDDEN"],
	["Hunter",																	"B_MRAP_01_F",														4000,						"vehicle",	"HIDDEN"],
	["Hunter HMG",																"B_MRAP_01_hmg_F",													35000,						"vehicle",	"HIDDEN"],
	["Hunter GMG",																"B_MRAP_01_gmg_F",													37500,						"vehicle",	"HIDDEN"],
	["Ifrit",																	"O_MRAP_02_F",														4000,						"vehicle",	"HIDDEN"],
	["Ifrit HMG",																"O_MRAP_02_hmg_F",													35000,						"vehicle",	"HIDDEN"],
	["Ifrit GMG",																"O_MRAP_02_gmg_F",													37500,						"vehicle",	"HIDDEN"],
	["Strider",																	"I_MRAP_03_F",														4000,						"vehicle",	"HIDDEN"],
	["Strider HMG",																"I_MRAP_03_hmg_F",													35000,						"vehicle",	"HIDDEN"],
	["Strider GMG",																"I_MRAP_03_gmg_F",													37500,						"vehicle",	"HIDDEN"],
	["MSE-3 Marid",																"O_APC_Wheeled_02_rcws_F",											50000,						"vehicle",	"HIDDEN"],
	["AMV-7 Marshall",															"B_APC_Wheeled_01_cannon_F",										70000,						"vehicle",	"HIDDEN"],
	["AFV-4 Gorgon",															"I_APC_Wheeled_03_cannon_F",										95000,						"vehicle",	"HIDDEN"]
];
tanksArray = compileFinal str
[
	["M109A6",						"rhsusf_m109d_usarmy",					1000000,			"vehicle", "WEST"],
	["M1A1HC",						"rhsusf_m1a1hc_wd",						130600,				"vehicle", "WEST"],
	["M1A1FEP",						"rhsusf_m1a1fep_d",						130000,				"vehicle", "WEST"],
	["M1A1SA",						"rhsusf_m1a1aimd_usarmy",				150000,				"vehicle", "WEST"],
	["M1A1SA (TUSK I)",				"rhsusf_m1a1aim_tuski_d",				160000,				"vehicle", "WEST"],
	["M1A2SPv1",					"rhsusf_m1a2sep1d_usarmy",				100000,				"vehicle", "WEST"],
	["M1A2SPv1 (TUSK II)",			"rhsusf_m1a2sep1tuskiid_usarmy",		165000,				"vehicle", "WEST"],
	["BM-21",					"RHS_BM21_MSV_01",			650000,				"vehicle", "EAST"],
	["9P129-1M (9M79-1-F)",		"rhs_9k79",					1000000,			"vehicle", "EAST"], // 	Misil balístico táctico variante RACIMO?
	["9P129-1M (9M79-1-K)",		"rhs_9k79_K",				1000000,			"vehicle", "EAST"], // 	Misil balístico táctico variante MOAB
	// ["9P129-1M (9M79B)",		"rhs_9k79_B",				10000000,			"vehicle", "EAST"], // 	Misil balístico táctico variante NUCLEAR
	["2S3M1",					"rhs_2s3_tv",				1000000,			"vehicle", "EAST"], // 	igual que el socher
	["2S25",					"rhs_sprut_vdv",			80000,				"vehicle", "EAST"], // 	Buen armamento, blindaje muy pobre 
	["T-72B (obr. 1984g)",		"rhs_t72ba_tv",				110000,				"vehicle", "EAST"], // hay que recargarlo manual (tecla R) el hud es antiguo
	["T-80",					"rhs_t80",					119000,				"vehicle", "EAST"], // hay que recargarlo manual (tecla R) el hud es antiguo
	["T-80A",					"rhs_t80a",					120000,				"vehicle", "EAST"],
	["T-80BK",					"rhs_t80bk",				125000,				"vehicle", "EAST"],
	["T-80BVK",					"rhs_t80bvk",				127000,				"vehicle", "EAST"],
	["T-80U (45M)",				"rhs_t80u45m",				130000,				"vehicle", "EAST"],
	["T-90 (obr. 1992g)",		"rhs_t90_tv",				135000,				"vehicle", "EAST"], // Tiene el ATGM 9M119 el misil teledirigido por el anima del cañón
	["T-90A (obr. 2006g)",		"rhs_t90a_tv",				140000,				"vehicle", "EAST"], // Tiene el ATGM 9M119 el misil teledirigido por el anima del cañón

	["AWC 303 Nyx Recon", 														"I_LT_01_scout_F", 													5000, 						"vehicle",	"HIDDEN"],
	["AWC 304 Nyx Autocannon", 													"I_LT_01_cannon_F", 												20000, 						"vehicle",	"HIDDEN"],
	["AWC 301 Nyx AT", 															"I_LT_01_AT_F", 													20000, 						"vehicle",	"HIDDEN"],
	["AWC 302 Nyx AA", 															"I_LT_01_AA_F", 													20000, 						"vehicle",	"HIDDEN"],
	["T-140 Angara", 															"O_MBT_04_cannon_F", 												75000, 						"vehicle",	"HIDDEN"],
	["T-140K Angara", 															"O_MBT_04_command_F", 												90000, 						"vehicle",	"HIDDEN"],
	["IFV-6c Panther",															"B_APC_Tracked_01_rcws_F",											55000,						"vehicle",	"HIDDEN"],
	["FV-720 Mora",																"I_APC_tracked_03_cannon_F",										75000,						"vehicle",	"HIDDEN"],
	["BTR-K Kamysh",															"O_APC_Tracked_02_cannon_F",										100000,						"vehicle",	"HIDDEN"],
	["IFV-6a Cheetah AA",														"B_APC_Tracked_01_AA_F",											110000,						"vehicle",	"HIDDEN"],
	["ZSU-39 Tigris AA",														"O_APC_Tracked_02_AA_F",											110000,						"vehicle",	"HIDDEN"],
	["M2A1 Slammer",															"B_MBT_01_cannon_F",												125000,						"vehicle",	"HIDDEN"],
	["M2A4 Slammer HMG",														"B_MBT_01_TUSK_F",													130000,						"vehicle",	"HIDDEN"],						// Commander gun variant
	["T-100 Varsuk",															"O_MBT_02_cannon_F",												140000,						"vehicle",	"HIDDEN"],
	["MBT-52 Kuma",																"I_MBT_03_cannon_F",												150000,						"vehicle",	"HIDDEN"],
	["CRV-6e Bobcat",															"B_APC_Tracked_01_CRV_F",											1000000,					"vehicle",	"HIDDEN"],
	["M4 Scorcher",																"B_MBT_01_arty_F",													1000000,					"vehicle",	"HIDDEN"],
	["M5 Sandstorm MLRS",														"B_MBT_01_mlrs_F",													1000000,					"vehicle",	"HIDDEN"]
];
helicoptersArray = compileFinal str
[	
	["OH-6M",					"RHS_MELB_H6M",				5500,				"vehicle", "WEST"],
	["AH-6M Little Bird",		"RHS_MELB_AH6M",			70000,				"vehicle", "WEST"],
	["AH-64D (OIF Grey)",		"RHS_AH64DGrey",			550000,				"vehicle", "WEST"],
	["AH-64D",					"RHS_AH64D_wd",				550000,				"vehicle", "WEST"],
	["AH-64D (No Radar)",		"RHS_AH64D_noradar",		530000,				"vehicle", "WEST"],
	["AH-1Z",					"RHS_AH1Z",					555000,				"vehicle", "WEST"],
	["CH-47F",					"RHS_CH_47F",				25000,				"vehicle", "WEST"],
	["UH-1Y (2x RocketPod)",	"RHS_UH1Y_FFAR_d",			60000,				"vehicle", "WEST"],
	["UH-1Y (2x RocketPod/MG)",	"RHS_UH1Y_d",				60000,				"vehicle", "WEST"],
	["UH-1Y (Desarmado)",		"RHS_UH1Y_UNARMED_d",		25000,				"vehicle", "WEST"],
	["UH-60M (2x MiniGun)",		"RHS_UH60M",				55000,				"vehicle", "WEST"],
	["UH-60M (ESSS)",			"RHS_UH60M_ESSS",			30500,				"vehicle", "WEST"],
	["UH-60M",					"RHS_UH60M2",				30000,				"vehicle", "WEST"],
	["UH-60M (MEV)",			"RHS_UH60M_MEV2",			30500,				"vehicle", "WEST"],
	["UH-60M (MEV/ESSS)",		"RHS_UH60M_MEV",			31000,				"vehicle", "WEST"],
	["CH-53E",					"rhsusf_CH53E_USMC_D",		40000,				"vehicle", "WEST"],
	["Mi-24P",					"RHS_Mi24P_vvsc",			530000,				"vehicle", "EAST"], // PILOTO: Ametralladora GSh-30-2K. 2x20 rockets S-8 KOM. Gunner: 4 9M129M (misil teledir.) 2 FAB 250 (bombas caida libre)
	["Mi-24V",					"RHS_Mi24V_vvs",			550000,				"vehicle", "EAST"], // PILOTO: 2x20 rockets S-8 KOM + 2x20 rockets S-8 DF. Gunner: 4 9M129M (misil teledir.) Torreta 1SLT 12.7x108mm (minigun) x1470 rondas
	["Mi-24T (Desarmado)",		"RHS_Mi24Vt_vvs",			5000,				"vehicle", "EAST"], // Desarmado
	["Mi-28N",					"rhs_mi28n_vvs",			650000,				"vehicle", "EAST"], // PILOTO: 2x20 rockets S-8 KOM. Gunner: 16 9M129M (misil teledir.). Shipunov 2A42 125 3UOF8 (HE-T) + 125 UBR11 (APFSDS)
	["Mi-8AMT",					"RHS_Mi8AMT_vdv",			5500,				"vehicle", "EAST"], // Desarmado
	["Mi-8MT (Cargo)",			"RHS_Mi8mt_Cargo_vdv",		5700,				"vehicle", "EAST"], // Desarmado
	["Mi-8MT (Artillado)",		"RHS_Mi8mt_vdv",			45000,				"vehicle", "EAST"], // Artillado puerta delantera, y ventana trasera
	["Mi-8MTV-3(Cargo/Artillado)",	"RHS_Mi8mtv3_Cargo_vvsc",	85000,			"vehicle", "EAST"], // Artillado en el morro. 40 S-8 DF + 40 S-8 KOM
	["Mi-8MTV-3(Artillado)",	"RHS_Mi8MTV3_vvsc",			95500,				"vehicle", "EAST"], // Artillado en el morro, puerta delantera, y ventana trasera. 40 S-8 DF + 40 S-8 KOM
	["Mi-8MTV-3(Heavy)",		"RHS_Mi8MTV3_heavy_vdv",	100000,				"vehicle", "EAST"], // Artillado en el morro, puerta delantera, y ventana trasera. 120 S-8 KOM
	["Mi-8AMTSh",				"RHS_Mi8AMTSh_vvsc",		120000,				"vehicle", "EAST"], // Artillado en el morro, 2x puertas delanteras, y ventana trasera. 120 S-8 KOM
	["Ka-52",					"RHS_Ka52_vvsc",			360000,				"vehicle", "EAST"], // Piloto: 40 S-8 KOM. GUNNER: Shipunov 2A42 230 3UOF8 (HE-T) + 230 UBR11 (APFSDS). 12  9M127M (misil teledir.)
	["Ka-60",					"rhs_ka60_c",				4500,				"vehicle", "EAST"], // desarmado
	
	["AH-9 Pawnee (Shrieker AP)",												"B_Heli_Light_01_dynamicLoadout_F",									70000,						"vehicle",						"variant_pawneeS-HE",	"HIDDEN"],
	["AH-9 Pawnee (Shrieker HE)",												"B_Heli_Light_01_dynamicLoadout_F",									80000,						"vehicle",						"variant_pawneeS-AP",	"HIDDEN"],
	["AH-9 Pawnee (Tratnyr AP)",												"B_Heli_Light_01_dynamicLoadout_F",									80000,						"vehicle",						"variant_pawneeT-AP",	"HIDDEN"],
	["AH-9 Pawnee (Gun-Only)",													"B_Heli_Light_01_dynamicLoadout_F",									15000,						"vehicle",						"variant_pawneeGun",	"HIDDEN"],// Armed AH-6 (no missiles)
	["AH-9 Pawnee (20mm Cannons)",												"B_Heli_Light_01_dynamicLoadout_F",									45000,						"vehicle",						"variant_pawnee20mm",	"HIDDEN"],
	["AH-9 Pawnee (Falchion x2)",												"B_Heli_Light_01_dynamicLoadout_F",									120000,						"vehicle",						"variant_pawneeFALCHION",	"HIDDEN"],
	["AH-9 Pawnee (Scalpel x8)",												"B_Heli_Light_01_dynamicLoadout_F",									200000,						"vehicle",						"variant_pawneeSCALX4",	"HIDDEN"],
	["AH-9 Pawnee (Tratnyr HE)",												"B_Heli_Light_01_dynamicLoadout_F",									90000,						"vehicle",						"variant_pawneeT-HE",	"HIDDEN"],
	["AH-9 Pawnee (DAR)",														"B_Heli_Light_01_dynamicLoadout_F",									45000,						"vehicle",						"variant_pawneeDAR",	"HIDDEN"],
	["AH-99 Blackfoot",															"B_Heli_Attack_01_dynamicLoadout_F",								500000,						"vehicle",	"HIDDEN"],
	["CH-49 Mohawk",															"I_Heli_Transport_02_F",											10000,						"vehicle",	"HIDDEN"],
	["CH-67 Huron (Armed) [DLC]",												"B_Heli_Transport_03_F",											30000,						"vehicle",	"HIDDEN"],
	["CH-67 Huron (Black) [DLC]",												"B_Heli_Transport_03_unarmed_F",									10000,						"vehicle",	"HIDDEN"],
	["M-900 Civilian",															"C_Heli_Light_01_civil_F",											4000,						"vehicle",	"HIDDEN"],
	["MH-9 Hummingbird",														"B_Heli_Light_01_F",												5000,						"vehicle",	"HIDDEN"],
	["Mi-290 Taru (Box) [DLC]",													"O_Heli_Transport_04_box_F",										8000,						"vehicle",	"HIDDEN"],
	["Mi-290 Taru (Ammo) [DLC]",												"O_Heli_Transport_04_ammo_F",										725000,						"vehicle",	"HIDDEN"],
	["Mi-290 Taru (Repair) [DLC]",												"O_Heli_Transport_04_repair_F",										227500,						"vehicle",	"HIDDEN"],
	["Mi-290 Taru (Crane) [DLC]",												"O_Heli_Transport_04_F",											7500,						"vehicle",	"HIDDEN"],
	["Mi-290 Taru (Fuel) [DLC]",												"O_Heli_Transport_04_fuel_F",										120000,						"vehicle",	"HIDDEN"],
	["Mi-290 Taru (Bench) [DLC]",												"O_Heli_Transport_04_bench_F",										9000,						"vehicle",	"HIDDEN"],
	["Mi-290 Taru (Transport) [DLC]",											"O_Heli_Transport_04_covered_F",									9500,						"vehicle",	"HIDDEN"],
	["Mi-290 Taru (Medical) [DLC]",												"O_Heli_Transport_04_medevac_F",									12500,						"vehicle",	"HIDDEN"],
	["Mi-48 Kajman",															"O_Heli_Attack_02_dynamicLoadout_F",								300000,						"vehicle",	"HIDDEN"],
	["MQ-12 Falcon",															"B_T_UAV_03_dynamicLoadout_F",										350000,						"vehicle",	"HIDDEN"],
	["PO-30 Orca (Unarmed)",													"O_Heli_Light_02_dynamicLoadout_F",									30000,						"vehicle",						"variant_orcaUnArm",	"HIDDEN"],
	["PO-30 Orca (Unarmed)",													"O_Heli_Light_02_dynamicLoadout_F",									6000,						"vehicle",						"variant_orcaUnArm",	"HIDDEN"],
	["PO-30 Orca (6.5mm + DAGR)",												"O_Heli_Light_02_dynamicLoadout_F",									75000,						"vehicle",						"variant_orcaGUNDAGR",	"HIDDEN"],
	["PO-30 Orca (6.5mm + DAR)",												"O_Heli_Light_02_dynamicLoadout_F",									40000,						"vehicle",						"variant_orcaGUNDAR",	"HIDDEN"],
	["PO-30 Orca (6.5mm)",														"O_Heli_Light_02_dynamicLoadout_F",									10000,						"vehicle",						"variant_orcaGUN",	"HIDDEN"],
	["UH-80 Ghost Hawk",														"B_Heli_Transport_01_F",											25000,						"vehicle",	"HIDDEN"],
	["WY-55 Hellcat (Armed)",													"I_Heli_light_03_dynamicLoadout_F",									40000,						"vehicle",						"variant_HellGun",	"HIDDEN"],
	["WY-55 Hellcat (Unarmed)",													"I_Heli_light_03_unarmed_F",										7000,						"vehicle"],
	["WY-55 Hellcat (Bombs)",													"I_Heli_light_03_dynamicLoadout_F",									40000,						"vehicle",						"variant_HellBOMB",	"HIDDEN"],
	["WY-55 Hellcat (DAR)",														"I_Heli_light_03_dynamicLoadout_F",									40000,						"vehicle",						"variant_HellDAR",	"HIDDEN"],
	["WY-55 Hellcat (20mm Cannon)",												"I_Heli_light_03_dynamicLoadout_F",									40000,						"vehicle",						"variant_Hell20mm",	"HIDDEN"],
	["WY-55 Hellcat (Guns)",													"I_Heli_light_03_dynamicLoadout_F",									10000,						"vehicle",						"variant_HellGun",	"HIDDEN"],
	["WY-55 Hellcat (DAGR)",													"I_Heli_light_03_dynamicLoadout_F",									40000,						"vehicle",						"variant_HellDAGR",	"HIDDEN"]
];
planesArray = compileFinal str
[
	["C-130J",					"RHS_C130J",					60200,				"vehicle", "WEST"],
	["A-10A",					"RHS_A10",						450000,				"vehicle", "WEST"],
	["Pchela-1T",				"rhs_pchela1t_vvsc",			10500,				"vehicle", "EAST"],
	["An-2",					"RHS_AN2",						5000,				"vehicle", "EAST"],
	["L-159 ALCA",				"rhs_l159_CDF",					200000,				"vehicle", "EAST"],
	["L-39C Albatros",			"rhs_l39_cdf",					150000,				"vehicle", "EAST"],
	["Su-25",					"RHS_Su25SM_vvs",				450000,				"vehicle", "EAST"],
	["TU-95MS Bear",			"RHS_TU95MS_vvs_old",			1000000,			"vehicle", "EAST"],
	["MiG-29S",					"rhs_mig29s_vvsc",				500000,				"vehicle", "EAST"],
	
	["A-143 Buzzard AA",														"I_Plane_Fighter_03_dynamicLoadout_F",								150000,						"vehicle"],
	["A-143 Buzzard CAS",														"I_Plane_Fighter_03_dynamicLoadout_F",								390000,						"vehicle"],
	["A-149 Gryphon",															"I_Plane_Fighter_04_F",												400000,						"vehicle"],
	["A-164 Wipeout",															"B_Plane_CAS_01_dynamicLoadout_F",									450000,						"vehicle"],
	["Caesar BTT",																"C_Plane_Civil_01_F",												3000,						"vehicle"],
	["Ceasar BTT (racing)",														"C_Plane_Civil_01_Racing_F",										3000,						"vehicle"],
	["F/A-181 Black Wasp II (Stealth)",											"B_Plane_Fighter_01_Stealth_F",										500000,						"vehicle"],
	["F/A-181 Black Wasp II",													"B_Plane_Fighter_01_F",												550000,						"vehicle"],
	["Pchela-1T UAV (Unarmed)",													"rhs_pchela1t_vvsc",												25000,						"vehicle"],
	["K40 Ababil-3 UAV (Unarmed)",												"O_UAV_02_F",														25000,						"vehicle"],
	["K40 Ababil-3 UAV (Bomber)",												"I_UAV_02_dynamicLoadout_F",										250000,						"vehicle",						"variant_greyhawkBomber"],
	["K40 Ababil-3 UAV (Missiles)",												"O_UAV_02_dynamicLoadout_F",										450000,						"vehicle",						"variant_greyhawkMissile"],
	["K40 Ababil-3 UAV (Unarmed)",												"I_UAV_02_F",														25000,						"vehicle"],
	["K40 Ababil-3 UAV (Bomber)",												"O_UAV_02_dynamicLoadout_F",										250000,						"vehicle",						"variant_greyhawkBomber"],
	["K40 Ababil-3 UAV (Missiles)",												"I_UAV_02_dynamicLoadout_F",										425000,						"vehicle",						"variant_greyhawkMissile"],
	["KH-3A Fenghuang",															"O_T_UAV_04_CAS_F",													375000,						"vehicle"],
	["MQ4A Greyhawk UAV (Unarmed)",												"B_UAV_02_F",														25000,						"vehicle"],
	["MQ4A Greyhawk UAV (Bomber)",												"B_UAV_02_dynamicLoadout_F",										250000,						"vehicle",						"variant_greyhawkBomber"],// Bomber UAVs are a lot harder to use,hence why they are cheaper than Missile ones
	["MQ4A Greyhawk UAV (Missiles)",											"B_UAV_02_dynamicLoadout_F",										425000,						"vehicle",						"variant_greyhawkMissile"],
	["To-199 Neophron CAS",														"O_Plane_CAS_02_dynamicLoadout_F",									450000,						"vehicle"],
	["To-201 Shikra",															"O_Plane_Fighter_02_F",												550000,						"vehicle"],
	["To-201 Shikra (Stealth)",													"O_Plane_Fighter_02_Stealth_F",										500000,						"vehicle"],
	["UCAV Sentinel",															"B_UAV_05_F",														400000,						"vehicle"],
	["V-44 X Blackfish (Vehicle Transport)",									"B_T_VTOL_01_vehicle_F",											30000,						"vehicle"],
	["V-44 X Blackfish (Infrantry Transport)",									"B_T_VTOL_01_infantry_F",											20000,						"vehicle"],
	["V-44 X Blackfish (Armed)",												"B_T_VTOL_01_armed_F",												400000,						"vehicle"],
	["Y-32 Xi'an (Vehicle Transport)",											"O_T_VTOL_02_vehicle_F",											350000,						"vehicle"],
	["Y-32 Xi'an (Infrantry Transport)",										"O_T_VTOL_02_infantry_F",											350000,						"vehicle"]
];
boatsArray = compileFinal str
[
	["Mk V SOC",																"rhsusf_mkvsoc",													50000,						"boat", "WEST"],
	["Water Scooter",															"C_Scooter_Transport_01_F",											500,						"boat"],
	["Rescue Boat",																"C_Rubberboat",														500,						"boat"],
	["Rescue Boat (NATO)",														"B_Lifeboat",														500,						"boat"],
	["Rescue Boat (CSAT)",														"O_Lifeboat",														500,						"boat"],
	["RHIB",																	"I_C_Boat_Transport_02_F",											500],
	["Assault Boat (NATO)",														"B_Boat_Transport_01_F",											600,						"boat"],
	["Assault Boat (CSAT)",														"O_Boat_Transport_01_F",											600,						"boat"],
	["Assault Boat (AAF)",														"I_Boat_Transport_01_F",											600,						"boat"],
	["Assault Boat (FIA)",														"B_G_Boat_Transport_01_F",											600,						"boat"],
	["Motorboat",																"C_Boat_Civil_01_F",												1000,						"boat"],
	["Motorboat Rescue",														"C_Boat_Civil_01_rescue_F",											900,						"boat"],
	["Motorboat Police",														"C_Boat_Civil_01_police_F",											1100,						"boat"],
	["Speedboat HMG (CSAT)",													"O_Boat_Armed_01_hmg_F",											4000,						"boat"],
	["Speedboat Minigun (NATO)",												"B_Boat_Armed_01_minigun_F",										4000,						"boat"],
	["Speedboat Minigun (AAF)",													"I_Boat_Armed_01_minigun_F",										4000,						"boat"],
	["SDV Submarine (NATO)",													"B_SDV_01_F",														1000,						"submarine"],
	["SDV Submarine (CSAT)",													"O_SDV_01_F",														1000,						"submarine"],
	["SDV Submarine (AAF)",														"I_SDV_01_F",														1000,						"submarine"]
];
AutonomousArray = compileFinal str
[
	["Mk-21 Centurion SAM",														"B_SAM_System_02_F",												350000],
	["Mk-49 Spartan SAM",														"B_SAM_System_01_F",												125000],
	["Praetorian 1C AAA",														"B_AAA_System_01_F",												225000],
	["Mk30A HMG .50 Sentry (NATO)"  , "B_HMG_01_A_F"        , 10000],
	["Mk30A HMG .50 Sentry (CSAT)"  , "O_HMG_01_A_F"        , 10000],
	["Mk30A HMG .50 Sentry (AAF)"   , "I_HMG_01_A_F"        , 10000],
	["Mk32A GMG 20mm Sentry (NATO)" , "B_GMG_01_A_F"        , 15000],
	["Mk32A GMG 20mm Sentry (CSAT)" , "O_GMG_01_A_F"        , 15000],
	["Mk32A GMG 20mm Sentry (AAF)"  , "I_GMG_01_A_F"        , 15000],
	["Praetorian 1C AAA"            , "B_AAA_System_01_F"   , 32500],
	["AN/MPQ 105 Radar"             , "B_Radar_System_01_F" , 5000 ],
	["R-750 Chronos Radar"          , "O_Radar_System_02_F" , 5000 ],
	["MIM-145 Defender"             , "B_SAM_System_03_F"   , 25000],
	["S-750 Rhea"                   , "O_SAM_System_04_F"   , 25000]
];

allVehStoreVehicles = compileFinal str (call landArray + call armoredArray + call tanksArray + call helicoptersArray + call planesArray + call boatsArray + call AutonomousArray);


_color = "#(rgb,1,1,1)color";
_texDir = "client\images\vehicleTextures\";
_kartDir = "\A3\soft_f_kart\Kart_01\Data\";
_mh9Dir = "\A3\air_f\Heli_Light_01\Data\";
_mohawkDir = "\A3\air_f_beta\Heli_Transport_02\Data\";
_wreckDir = "\A3\structures_f\wrecks\data\";
_gorgonDir = "\A3\armor_f_gamma\APC_Wheeled_03\data\";

colorsArray = compileFinal str
[
	[// Main colors
		"All",
		[
			["Black",_color + "(0.01,0.01,0.01,1)"],// #(argb,8,8,3)color(0.1,0.1,0.1,0.1)
			["Gray",_color + "(0.15,0.151,0.152,1)"],// #(argb,8,8,3)color(0.5,0.51,0.512,0.3)
			["White",_color + "(0.75,0.75,0.75,1)"],// #(argb,8,8,3)color(1,1,1,0.5)
			["Dark Blue",_color + "(0,0.05,0.15,1)"],// #(argb,8,8,3)color(0,0.3,0.6,0.05)
			["Blue",_color + "(0,0.03,0.5,1)"],// #(argb,8,8,3)color(0,0.2,1,0.75)
			["Teal",_color + "(0,0.3,0.3,1)"],// #(argb,8,8,3)color(0,1,1,0.15)
			["Green",_color + "(0,0.5,0,1)"],// #(argb,8,8,3)color(0,1,0,0.15)
			["Yellow",_color + "(0.5,0.4,0,1)"],// #(argb,8,8,3)color(1,0.8,0,0.4)
			["Orange",_color + "(0.4,0.09,0,1)"],// #(argb,8,8,3)color(1,0.5,0,0.4)
			["Red",_color + "(0.45,0.005,0,1)"],// #(argb,8,8,3)color(1,0.1,0,0.3)
			["Pink",_color + "(0.5,0.03,0.3,1)"],// #(argb,8,8,3)color(1,0.06,0.6,0.5)
			["Purple",_color + "(0.1,0,0.3,1)"],// #(argb,8,8,3)color(0.8,0,1,0.1)
			["NATO Tan",_texDir + "nato.paa"],// #(argb,8,8,3)color(0.584,0.565,0.515,0.3)
			["CSAT Brown",_texDir + "csat.paa"],// #(argb,8,8,3)color(0.624,0.512,0.368,0.3)
			["AAF Green",_texDir + "aaf.paa"],// #(argb,8,8,3)color(0.546,0.59,0.363,0.2)
			["Bloodshot",_texDir + "bloodshot.paa"],
			["Carbon",_texDir + "carbon.paa"],
			["Confederate",_texDir + "confederate.paa"],
			["Denim",_texDir + "denim.paa"],
			["Digital",_texDir + "digi.paa"],
			["Digital Black",_texDir + "digi_black.paa"],
			["Digital Desert",_texDir + "digi_desert.paa"],
			["Digital Woodland",_texDir + "digi_wood.paa"],
			["Doritos",_texDir + "doritos.paa"],
			["Drylands",_texDir + "drylands.paa"],
			["Hello Kitty",_texDir + "hellokitty.paa"],
			["Hex",_texDir + "hex.paa"],
			["Hippie",_texDir + "hippie.paa"],
			//["ISIS",_texDir + "isis.paa"],
			["Leopard",_texDir + "leopard.paa"],
			["Mountain Dew",_texDir + "mtndew.paa"],
			["'Murica",_texDir + "murica.paa"],
			// ["Nazi",_texDir + "nazi.paa"],
			["Orange Camo",_texDir + "camo_orange.paa"],
			["Pink Camo",_texDir + "camo_pink.paa"],
			["Pride",_texDir + "pride.paa"],
			["Psych",_texDir + "psych.paa"],
			["Red Camo",_texDir + "camo_red.paa"],
			["Rusty",_texDir + "rusty.paa"],
			["Sand",_texDir + "sand.paa"],
			["Snake",_texDir + "snake.paa"],
			["Stripes",_texDir + "stripes.paa"],
			["Stripes 2",_texDir + "stripes2.paa"],
			["Stripes 3",_texDir + "stripes3.paa"],
			["Swamp",_texDir + "swamp.paa"],
			["Tiger",_texDir + "tiger.paa"],
			["Trippy",_texDir + "rainbow.paa"],
			["Union Jack",_texDir + "unionjack.paa"],
			["Urban",_texDir + "urban.paa"],
			["Weed",_texDir + "weed.paa"],
			["Woodland",_texDir + "woodland.paa"],
			["Woodland Dark",_texDir + "wooddark.paa"],
			["Woodland Tiger",_texDir + "woodtiger.paa"]
		]
	],
	[// Kart colors
		"Kart_01_Base_F",
		[
			["Black (Kart)",["Black"]],// ["Black (Kart)",[configName (configFile >> "CfgVehicles" >> "C_Kart_01_F" >> "TextureSources" >> "Black")]],
			["White (Kart)",["White"]],
			["Blue (Kart)",["Blue"]],
			["Green (Kart)",["Green"]],
			["Yellow (Kart)",["Yellow"]],
			["Orange (Kart)",["Orange"]],
			["Red (Kart)",[[0,_kartDir + "kart_01_base_red_co.paa"]]]// no red TextureSource :(
		]
	],
	[// MH-9 colors
		"Heli_Light_01_base_F",
		[
			["AAF Camo (MH-9)",[[0,_mh9Dir + "heli_light_01_ext_indp_co.paa"]]],
			["Blue 'n White (MH-9)",[[0,_mh9Dir + "heli_light_01_ext_blue_co.paa"]]],
			["Blueline (MH-9)",[[0,_mh9Dir + "Skins\heli_light_01_ext_blueline_co.paa"]]],
			["Cream Gravy (MH-9)",[[0,_mh9Dir + "heli_light_01_ext_co.paa"]]],
			["Digital (MH-9)",[[0,_mh9Dir + "Skins\heli_light_01_ext_digital_co.paa"]]],
			["Elliptical (MH-9)",[[0,_mh9Dir + "Skins\heli_light_01_ext_elliptical_co.paa"]]],
			["Furious (MH-9)",[[0,_mh9Dir + "Skins\heli_light_01_ext_furious_co.paa"]]],
			["Graywatcher (MH-9)",[[0,_mh9Dir + "Skins\heli_light_01_ext_graywatcher_co.paa"]]],
			["ION (MH-9)",[[0,_mh9Dir + "heli_light_01_ext_ion_co.paa"]]],
			["Jeans (MH-9)",[[0,_mh9Dir + "Skins\heli_light_01_ext_jeans_co.paa"]]],
			["Light (MH-9)",[[0,_mh9Dir + "Skins\heli_light_01_ext_light_co.paa"]]],
			["Shadow (MH-9)",[[0,_mh9Dir + "Skins\heli_light_01_ext_shadow_co.paa"]]],
			["Sheriff (MH-9)",[[0,_mh9Dir + "Skins\heli_light_01_ext_sheriff_co.paa"]]],
			["Speedy (MH-9)",[[0,_mh9Dir + "Skins\heli_light_01_ext_speedy_co.paa"]]],
			["Sunset (MH-9)",[[0,_mh9Dir + "Skins\heli_light_01_ext_sunset_co.paa"]]],
			["Vrana (MH-9)",[[0,_mh9Dir + "Skins\heli_light_01_ext_vrana_co.paa"]]],
			["Wasp (MH-9)",[[0,_mh9Dir + "Skins\heli_light_01_ext_wasp_co.paa"]]],
			["Wave (MH-9)",[[0,_mh9Dir + "Skins\heli_light_01_ext_wave_co.paa"]]]
		]
	],
	[// Mohawk colors
		"Heli_Transport_02_base_F",
		[
			["Dahoman (Mohawk)",[
				[0,_mohawkDir + "Skins\heli_transport_02_1_dahoman_co.paa"],
				[1,_mohawkDir + "Skins\heli_transport_02_2_dahoman_co.paa"],
				[2,_mohawkDir + "Skins\heli_transport_02_3_dahoman_co.paa"]
			]],
			["ION (Mohawk)",[
				[0,_mohawkDir + "Skins\heli_transport_02_1_ion_co.paa"],
				[1,_mohawkDir + "Skins\heli_transport_02_2_ion_co.paa"],
				[2,_mohawkDir + "Skins\heli_transport_02_3_ion_co.paa"]
			]]
		]
	],
	[// Taru paintjob
		"Heli_Transport_04_base_F",
		[
			["Black (Taru)",["Black"]]
		]
	],
	[ // Blackfoot paintjob
		"Heli_Attack_01_base_F",
		[
			["Rusty - AH-99 Blackfoot", [[0, _wreckDir + "wreck_heli_attack_01_co.paa"]]]
		]
	],
	[// Kajman paintjobs
		"Heli_Attack_02_base_F",
		[
			["Black (Kajman)",["Black"]],
			["Rusty (Kajman)",[
				[0,_wreckDir + "wreck_heli_attack_02_body1_co.paa"],
				[1,_wreckDir + "wreck_heli_attack_02_body2_co.paa"]
			]],
			["Mossy (Kajman)",[
				[0,_wreckDir + "uwreck_heli_attack_02_body1_co.paa"],
				[1,_wreckDir + "uwreck_heli_attack_02_body2_co.paa"]
			]]
		]
	],
	[// Ghost Hawk camo
		"Heli_Transport_01_base_F",
		[
			//["Black (Ghost Hawk)",["Black"]],// default
			["Olive (Ghost Hawk)",["Green"]],
			["Dazzle Black (Ghost Hawk)",["Olive"]],
			["Dazzle Tan (Ghost Hawk)",["Sand"]]
		]
	],
	[// Zamak paintjobs
		"Truck_02_base_F",
		[
			["Hex (Zamak)",["Opfor"]],
			["Orange (Zamak)",["Orange"]]
		]
	],
	[// Strider NATO color
		"MRAP_03_base_F",
		[
			["Tan (Strider)",["Blufor"]]
		]
	],
	[// Gorgon NATO color
		"APC_Wheeled_03_base_F",
		[
			["Tan (Gorgon)",[
				[0,_gorgonDir + "apc_wheeled_03_ext_co.paa"],
				[1,_gorgonDir + "apc_wheeled_03_ext2_co.paa"],
				[2,_gorgonDir + "rcws30_co.paa"],
				[3,_gorgonDir + "apc_wheeled_03_ext_alpha_co.paa"]
			]]
		]
	],
	[// Hatchback wreck paintjob
		"Hatchback_01_base_F",
		[
			["Rusty (Hatchback)",[[0,_wreckDir + "civilcar_extwreck_co.paa"]]]
		]
	],
	[ // GOD EMPEROR
		"B_MBT_01_cannon_F",
		[
			["Trump - Slammer", [
				[0, _texDir + "slammer_trump_0.paa"],
				[1, _texDir + "slammer_trump_1.paa"]
			]]
		]
	],
	[
		"B_MBT_01_TUSK_F",
		[
			["Trump - Slammer", [[2, _texDir + "slammer_trump_2.paa"]]]
		]
	],
	[// Prowler paintjobs
		"LSV_01_base_F",
		[
			["Olive (Prowler)",["Olive"]],
			["Dazzle (Prowler)",["Dazzle"]],
			["Black (Prowler)",["Black"]],
			["Tan (Prowler)",["Sand"]]
		]
	],
	[// Qilin paintjobs
		"LSV_02_base_F",
		[
			//["Green Hex (Qilin)",["GreenHex"]],// default
			["Hex (Qilin)",["Arid"]],
			["Black (Qilin)",["Black"]]
		]
	],
	[// Blackfish paintjobs
		"VTOL_01_base_F",
		[
			//["Olive (Blackfish)",["Olive"]],// default
			["Blue (Blackfish)",["Blue"]]
		]
	],
	[// Xi'an paintjobs
		"VTOL_02_base_F",
		[
			//["Green Hex (Xi'an)",["GreenHex"]],// default
			["Hex (Xi'an)",["Hex"]],
			["Gray Hex (Xi'an)",["Grey"]]
		]
	],
	[// UGV paintjobs
		"UGV_01_base_F",
		[
			["Tan (UGV)",["Blufor"]],
			["Hex (UGV)",["Opfor"]],
			["Digital (UGV)",["Indep"]],
			["Green Hex (UGV)",["GreenHex"]]
		]
	],
	[// Ifrit GreenHex
		"MRAP_02_base_F",
		[
			["Green Hex (Ifrit)",["GreenHex"]]
		]
	],
	[// Tempest GreenHex
		"Truck_03_base_F",
		[
			["Green Hex (Tempest)",["GreenHex"]]
		]
	],
	[// Marid GreenHex
		"APC_Wheeled_02_base_F",
		[
			["Green Hex (Marid)",["GreenHex"]]
		]
	],
	[// Kamysh & Tigris GreenHex
		"APC_Tracked_02_base_F",
		[
			["Green Hex (Kamysh)",["GreenHex"]]
		]
	],
	[// Varsuk & Sochor GreenHex
		"MBT_02_base_F",
		[
			["Green Hex (Varsuk)",["GreenHex"]]
		]
	],
	[// RHIB paintjob
		"Boat_Transport_02_base_F",
		[
			["Civilian (RHIB)",["Civilian"]]
		]
	],
	[// F/A-181 Black Wasp
		"Plane_Fighter_01_Base_F",
		[
			//["Dark Grey (F/A-181 Black Wasp)",["DarkGrey"]],// default
			["Dark Grey Camo (F/A-181 Black Wasp)",["DarkGreyCamo"]]
		]
	],
	[// UCAV Sentinel
		"UAV_05_Base_F",
		[
			//["Dark Grey (UCAV Sentinel)",["DarkGrey"]],// default
			["Dark Grey Camo (UCAV Sentinel)",["DarkGreyCamo"]]
		]
	],
	[//	To-201 Shikra
		"Plane_Fighter_02_Base_F",
		[
			//["Arid Hex Camo (To-201 Shikra)",["CamoAridHex"]],// default
			["Grey Hex Camo (To-201 Shikra)",["CamoGreyHex"]],
			["Blue (To-201 Shikra)",["CamoBlue"]]
		]
	],
	[// A-149 Gryphon
		"Plane_Fighter_04_Base_F",
		[
			//["Digital Green Camo (A-149 Gryphon)",["DigitalCamoGreen"]],// default
			["Digital Grey Camo (A-149 Gryphon)",["DigitalCamoGrey"]],
			["Grey (A-149 Gryphon)",["CamoGrey"]]
		]
	]
];

//General Store Item List
//Display Name,Class Name,Description,Picture,Buy Price,Sell Price.
customPlayerItems = compileFinal str
[
	["Artillery Strike", "artillery", "", "client\icons\tablet.paa", 500000, 50000, "HIDDEN"],
	//["Water Bottle", "water", localize "STR_WL_ShopDescriptions_Water", "client\icons\water.paa", 30, 15],
	//["Canned Food", "cannedfood", localize "STR_WL_ShopDescriptions_CanFood", "client\icons\cannedfood.paa", 30, 15],
	["Jerry Can (Full)","jerrycanfull",localize "STR_WL_ShopDescriptions_fuelFull","client\icons\jerrycan.paa",150,75],
	["Jerry Can (Empty)","jerrycanempty",localize "STR_WL_ShopDescriptions_fuelEmpty","client\icons\jerrycan.paa",50,25],
	["Camo Net","camonet",localize "STR_WL_ShopDescriptions_Camo","client\icons\camonet.paa",200,100],
	["Syphon Hose","syphonhose",localize "STR_WL_ShopDescriptions_SyphonHose","client\icons\syphonhose.paa",200,100],
	["Spawn Beacon","spawnbeacon",localize "STR_WL_ShopDescriptions_spawnBeacon","client\icons\spawnbeacon.paa",15000,7500]
];

donatorItems = compileFinal str
[
"H_MilCap_blue",
"H_MilCap_gry",
"H_MilCap_oucamo",
"H_MilCap_rucamo",
"H_MilCap_mcamo",
"H_MilCap_ocamo",
"H_MilCap_dgtl",
"H_Cap_headphones",
"H_Bandanna_gry",
"H_Bandanna_blu",
"H_Bandanna_cbr",
"H_Bandanna_khk_hs",
"H_Bandanna_khk",
"H_Bandanna_mcamo",
"H_Bandanna_sgg",
"H_Bandanna_sand",
"H_Bandanna_surfer",
"H_Bandanna_surfer_blk",
"H_Bandanna_surfer_grn",
"H_Bandanna_camo",
"H_Watchcap_blk",
"H_Watchcap_cbr",
"H_Watchcap_khk",
"H_Watchcap_sgg",
"H_Watchcap_camo",
"H_Beret_blk",
"H_Beret_Colonel",
"H_Beret_02",
"H_Booniehat_dgtl",
"H_Booniehat_khk_hs",
"H_Booniehat_khk",
"H_Booniehat_mcamo",
"H_Booniehat_oli",
"H_Booniehat_tan",
"H_Hat_blue",
"H_Hat_brown",
"H_Hat_camo",
"H_Hat_checker",
"H_Hat_grey",
"H_Hat_tan",
"H_Cap_grn_BI",
"H_Cap_blk",
"H_Cap_blu",
"H_Cap_blk_CMMG",
"H_Cap_grn",
"H_Cap_blk_ION",
"H_Cap_oli",
"H_Cap_oli_hs",
"H_Cap_police",
"H_Cap_press",
"H_Cap_red",
"H_Cap_surfer",
"H_Cap_tan",
"H_Cap_khaki_specops_UK",
"H_Cap_usblack",
"H_Cap_tan_specops_US",
"H_Cap_blk_Raven",
"H_Cap_brn_SPECOPS",
"H_Shemag_olive",
"H_Shemag_olive_hs",
"H_ShemagOpen_tan",
"H_ShemagOpen_khk",
"H_RacingHelmet_1_black_F",
"H_RacingHelmet_1_blue_F",
"H_RacingHelmet_1_green_F",
"H_RacingHelmet_1_yellow_F",
"H_RacingHelmet_1_orange_F",
"H_RacingHelmet_1_red_F",
"H_RacingHelmet_1_white_F",
"H_RacingHelmet_1_F",
"H_RacingHelmet_2_F",
"H_RacingHelmet_3_F",
"H_RacingHelmet_4_F",
"G_Goggles_VR",
"G_Balaclava_blk",
"G_Balaclava_combat",
"G_Balaclava_lowprofile",
"G_Balaclava_oli",
"G_Bandanna_aviator",
"G_Bandanna_beast",
"G_Bandanna_blk",
"G_Bandanna_khk",
"G_Bandanna_oli",
"G_Bandanna_shades",
"G_Bandanna_sport",
"G_Bandanna_tan",
"G_Aviator",
"G_Lady_Blue",
"G_Lady_Red",
"G_Lady_Mirror",
"G_Lady_Dark",
"G_Lowprofile",
"G_Shades_Black",
"G_Shades_Blue",
"G_Shades_Green",
"G_Shades_Red",
"G_Spectacles",
"G_Sport_Red",
"G_Sport_Blackyellow",
"G_Sport_BlackWhite",
"G_Sport_Checkered",
"G_Sport_Blackred",
"G_Sport_Greenblack",
"G_Squares_Tinted",
"G_Squares",
"G_Tactical_Clear",
"G_Tactical_Black",
"G_Spectacles_Tinted"
];

//Put all gun, ammo, or general item classes in this list if you only want them only accessible through missions (this list will not add these items to mission crates, do that manually)
missionOnlyItems = compileFinal str
[
"srifle_GM6_F",
"srifle_GM6_camo_F",
"srifle_GM6_ghex_F",
"MMG_02_sand_F",
"MMG_02_camo_F",
"MMG_02_black_F",
"MMG_01_tan_F",
"MMG_01_hex_F",
"Titan_AT",
"Titan_AP",
"Laserdesignator",
"Laserdesignator_02",
"Laserdesignator_03",
"optic_tws",
"optic_tws_mg",
"optic_Nightstalker",
"optic_LRPS",
"optic_LRPS_ghex_F",
"optic_LRPS_tna_F",
"optic_LRPS_tna_F",
"C_IDAP_UAV_06_antimine_backpack_F"
];

call compile preprocessFileLineNumbers "mapConfig\storeOwners.sqf";

storeConfigDone = compileFinal "true";
