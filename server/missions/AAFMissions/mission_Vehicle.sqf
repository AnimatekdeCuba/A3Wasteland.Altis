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
		"I_MBT_03_cannon_F",
		//APCs
		"I_APC_Wheeled_03_cannon_F",
		"I_APC_tracked_03_cannon_F",
		//LAV
		"I_MRAP_03_hmg_F",
		"I_MRAP_03_gmg_F",
		//UAV
		"I_UAV_02_dynamicLoadout_F",
		//Jets
		"I_Plane_Fighter_03_dynamicLoadout_F",
		"I_Plane_Fighter_04_F",
		//Helis
		"I_Heli_Transport_02_F",
		"I_Heli_light_03_dynamicLoadout_F",
		"I_Heli_light_03_unarmed_F"
	];
	_missionType = switch (true) do
	{
		case ({_vehicleClass isKindOf _x} count ["B_APC_Tracked_01_AA_F", "O_APC_Tracked_02_AA_F"] > 0): 																			{ "AAF Anti Aircraft Vehicle" };
		case (_vehicleClass isKindOf "I_APC_Wheeled_03_cannon_F"):                                                          														{ "AAF Infantry Fighting Vehicle" };
		case (_vehicleClass isKindOf "I_APC_tracked_03_cannon_F"):																													{ "AAF Armored Personnel Carrier" };
		case (_vehicleClass isKindOf "I_MBT_03_cannon_F"):																															{ "AAF Main Battle Tank" };
		case ({_vehicleClass isKindOf _x} count ["I_Plane_Fighter_03_dynamicLoadout_F", "I_Plane_Fighter_04_F"] > 0): 																{ "AAF Jet" };
		case (_vehicleClass isKindOf "I_UAV_02_dynamicLoadout_F"):                                                          														{ "AAF Unmanned Air Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["I_Heli_Transport_02_F", "I_Heli_light_03_dynamicLoadout_F", "I_Heli_light_03_unarmed_F"] > 0):									{ "AAF Light Armored Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"] > 0):																							{ "AAF helicopter" };
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
