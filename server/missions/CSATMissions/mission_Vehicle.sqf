// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_APC.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev, GMG_Monkey
//	@file Created: 08/12/2012 15:19

if (!isServer && hasinterface) exitWith {};
#include "CSATMissionDefines.sqf";
private _vehicleClass = "";
_setupVars =
{
	_vehicleClass = selectrandom
	[
		//Arty
		"O_MBT_02_arty_F",
		//MBT
		"O_MBT_02_cannon_F",
		//APCs
		"O_APC_Tracked_02_cannon_F",
		"O_APC_Wheeled_02_rcws_F",
		//LAV
		"O_MRAP_02_hmg_F",
		"O_MRAP_02_gmg_F",
		//UAV
		"O_UAV_02_dynamicLoadout_F",
		"O_T_UAV_04_CAS_F",
		//Jets
		"O_Plane_CAS_02_dynamicLoadout_F",
		"O_Plane_Fighter_02_F",
		"O_Plane_Fighter_02_Stealth_F",
		//Helis
		"O_Heli_Transport_04_F",
		"O_Heli_Transport_04_ammo_F",
		"O_Heli_Transport_04_bench_F",
		"O_Heli_Transport_04_box_F",
		"O_Heli_Transport_04_fuel_F",
		"O_Heli_Attack_02_dynamicLoadout_F",
		"O_Heli_Light_02_dynamicLoadout_F",
		"O_Heli_Light_02_unarmed_F",
		//VTOLs
		"O_T_VTOL_02_infantry_dynamicLoadout_F",
		"O_T_VTOL_02_vehicle_dynamicLoadout_F",
		//UGV
		"O_UGV_01_rcws_F"
	];
	_missionType = switch (true) do
	{
		case ({_vehicleClass isKindOf _x} count ["B_APC_Tracked_01_AA_F", "O_APC_Tracked_02_AA_F"] > 0): 																			{ "CSAT Anti Aircraft Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F"] > 0):																		{ "CSAT Armored Personnel Carrier" };
		case ({_vehicleClass isKindOf _x} count ["O_MBT_02_cannon_F"] > 0):																											{ "CSAT Main Battle Tank" };
		case ({_vehicleClass isKindOf _x} count ["O_Plane_CAS_02_dynamicLoadout_F","O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F"] > 0): 									{ "CSAT Jet" };
		case ({_vehicleClass isKindOf _x} count ["O_UAV_02_dynamicLoadout_F","O_T_UAV_04_CAS_F"] > 0):                                                          					{ "CSAT Unmanned Air Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F"] > 0):																							{ "CSAT Light Armored Vehicle" };
		case ({_vehicleClass isKindOf _x} count 
		[
			"O_Heli_Transport_04_F",
			"O_Heli_Transport_04_ammo_F",
			"O_Heli_Transport_04_bench_F",
			"O_Heli_Transport_04_box_F",
			"O_Heli_Transport_04_fuel_F",
			"O_Heli_Attack_02_dynamicLoadout_F",
			"O_Heli_Light_02_dynamicLoadout_F",
			"O_Heli_Light_02_unarmed_F"
		] > 0):																																										{ "CSAT Helicopter" };
		case ({_vehicleClass isKindOf _x} count ["O_T_VTOL_02_infantry_dynamicLoadout_F","O_T_VTOL_02_vehicle_dynamicLoadout_F"] > 0):												{ "CSAT VTOL" };
		case ({_vehicleClass isKindOf _x} count ["O_UGV_01_rcws_F"] > 0):																											{ "CSAT Unmanned Ground Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["O_MBT_02_arty_F"] > 0):																											{ "CSAT Artillary" };

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
