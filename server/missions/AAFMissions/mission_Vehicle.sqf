// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_APC.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev, GMG_Monkey
//	@file Created: 08/12/2012 15:19

// if (!isServer && hasinterface) exitWith {};
#include "AAFMissionDefines.sqf";
private _vehicleClass = "";
_setupVars =
{
	_vehicleClass = selectrandom
	[
		//MBT
		"rhsgref_cdf_t72bb_tv",
		"rhsgref_cdf_t80bv_tv",
		//AA
		"rhsgref_cdf_zsu234",
		//APCs
		"rhsgref_cdf_btr70",
		"rhsgref_cdf_bmd1p",
		"rhsgref_cdf_bmd2",
		"rhsgref_cdf_bmp2d",
		//LAV
		"rhsgref_BRDM2",
		"rhsgref_BRDM2_ATGM",
		//UAV
		"I_UAV_02_dynamicLoadout_F",
		//Jets
		"rhs_l159_CDF",
		"rhsgref_cdf_su25",
		"rhssaf_airforce_l_18",
		//Helis
		"rhsgref_cdf_Mi35",
		"rhsgref_mi24g_CAS",
		"rhsgref_cdf_Mi24D"
	];
	_missionType = switch (true) do
	{
		case ({_vehicleClass isKindOf _x} count ["rhsgref_cdf_zsu234"] > 0): 																			{ "AAF Anti Aircraft Vehicle" };
		case (_vehicleClass isKindOf "rhsgref_cdf_btr70"):                                                          														{ "AAF Infantry Fighting Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["rhsgref_cdf_bmd1p", "rhsgref_cdf_bmd2", "rhsgref_cdf_bmp2d"] > 0):																													{ "AAF Armored Personnel Carrier" };
		case ({_vehicleClass isKindOf _x} count ["rhsgref_cdf_t72bb_tv", "rhsgref_cdf_t80bv_tv"] > 0): 																				{ "AAF Main Battle Tank" };
		case ({_vehicleClass isKindOf _x} count ["rhs_l159_CDF", "rhsgref_cdf_su25", "rhssaf_airforce_l_18"] > 0): 																{ "AAF Jet" };
		case (_vehicleClass isKindOf "I_UAV_02_dynamicLoadout_F"):                                                          														{ "AAF Unmanned Air Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["rhsgref_cdf_Mi35", "rhsgref_mi24g_CAS", "rhsgref_cdf_Mi24D"] > 0):									{ "AAF Helicopter" };
		case ({_vehicleClass isKindOf _x} count ["rhsgref_BRDM2","rhsgref_BRDM2_ATGM"] > 0):																							{ "AAF Light Armored Vehicle" };
		default 																																									{ "AAF Vehicle" };
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

_this call mission_AAFVehicleCapture;
