// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: createAAFRegular.sqf
//	Author: BIB_Monkey
/*
 * Creates a random Soldier.
 */

// if (!isServer && hasinterface) exitWith {};
private _group = _this select 0;
private _position = _this select 1;
private _faction = _this select 2;
private _type = _this select 3;

private _soldierTypes = selectrandom ["C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F", "C_man_polo_4_F", "C_man_polo_5_F", "C_man_polo_6_F"];
private _uniformTypes = [];
private _vestTypes = [];
private _BackpackTypes = [];
private _weaponTypesRifle = [];
private _grenadeType = [];
private _weaponTypesLauncher = [];
private _weaponTypesPistor = [];
private _weaponSight = [];
private _weaponsRail = [];
private _weaponsBipod = [];
private _weaponsSuppressor = [];
private _BinocularTypes = [];
private _NVGogglesTypes = [];
private _TerminalTypes = [];
private _itemsList = [];
private _headgear = [];
private _faceItems = [];
private _allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
private _rank = "PRIVATE"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
//Soldier Skills are set from 0 to 1; 
private _Accuracy = 1; //Soldier accuracy;
private _Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
private _aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
private _aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
private _spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
private _spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
private _reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
private _commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	

//Uniform
	switch (_faction) do
	{
		case "NATO":
		{
			switch (_type) do
			{
				case "Sniper": {_uniformTypes = ["U_B_FullGhillie_ard","U_B_T_FullGhillie_tna_F","U_B_FullGhillie_lsh","U_B_FullGhillie_sard","U_B_T_Sniper_F","U_B_GhillieSuit"]};
				case "Diver": {_uniformTypes = ["U_B_survival_uniform","U_B_Wetsuit"]};
				case "HeliCrew": {_uniformTypes = ["U_B_HeliPilotCoveralls"]};
				case "Helipilot": {_uniformTypes = ["U_B_HeliPilotCoveralls"]};
				case "JetPilot": {_uniformTypes = ["U_B_PilotCoveralls"]};
				case "CTRG": {_uniformTypes = ["rhs_uniform_g3_rgr"]};
				default {_uniformTypes = ["rhssaf_uniform_m10_digital","rhs_uniform_cu_ocp_10th","rhs_uniform_g3_mc","rhs_uniform_g3_m81","rhs_uniform_FROG01_wd"]};
			};
		};
		case "CSAT":
		{
			switch (_type) do
			{
				case "Sniper": {_uniformTypes = ["U_O_FullGhillie_ard","U_O_T_FullGhillie_tna_F","U_O_FullGhillie_lsh","U_O_FullGhillie_sard","U_O_T_Sniper_F","U_O_GhillieSuit"]};
				case "Diver": {_uniformTypes = ["U_O_Wetsuit"]};
				case "HeliCrew": {_uniformTypes = ["rhs_uniform_m88_patchless"]};
				case "Helipilot": {_uniformTypes = ["rhs_uniform_m88_patchless"]};
				case "JetPilot": {_uniformTypes = ["rhs_uniform_df15"]};
				case "Viper": {_uniformTypes = ["rhs_uniform_gorka_r_g","rhs_uniform_gorka_r_y"]};
				default {_uniformTypes = ["rhs_uniform_rva_flora","rhs_uniform_mvd_izlom","rhs_uniform_vdv_emr","rhs_uniform_mflora_patchless","rhs_uniform_flora_patchless_alt"]};
			};
		};
		case "AAF":
		{
			switch (_type) do
			{
				case "Sniper": {_uniformTypes = ["rhsgref_uniform_specter", "U_I_CombatUniform_shortsleeve", "U_I_GhillieSuit"]};
				case "Diver": {_uniformTypes = ["U_I_Wetsuit"]};
				case "HeliCrew": {_uniformTypes = ["rhssaf_uniform_heli_pilot"]};
				case "Helipilot": {_uniformTypes = ["rhssaf_uniform_heli_pilot"]};
				case "JetPilot": {_uniformTypes = ["U_I_PilotCoveralls"]};
				default {_uniformTypes = ["rhsgref_uniform_ag107_erld","rhsgref_uniform_altis_lizard","rhsgref_uniform_vsr"]};
			};
		};
		case "GEN":
		{
			switch (_type) do
			{
				case "Commander": {_uniformTypes = ["U_B_GEN_Commander_F"]};
				default {_uniformTypes = ["U_B_GEN_Soldier_F","rhs_uniform_g3_blk"]};
			};
		};
		case "SYN":
		{
			switch (_type) do
			{
				default {_uniformTypes = ["U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_5_F","U_C_ConstructionCoverall_Black_F","U_C_ConstructionCoverall_Blue_F","U_C_ConstructionCoverall_Red_F","U_C_ConstructionCoverall_Vrana_F","U_BG_Guerilla1_2_F","U_BG_Guerrilla_6_1","U_BG_Guerilla2_2",	"U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_leader","U_C_Mechanic_01_F","U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F","U_Rangemaster","U_I_C_Soldier_Camo_F","U_C_Poor_1","U_C_WorkerCoveralls"]};
			};
		};
		case "IDAP":
		{
			switch (_type) do
			{
				case "Paramedic": {_uniformTypes = ["U_C_Paramedic_01_F"]};
				default {_uniformTypes = ["U_C_IDAP_Man_cargo_F","U_C_IDAP_Man_casual_F","U_C_IDAP_Man_Jeans_F","U_C_IDAP_Man_shorts_F","U_C_IDAP_Man_TeeShorts_F","U_C_IDAP_Man_Tee_F"]};
			};
		};
	};
//Vest
	switch (_faction) do
	{
		case "NATO":
		{
			switch (_type) do
			{
				case "Diver":{_vestTypes = ["V_RebreatherB"]};
				case "HeliPilot":{_vestTypes = ["V_TacVest_blk"]};
				case "JetPilot":{_vestTypes = ["V_TacVest_blk"]};
				case "Grenedier":{_vestTypes = ["rhsusf_iotv_ocp_Grenadier","rhsusf_spc_patchless","rhsusf_mbav_grenadier"]};
				case "CTRG":{_vestTypes = ["rhsusf_mbav_rifleman","rhsusf_mbav_grenadier","rhsusf_mbav_mg","rhsusf_mbav_medic"]};
				default {_vestTypes = ["rhsusf_spc_light","rhsusf_spc_marksman","rhsusf_spcs_ocp_rifleman","rhsusf_spc_patchless","rhsusf_spcs_ocp_sniper","rhsusf_spc_squadleader","rhsusf_spc_teamleader","rhsusf_spcs_ocp_squadleader","rhsusf_spcs_ocp_teamleader"]};
			};
		};
		case "CSAT":
		{
			switch (_type) do
			{
				case "Diver":{_vestTypes = ["V_RebreatherIR"]};
				case "HeliPilot":{_vestTypes = ["V_TacVest_blk"]};
				case "JetPilot":{_vestTypes = ["V_TacVest_blk"]};
				case "Viper":{_vestTypes = ["rhs_6b23_6sh116_vog_od","rhs_6b23_6sh116_vog_flora"]};
				default {_vestTypes = ["rhs_6b13_flora","rhs_6b13_emr","rhs_6b13_Flora_6sh92_vog","rhs_6b23_digi","rhs_6b23_6sh116_vog"]};
			};
		};
		case "AAF":
		{
			switch (_type) do
			{
				case "Diver":{_vestTypes = ["V_RebreatherIA"]};
				case "HeliPilot":{_vestTypes = ["V_TacVest_blk"]};
				case "JetPilot":{_vestTypes = ["V_TacVest_blk"]};
				default {_vestTypes = ["rhsgref_6b23_khaki_rifleman","rhsgref_TacVest_ERDL","rhs_6b5_rifleman_ttsko"]};
			};
		};
		case "GEN":{_vestTypes = ["V_TacVest_gen_F","V_EOD_blue_F","V_TacVest_blk_POLICE"]};
		case "SYN":{_vestTypes = ["V_BandollierB_blk","V_BandollierB_cbr","V_TacVest_blk","V_TacVest_khk","V_TacVest_oli","V_TacVest_brn","V_TacVest_camo"]};
		case "IDAP":{_vestTypes = ["V_EOD_IDAP_blue_F","V_EOD_blue_F","V_EOD_coyote_F","V_EOD_olive_F"]};
		default {_vestTypes = ["objNull"]};
	};
//Backpack
	switch (_type) do
	{
		case "AT":
		{
			switch (_faction) do
			{
				case "NATO":{_BackpackTypes = ["B_TacticalPack_mcamo","rhssaf_kitbag_smb","B_Carryall_oli"]};
				case "CSAT":{_BackpackTypes = ["B_FieldPack_oli","B_FieldPack_khk","B_FieldPack_cbr_F","B_TacticalPack_oli","B_Carryall_oli","B_Carryall_khk_F"]};
				case "AAF":{_BackpackTypes = ["B_AssaultPack_rgr","B_Kitbag_rgr","B_TacticalPack_rgr","B_TacticalPack_oli","rhsgref_wdl_alicepack"]};
				case "SYN":{_BackpackTypes = ["B_FieldPack_blk","B_FieldPack_cbr","B_FieldPack_khk","B_Kitbag_cbr","B_Kitbag_sgg","B_TacticalPack_blk","B_TacticalPack_rgr","rhsgref_wdl_alicepack","rhsgref_hidf_alicepack"]};
			};
		};
		case "AA":
		{
			switch (_faction) do
			{
				case "NATO":{_BackpackTypes = ["B_TacticalPack_mcamo","rhssaf_kitbag_smb","B_Carryall_oli"]};
				case "CSAT":{_BackpackTypes = ["B_FieldPack_oli","B_FieldPack_khk","B_FieldPack_cbr_F","B_TacticalPack_oli","B_Carryall_oli","B_Carryall_khk_F"]};
				case "AAF":{_BackpackTypes = ["B_AssaultPack_rgr","B_Kitbag_rgr","B_TacticalPack_rgr","B_TacticalPack_oli","rhsgref_wdl_alicepack"]};
			};
		};
		case "SAW":
		{
			switch (_faction) do
			{
				case "NATO":{_BackpackTypes = ["B_FieldPack_oli","B_FieldPack_cbr_F","B_TacticalPack_oli"]};
				case "CSAT":{_BackpackTypes = ["B_FieldPack_oli","B_FieldPack_khk","B_FieldPack_cbr_F","B_TacticalPack_oli"]};
				case "AAF":{_BackpackTypes = ["B_AssaultPack_rgr","B_Kitbag_rgr","B_TacticalPack_rgr","B_TacticalPack_oli"]};
				case "SYN":{_BackpackTypes = ["B_FieldPack_blk","B_FieldPack_cbr","B_FieldPack_khk","B_Kitbag_cbr","B_Kitbag_sgg","B_TacticalPack_blk","B_TacticalPack_rgr"]};
			};
		};
		case "Viper":
		{
			_BackpackTypes = ["objNull","objNull","objNull","objNull","B_ViperLightHarness_khk_F","B_ViperLightHarness_oli_F","B_ViperHarness_khk_F","B_ViperHarness_oli_F"];
		};
		case "CTRG":
		{
			_BackpackTypes = ["objNull","objNull","objNull","objNull","B_Carryall_khk","B_Carryall_cbr","B_Carryall_mcamo","B_Carryall_oli"];
		};
		default
		{
			switch (_faction) do
			{
				case "NATO":{_BackpackTypes = ["objNull","objNull","objNull","B_AssaultPack_mcamo","B_Kitbag_mcamo","B_TacticalPack_oli"]};
				case "CSAT":{_BackpackTypes = ["objNull","objNull","objNull","B_FieldPack_oli","B_FieldPack_khk","B_FieldPack_cbr_F","B_TacticalPack_oli"]};
				case "AAF":{_BackpackTypes = ["objNull","objNull","objNull","B_AssaultPack_rgr","B_Kitbag_rgr","B_TacticalPack_rgr","B_TacticalPack_oli"]};
				case "SYN":{_BackpackTypes = ["objNull","objNull","objNull", "B_LegStrapBag_black_F","B_LegStrapBag_coyote_F","B_LegStrapBag_olive_F","B_Messenger_Black_F","B_Messenger_Coyote_F","B_Messenger_Gray_F","B_Messenger_Olive_F","B_AssaultPack_blk","B_AssaultPack_rgr"]};
				case "IDAP":{_BackpackTypes = ["objNull","objNull","objNull", "B_LegStrapBag_black_F","B_LegStrapBag_coyote_F","B_LegStrapBag_olive_F","B_Messenger_Black_F","B_Messenger_Coyote_F","B_Messenger_Gray_F","B_Messenger_Olive_F","B_AssaultPack_blk","B_AssaultPack_rgr","B_Messenger_IDAP_F"]};
				default {_BackpackTypes = ["objNull"]};
			};
		};
	};
//Primary Weapon
	switch (_type) do
	{
		case "Crew":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesRifle = ["rhs_weap_m4a1_carryhandle"]};
				case "CSAT":{_weaponTypesRifle = ["rhs_weap_aks74n"]};
				case "AAF":{_weaponTypesRifle = ["rhs_weap_g36kv"]};
				default {_weaponTypesRifle = ["rhs_weap_m92"]};
			};
		};
		case "HeliCrew":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesRifle = ["rhsusf_weap_MP7A2"]};
				case "CSAT":{_weaponTypesRifle = ["rhs_weap_vss_grip_npz"]};
				case "AAF":{_weaponTypesRifle = ["rhs_weap_m3a1_specops"]};
				default {_weaponTypesRifle = ["rhs_weap_pp2000"]};
			};
		};
		case "HeliPilot":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesRifle = ["rhsusf_weap_MP7A2"]};
				case "CSAT":{_weaponTypesRifle = ["rhs_weap_vss_grip_npz"]};
				case "AAF":{_weaponTypesRifle = ["rhs_weap_m3a1_specops"]};
				default {_weaponTypesRifle = ["rhs_weap_pp2000"]};
			};
		};
		case "JetPilot":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesRifle = ["rhsusf_weap_MP7A2"]};
				case "CSAT":{_weaponTypesRifle = ["rhs_weap_vss_grip_npz"]};
				case "AAF":{_weaponTypesRifle = ["rhs_weap_m3a1_specops"]};
				default {_weaponTypesRifle = ["rhs_weap_pp2000"]};
			};
		};
		case "Medic":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesRifle = ["rhs_weap_m4a1_carryhandle"]};
				case "CSAT":{_weaponTypesRifle = ["rhs_weap_aks74n"]};
				case "AAF":{_weaponTypesRifle = ["rhs_weap_g36kv"]};
				default {_weaponTypesRifle = ["rhs_weap_m3a1_specops"]};
			};
		};
		case "Diver":
		{
			_weaponTypesRifle = ["arifle_SDAR_F"];
		};
		case "Grenedier":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesRifle = ["rhs_weap_m16a4_carryhandle_M203","rhs_weap_hk416d10_m320","rhs_weap_m4a1_m203s","rhs_weap_m32"]};
				case "CSAT":{_weaponTypesRifle = ["rhs_weap_akmn_gp25","rhs_weap_aks74n_gp25"]};
				case "AAF":{_weaponTypesRifle = ["rhs_weap_m79","rhs_weap_g36kv_ag36","rhs_weap_vhsd2_bg"]};
				case "SYN":{_weaponTypesRifle = ["rhs_weap_akmn_gp25","rhs_weap_m21a_pbg40"]};
				case "IDAP":{_weaponTypesRifle = ["rhs_weap_akmn_gp25","rhs_weap_m21a_pbg40"]};
				case "GEN":{_weaponTypesRifle = ["rhs_weap_m4a1_m203s"]};
			};
		};
		case "Marksman":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesRifle = ["rhs_weap_hk416d145","rhs_weap_m27iar_grip","rhs_weap_m16a4_carryhandle_pmag","rhs_weap_sr25_ec","rhs_weap_m14ebrri"]};
				case "CSAT":{_weaponTypesRifle = ["rhs_weap_m76","rhs_weap_svdp","rhs_weap_ak74m_zenitco01"]};
				case "AAF":{_weaponTypesRifle = ["rhs_weap_m76","rhs_weap_svdp","rhs_weap_akmn"]};
			};
		};
		case "SAW":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesRifle = ["rhs_weap_m249_pip","rhs_weap_m240B"]};
				case "CSAT":{_weaponTypesRifle = ["rhs_weap_pkm","rhs_weap_pkp"]};
				case "AAF":{_weaponTypesRifle = ["rhs_weap_mg42","rhs_weap_minimi_para_railed"]};
				case "SYN":{_weaponTypesRifle = ["rhs_weap_mg42","rhs_weap_pkm"]};
			};
		};
		case "Sniper":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesRifle = ["rhs_weap_m24sws_wd","rhs_weap_XM2010_sa","rhs_weap_m14ebrri","rhs_weap_m24sws_wd","rhs_weap_XM2010_sa","rhs_weap_m14ebrri","rhs_weap_m24sws_wd","rhs_weap_XM2010_sa","rhs_weap_m14ebrri","rhs_weap_M107"]};
				case "CSAT":{_weaponTypesRifle = ["rhs_weap_svdp_wd_npz","rhs_weap_svdp_wd_npz","rhs_weap_svdp_wd_npz","rhs_weap_svdp_wd_npz","rhs_weap_svdp_wd_npz","rhs_weap_t5000"]};
				case "AAF":{_weaponTypesRifle = ["rhs_weap_svdp_wd_npz","rhs_weap_m24sws","rhs_weap_svdp_wd_npz","rhs_weap_m24sws","rhs_weap_svdp_wd_npz","rhs_weap_m24sws","rhs_weap_m82a1"]};
			};
		};
		case "Viper":
		{
			switch (_faction) do
			{
				case "CSAT":{_weaponTypesRifle = ["rhs_weap_akm_zenitco01_b33","rhs_weap_ak104_zenitco01_b33","rhs_weap_aks74n_gp25_npz","rhs_weap_ak74mr","rhs_weap_ak74mr_gp25","rhs_weap_svdp_wd_npz","rhs_weap_pkp","rhs_weap_asval_grip_npz"]};
			};
		};
		case "CTRG":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesRifle = ["rhs_weap_vhsd2_ct15x","rhs_weap_vhsd2_bg_ct15x","rhs_weap_hk416d10_LMT_wd","rhs_weap_hk416d10_m320","rhs_weap_m4a1_blockII_KAC_wd","rhs_weap_mk18_m320","rhs_weap_m32","rhs_weap_m40a5_wd","rhs_weap_m249_pip","rhs_weap_m240B","rhs_weap_m4a1_blockII_KAC_wd","rhs_weap_mk18_KAC_wd"]};
			};
		};
		default
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesRifle = ["rhs_weap_m16a4_carryhandle_pmag","rhs_weap_m16a4_carryhandle_pmag","rhs_weap_m16a4_carryhandle_pmag","rhs_weap_hk416d10","rhs_weap_m4a1_carryhandle","rhs_weap_m4a1_carryhandle","rhs_weap_m4a1_carryhandle","rhs_weap_m27iar_grip","rhs_weap_hk416d10","rhs_weap_m32"]};//"rhs_weap_m16a4_carryhandle_pmag","rhs_weap_m16a4_carryhandle_pmag","rhs_weap_m16a4_carryhandle_pmag","rhs_weap_hk416d10","rhs_weap_m4a1_carryhandle","rhs_weap_m4a1_carryhandle","rhs_weap_m4a1_carryhandle","rhs_weap_m27iar_grip","rhs_weap_hk416d10","rhs_weap_m32"
				case "CSAT":{_weaponTypesRifle = ["rhs_weap_aks74n","rhs_weap_aks74n","rhs_weap_aks74n","rhs_weap_ak105_zenitco01","rhs_weap_ak105_zenitco01","rhs_weap_ak105_zenitco01","rhs_weap_akmn","rhs_weap_vss_grip"]};
				//"rhs_weap_aks74n","rhs_weap_aks74n","rhs_weap_aks74n","rhs_weap_ak105_zenitco01","rhs_weap_ak105_zenitco01","rhs_weap_ak105_zenitco01","rhs_weap_akmn","rhs_weap_vss_grip"
				case "AAF":{_weaponTypesRifle = ["rhs_weap_g36c","rhs_weap_g36kv","rhs_weap_g36c","rhs_weap_g36kv","rhs_weap_g36c","rhs_weap_g36kv","rhs_weap_vhsd2_ct15x","rhs_weap_vhsd2_bg_ct15x"]};
				//"rhs_weap_g36c","rhs_weap_g36kv","rhs_weap_g36c","rhs_weap_g36kv","rhs_weap_g36c","rhs_weap_g36kv","rhs_weap_vhsd2_ct15x","rhs_weap_vhsd2_bg_ct15x"
				case "SYN":{_weaponTypesRifle = ["rhs_weap_akmn","rhs_weap_akmn","rhs_weap_m76","rhs_weap_m92","rhs_weap_m92","rhs_weap_m92","rhs_weap_m79","rhs_weap_m1garand_sa43"]};
				//"rhs_weap_akmn","rhs_weap_akmn","rhs_weap_m76","rhs_weap_m92","rhs_weap_m92","rhs_weap_m92","rhs_weap_m79","rhs_weap_m1garand_sa43"
				case "IDAP":{_weaponTypesRifle = ["rhs_weap_savz58v","rhs_weap_savz58v","rhs_weap_akms","rhs_weap_akms","rhs_weap_akms","rhs_weap_pkm","rhs_weap_m76","rhs_weap_m92","rhs_weap_m38"]};
				//"rhs_weap_savz58v","rhs_weap_savz58v","rhs_weap_akms","rhs_weap_akms","rhs_weap_akms","rhs_weap_pkm","rhs_weap_m76","rhs_weap_m92","rhs_weap_m38"
				case "GEN":{_weaponTypesRifle = ["SMG_03C_black","SMG_03C_black","SMG_03_black","SMG_03_black","rhs_weap_m16a4_carryhandle_pmag","rhs_weap_m4a1","rhs_weap_m4a1","rhs_weap_m249_pip"]};
				//"SMG_03C_black","SMG_03C_black","SMG_03_black","SMG_03_black","rhs_weap_m16a4_carryhandle_pmag","rhs_weap_m4a1","rhs_weap_m4a1","rhs_weap_m249_pip"
				default {_weaponTypesRifle = ["rhs_weap_m3a1_specops"]};
				//"rhs_weap_m3a1_specops"
			};
		};
	};
	
//Grenadier Ammo
	switch (_type) do
	{
		case ("Grenedier"):
		{
			switch (_faction) do
			{
				case "NATO":{_grenadeType = ["rhs_mag_M441_HE","rhs_mag_M433_HEDP","rhs_mag_M397_HET"]};
				case "CSAT":{_grenadeType = ["rhs_VOG25","rhs_VOG25P","rhs_VG40TB"]};
				case "AAF":{_grenadeType = ["rhs_mag_M441_HE","rhs_mag_M433_HEDP","rhs_mag_M397_HET"]};
				case "SYN":{_grenadeType = ["rhs_VOG25","rhs_VOG25P","rhs_VG40TB"]};
				case "IDAP":{_grenadeType = ["rhs_VOG25","rhs_VOG25P","rhs_VG40TB"]};
				case "GEN":{_grenadeType = ["rhs_mag_M441_HE","rhs_mag_M433_HEDP","rhs_mag_M397_HET"]};
			};
		};
		default
		{
			_grenadeType = ["objNull"];
		};
	};


//Launcher
	switch (_type) do
	{
		case ("AA"):
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesLauncher = ["rhs_weap_fim92"]};
				case "CSAT":{_weaponTypesLauncher = ["rhs_weap_igla"]};
				case "AAF":{_weaponTypesLauncher = ["rhs_weap_igla"]};
			};
		};
		case "AT":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesLauncher = ["rhs_weap_M136","rhs_weap_maaws","rhs_weap_smaw_green","rhs_weap_m72a7","rhs_weap_fgm148","rhs_weap_M136_hedp"]};
				case "CSAT":{_weaponTypesLauncher = ["rhs_weap_rpg26","rhs_weap_rshg2","rhs_weap_rpg7"]};
				case "AAF":{_weaponTypesLauncher = ["rhs_weap_rpg7","rhs_weap_rpg75","rhs_weap_m80"]};
				case "SYN":{_weaponTypesLauncher = ["rhs_weap_panzerfaust60","rhs_weap_rpg7"]};
				case "IDAP":{_weaponTypesLauncher = ["rhs_weap_panzerfaust60","rhs_weap_m80"]};
				case "GEN":{_weaponTypesLauncher = ["rhs_weap_rpg7","rhs_weap_rpg75","rhs_weap_m80"]};
			};
		};
		case "Viper":
		{
			switch (_faction) do
			{
				case "CSAT":{_weaponTypesLauncher = ["objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","rhs_weap_rpg26","rhs_weap_rpg26","rhs_weap_rshg2","rhs_weap_rshg2","rhs_weap_rpg7","rhs_weap_rpg7","rhs_weap_igla","rhs_weap_igla","rhs_weap_igla","rhs_weap_rpg7"]};
			};
		};
		case "CTRG":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesLauncher = ["objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","rhs_weap_m72a7","rhs_weap_fim92","rhs_weap_M136","rhs_weap_M136","rhs_weap_maaws","rhs_weap_smaw_green","rhs_weap_smaw_green","rhs_weap_smaw_green","rhs_weap_fim92","rhs_weap_fgm148"]};
			};
		};
		default
		{
			_weaponTypesLauncher = ["objNull"];
		};
	};
//Pistol
	switch (_type) do
	{
		case "Crew":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesPistor = ["rhsusf_weap_m1911a1"]};
				case "CSAT":{_weaponTypesPistor = ["rhs_weap_makarov_pm"]};
				case "AAF":{_weaponTypesPistor = ["rhs_weap_type94_new"]};
				default {_weaponTypesPistor = ["objNull"]};
			};
		};
		case "HeliCrew":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesPistor = ["rhsusf_weap_m1911a1"]};
				case "CSAT":{_weaponTypesPistor = ["rhs_weap_makarov_pm"]};
				case "AAF":{_weaponTypesPistor = ["rhs_weap_type94_new"]};
				default {_weaponTypesPistor = ["objNull"]};
			};
		};
		case "HeliPilot":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesPistor = ["rhsusf_weap_m1911a1"]};
				case "CSAT":{_weaponTypesPistor = ["rhs_weap_makarov_pm"]};
				case "AAF":{_weaponTypesPistor = ["rhs_weap_type94_new"]};
				default {_weaponTypesPistor = ["objNull"]};
			};
		};
		case "JetPilot":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesPistor = ["rhsusf_weap_m1911a1"]};
				case "CSAT":{_weaponTypesPistor = ["rhs_weap_makarov_pm"]};
				case "AAF":{_weaponTypesPistor = ["rhs_weap_type94_new"]};
				default {_weaponTypesPistor = ["objNull"]};
			};
		};
		case "Medic":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesPistor = ["rhsusf_weap_m1911a1"]};
				case "CSAT":{_weaponTypesPistor = ["rhs_weap_makarov_pm"]};
				case "AAF":{_weaponTypesPistor = ["rhs_weap_type94_new"]};
				default {_weaponTypesPistor = ["objNull"]};
			};
		};
		case "Viper":
		{
			switch (_faction) do
			{
				case "CSAT":{_weaponTypesPistor = ["objNull","objNull","objNull","rhs_weap_pya"]};
			};
		};
		case "CTRG":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponTypesPistor = ["objNull","objNull","objNull","rhsusf_weap_glock17g4"]};
			};
		};
		default
		{
			_weaponTypesPistor = ["objNull"];
		};
	};
//Sight
	switch (_type) do
	{	
		case "Grenedier":
		{
			switch (_faction) do
			{
				case "CSAT":{_weaponSight = ["rhs_acc_1p63","rhs_acc_nita_3d","rhs_acc_pkas","rhs_acc_ekp8_02","rhs_acc_ekp1","rhs_acc_1p78"]};
			};
		};
		case "Marksman":
		{	
			switch (_faction) do
			{
				case "NATO":{_weaponSight = ["optic_SOS","optic_DMS","optic_KHS_old","rhsusf_acc_ACOG_MDO","optic_SOS","optic_DMS","optic_KHS_old","rhsusf_acc_ACOG_MDO","optic_NVS"]};
				case "CSAT":{_weaponSight = ["rhs_acc_1p29","rhs_acc_pso1m21"]};
				case "AAF":{_weaponSight = ["rhs_acc_1p29","rhs_acc_pso1m21"]};
			};
		};
		case "Sniper":
		{
			_weaponSight = ["optic_SOS","optic_DMS","optic_KHS_old","optic_KHS_blk","optic_SOS","optic_DMS","optic_KHS_old","optic_KHS_blk","optic_SOS","optic_DMS","optic_KHS_old","optic_KHS_blk","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_DMS","optic_NVS","optic_tws"];
		};
		case "Viper":
		{
			switch (_faction) do
			{
				case "CSAT":{_weaponSight = ["rhs_acc_rakursPM","rhs_acc_1p87","rhs_acc_ekp8_18","rhsusf_acc_ACOG_MDO","rhsusf_acc_g33_xps3","optic_DMS","rhsusf_acc_su230a_mrds","rhs_acc_rakursPM","rhs_acc_1p87","rhs_acc_ekp8_18","rhsusf_acc_ACOG_MDO","rhsusf_acc_g33_xps3","optic_DMS","rhsusf_acc_su230a_mrds","rhs_acc_rakursPM","rhs_acc_1p87","rhs_acc_ekp8_18","rhsusf_acc_ACOG_MDO","rhsusf_acc_g33_xps3","optic_DMS","rhsusf_acc_su230a_mrds","optic_tws"]};
			};
		};
		case "CTRG":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponSight = ["rhsusf_acc_RX01","rhsusf_acc_T1_high","rhsusf_acc_g33_xps3","rhsusf_acc_ACOG_MDO","rhsusf_acc_g33_t1","rhsusf_acc_ACOG_RMR","rhsusf_acc_su230a_mrds","rhsusf_acc_RX01","rhsusf_acc_T1_high","rhsusf_acc_g33_xps3","rhsusf_acc_ACOG_MDO","rhsusf_acc_g33_t1","rhsusf_acc_ACOG_RMR","rhsusf_acc_su230a_mrds","rhsusf_acc_RX01","rhsusf_acc_T1_high","rhsusf_acc_g33_xps3","rhsusf_acc_ACOG_MDO","rhsusf_acc_g33_t1","rhsusf_acc_ACOG_RMR","rhsusf_acc_su230a_mrds","optic_tws"]};
			};
		};
		default
		{
			switch (_faction) do
			{
				case "CSAT":{_weaponSight = ["rhs_acc_1p63","rhs_acc_nita_3d","rhs_acc_pkas","rhs_acc_ekp8_02","rhs_acc_ekp1","rhs_acc_1p78","rhs_acc_1p29","rhs_acc_pso1m21"]};
				case "AAF":{_weaponSight = ["rhsusf_acc_RX01","rhsusf_acc_T1_high","rhsusf_acc_g33_xps3","rhsusf_acc_ACOG_MDO","rhsusf_acc_g33_t1","rhsusf_acc_ACOG_RMR","rhsusf_acc_su230a_mrds","rhsusf_acc_RX01","rhsusf_acc_T1_high","rhsusf_acc_g33_xps3"]};
				case "SYN":{_weaponSight = ["objNull","objNull","rhs_acc_1p63","rhs_acc_nita_3d","rhs_acc_pkas","rhs_acc_ekp8_02","rhs_acc_ekp1","rhs_acc_1p78","rhs_acc_1p29","rhs_acc_pso1m21"]};
				//case "IDAP":{_weaponSight = ["rhs_acc_1p63","rhs_acc_nita_3d","rhs_acc_pkas","rhs_acc_ekp8_02","rhs_acc_ekp1","rhs_acc_1p78","rhs_acc_1p29"]};
				case "GEN":{_weaponSight = ["rhsusf_acc_RX01","rhsusf_acc_T1_high","rhsusf_acc_g33_xps3"]};
				/*default {_weaponTypesRifle = ["rhs_acc_rakursPM","rhs_acc_1p87","rhs_acc_ekp8_18","rhsusf_acc_ACOG_MDO","rhsusf_acc_g33_xps3","optic_DMS","rhsusf_acc_su230a_mrds","rhsusf_acc_RX01","rhsusf_acc_T1_high","rhsusf_acc_ACOG_RMR","rhsusf_acc_compm4","optic_Hamr","optic_MRCO","optic_Holosight","optic_Aco","optic_Aco_grn","optic_SOS"]};*/
			};
		};
	};

//Rail
	switch (_type) do
	{
		case "Marksman":
		{
			_weaponsRail = ["objNull","objNull","acc_pointer_IR"];
		};
		case "Sniper":
		{
			_weaponsRail = ["objNull","objNull","acc_pointer_IR"];
		};
		case "Viper":
		{
			switch (_faction) do
			{
				case "CSAT":{_weaponsRail = ["objNull","objNull","acc_pointer_IR"]};
			};
		};
		case "CTRG":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponsRail = ["objNull","objNull","acc_pointer_IR"]};
			};
		};
		default
		{
			_weaponsRail = ["objNull","objNull","acc_flashlight"];
		};
	};
//Bipod
	switch (_faction) do
	{
		case "NATO":
		{
			switch (_type) do
			{
				case "Marksman":{_weaponsBipod = ["rhsusf_acc_harris_bipod"]};
				case "Sniper":{_weaponsBipod = ["rhsusf_acc_harris_bipod"]};
				default{_weaponsBipod = ["objNull","objNull","objNull","rhsusf_acc_grip2","rhsusf_acc_grip3"]};
			};
		};
		case "CSAT":
		{
			switch (_type) do
			{
				case "Marksman":{_weaponsBipod = ["rhs_acc_harris_swivel"]};
				case "Sniper":{_weaponsBipod = ["rhs_acc_harris_swivel"]};
				default{_weaponsBipod = ["objNull","objNull","objNull","rhs_acc_grip_rk2","rhs_acc_grip_ffg2"]};
			};
		};
		case "AAF":
		{
			switch (_type) do
			{
				case "Marksman":{_weaponsBipod = ["bipod_03_F_blk"]};
				case "Sniper":{_weaponsBipod = ["bipod_03_F_blk"]};
				default{_weaponsBipod = ["objNull","objNull","objNull","bipod_03_F_blk","bipod_03_F_oli"]};
			};
		};
		default {_weaponsBipod = ["objNull"]};
	};

//Suppressor
	switch (_type) do
	{	
		case "Marksman":
		{	
			switch (_faction) do
			{
				case "NATO":{_weaponsSuppressor = ["rhsusf_acc_rotex5_grey","rhsusf_acc_nt4_black","rhsusf_acc_SR25S","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull"]};
				case "CSAT":{_weaponsSuppressor = ["rhs_acc_pbs1","rhs_acc_tgpv","rhs_acc_tgpa","rhs_acc_tgpa","objNull","objNull","objNull","objNull","objNull","objNull","objNull"]};
				case "AAF":{_weaponsSuppressor = ["rhs_acc_pbs1","rhs_acc_tgpv","rhs_acc_pbs1","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull"]};
			};
		};
		case "Viper":
		{
			switch (_faction) do
			{
				case "CSAT":{_weaponsSuppressor = ["rhs_acc_tgpa","rhs_acc_pbs1","rhs_acc_tgpa","rhs_acc_pbs1","rhs_acc_tgpv","rhs_acc_tgpv","objNull","objNull","objNull","objNull","objNull","objNull"]};
			};
		};
		case "CTRG":
		{
			switch (_faction) do
			{
				case "NATO":{_weaponsSuppressor = ["rhsusf_acc_rotex5_grey","rhsusf_acc_nt4_black","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull"]};
			};
		};
		default
		{
			switch (_faction) do
			{
				case "NATO":{_weaponsSuppressor = ["rhsusf_acc_rotex5_grey","rhsusf_acc_nt4_black","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull"]};
				case "CSAT":{_weaponsSuppressor = ["rhs_acc_pbs1","rhs_acc_tgpa","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull"]};
				case "AAF":{_weaponsSuppressor = ["rhsusf_acc_rotex5_grey","rhsusf_acc_nt4_black","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull"]};
				case "SYN":{_weaponsSuppressor = ["rhs_acc_pbs1","rhs_acc_pbs1","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull"]};
				case "IDAP":{_weaponsSuppressor = ["rhs_acc_pbs1","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull"]};
				case "GEN":{_weaponsSuppressor = ["rhsusf_acc_rotex5_grey","muzzle_snds_570","muzzle_snds_570","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull","objNull"]};
			};
		};
	};

//Binoculars
	switch (_type) do
	{
		case "Marksman": {_BinocularTypes = ["Rangefinder"]};
		case "Sniper": {_BinocularTypes = ["Rangefinder"]};
		case "Viper": {_BinocularTypes = ["objNull","objNull","objNull","objNull","objNull","objNull","Rangefinder","Rangefinder","Laserdesignator"]};
		case "CTRG": {_BinocularTypes = ["objNull","objNull","objNull","objNull","objNull","objNull","Rangefinder","Rangefinder","Laserdesignator"]};
		default {_BinocularTypes = ["objNull","objNull","Binocular"]};
	};
	
//NVGoggles
	switch (_type) do
	{
		case "Marksman": {_NVGogglesTypes = ["NVGoggles_INDEP"]};
		case "Sniper": {_NVGogglesTypes = ["NVGoggles_INDEP"]};
		case "Viper": {_NVGogglesTypes = ["NVGoggles_OPFOR"]};
		case "CTRG": {_NVGogglesTypes = ["NVGoggles"]};
		default {_NVGogglesTypes = ["objNull","objNull","objNull","NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP"]};
	};

//Terminal
	switch (_type) do
	{
		default {_TerminalTypes = ["objNull","objNull","ItemGPS"]};
	};
//Items
	switch (_type) do
	{
		case "Medic":{_itemsList = ["FirstAidKit","Medikit"]};
		case "Engineer":{_itemsList = ["MineDetector","FirstAidKit","ToolKit"]};
		case "Diver":{_itemsList = ["objNull"]};
		default {_itemsList = ["objNull","rhs_mag_an_m14_th3", "rhssaf_mag_brk_m79", "rhssaf_mag_brz_m88", "rhs_mag_m7a3_cs", "rhsgref_mag_rkg3em", "rhs_mag_zarya2","rhs_mag_an_m8hc", "rhssaf_mag_brd_m83_white", "rhssaf_mag_brd_m83_blue", "rhssaf_mag_brd_m83_green", "rhssaf_mag_brd_m83_yellow", "rhssaf_mag_brd_m83_red","rhssaf_mag_br_m75", "rhssaf_mag_br_m84", "rhs_mag_f1","DemoCharge_Remote_Mag","FirstAidKit"]};
	};
//headgear
	switch (_faction) do
	{
		case "CSAT":
		{
			switch (_type) do
			{
				case "Diver":{_headgear = ["objNull"]};
				case "Crew":{_headgear = ["rhs_tsh4_ess"]};
				case "HeliPilot":{_headgear = ["rhs_zsh7a_mike_green"]};
				case "HeliCrew":{_headgear = ["rhs_zsh7a_mike_green"]};
				case "JetPilot":{_headgear = ["rhs_zsh7a_alt"]};
				case "Viper":{_headgear = ["rhs_6b7_1m_olive","rhs_6b7_1m_flora_ns3","rhs_altyn_novisor_ess"]};
				default{_headgear = ["rhs_6b26_green","rhs_6b26",	"rhs_6b27m_digi","rhs_6b28_green","rhs_6b47","rhs_6b7_1m_emr_ess","rhs_6b28_ess","rhs_6b28_flora_ess"]};
			};
		};
		case "NATO":
		{
			switch (_type) do
			{
				case "Diver":{_headgear = ["objNull"]};
				case "Crew":{_headgear = ["rhsusf_ihadss"]};
				case "HeliPilot":{_headgear = ["rhsusf_hgu56p_visor_mask_skull"]};
				case "HeliCrew":{_headgear = ["rhsusf_hgu56p_visor_mask_green"]};
				case "JetPilot":{_headgear = ["RHS_jetpilot_usaf"]};
				case "CTRG":{_headgear = ["rhsusf_opscore_fg","rhsusf_opscore_mc_cover","rhsusf_opscore_rg_cover_pelt","rhsusf_opscore_coy_cover_pelt"]};
				default{_headgear = ["rhsusf_ach_bare_wood_headset_ess","rhsusf_ach_helmet_M81","rhsusf_ach_helmet_headset_ess_ocp","rhsusf_ach_helmet_camo_ocp","rhsusf_lwh_helmet_marpatwd","H_HelmetB_grass","rhsusf_mich_bare_alt","rhsusf_mich_bare_semi","rhsusf_mich_bare_norotos_arc_alt_semi","rhsusf_mich_helmet_marpatwd","rhsusf_mich_helmet_marpatwd_norotos_arc_headset","rhs_Booniehat_m81","rhs_booniehat2_marpatwd"]};
			};
		};
		case "AAF":
		{
			switch (_type) do
			{
				case "Diver":{_headgear = ["objNull"]};
				case "Crew":{_headgear = ["H_HelmetCrew_I"]};
				case "HeliPilot":{_headgear = ["H_PilotHelmetHeli_I"]};
				case "HeliCrew":{_headgear = ["H_CrewHelmetHeli_I"]};
				case "JetPilot":{_headgear = ["H_PilotHelmetFighter_I"]};
				default{_headgear = ["rhsgref_6b27m_ttsko_digi", "rhsgref_6b27m_ttsko_forest","rhsgref_helmet_pasgt_olive","rhssaf_helmet_m97_woodland","rhssaf_helmet_m97_olive_nocamo"]};
			};
		};
		case "GEN":
		{
			_headgear = ["H_Beret_gen_F","H_MilCap_gen_F","H_PASGT_basic_blue_F","H_PASGT_basic_black_F"];
		};
		case "SYN":
		{
			_headgear = ["rhsgref_helmet_M1_liner","rhsgref_helmet_M1_bare","rhsgref_helmet_M1_painted","H_Bandanna_gry","H_Bandanna_sand","H_Bandanna_surfer","H_Bandanna_surfer_blk","H_Bandanna_cbr","H_Bandanna_gry","H_Bandanna_khk","H_Bandanna_sgg","H_BandMask_blk","H_BandMask_demon","H_BandMask_khk","H_BandMask_reaper","H_PASGT_basic_blue_F","H_PASGT_basic_olive_F","H_PASGT_neckprot_blue_press_F","H_PASGT_basic_white_F","H_Watchcap_blk","H_Watchcap_sgg","H_Watchcap_cbr","H_Watchcap_camo","H_Watchcap_khk","H_TurbanO_blk","H_WirelessEarpiece_F","H_Cap_grn_BI","H_Cap_grn_BI","H_Cap_blk","H_Cap_blu","H_Cap_blk_CMMG","H_Cap_blk_CMMG","H_Cap_grn","H_Cap_blk_ION","H_Cap_blk_ION","H_Cap_oli","H_Cap_oli_hs","H_Cap_red","H_Cap_surfer","H_Cap_tan","H_Construction_earprot_black_F","H_Construction_headset_black_F","H_Construction_basic_black_F","H_Construction_earprot_orange_F","H_Construction_headset_orange_F","H_Construction_basic_orange_F","H_Construction_earprot_red_F","H_Construction_headset_red_F","H_Construction_basic_red_F","H_Construction_earprot_vrana_F","H_Construction_headset_vrana_F","H_Construction_basic_vrana_F","H_Construction_earprot_white_F","H_Construction_headset_white_F","H_Construction_basic_white_F","H_Construction_earprot_yellow_F","H_Construction_headset_yellow_F","H_Construction_basic_yellow_F","H_EarProtectors_black_F","H_EarProtectors_orange_F","H_EarProtectors_red_F","H_EarProtectors_white_F","H_EarProtectors_yellow_F","H_Hat_blue","H_Hat_brown","H_Hat_camo","H_Hat_checker","H_Hat_grey","H_Hat_tan","H_HeadBandage_bloody_F","H_HeadBandage_clean_F","H_HeadBandage_stained_F","H_HeadSet_black_F","H_HeadSet_orange_F","H_HeadSet_red_F","H_HeadSet_white_F","H_HeadSet_yellow_F","H_Cap_headphones","H_Hat_Safari_olive_F","H_Hat_Safari_sand_F","H_ShemagOpen_tan","H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_khk","H_Shemag_khk","H_Shemag_olive","H_Shemag_tan"];
		};
		case "IDAP":
		{
			_headgear = ["H_Cap_Black_IDAP_F","H_Cap_Orange_IDAP_F","H_Cap_White_IDAP_F","H_PASGT_basic_blue_F","H_PASGT_basic_olive_F","H_PASGT_neckprot_blue_press_F","H_PASGT_basic_white_F"];
		};
	};
//Face Items
	switch (_type) do
	{
		case "CTRG": {_faceItems = ["G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F","G_Balaclava_TI_tna_F","G_Balaclava_TI_G_tna_F"]};
		default {_faceItems = ["G_Aviator","G_Combat","G_Lowprofile","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","G_Spectacles","G_Sport_Red","G_Sport_Blackyellow","G_Sport_BlackWhite","G_Sport_Checkered","G_Sport_Blackred","G_Sport_Greenblack","G_Squares_Tinted","G_Squares","G_Tactical_Clear","G_Tactical_Clear","G_Tactical_Black","G_Spectacles_Tinted"]};
	};
//Soldier Skill and Attributes
	Switch (_type) do
	{
		case "Sniper":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "SERGEANT"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 1; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		case "Diver":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "LIEUTENANT"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 0.1; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		case "HeliCrew":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "SERGEANT"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 1; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		case "Helipilot":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "CAPTAIN"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 1; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		case "JetPilot":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "MAJOR"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 1; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		case "CTRG":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "CAPTAIN"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 1; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		case "Viper":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "CAPTAIN"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 1; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		case "Commander":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "LIEUTENANT"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 0.6; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		case "AT":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "LIEUTENANT"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 0.7; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		case "AA":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "LIEUTENANT"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 0.5; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		case "Crew":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "LIEUTENANT"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 0.1; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		case "Medic":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "LIEUTENANT"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 0.1; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		case "Grenedier":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "LIEUTENANT"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 0.4; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		case "Marksman":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "LIEUTENANT"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 0.8; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		case "SAW":
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "LIEUTENANT"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 0.2; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 1; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 1; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 1; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 1; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 1; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 1; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
		default
		{
			_allowFleeing = 1; // can the unit flee? 0 = no 1 = yes
			_rank = "PRIVATE"; //  PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR or COLONEL
			//Soldier Skills are set from 0 to 1; 
			_Accuracy = 0.3; //Soldier accuracy;
			_Courage = 1; //Affects unit's subordinates' morale (Higher value = more courage)
			_aimingShake = 0.7; //Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
			_aimingSpeed = 0.4; //Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
			_spotDistance = 0.5; //Affects the AI ability to spot targets within it's visual or audible range (Higher value = more likely to spot)
			_spotTime = 0.5; //Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)
			_reloadSpeed = 0.4; //Affects the delay between switching or reloading a weapon (Higher value = less delay)
			_commanding = 0.2; //Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)	
		};
	};
//Spawn the Soldier
	private _soldier = _group createUnit [_soldierTypes, _position, [], 20, "NONE"];
//Give soldier a uniform
	_soldier forceaddUniform (selectrandom _uniformTypes);
//Give Soldier a Vest
	_soldier addVest (selectrandom _vestTypes);
//Maybe give the soldier a backpack
	_soldier addBackpack (selectrandom _BackpackTypes);
//Maybe Give the Soldier a weapon
	[_soldier,selectrandom  _weaponTypesRifle, 6] call BIS_fnc_addWeapon;
//Maybe give the soldier a Launcher
	[_soldier,selectrandom  _weaponTypesLauncher, 3] call BIS_fnc_addWeapon;
//Maybe give the soldier a pistol
	[_soldier,selectrandom  _weaponTypesPistor, 2] call BIS_fnc_addWeapon;
//Maybe give the soldier some gun bling
	_soldier addPrimaryWeaponItem (selectrandom _weaponSight);
	_soldier addPrimaryWeaponItem (selectrandom _weaponsRail);
	_soldier addPrimaryWeaponItem (selectrandom _weaponsBipod);
	_soldier addPrimaryWeaponItem (selectrandom _weaponsSuppressor);
//Give Grenedier ammo
	for "_i" from 1 to 5 do 
	{
		private _glaunch = selectrandom _grenadeType;
		_soldier addItem _glaunch;
	};
//Maybe give the soldier some binoculars
	_bino = selectrandom _BinocularTypes;
	//_soldier additem _bino;
	_soldier linkitem _bino;
//Maybe give the soldier some NV Goggles
	_nvs = selectrandom _NVGogglesTypes;
	//_soldier additem _bino;
	_soldier linkitem _nvs;
//Give the soldier a hat
	_soldier addHeadgear (selectrandom _headgear);
//Maybe give the soldier some glasses
	_faceItem = selectrandom _faceItems;
	//_soldier additem _faceItem;
	_soldier linkItem _faceItem;
//Give the soldier some stuff
	for "_i" from 1 to 2 do
	{
		private _item = selectrandom _itemsList;
		_soldier additem _item;
	};
//Maybe give the soldier a GPS or UAV Terminal
	_terminal = selectrandom _TerminalTypes;
	//_soldier additem _terminal;
	_soldier linkitem _terminal;
//Set the Soldiers rank and Skills
	_soldier setRank _rank;
	_soldier allowFleeing 0;
	_soldier setSkill ["aimingAccuracy", _Accuracy];
	_soldier setSkill ["courage", _Courage];
	_soldier setskill ["aimingShake", _aimingShake];
	_soldier setskill ["aimingSpeed", _aimingSpeed];
	_soldier setskill ["spotDistance", _spotDistance];
	_soldier setskill ["spotTime", _spotTime];
	_soldier setskill ["commanding", _commanding];
	_soldier setskill ["reloadSpeed", _reloadSpeed];
//Finish up
	_soldier triggerDynamicSimulation true;
	_soldier addEventHandler ["Killed", server_playerDied];
	_soldier
