// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refilltruck.sqf
//	@file Author: AgentRev
//	@file Created: 30/06/2013 15:28

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) (START + floor random ((END - START) + 1))

private ["_truck", "_truckItems", "_item", "_qty", "_mag"];
_truck = _this;

// Clear prexisting cargo first
clearMagazineCargoGlobal _truck;
clearWeaponCargoGlobal _truck;
clearItemCargoGlobal _truck;

// Item type, Item, # of items, # of magazines per weapon
_truckItems =
[
	["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(0,2)],
	["itm", "FirstAidKit", RANDOM_BETWEEN(3,6)],
	["itm", "Medikit", RANDOM_BETWEEN(1,3)],
	["itm", "Toolkit", RANDOM_BETWEEN(0,1)],
	["itm", ["rhsusf_acc_nt4_black", "rhs_acc_pbs1", "rhs_acc_pbs4", "rhs_acc_tgpa", "rhs_acc_tgpv","rhs_acc_dtk4screws","rhs_acc_dtk4long""rhs_acc_dtk4short"], RANDOM_BETWEEN(0,3)],
	["itm", ["rhsusf_acc_T1_high", "rhsusf_acc_compm4", "rhsusf_acc_g33_t1", "rhsusf_acc_ACOG_RMR", "rhsusf_acc_ACOG_MDO"], RANDOM_BETWEEN(2,4)],
	//["wep", ["SMG_01_F", "SMG_02_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,5)],
	["wep", ["rhs_weap_akm_zenitco01_b33", "rhs_weap_akmn_gp25_npz", "rhs_weap_m4a1_m320", "rhs_weap_m4a1_wd_mstock"], RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(4,5)],
	["mag", ["rhs_mag_M441_HE","rhs_VOG25"], RANDOM_BETWEEN(5,10)],
	["wep", ["rhs_weap_svdp_wd_npz", "rhs_weap_m24sws_d", "srifle_LRR_tna_LRPS_F", "rhs_weap_XM2010_sa", "rhs_weap_m76"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(6,12)],
	["wep",[
		"rhs_weap_rpg7",
		["rhs_weap_rpg26", "rhs_weap_rshg2"],
		["rhs_weap_panzerfaust60", "rhs_weap_rpg75", "rhs_weap_m80"],
		["rhs_weap_M136", "rhs_weap_M136_hedp", "rhs_weap_M136_hp", "rhs_weap_m72a7"],
		["rhs_weap_maaws", "rhs_weap_smaw_green"]
	], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,3)],
	["wep", ["rhs_weap_igla", "rhs_weap_fim92", "rhs_weap_fgm148"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,3)],
	["mag", "rhssaf_mag_br_m75", RANDOM_BETWEEN(5,10)],
	["mag", ["APERSTripMine_Wire_Mag", "APERSBoundingMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag"], RANDOM_BETWEEN(2,6)],
	["mag", ["SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(2,5)],
	["itm", [["rhsgref_helmet_pasgt_olive", "rhsgref_helmet_pasgt_erdl"], ["rhs_6b28_green_ess", "rhs_6b28_flora_ess"], "rhsusf_opscore_mc_cover_pelt_cam"], RANDOM_BETWEEN(1,4)],
	["itm", [
		["rhsusf_mbav_light", "rhsusf_mbav_mg", "rhsusf_mbav_rifleman"],
		["rhs_6b13_flora", "rhs_6b13_emr", "rhs_6b13"],
		["rhsgref_otv_khaki", "rhsgref_otv_digi", "rhs_6b5_rifleman_vsr"]
	], RANDOM_BETWEEN(1,4)]
];

[_truck, _truckItems] call processItems;
