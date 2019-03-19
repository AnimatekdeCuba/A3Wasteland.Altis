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
		"B_MBT_01_arty_F",
		"B_MBT_01_mlrs_F",
		//AA
		"B_APC_Tracked_01_AA_F",
		//MBT
		"B_MBT_01_cannon_F",
		"B_MBT_01_TUSK_F",
		//APCs
		"B_APC_Wheeled_01_cannon_F",
		"B_APC_Tracked_01_CRV_F",
		"B_APC_Tracked_01_rcws_F",
		//LAV
		"B_MRAP_01_hmg_F",
		"B_MRAP_01_gmg_F",
		//UAV
		"B_UAV_02_dynamicLoadout_F",
		"B_UAV_05_F",
		"B_T_UAV_03_dynamicLoadout_F",
		//Jets
		"B_Plane_CAS_01_dynamicLoadout_F",
		"B_Plane_Fighter_01_F",
		"B_Plane_Fighter_01_Stealth_F",
		//Helis
		"B_Heli_Light_01_dynamicLoadout_F",
		"B_Heli_Attack_01_dynamicLoadout_F",
		"B_Heli_Transport_03_F",
		"B_Heli_Transport_03_unarmed_F",
		"B_Heli_Light_01_F",
		"B_Heli_Transport_01_F",
		//VTOLs
		"B_T_VTOL_01_armed_F",
		"B_T_VTOL_01_infantry_F",
		"B_T_VTOL_01_vehicle_F",
		//UGV
		"B_UGV_01_rcws_F"
	];
	_missionType = switch (true) do
	{
		case ({_vehicleClass isKindOf _x} count ["B_APC_Tracked_01_AA_F", "O_APC_Tracked_02_AA_F"] > 0): 																			{ "NATO Anti Aircraft Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_CRV_F","B_APC_Tracked_01_rcws_F"] > 0):												{ "NATO Armored Personnel Carrier" };
		case ({_vehicleClass isKindOf _x} count ["B_MBT_01_cannon_F","B_MBT_01_TUSK_F"] > 0):																						{ "NATO Main Battle Tank" };
		case ({_vehicleClass isKindOf _x} count ["B_Plane_CAS_01_dynamicLoadout_F","B_Plane_Fighter_01_F","B_Plane_Fighter_01_Stealth_F"] > 0): 									{ "NATO Jet" };
		case ({_vehicleClass isKindOf _x} count ["B_UAV_02_dynamicLoadout_F","B_UAV_05_F","B_T_UAV_03_dynamicLoadout_F"] > 0):                                                      { "NATO Unmanned Air Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["B_MRAP_01_hmg_F","B_MRAP_01_gmg_F"] > 0):																							{ "NATO Light Armored Vehicle" };
		case ({_vehicleClass isKindOf _x} count 
		[
			"B_Heli_Light_01_dynamicLoadout_F",
			"B_Heli_Attack_01_dynamicLoadout_F",
			"B_Heli_Transport_03_F",
			"B_Heli_Transport_03_unarmed_F",
			"B_Heli_Light_01_F",
			"B_Heli_Transport_01_F"
		] > 0):																																										{ "NATO Helicopter" };
		case ({_vehicleClass isKindOf _x} count ["B_T_VTOL_01_armed_F","B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F"] > 0):														{ "NATO VTOL" };
		case ({_vehicleClass isKindOf _x} count ["B_UGV_01_rcws_F"] > 0):																											{ "NATO Unmanned Ground Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["B_MBT_01_arty_F","B_MBT_01_mlrs_F"] > 0):																							{ "NATO Artillary" };
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
