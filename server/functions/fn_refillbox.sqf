// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev, GMG_Monkey
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
switch (_boxType) do
{
	//Mission Crates
		//Tier 1 crates
			case "Mission_PMPistol":
			{
				_boxItems =
				[
					["wep", "hgun_Pistol_01_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)]
				];
			};
			case "Mission_P07Pistol":
			{
				_boxItems =
				[
					["wep", ["hgun_P07_F","hgun_P07_khk_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)]
				];
			};
			case "Mission_ZuberPistol":
			{
				_boxItems =
				[
					["wep", "hgun_Pistol_heavy_02_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)]
				];
			};
			case "Mission_RookPistol":
			{
				_boxItems =
				[
					["wep", "hgun_Rook40_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)]
				];
			};
			case "Mission_PDW":
			{
				_boxItems =
				[
					["wep", "hgun_PDW2000_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_aco_smg","optic_ACO_grn_smg"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_45Pistol":
			{
				_boxItems =
				[
					["wep", "hgun_Pistol_heavy_01_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", "optic_MRD", RANDOM_BETWEEN(0,4)],
					["itm", "muzzle_snds_acp", RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_ZuberPistol":
			{
				_boxItems =
				[
					["wep", "hgun_Pistol_heavy_02_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", "optic_Yorris", RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_Sting":
			{
				_boxItems =
				[
					["wep", "SMG_02_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_aco_smg","optic_ACO_grn_smg"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_Vermin":
			{
				_boxItems =
				[
					["wep", "SMG_01_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_aco_smg","optic_ACO_grn_smg"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_Protector":
			{
				_boxItems =
				[
					["wep", "SMG_05_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_aco_smg","optic_ACO_grn_smg"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_SDAR":
			{
				_boxItems =
				[
					["wep", "arifle_SDAR_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)]
				];
			};
			case "Mission_Mk20":
			{
				_boxItems =
				[
					["wep", ["arifle_Mk20C_plain_F","arifle_Mk20C_F","arifle_Mk20_plain_F","arifle_Mk20_F","arifle_Mk20_GL_plain_F","arifle_Mk20_GL_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_Aco","optic_Aco_grn","optic_Holosight_smg","optic_Holosight","optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_TRG":
			{
				_boxItems =
				[
					["wep", ["arifle_TRG20_F","arifle_TRG21_F","arifle_TRG21_GL_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_Aco","optic_Aco_grn","optic_Holosight_smg","optic_Holosight","optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_Katiba":
			{
				_boxItems =
				[
					["wep", ["arifle_Katiba_C_F","arifle_Katiba_F","arifle_Katiba_GL_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_Aco","optic_Aco_grn","optic_Holosight_smg","optic_Holosight","optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_MX":
			{
				_boxItems =
				[
					["wep", ["arifle_MXC_F","arifle_MXC_Black_F","arifle_MXC_khk_F","arifle_MX_F","arifle_MX_Black_F","arifle_MX_khk_F","arifle_MX_GL_F","arifle_MX_GL_Black_F","arifle_MX_GL_khk_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_Aco","optic_Aco_grn","optic_Holosight_smg","optic_Holosight","optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_SPAR16":
			{
				_boxItems =
				[
					["wep", ["arifle_SPAR_01_blk_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_snd_F","arifle_SPAR_01_GL_blk_F","arifle_SPAR_01_GL_khk_F","arifle_SPAR_01_GL_snd_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_Aco","optic_Aco_grn","optic_Holosight_smg","optic_Holosight","optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_CAR95":
			{
				_boxItems =
				[
					["wep", ["arifle_CTAR_blk_F","arifle_CTAR_hex_F","arifle_CTAR_ghex_F","arifle_CTAR_GL_blk_F","arifle_CTAR_GL_hex_F","arifle_CTAR_GL_ghex_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_Aco","optic_Aco_grn","optic_Holosight_smg","optic_Holosight","optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_MXSW":
			{
				_boxItems =
				[
					["wep", ["arifle_MX_SW_F","arifle_MX_SW_Black_F","arifle_MX_SW_khk_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_Aco","optic_Aco_grn","optic_Holosight_smg","optic_Holosight","optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_Mk200":
			{
				_boxItems =
				[
					["wep", "LMG_Mk200_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_Aco","optic_Aco_grn","optic_Holosight_smg","optic_Holosight","optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_SPAR16S":
			{
				_boxItems =
				[
					["wep", ["arifle_SPAR_02_blk_F","arifle_SPAR_02_khk_F","arifle_SPAR_02_snd_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_Aco","optic_Aco_grn","optic_Holosight_smg","optic_Holosight","optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_CAR951":
			{
				_boxItems =
				[
					["wep", ["arifle_CTARS_blk_F","arifle_CTARS_hex_F","arifle_CTARS_ghex_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_Aco","optic_Aco_grn","optic_Holosight_smg","optic_Holosight","optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_LIM":
			{
				_boxItems =
				[
					["wep", "LMG_03_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_Aco","optic_Aco_grn","optic_Holosight_smg","optic_Holosight","optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Medical":
			{
				_boxItems =
				[
					// Item type, Item class(es), # of items, # of magazines per weapon
					//["itm", "Medikit", RANDOM_BETWEEN(10,40)],
					//["itm", "FirstAidKit", RANDOM_BETWEEN(10,40)]
				];
			};
			case "mission_Field_Engineer": 
			{	
				_boxItems = 
				[
					["itm", "Toolkit", RANDOM_BETWEEN(10,40)],
					["itm", "MineDetector", RANDOM_BETWEEN(10,40)]
				];
			};
			case "Mission_Ammo_45":
			{
				_boxItems =
				[
					["mag", ["6Rnd_45ACP_Cylinder","9Rnd_45ACP_Mag","11Rnd_45ACP_Mag","30Rnd_45ACP_MAG_SMG_01","30Rnd_45ACP_Mag_SMG_01_tracer_green"], RANDOM_BETWEEN(20,40)]
				];
			};
			case "Mission_Ammo_545":
			{
				_boxItems =
				[
					["mag", ["30Rnd_545x39_Mag_F","30Rnd_545x39_Mag_Tracer_F","30Rnd_545x39_Mag_Tracer_Green_F"], RANDOM_BETWEEN(20,40)]
				];
			};
			case "Mission_Ammo_556":
			{
				_boxItems =
				[
					["mag", ["20Rnd_556x45_UW_mag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Red","150Rnd_556x45_Drum_Mag_F","150Rnd_556x45_Drum_Mag_Tracer_F","200Rnd_556x45_Box_F","200Rnd_556x45_Box_Tracer_F","200Rnd_556x45_Box_Tracer_Red_F"], RANDOM_BETWEEN(20,40)]
				];
			};
			case "Mission_Ammo_58":
			{
				_boxItems =
				[
					["mag", ["30Rnd_580x42_Mag_F","30Rnd_580x42_Mag_Tracer_F","100Rnd_580x42_Mag_F","100Rnd_580x42_Mag_Tracer_F"], RANDOM_BETWEEN(20,40)]
				];
			};
			case "Mission_Ammo_65":
			{
				_boxItems =
				[
					["mag", ["20Rnd_650x39_Cased_Mag_F","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer","100Rnd_65x39_caseless_mag","100Rnd_65x39_caseless_mag_Tracer","200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer"], RANDOM_BETWEEN(20,40)]
				];
			};
			case "Mission_Ammo_762":
			{
				_boxItems =
				[
					["mag", ["10Rnd_762x54_Mag","20Rnd_762x51_Mag","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Ma","150Rnd_762x54_Box","150Rnd_762x54_Box_Tracer"], RANDOM_BETWEEN(20,40)]
				];
			};
			case "Mission_Ammo_338":
			{
				_boxItems =
				[
					["mag", ["10Rnd_338_Mag","130Rnd_338_Mag"], RANDOM_BETWEEN(20,40)]
				];
			};
			case "Mission_Ammo_93":
			{
				_boxItems =
				[
					["mag", ["10Rnd_93x64_DMR_05_Mag","150Rnd_93x64_Mag"], RANDOM_BETWEEN(20,40)]
				];
			};
			case "Mission_Ammo_408":
			{
				_boxItems =
				[
					["mag", "7Rnd_408_Mag", RANDOM_BETWEEN(20,40)]
				];
			};
			case "Mission_Ammo_127":
			{
				_boxItems =
				[
					["mag", ["5Rnd_127x108_Mag","5Rnd_127x108_APDS_Mag","10Rnd_127x54_Mag"], RANDOM_BETWEEN(20,40)]
				];
			};
			case "Mission_Ammo_50":
			{
				_boxItems =
				[
					["mag", "10Rnd_50BW_Mag_F", RANDOM_BETWEEN(20,40)]
				];
			};
			case "Mission_Ammo_3GL":
			{
				_boxItems =
				[
					["mag", ["10Rnd_3Rnd_Smoke_Grenade_shell9x21_Mag","3Rnd_SmokePurple_Grenade_shell","3Rnd_SmokeBlue_Grenade_shell","3Rnd_SmokeGreen_Grenade_shell","3Rnd_SmokeYellow_Grenade_shell","3Rnd_SmokeOrange_Grenade_shell","3Rnd_SmokeRed_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_UGL_FlareWhite_F","3Rnd_UGL_FlareGreen_F","3Rnd_UGL_FlareYellow_F","3Rnd_UGL_FlareRed_F","3Rnd_UGL_FlareCIR_F"], RANDOM_BETWEEN(20,40)]
				];
			};
			case "Mission_Ammo_UGL":
			{
				_boxItems =
				[
					["mag", ["1Rnd_HE_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareYellow_F","UGL_FlareRed_F","UGL_FlareCIR_F"], RANDOM_BETWEEN(20,40)]
				];
			};
		//Tier 2 crates
			case "Mission_AK":
			{
				_boxItems =
				[
					["wep", ["arifle_AKS_F","arifle_AKM_F","arifle_AK12_F","arifle_AK12_GL_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_Aco","optic_Aco_grn","optic_Holosight_smg","optic_Holosight","optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_MXM":
			{
				_boxItems =
				[
					["wep", ["arifle_MXM_F","arifle_MXM_Black_F","arifle_MXM_khk_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_Mk18":
			{
				_boxItems =
				[
					["wep", "srifle_EBR_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_CMR76":
			{
				_boxItems =
				[
					["wep", ["srifle_DMR_07_blk_F","srifle_DMR_07_hex_F","srifle_DMR_07_ghex_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_SPAR17":
			{
				_boxItems =
				[
					["wep", ["arifle_SPAR_03_blk_F","arifle_SPAR_03_khk_F","arifle_SPAR_03_snd_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_MK14":
			{
				_boxItems =
				[
					["wep", ["srifle_DMR_06_camo_F","srifle_DMR_06_olive_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_MK1":
			{
				_boxItems =
				[
					["wep", ["srifle_DMR_03_F","srifle_DMR_03_multicam_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F","srifle_DMR_03_woodland_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_MAR10":
			{
				_boxItems =
				[
					["wep", ["srifle_DMR_02_F","srifle_DMR_02_camo_F","srifle_DMR_02_sniper_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_Syrus":
			{
				_boxItems =
				[
					["wep", ["srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_f"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_M320":
			{
				_boxItems =
				[
					["wep", ["srifle_LRR_LRPS_F","srifle_LRR_camo_LRPS_F","srifle_LRR_tna_LRPS_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_Lynx":
			{
				_boxItems =
				[
					["wep", ["srifle_GM6_LRPS_F","srifle_GM6_camo_LRPS_F","srifle_GM6_ghex_LRPS_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_ASP":
			{
				_boxItems =
				[
					["wep", ["srifle_DMR_04_F","srifle_DMR_04_tan_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_Zafir":
			{
				_boxItems =
				[
					["wep", "LMG_Zafir_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_SPMG":
			{
				_boxItems =
				[
					["wep", ["MMG_02_sand_F","MMG_02_camo_F","MMG_02_black_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_NAVID":
			{
				_boxItems =
				[
					["wep", ["MMG_01_tan_F","MMG_01_hex_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
					["itm", ["optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS"], RANDOM_BETWEEN(0,4)]
				];
			};
			case "Mission_RPG7":
			{
				_boxItems =
				[
					["wep", "launch_RPG7_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(5,10)]
				];
			};
			case "Mission_RPG42":
			{
				_boxItems =
				[
					["wep", ["launch_RPG32_F","launch_RPG32_ghex_F"], RANDOM_BETWEEN(2,4),0],
					["mag", ["RPG32_F","RPG32_HE_F"], RANDOM_BETWEEN(5,10)]
				];
			};
			case "Mission_PCML":
			{
				_boxItems =
				[
					["wep", "launch_NLAW_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)]
				];
			};
			case "Mission_AAF_TitanAA":
			{
				_boxItems =
				[
					["wep", "launch_I_Titan_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)]
				];
			};
			case "Mission_AAF_TitanAT":
			{
				_boxItems =
				[
					["wep", "launch_I_Titan_short_F", RANDOM_BETWEEN(1,2), 0],
					["mag", ["Titan_AT","Titan_AP"], RANDOM_BETWEEN(2,4)]
				];
			};
			case "Mission_NATO_TitanAA":
			{
				_boxItems =
				[
					["wep", ["launch_Titan_F","launch_B_Titan_tna_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)]
				];
			};
			case "Mission_NATO_TitanAT":
			{
				_boxItems =
				[
					["wep", ["launch_Titan_short_F","launch_B_Titan_short_tna_F"], RANDOM_BETWEEN(1,2), 0],
					["mag", ["Titan_AT","Titan_AP"], RANDOM_BETWEEN(2,4)]
				];
			};
			case "Mission_CSAT_TitanAA":
			{
				_boxItems =
				[
					["wep", ["launch_O_Titan_F","launch_O_Titan_ghex_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)]
				];
			};
			case "Mission_CSAT_TitanAT":
			{
				_boxItems =
				[
					["wep", ["launch_O_Titan_short_F","launch_O_Titan_short_ghex_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,4)]
				];
			};
			case "Mission_Grenades":
			{
				_boxItems =
				[
					["mag", ["MiniGrenade","HandGrenade"], RANDOM_BETWEEN(10,20)]
				];
			};
			case "Mission_APERS":
			{
				_boxItems =
				[
					["mag", ["APERSBoundingMine_Range_Mag","APERSMine_Range_Mag","APERSTripMine_Wire_Mag"], RANDOM_BETWEEN(10,20)]
				];
			};
			case "Mission_ATMine":
			{
				_boxItems =
				[
					["mag", "ATMine_Range_Mag", RANDOM_BETWEEN(10,20)]
				];
			};
			case "Mission_ExpCharge":
			{
				_boxItems =
				[
					["mag", "DemoCharge_Remote_Mag", RANDOM_BETWEEN(10,20)]
				];
			};
			case "Mission_Claymore":
			{
				_boxItems =
				[
					["mag", "ClaymoreDirectionalMine_Remote_Mag", RANDOM_BETWEEN(10,20)]
				];
			};
			case "Mission_ExpSatch":
			{
				_boxItems =
				[
					["mag", "SatchelCharge_Remote_Mag", RANDOM_BETWEEN(10,20)]
				];
			};
			case "Mission_Slam":
			{
				_boxItems =
				[
					["mag", "SLAMDirectionalMine_Wire_Mag", RANDOM_BETWEEN(10,20)]
				];
			};
			case "Mission_IDAP_APERSDispencer":
			{
				_boxItems =
				[
					["mag", "APERSMineDispenser_Mag", RANDOM_BETWEEN(10,20)]
				];
			};
			case "Mission_SYN_IED":
			{
				_boxItems =
				[
					["mag", ["IEDLandBig_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDLandSmall_Remote_Mag","IEDUrbanSmall_Remote_Mag"], RANDOM_BETWEEN(10,20)]
				];
			};
			case "Mission_WepEquipment":
			{
				_boxItems =
				[
					["itm", ["muzzle_snds_L","muzzle_snds_acp","muzzle_snds_M","muzzle_snds_m_khk_F","muzzle_snds_m_snd_F","muzzle_snds_58_blk_F","muzzle_snds_58_wdm_F","muzzle_snds_H","muzzle_snds_H_khk_F","muzzle_snds_H_snd_F","muzzle_snds_H_MG","muzzle_snds_H_MG_blk_F","muzzle_snds_H_MG_khk_F","muzzle_snds_65_TI_blk_F","muzzle_snds_65_TI_hex_F","muzzle_snds_65_TI_ghex_F","muzzle_snds_B","muzzle_snds_B_khk_F","muzzle_snds_B_snd_F","muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand","muzzle_snds_93mmg","muzzle_snds_93mmg_tan","bipod_01_F_blk","bipod_02_F_blk","bipod_03_F_blk","bipod_01_F_mtp","bipod_02_F_hex","bipod_03_F_oli","bipod_01_F_snd","bipod_02_F_tan","bipod_01_F_khk","acc_flashlight","acc_flashlight_pistol","acc_pointer_IR","optic_Yorris","optic_MRD","optic_aco_smg","optic_ACO_grn_smg","optic_Aco","optic_Aco_grn","optic_Holosight_smg","optic_Holosight","optic_MRCO","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Arco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_Hamr","optic_Hamr_khk_F","optic_SOS","optic_SOS_khk_F","optic_DMS","optic_DMS_ghex_F","optic_KHS_old","optic_KHS_blk","optic_KHS_hex","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_LRPS","optic_LRPS_ghex_F","optic_LRPS_tna_F","optic_NVS","optic_tws","optic_tws_mg","optic_Nightstalker"], RANDOM_BETWEEN(20,40)]
				];
			};
			case "Mission_Ammo_9mm":
			{
				_boxItems =
				[
					["mag", ["10Rnd_9x21_Mag","16Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Mag_SMG_02"], RANDOM_BETWEEN(20,40)]
				];
			};
			case "Mission_IDAP_MedDrone":
			{
				_boxItems =
				[
					["bac", ["C_UAV_06_medical_backpack_F","C_IDAP_UAV_06_medical_backpack_F"], RANDOM_BETWEEN(1,4)]
				];
			};
			case "Mission_IDAP_DeMineDrone":
			{
				_boxItems =
				[
					["bac", ["C_IDAP_UAV_06_antimine_backpack_F"], RANDOM_BETWEEN(1,4)]
				];
			};
			case "Mission_IDAP_UtilityDrone":
			{
				_boxItems =
				[
					["bac", ["C_UAV_06_backpack_F","C_IDAP_UAV_06_backpack_F"], RANDOM_BETWEEN(1,4)]
				];
			};
			case "Mission_AAF_MedDrone":
			{
				_boxItems =
				[
					["bac", "I_UAV_06_medical_backpack_F", RANDOM_BETWEEN(1,4)]
				];
			};
			case "Mission_AAF_UtilityDrone":
			{
				_boxItems =
				[
					["bac", "I_UAV_06_backpack_F", RANDOM_BETWEEN(1,4)]
				];
			};
			case "Mission_NATO_MedDrone":
			{
				_boxItems =
				[
					["bac", "B_UAV_06_medical_backpack_F", RANDOM_BETWEEN(1,4)]
				];
			};
			case "Mission_NATO_UtilityDrone":
			{
				_boxItems =
				[
					["bac", "B_UAV_06_backpack_F", RANDOM_BETWEEN(1,4)]
				];
			};
			case "Mission_CSAT_MedDrone":
			{
				_boxItems =
				[
					["bac", "O_UAV_06_medical_backpack_F", RANDOM_BETWEEN(1,4)]
				];
			};
			case "Mission_CSAT_UtilityDrone":
			{
				_boxItems =
				[
					["bac", "O_UAV_06_backpack_F", RANDOM_BETWEEN(1,4)]
				];
			};
			case "Mission_AAF_Darter":
			{
				_boxItems =
				[
					["bac", "I_UAV_06_medical_backpack_F", RANDOM_BETWEEN(1,4)]
				];
			};
			case "Mission_CSAT_Darter":
			{
				_boxItems =
				[
					["bac", "O_UAV_06_medical_backpack_F", RANDOM_BETWEEN(1,4)]
				];
			};
			case "Mission_NATO_Darter":
			{
				_boxItems =
				[
					["bac", "B_UAV_06_medical_backpack_F", RANDOM_BETWEEN(1,4)]
				];
			};
			case "Mission_IDAP_Darter":
			{
				_boxItems =
				[
					["bac", ["C_UAV_06_medical_backpack_F","C_IDAP_UAV_06_medical_backpack_F"], RANDOM_BETWEEN(1,4)]
				];
			};
		//Tier 3 crates
		case "Diving_Gear_AAF":
			{
				_boxItems =
				[
					// Item type, Item class(es), # of items, # of magazines per weapon
					//Weapons
					["wep", "arifle_SDAR_F", 4, RANDOM_BETWEEN(4,6)],
					//Items
					["itm", "V_RebreatherIA", 4],
					["itm", "G_Diving", 4],
					["itm", "U_I_Wetsuit", 4],
					["itm", ["Chemlight_red", "Chemlight_green", "Chemlight_yellow", "Chemlight_blue"], RANDOM_BETWEEN(6,9)],
					["bac", ["B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_oli"], RANDOM_BETWEEN(3,5)],
					//Mags
					["mag", ["SmokeShell", "SmokeShellRed", "SmokeShellgreen"], RANDOM_BETWEEN(5,9)]
				];
			};
			case "Diving_Gear_NATO":
			{
				_boxItems =
				[
					// Item type, Item class(es), # of items, # of magazines per weapon
					//Weapons
					["wep", "arifle_SDAR_F", 4, RANDOM_BETWEEN(4,6)],
					//Items
					["itm", "V_RebreatherB", 4],
					["itm", "G_Diving", 4],
					["itm", ["U_B_Wetsuit","U_B_Wetsuit","U_B_Wetsuit","U_B_Wetsuit","U_B_survival_uniform"], 4],
					["itm", ["Chemlight_red", "Chemlight_green", "Chemlight_yellow", "Chemlight_blue"], RANDOM_BETWEEN(6,9)],
					["bac", ["B_Carryall_mcamo"], RANDOM_BETWEEN(3,5)],
					//Mags
					["mag", ["SmokeShell", "SmokeShellRed", "SmokeShellgreen"], RANDOM_BETWEEN(5,9)]
				];
			};
			case "Diving_Gear_CSAT":
			{
				_boxItems =
				[
					// Item type, Item class(es), # of items, # of magazines per weapon
					//Weapons
					["wep", "arifle_SDAR_F", 4, RANDOM_BETWEEN(4,6)],
					//Items
					["itm", "V_RebreatherIR", 4],
					["itm", "G_Diving", 4],
					["itm", "U_O_Wetsuit", 4],
					["itm", ["Chemlight_red", "Chemlight_green", "Chemlight_yellow", "Chemlight_blue"], RANDOM_BETWEEN(6,9)],
					["bac", "B_Carryall_oucamo", RANDOM_BETWEEN(3,5)],
					//Mags
					["mag", ["SmokeShell", "SmokeShellRed", "SmokeShellgreen"], RANDOM_BETWEEN(5,9)]

				];
			};
			case "SniperGear_NATO":
			{
				_boxItems = 
				[
					["wep", ["srifle_LRR_LRPS_F","srifle_LRR_camo_LRPS_F","srifle_LRR_tna_LRPS_F"], 4, RANDOM_BETWEEN(1,6)],
					["itm", ["U_B_FullGhillie_ard","U_B_T_FullGhillie_tna_F","U_B_FullGhillie_lsh","U_B_FullGhillie_sard"], 4],
					["bac", ["B_Kitbag_cbr","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","B_TacticalPack_blk","B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_oli","B_Carryall_khk","B_Carryall_cbr","B_Carryall_mcamo","B_Carryall_oli"],4]
				];
			};
			case "SniperGear_CSAT":
			{
				_boxItems = 
				[
					["wep", ["srifle_GM6_LRPS_F","srifle_GM6_camo_LRPS_F","srifle_GM6_ghex_LRPS_F"], 4, RANDOM_BETWEEN(1,6)],
					["itm", ["U_O_FullGhillie_ard","U_O_T_FullGhillie_tna_F","U_O_FullGhillie_lsh","U_O_FullGhillie_sard"], 4],
					["bac", ["B_FieldPack_blk","B_FieldPack_cbr","B_FieldPack_khk","B_FieldPack_oucamo","B_FieldPack_ocamo","B_FieldPack_ghex_F","B_TacticalPack_ocamo","B_Carryall_khk","B_Carryall_cbr","B_Carryall_oli","B_Carryall_oucamo","B_Carryall_ghex_F"],4]
				];
			};
			case "SniperGear_AAF":
			{
				_boxItems = 
				[
					["wep", ["srifle_GM6_LRPS_F","srifle_GM6_camo_LRPS_F","srifle_GM6_ghex_LRPS_F"], 4, RANDOM_BETWEEN(1,6)],
					["itm", ["U_I_FullGhillie_ard","U_I_FullGhillie_lsh","U_I_FullGhillie_sard"], 4],
					["bac", ["B_Kitbag_cbr","B_Kitbag_rgr","B_Kitbag_sgg","B_TacticalPack_blk","B_TacticalPack_rgr","B_TacticalPack_oli","B_Carryall_khk","B_Carryall_cbr","B_Carryall_oli"],4]
				];
			};
			case "Launchers_NATO":
			{
				_boxItems = 
				[
					["wep", ["launch_Titan_short_F","launch_B_Titan_short_tna_F","launch_Titan_F","launch_B_Titan_tna_F"], 4, RANDOM_BETWEEN(2,4)],
					["mag", "Titan_AP", RANDOM_BETWEEN(0,2)],
					["bac", ["B_Kitbag_cbr","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","B_TacticalPack_blk","B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_oli","B_Carryall_khk","B_Carryall_cbr","B_Carryall_mcamo","B_Carryall_oli"],4]
				];			
			};
			case "Launchers_CSAT":
			{
				_boxItems = 
				[
					["wep", ["launch_O_Titan_short_F","launch_O_Titan_short_ghex_F","launch_O_Titan_F","launch_O_Titan_ghex_F"], 4, RANDOM_BETWEEN(2,4)],
					["mag", "Titan_AP", RANDOM_BETWEEN(0,2)],
					["bac", ["B_FieldPack_blk","B_FieldPack_cbr","B_FieldPack_khk","B_FieldPack_oucamo","B_FieldPack_ocamo","B_FieldPack_ghex_F","B_TacticalPack_ocamo","B_Carryall_khk","B_Carryall_cbr","B_Carryall_oli","B_Carryall_oucamo","B_Carryall_ghex_F"],4]
				];			
			};
			case "Launchers_AAF":
			{
				_boxItems = 
				[
					["wep", ["launch_Titan_short_F","launch_I_Titan_short_F","launch_Titan_F","launch_I_Titan_F"], 4, RANDOM_BETWEEN(2,4)],
					["mag", "Titan_AP", RANDOM_BETWEEN(0,2)],
					["bac", ["B_Kitbag_cbr","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","B_TacticalPack_blk","B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_oli","B_Carryall_khk","B_Carryall_cbr","B_Carryall_mcamo","B_Carryall_oli"],4]
				];			
			};
			case "Viper":
			{
				_boxItems = 
				[
					["itm", ["U_O_V_Soldier_Viper_F","U_O_V_Soldier_Viper_hex_F"], 4],
					["bac", ["B_ViperLightHarness_blk_F","B_ViperLightHarness_hex_F","B_ViperLightHarness_ghex_F","B_ViperLightHarness_khk_F","B_ViperLightHarness_oli_F","B_ViperHarness_blk_F","B_ViperHarness_hex_F","B_ViperHarness_ghex_F","B_ViperHarness_khk_F","B_ViperHarness_oli_F"], 4],
					["itm", ["H_HelmetO_ViperSP_ghex_F","H_HelmetO_ViperSP_hex_F"], 4]
				];
			};
			case "CTRG":
			{
				_boxItems = 
				[
					["itm", "U_B_CTRG_Soldier_F", 4],
					["itm", ["G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F","G_Balaclava_TI_tna_F","G_Balaclava_TI_G_tna_F"], 4],
					["itm", "H_HelmetB_TI_tna_F", 4]
				];
			};
			case "VehicleAmmo":
			{
				_boxItems = [["itm", "objNull", 0]];
			};
			case "Container":
			{
				_boxItems = [["itm", "objNull", 0]];
			};
	//Airdrop Crates
		case "airdrop_Rifles":
		{
			_boxItems =
			[
				// Item type, Item class(es), # of items, # of magazines per weapon
				//weapons
				["wep", ["arifle_MXC_F", "arifle_MXC_Black_F", "arifle_MX_F", "arifle_MX_Black_F", "arifle_MX_GL_F", "arifle_MX_GL_Black_F"], 2,6],
				["wep", ["arifle_Mk20C_plain_F", "arifle_Mk20C_F", "arifle_Mk20_plain_F", "arifle_Mk20_F", "arifle_Mk20_GL_plain_F", "arifle_Mk20_GL_F"], 2,6],
				["wep", ["arifle_TRG20_F", "arifle_TRG21_F", "arifle_TRG21_GL_F"], 2,6],
				["wep", ["arifle_Katiba_C_F", "arifle_Katiba_F", "arifle_Katiba_GL_F"], 2,6],
				//items
				["itm", ["bipod_01_F_blk", "bipod_02_F_hex"], 3]
			];
		};
		case "airdrop_LMGs":
		{
			_boxItems =
			[
				// Item type, Item class(es), # of items, # of magazines per weapon
				//weapons
				["wep", ["MMG_02_black_F", "MMG_01_hex_F"], 2,5],
				["wep", ["arifle_MX_SW_F", "arifle_MX_SW_Black_F"], 2,5],
				["wep", "LMG_Mk200_F", 2,5],
				["wep", "LMG_Mk200_F", 2,5],
				["wep", "LMG_Zafir_F", 2,5],
				["wep", ["MMG_01_tan_F", "MMG_01_hex_F"], 2,5],
				//items
				["itm", ["bipod_01_F_blk", "bipod_02_F_hex"], 2]
			];
		};
		case "airdrop_Snipers":
		{
			_boxItems =
			[
				// Item type, Item class(es), # of items, # of magazines per weapon
				//weapons
				["wep", ["srifle_GM6_LRPS_F", "srifle_GM6_camo_LRPS_F"], 2,0],
				["wep", ["srifle_LRR_LRPS_F", "srifle_LRR_camo_LRPS_F"], 2,10],
				["wep", "Laserdesignator", 4],
				//Mags
				["mag", "5Rnd_127x108_APDS_Mag", 20],
				//Items
				["itm", "optic_tws", 4]
			];
		};
		case "airdrop_Launchers":
		{
			_boxItems =
			[
				// Item type, Item class(es), # of items, # of magazines per weapon
				//Weapons
				["wep", "launch_RPG32_F", 2,4],
				["wep", "launch_NLAW_F", 2,4],
				["wep", "launch_Titan_short_F", 2,4],
				["wep", "launch_Titan_F", 2,4],
				//Mags
				["mag", "RPG32_HE_F", 8],
				["mag", "Titan_AP", 4]
			];
		};
		case "airdrop_Medical":
		{
			_boxItems =
			[
				// Item type, Item class(es), # of items, # of magazines per weapon
				//["itm", "Medikit", 30],
				//["itm", "FirstAidKit", 40]
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
				["itm", ["B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_oli", "B_Carryall_mcamo"], 2]
			];
		};
		case "airdrop_Field_Engineer": 
		{	
			_boxItems = 
			[
				["itm", "Toolkit", 30],
				["itm", "MineDetector", 20]
			];
		};
		default
		{
			_boxItems = 
			[
				["itm", "G_Goggles_VR", 1]
			];
			diag_log format ["failed lootcrate = %1", _boxType]
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
