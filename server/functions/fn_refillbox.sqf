// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) ((START) + floor random ((END) - (START) + 1))
#define RANDOM_ODDS(ODDS) ([0,1] select (random 1 < (ODDS))) // between 0.0 and 1.0

private ["_box", "_boxType", "_boxItems", "_item", "_qty", "_mag"];
_box = _this select 0;
_boxType = _this select 1;

_box setVariable [call vChecksum, true];

_box allowDamage false; // No more fucking busted crates
_box setVariable ["allowDamage", false, true];
_box setVariable ["A3W_inventoryLockR3F", true, true];

// Clear pre-existing cargo first
//clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

if (_boxType == "mission_USSpecial2") then { _boxType = "mission_USSpecial" };

switch (_boxType) do
{
	//Mission Crates
	
	case "mission_USLaunchers": // default wasteland launchers loot crate
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//Weapons
			["wep", ["rhs_weap_rpg7", "rhs_weap_maaws", "rhs_weap_smaw_green"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,3)],
			["wep", ["rhs_weap_panzerfaust60", "rhs_weap_rpg75", "rhs_weap_m80"], RANDOM_BETWEEN(2,5)],
			//Mags
			["mag", ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(3,6)]
		];
	};
	case "mission_USLaunchers2": // default wasteland launchers loot crate
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//Weapons
			["wep", "rhs_weap_fgm148", 1, RANDOM_BETWEEN(1,2)],
			["wep", "rhs_weap_igla", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,2)],
			//Mags
			["mag", ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(3,6)]
		];
	};
	case "mission_USSpecial": //default wasteland generic loot crate
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//Weapons
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(1,4)],
			//["itm", "VSM_Gasmask_acc", RANDOM_BETWEEN(1,2)],
			//["wep", ["hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_01_MRD_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_02_Yorris_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
			["wep", ["rhs_weap_m4a1_blockII_KAC_wd", "rhs_weap_hk416d145_wd_2", "rhs_weap_m27iar_grip"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,6)],
			["wep", ["rhs_weap_ak103_zenitco01_b33", "rhs_weap_akm_zenitco01_b33", "rhs_weap_ak104_zenitco01_b33"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,6)],
			["wep", ["rhs_weap_m240B", "rhs_weap_pkp"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,4)],
			["wep", "rhs_weap_m32", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,5)],
			//Items
			["itm", "Medikit", RANDOM_BETWEEN(0,3)],
			["itm", "Toolkit", RANDOM_BETWEEN(0,3)],
			["itm", ["optic_Hamr", "rhsusf_acc_g33_t1", "rhsusf_acc_ACOG_MDO", "optic_SOS", "optic_DMS"], RANDOM_BETWEEN(2,4)],
			["itm", ["rhsusf_acc_nt4_black", "rhs_acc_tgpa", "rhs_acc_pbs1"], RANDOM_BETWEEN(0,3)],
			//Mags
			["mag", "rhs_mag_30Rnd_556x45_M855_Stanag", RANDOM_BETWEEN(4,8)],
			["mag", "rhs_mag_100Rnd_556x45_M855_cmag", RANDOM_BETWEEN(3,5)],
			["mag", "rhs_30Rnd_762x39mm_polymer", RANDOM_BETWEEN(4,8)],
			["mag", "rhs_75Rnd_762x39mm", RANDOM_BETWEEN(5,7)]
		];
	};
	case "Launchers_Tier_2":
	{
		_boxItems =
		[
			//Weapons
			["wep", "rhs_weap_M136", RANDOM_BETWEEN(1,2)],
			["wep", "rhs_weap_rpg26", RANDOM_BETWEEN(1,2)],
			["wep", "rhs_weap_rpg7", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,3)],
			["wep", "rhs_weap_maaws", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,3)],
			["wep", "rhs_weap_smaw_green", RANDOM_BETWEEN(2,3), RANDOM_BETWEEN(2,3)],
			["wep", "rhs_weap_fgm148", RANDOM_BETWEEN(0,1), RANDOM_BETWEEN(1,2)],
			//Items
			["bac", ["rhsgref_hidf_alicepack", "rhssaf_alice_smb", "rhssaf_alice_md2camo", "B_Carryall_cbr", "B_Carryall_oli"], RANDOM_BETWEEN(3,4)]

		];

	};
	case "Diving_Gear":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//Weapons
			["wep", "arifle_SDAR_F", 2, RANDOM_BETWEEN(4,6)],
			//Items
			["itm", "V_RebreatherB", 2],
			["itm", "V_RebreatherIR", 2],
			["itm", "V_RebreatherIA", 2],
			["itm", "G_Diving", 2],
			["itm", "U_B_Wetsuit", 2],
			["itm", "U_O_Wetsuit", 2],
			["itm", "U_I_Wetsuit", 2],
			["itm", ["Chemlight_red", "Chemlight_green", "Chemlight_yellow", "Chemlight_blue"], RANDOM_BETWEEN(6,9)],
			["bac", ["B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_oli", "B_Carryall_mcamo", "B_Carryall_oucamo"], RANDOM_BETWEEN(3,5)],
			//Mags
			["mag", ["SmokeShell", "SmokeShellRed", "SmokeShellgreen"], RANDOM_BETWEEN(5,9)]

		];
	};
	case "General_supplies":
	{
	_boxitems =
		[
			//first aid, medkit, tookit, gps, rangefinder, etc
			// Item type, Item class(es), # of items, # of magazines per weapon
			["itm", "FirstAidKit", RANDOM_BETWEEN(5,6)],
			//["itm", "VSM_Gasmask_acc", RANDOM_BETWEEN(1,2)],
			["wep", ["Rangefinder", "Laserdesignator"], RANDOM_BETWEEN(2,4)],
			//["wep", ["hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_01_MRD_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_02_Yorris_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
			["itm", "Medikit", RANDOM_BETWEEN(2,3)],
			["itm", "Toolkit", RANDOM_BETWEEN(2,3)],
			["itm", ["optic_ERCO_blk_F", "rhsusf_acc_compm4", "rhsusf_acc_su230a_mrds", "optic_DMS"], RANDOM_BETWEEN(2,4)],
			//["itm", "Laserbatteries", RANDOM_BETWEEN(0,4)],
			["itm", ["rhssaf_helmet_m97_olive_nocamo","rhssaf_helmet_m97_black_nocamo", "rhssaf_helmet_m59_85_nocamo", "rhsgref_ttsko_alicepack"], RANDOM_BETWEEN(2,4)],
			["bac", ["B_Kitbag_mcamo", "B_FieldPack_khk", "B_Carryall_mcamo"], RANDOM_BETWEEN(3,5)],
			["itm", ["rhs_6b5_rifleman_khaki", "rhs_6b5rifleman", "rhssaf_vest_otv_md2camo"], RANDOM_BETWEEN(2,4)],
			["itm", ["Chemlight_red", "Chemlight_green", "Chemlight_yellow", "Chemlight_blue"], RANDOM_BETWEEN(6,9)],
			["mag", ["rhs_mag_an_m14_th3", "rhssaf_mag_brk_m79", "rhssaf_mag_brz_m88", "rhs_mag_m7a3_cs", "rhsgref_mag_rkg3em", "rhs_mag_zarya2"], RANDOM_BETWEEN(5,9)],
			["mag", ["rhssaf_mag_br_m75", "rhssaf_mag_br_m84", "rhs_mag_f1","DemoCharge_Remote_Mag"], RANDOM_BETWEEN(5,9)],
			["bac", ["I_UAV_01_backpack_F", "O_UAV_01_backpack_F", "B_UAV_01_backpack_F"], RANDOM_BETWEEN(0,1)]
		];
	};
	Case "GEVP":
	{

		_boxItems =
		[
			//Weapons
			["wep", ["rhs_weap_akms", "rhs_weap_savz58v"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(4,8)],
			["wep", ["rhs_weap_ak103_zenitco01_b33", "rhs_weap_ak103_gp25_npz"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(4,8)],
            ["wep", ["rhs_weap_ak74m_camo_npz", "rhs_weap_ak74m_desert_npz"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(4,8)],
			["wep", ["rhs_weap_m249_pip_L_vfg"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)],
            ["wep", ["rhs_weap_g36c", "rhs_weap_g36kv", "rhs_weap_g36kv_ag36"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(6,10)],
			["wep", ["rhs_weap_pkm"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)],
			["wep", ["rhs_weap_vhsd2_ct15x", "rhs_weap_vhsd2_bg_ct15x"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(6,10)],
			["wep", ["rhs_weap_maaws"], RANDOM_BETWEEN(2,2), RANDOM_BETWEEN(4,6)],
			["wep", ["rhs_weap_M136", "rhs_weap_rpg26", "rhs_weap_rpg7", "rhs_weap_smaw_green"], RANDOM_BETWEEN(2,3), RANDOM_BETWEEN(2,6)],
            ["wep", ["rhs_weap_fim92", "rhs_weap_igla"], RANDOM_BETWEEN(2,2), RANDOM_BETWEEN(2,4)],
            ["wep", ["rhs_weap_m16a4_carryhandle_M203", "rhs_weap_m4a1_m320", "rhs_weap_m14ebrri"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(6,10)],
			//Items
            ["itm", ["rhs_6b7_1m_olive", "rhs_6b27m_green_ess", "rhs_6b26"], RANDOM_BETWEEN(3,5)],
            ["itm", ["rhsusf_ach_helmet_headset_ocp", "rhsusf_opscore_mar_fg_pelt", "rhsusf_mich_bare_semi"], RANDOM_BETWEEN(3,5)],
            ["bac", ["B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_oli", "B_Carryall_mcamo", "B_Carryall_oucamo"], RANDOM_BETWEEN(3,4)],
			["itm", ["rhsusf_iotv_ocp_Rifleman", "rhsusf_iotv_ocp_Grenadier", "rhsusf_spc_mg", "rhsusf_spc_teamleader", "rhsusf_spcs_ocp_squadleader", "rhsusf_iotv_ocp_Squadleader"], RANDOM_BETWEEN(3,6)],
			["itm", ["optic_MRCO", "optic_DMS", "optic_Hamr"], RANDOM_BETWEEN(2,3)],
			["itm", ["rhsusf_acc_compm4", "rhsusf_acc_RM05", "rhsusf_acc_ACOG_anpvs27"], RANDOM_BETWEEN(3,5)],
			["itm", ["rhsusf_acc_nt4_black"], RANDOM_BETWEEN(0,1)],
			["itm", ["rhs_acc_dtk4screws"], RANDOM_BETWEEN(0,1)],
			["itm", ["rhsusf_acc_premier_anpvs27"], RANDOM_BETWEEN(0,1)],
			["itm", ["rhs_acc_pbs1"], RANDOM_BETWEEN(0,1)],
			["itm", ["rhsusf_acc_harris_bipod", "rhs_acc_harris_swivel", "rhsusf_acc_grip3"], RANDOM_BETWEEN(2,4)],
			["itm", ["bipod_02_F_blk", "bipod_02_F_tan", "bipod_02_F_hex"], RANDOM_BETWEEN(2,4)],
			["itm", ["bipod_03_F_blk", "bipod_03_F_oli"], RANDOM_BETWEEN(3,4)],
			//["itm", ["muzzle_snds_93mmg", "muzzle_snds_93mmg_tan"], RANDOM_BETWEEN(1,2)],
			//["itm", ["muzzle_snds_M", "muzzle_snds_H", "muzzle_snds_B"], RANDOM_BETWEEN(1,2)]
			["bac", ["I_UAV_01_backpack_F", "O_UAV_01_backpack_F", "B_UAV_01_backpack_F"], RANDOM_BETWEEN(0,1)]

		];
	};

	case "Ammo_Drop":
	{
		_boxitems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//["mag",["16Rnd_9x21_Mag", "30Rnd_9x21_Mag", "6Rnd_45ACP_Cylinder", "11Rnd_45ACP_Mag", "9Rnd_45ACP_Mag"], RANDOM_BETWEEN(15,20)],
			//["mag",["30Rnd_45ACP_MAG_SMG_01", "30Rnd_45ACP_Mag_SMG_01_tracer_green"], RANDOM_BETWEEN(10,15)],
			["mag",["rhsusf_mag_6Rnd_M441_HE","rhsusf_mag_6Rnd_M433_HEDP"], RANDOM_BETWEEN(4,8)],
			
			["mag",["rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red"], RANDOM_BETWEEN(10,11)],
			["mag",["rhs_mag_100Rnd_556x45_M855A1_cmag","rhs_mag_100Rnd_556x45_M855A1_cmag_mixed"], RANDOM_BETWEEN(6,8)],
			["mag",["rhsusf_200rnd_556x45_M855_box", "rhsusf_200rnd_556x45_M855_mixed_box"], RANDOM_BETWEEN(6,8)],
			["mag",["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], RANDOM_BETWEEN(6,8)],
			
			["mag",["rhs_30Rnd_545x39_7N6M_green_AK","rhs_30Rnd_545x39_7N22_plum_AK"], RANDOM_BETWEEN(10,11)],
			["mag",["rhs_45Rnd_545x39_7N6_AK","rhs_45Rnd_545x39_7N22_AK"], RANDOM_BETWEEN(6,8)],
			["mag",["rhs_30Rnd_762x39mm_bakelite","rhs_30Rnd_762x39mm_bakelite_tracer"], RANDOM_BETWEEN(10,11)],
			["mag",["rhs_75Rnd_762x39mm","rhs_75Rnd_762x39mm_tracer"], RANDOM_BETWEEN(6,8)],
			["mag",["rhs_100Rnd_762x54mmR_7N13", "rhs_100Rnd_762x54mmR_7BZ3", "rhs_100Rnd_762x54mmR"], RANDOM_BETWEEN(10,12)],
			["mag",["rhssaf_100rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36"], RANDOM_BETWEEN(6,8)],
			
			["mag","rhs_10Rnd_762x54mmR_7N1", 10],
			["mag","rhs_5Rnd_338lapua_t5000", 10],
			//["mag","130Rnd_338_Mag", 10],
			["mag","rhsusf_mag_10Rnd_STD_50BMG_M33", 10],
			["mag","rhsgref_296Rnd_792x57_SmE_belt", 10],
			//["mag","150Rnd_93x64_Mag", 10],
			["mag","rhssaf_250Rnd_762x54R", 10],
			//["mag",["5Rnd_127x108_Mag","5Rnd_127x108_APDS_Mag"], RANDOM_BETWEEN(10,15)],
			["mag","rhs_mag_an_m8hc", RANDOM_BETWEEN(3,6)],
			["mag","rhssaf_mag_br_m84", RANDOM_BETWEEN(1,4)],
			["mag",["rhs_mag_an_m14_th3", "rhssaf_mag_brk_m79", "rhssaf_mag_brz_m88", "rhs_mag_m7a3_cs", "rhsgref_mag_rkg3em", "rhs_mag_zarya2"], RANDOM_BETWEEN(4,8)],
			["mag",["rhssaf_mag_br_m75", "rhssaf_mag_br_m84", "rhs_mag_f1","DemoCharge_Remote_Mag"], RANDOM_BETWEEN(4,8)],
			["mag",["rhs_mag_M441_HE","rhs_mag_M433_HEDP","rhs_mag_M397_HET"], RANDOM_BETWEEN(8,10)],
			["mag",["rhs_VOG25","rhs_VG40TB","rhs_VOG25P"], RANDOM_BETWEEN(8,10)],
			["mag",["rhs_GDM40","rhs_GRD40_White"], RANDOM_BETWEEN(8,10)]

		];
	};
	case "mission_AALauncher":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["rhs_weap_igla", "rhs_weap_fim92"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(4,8)]
		];
	};
	case "mission_CompactLauncher":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["rhs_weap_rpg7", "rhs_weap_maaws", "rhs_weap_smaw_green"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(4,8)],
			["wep", ["rhs_weap_fgm148"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_snipers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["rhs_weap_t5000", "rhs_weap_m107"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(4,6)],
			["wep", ["rhs_weap_XM2010_sa", "rhs_weap_m24sws_blk", "rhs_weap_m40a5_d"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(6,8)],
			["wep", ["rhs_weap_svdp_wd_npz", "rhs_weap_svds_npz"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(6,8)],
			//["mag", "5Rnd_127x108_APDS_Mag", RANDOM_BETWEEN(3,10)],
			["wep", "Rangefinder", RANDOM_BETWEEN(1,3)],
			["itm", "optic_DMS", RANDOM_BETWEEN(1,2)],
			["itm", "optic_SOS", RANDOM_BETWEEN(1,2)],
			["itm", "optic_AMS", RANDOM_BETWEEN(1,1)],
			["itm", "optic_KHS_blk", RANDOM_BETWEEN(1,1)],
			//["itm", "optic_LRPS", RANDOM_BETWEEN(1,2)],
			["itm", "optic_tws", RANDOM_BETWEEN(0,1)],
			["itm", "optic_Nightstalker", RANDOM_BETWEEN(0,1)],
			//["itm", "muzzle_snds_338_black", RANDOM_BETWEEN(1,2)],
			//["itm", "muzzle_snds_93mmg", RANDOM_BETWEEN(1,2)],
			["itm", "bipod_01_F_blk", RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_RPG":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", "rhs_weap_smaw_green", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,4)],
			["wep", "rhs_weap_M136", RANDOM_BETWEEN(1,3)],
			["wep", "rhs_weap_m80", RANDOM_BETWEEN(1,3)],
			["wep", "rhs_weap_m72a7", RANDOM_BETWEEN(1,3)]
		];
	};
	case "mission_PCML":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", "rhs_weap_rpg7", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,4)],
			["wep", "rhs_weap_panzerfaust60", RANDOM_BETWEEN(1,3)],
			["wep", "rhs_weap_rpg26", RANDOM_BETWEEN(1,5)],
			["wep", "rhs_weap_rshg2", RANDOM_BETWEEN(1,5)]
		];
	};
	case "mission_Pistols":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", "rhsusf_weap_glock17g4", RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(5,10)],
			["wep", "rhs_weap_pb_6p9", RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(5,10)],
			["wep", "rhs_weap_M320", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(4,6)],
			["itm", "muzzle_snds_acp", RANDOM_BETWEEN(2,4)],
			["itm", "muzzle_snds_L", RANDOM_BETWEEN(2,4)],
			["itm", "muzzle_snds_L", RANDOM_BETWEEN(2,4)],
			["itm", "rhs_acc_6p9_suppressor", RANDOM_BETWEEN(2,4)],
			["itm", "rhsusf_acc_omega9k", RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_AssRifles":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["rhs_weap_akm_zenitco01_b33", "rhs_weap_savz58v_rail"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(4,8)],
			["wep", ["rhs_weap_ak103_zenitco01_b33", "rhs_weap_ak103_gp25_npz"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(4,8)],
            ["wep", ["rhs_weap_ak74m_camo_npz", "rhs_weap_ak74m_desert_npz"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(4,8)],
			["wep", ["rhs_weap_m249_pip_L_vfg"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)],
            ["wep", ["rhs_weap_g36c", "rhs_weap_g36kv", "rhs_weap_g36kv_ag36"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(6,10)],
			["wep", ["rhs_weap_pkm"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)],
			["wep", ["rhs_weap_vhsd2_ct15x", "rhs_weap_vhsd2_bg_ct15x"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(6,10)],
            ["wep", ["rhs_weap_m16a4_carryhandle_M203", "rhs_weap_m4a1_m320", "rhs_weap_m14ebrri"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(6,10)],
			["wep", ["rhs_weap_hk416d145_wd", "rhs_weap_hk416d145_m320", "rhs_weap_m32"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(6,10)],
			
			["itm", "optic_MRCO", RANDOM_BETWEEN(2,4)],
			["itm", "optic_Arco", RANDOM_BETWEEN(2,4)],
			["itm", "optic_Hamr", RANDOM_BETWEEN(2,4)],
			["itm", "optic_DMS", RANDOM_BETWEEN(1,2)]
		];
	};
	case "mission_SMGs":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", "rhs_weap_m3a1", 2, RANDOM_BETWEEN(5,8)],
			["wep", "rhs_weap_m3a1_specops", 2, RANDOM_BETWEEN(5,8)],
			
			["wep", "SMG_03C_TR_black", 2, RANDOM_BETWEEN(4,6)],
			["wep", "SMG_03C_TR_khaki", 2, RANDOM_BETWEEN(4,6)],
			["wep", "SMG_03_TR_black", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(4,6)],
			["wep", "SMG_03_TR_khaki", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(4,6)],
			
			["wep", "rhsusf_weap_MP7A2", 2, RANDOM_BETWEEN(5,8)],
			["wep", "rhs_weap_vss_grip_npz", 2, RANDOM_BETWEEN(5,8)],
			["wep", "rhs_weap_savz61", 2, RANDOM_BETWEEN(5,8)],
			["itm", "rhsusf_acc_rotex_mp7", RANDOM_BETWEEN(0,2)],
			["itm", "muzzle_snds_570", RANDOM_BETWEEN(0,2)],
			["itm", "rhsusf_acc_mrds", RANDOM_BETWEEN(2,4)]
		];
	};
	case "mission_LMGs":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", "rhs_weap_m249_pip_S_vfg", RANDOM_BETWEEN(2,3), RANDOM_BETWEEN(5,8)],
			["wep", "rhs_weap_m240B_CAP", RANDOM_BETWEEN(2,3), RANDOM_BETWEEN(5,8)],
			["wep", "rhs_weap_pkm", RANDOM_BETWEEN(2,3), RANDOM_BETWEEN(5,8)],
			["wep", "rhs_weap_pkp", RANDOM_BETWEEN(2,3), RANDOM_BETWEEN(5,8)],
			["itm", "optic_MRCO", RANDOM_BETWEEN(1,2)],
			["itm", "optic_Hamr", RANDOM_BETWEEN(1,2)]
		];
	};
	case "Medical":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["itm", "Medikit", RANDOM_BETWEEN(5,10)],
			//["itm", "VSM_Gasmask_acc", RANDOM_BETWEEN(2,4)],
			["itm", "FirstAidKit", RANDOM_BETWEEN(5,10)]
		];
	};
	case "mission_Field_Engineer": 
	{	
		_boxItems = 
		[
			["itm", "Toolkit", 10],
			["itm", "MineDetector", 10]
		];
	};
	case "airdrop_Rifles":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//weapons
			["wep", ["rhs_weap_m21a_pr", "rhs_weap_m21a_pr_pbg40"], 3,9],
			["wep", ["rhs_weap_akm_zenitco01_b33", "rhs_weap_akmn_gp25_npz"], 2,6],
			["wep", ["rhs_weap_g36c", "rhs_weap_g36kv"], 2,6],
			["wep", ["rhs_weap_m4a1_blockII_KAC_bk", "rhs_weap_m16a4_carryhandle_pmag"], 2,6],
			["itm", "optic_MRCO", 2],
			["itm", "optic_Hamr", 2]
			//items
			//["itm", ["bipod_01_F_blk", "bipod_02_F_hex"], 3]
		];
	};
	case "airdrop_LMGs":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//weapons
			["wep", ["rhs_weap_m240G", "rhs_weap_m249_pip_S_para"], 2,4],
			["wep", ["rhs_weap_pkm", "rhs_weap_pkp"], 2,4],
			["itm", "optic_MRCO", RANDOM_BETWEEN(2,2)]
			//items
			//["itm", ["bipod_01_F_blk", "bipod_02_F_hex"], 2]
		];
	};
	case "airdrop_Snipers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//weapons
			["wep", ["rhs_weap_svds_npz", "rhs_weap_svdp_wd_npz"], 2,10],
			["wep", ["rhs_weap_XM2010", "rhs_weap_m24sws_blk"], 2,10],
			["wep", ["rhs_weap_m14ebrri", "rhs_weap_m40a5_wd"], 2,10],
			["wep", "Rangefinder", 2],
			["wep", "Laserdesignator", 2],
			//Mags
			//["mag", "5Rnd_127x108_APDS_Mag", 20],
			//Items
			["itm", "rhs_acc_pso1m21", 2],
			["itm", "optic_DMS", 4]
		];
	};
	case "airdrop_Launchers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//Weapons
			["wep", "rhs_weap_rpg7", 2,2],
			["wep", "rhs_weap_smaw_green", 2,2],
			["wep", "rhs_weap_rpg26", 2],
			["wep", "rhs_weap_m72a7", 2],
			//Mags
			["mag", "rhs_rpg7_PG7VL_mag", 2],
			["mag", "rhs_rpg7_OG7V_mag", 2],
			["mag", "rhs_rpg7_TBG7V_mag", 2],
			["mag", "rhs_mag_smaw_HEAA", 2],
			["mag", "rhs_mag_smaw_HEDP", 2]
		];
	};
	case "airdrop_Medical":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["itm", "Medikit", 15],
			//["itm", "VSM_Gasmask_acc", 3],
			["itm", "FirstAidKit", 20]
		];
	};
	case "airdrop_Diving_Gear": //diving equipment for squad of 2
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//weapons
			["wep", "arifle_SDAR_F", 2,5],
			//items
			["itm", "V_RebreatherB", 2],
			["itm", "V_RebreatherIR", 2],
			["itm", "V_RebreatherIA", 2],
			["itm", "G_Diving", 2],
			["itm", "U_B_Wetsuit", 2],
			["itm", "U_O_Wetsuit", 2],
			["itm", "U_I_Wetsuit", 2],
			["bac", ["B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_oli", "B_Carryall_mcamo"], 2]
		];
	};
	case "airdrop_Field_Engineer": 
	{	
		_boxItems = 
		[
			["itm", "Toolkit", 15],
			["itm", "MineDetector", 5]
		];
	};
};

[_box, _boxItems] call processItems;

if (["A3W_artilleryStrike"] call isConfigOn) then
{
	if (random 1.0 < ["A3W_artilleryCrateOdds", 1/10] call getPublicVar) then
	{
		_box setVariable ["artillery", 1, true];
	};
};
