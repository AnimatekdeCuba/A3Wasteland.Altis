// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_APC.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev, GMG_Monkey
//	@file Created: 08/12/2012 15:19

// if (!isServer && hasinterface) exitWith {};
#include "NATOMissionDefines.sqf";
private _vehicleClass = "";
_setupVars =
{
_vehicleClass = selectrandom
	[
		//Arty
		"rhsusf_m109_usarmy",
		"rhsusf_M142_usarmy_WD",
		//AA
		"RHS_M6_wd",
		//MBT
		"rhsusf_m1a1aimwd_usarmy",
		"rhsusf_m1a2sep1tuskiiwd_usarmy",
		//APCs
		"rhsusf_m113_usarmy",
		"rhsusf_m113_usarmy_MK19",
		"RHS_M2A2_BUSKI_WD",
		"RHS_M2A3_BUSKIII_wd",
		//LAV
		"rhsusf_M1220_M153_M2_usarmy_wd",
		"rhsusf_M1230_MK19_usarmy_wd",
		"rhsusf_CGRCAT1A2_M2_usmc_wd",
		"rhsusf_CGRCAT1A2_Mk19_usmc_wd",
		"rhsusf_m1045_w",
		//UAV
		"B_UAV_02_dynamicLoadout_F",
		"B_UAV_05_F",
		"B_T_UAV_03_dynamicLoadout_F",
		//Jets
		"RHS_A10",
		"rhs_l159_cdf_b_CDF",
		"rhsgref_cdf_b_mig29s",
		//Helis
		"RHS_AH64D_wd",
		"RHS_AH1Z",
		"RHS_UH1Y",
		"rhs_uh1h_hidf_gunship",
		"rhs_uh1h_hidf",
		"RHS_UH60M_d",
		"RHS_MELB_AH6M",
		//VTOLs
		/*"B_T_VTOL_01_armed_F",
		"B_T_VTOL_01_infantry_F",
		"B_T_VTOL_01_vehicle_F",*/
		//UGV
		"B_UGV_01_rcws_F"
	];
	_missionType = switch (true) do
	{
		case ({_vehicleClass isKindOf _x} count ["RHS_M6_wd"] > 0): 																			{ "NATO Anti Aircraft Vehicle" };
		case ({_vehicleClass isKindOf _x} count [
		"rhsusf_m113_usarmy",
		"rhsusf_m113_usarmy_MK19",
		"RHS_M2A2_BUSKI_WD",
		"RHS_M2A3_BUSKIII_wd"] > 0):												{ "NATO Armored Personnel Carrier" };
		case ({_vehicleClass isKindOf _x} count ["rhsusf_m1a1aimwd_usarmy",
		"rhsusf_m1a2sep1tuskiiwd_usarmy"] > 0):																						{ "NATO Main Battle Tank" };
		case ({_vehicleClass isKindOf _x} count ["RHS_A10",
		"rhs_l159_cdf_b_CDF",
		"rhsgref_cdf_b_mig29s"] > 0): 									{ "NATO Jet" };
		case ({_vehicleClass isKindOf _x} count ["B_UAV_02_dynamicLoadout_F","B_UAV_05_F","B_T_UAV_03_dynamicLoadout_F"] > 0):                                                      { "NATO Unmanned Air Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["rhsusf_M1220_M153_M2_usarmy_wd",
		"rhsusf_M1230_MK19_usarmy_wd",
		"rhsusf_CGRCAT1A2_M2_usmc_wd",
		"rhsusf_CGRCAT1A2_Mk19_usmc_wd",
		"rhsusf_m1045_w"] > 0):																							{ "NATO Light Armored Vehicle" };
		case ({_vehicleClass isKindOf _x} count 
		[
		"RHS_AH64D_wd",
		"RHS_AH1Z",
		"RHS_UH1Y",
		"rhs_uh1h_hidf_gunship",
		"rhs_uh1h_hidf",
		"RHS_UH60M_d",
		"RHS_MELB_AH6M"
		] > 0):																																										{ "NATO Helicopter" };
		//case ({_vehicleClass isKindOf _x} count ["B_T_VTOL_01_armed_F","B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F"] > 0):														{ "NATO VTOL" };
		case ({_vehicleClass isKindOf _x} count ["B_UGV_01_rcws_F"] > 0):																											{ "NATO Unmanned Ground Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["rhsusf_m109_usarmy",
		"rhsusf_M142_usarmy_WD"] > 0):																							{ "NATO Artillary" };
		default 																																									{ "NATO Vehicle" };
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

_this call mission_NATOVehicleCapture;
