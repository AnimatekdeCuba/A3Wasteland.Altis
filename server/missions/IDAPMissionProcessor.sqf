// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: IDAPMissionProcessor.sqf
//	@file Author: AgentRev

#define MISSION_PROC_TYPE_NAME "IDAP"
#define MISSION_PROC_TIMEOUT (["A3W_IDAPMissionTimeout", 60*60] call getPublicVar)
#define MISSION_PROC_COLOR_DEFINE IDAPMissionColor

#include "IDAPMissions\IDAPMissionDefines.sqf"
#include "missionProcessor.sqf";
