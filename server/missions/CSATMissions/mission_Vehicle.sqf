// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_APC.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev, GMG_Monkey
//	@file Created: 08/12/2012 15:19

// if (!isServer && hasinterface) exitWith {};
#include "CSATMissionDefines.sqf";
private _vehicleClass = "";
_setupVars =
{
	_vehicleClass = selectrandom
	[
		//Arty
		"RHS_BM21_VDV_01",
		"rhs_2s3_tv",
		//AA
		"rhs_zsu234_aa",
		"RHS_Ural_Zu23_VDV_01",
		//MBT
		"rhs_t80bvk",
		"rhs_t90a_tv",
		//APCs
		"rhs_bmd1p",
		"rhs_bmd1r",
		"rhs_bmd2m",
		"rhs_bmd4m_vdv",
		"rhs_bmp3mera_msv",
		"rhs_bmp2k_vdv",
		"rhs_btr80a_msv",
		//LAV
		"rhsgref_BRDM2_msv",
		"rhsgref_BRDM2_ATGM_msv",
		//UAV
		"O_UAV_02_dynamicLoadout_F",
		"O_T_UAV_04_CAS_F",
		//Jets
		"rhs_mig29sm_vmf",
		"RHS_Su25SM_vvs",
		//Helis
		"RHS_Ka52_vvsc",
		"RHS_Mi24V_vvsc",
		"rhs_mi28n_vvsc",
		"RHS_Mi8AMTSh_vvsc",
		"RHS_Mi8mt_vvsc",
		"RHS_Mi8MTV3_vvsc",
		"RHS_Mi8mt_Cargo_vdv",
		//VTOLs
		/*"O_T_VTOL_02_infantry_dynamicLoadout_F",
		"O_T_VTOL_02_vehicle_dynamicLoadout_F",*/
		//UGV
		"O_UGV_01_rcws_F"
	];
	_missionType = switch (true) do
	{
		case ({_vehicleClass isKindOf _x} count ["rhs_zsu234_aa", "RHS_Ural_Zu23_VDV_01"] > 0): 																			{ "CSAT Anti Aircraft Vehicle" };
		case ({_vehicleClass isKindOf _x} count [
		"rhs_bmd1p",
		"rhs_bmd1r",
		"rhs_bmd2m",
		"rhs_bmd4m_vdv",
		"rhs_bmp3mera_msv",
		"rhs_bmp2k_vdv",
		"rhs_btr80a_msv"] > 0):																		{ "CSAT Armored Personnel Carrier" };
		case ({_vehicleClass isKindOf _x} count ["rhs_t80bvk","rhs_t90a_tv"] > 0):																											{ "CSAT Main Battle Tank" };
		case ({_vehicleClass isKindOf _x} count ["rhs_mig29sm_vmf","RHS_Su25SM_vvs"] > 0): 									{ "CSAT Jet" };
		case ({_vehicleClass isKindOf _x} count ["O_UAV_02_dynamicLoadout_F","O_T_UAV_04_CAS_F"] > 0):                                                          					{ "CSAT Unmanned Air Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["rhsgref_BRDM2_msv","rhsgref_BRDM2_ATGM_msv"] > 0):																							{ "CSAT Light Armored Vehicle" };
		case ({_vehicleClass isKindOf _x} count 
		[
		"RHS_Ka52_vvsc",
		"RHS_Mi24V_vvsc",
		"rhs_mi28n_vvsc",
		"RHS_Mi8AMTSh_vvsc",
		"RHS_Mi8mt_vvsc",
		"RHS_Mi8MTV3_vvsc",
		"RHS_Mi8mt_Cargo_vdv"
		] > 0):																																										{ "CSAT Helicopter" };
		//case ({_vehicleClass isKindOf _x} count ["O_T_VTOL_02_infantry_dynamicLoadout_F","O_T_VTOL_02_vehicle_dynamicLoadout_F"] > 0):												{ "CSAT VTOL" };
		case ({_vehicleClass isKindOf _x} count ["O_UGV_01_rcws_F"] > 0):																											{ "CSAT Unmanned Ground Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["RHS_BM21_VDV_01","rhs_2s3_tv"] > 0):																											{ "CSAT Artillary" };

		default 																																									{ "CSAT Vehicle" };
	};
	If (_vehicleClass iskindof "Air") then
	{
		_locationsArray = JetSpawnMarkers;
	}
	else
	{
		_locationsArray = MissionSpawnMarkers;
	};
};

_this call mission_CSATVehicleCapture;
