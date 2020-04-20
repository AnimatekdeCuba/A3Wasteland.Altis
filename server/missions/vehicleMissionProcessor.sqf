// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mainMissionProcessor.sqf
//	@file Author: AgentRev

#define MISSION_PROC_TYPE_NAME "Vehicle"
#define MISSION_PROC_TIMEOUT (["A3W_vehicleMissionTimeout", 60*60] call getPublicVar)
#define MISSION_PROC_COLOR_DEFINE vehicleMissionColor

#include "vehicleMissions\vehicleMissionDefines.sqf"
#include "missionProcessor.sqf";
