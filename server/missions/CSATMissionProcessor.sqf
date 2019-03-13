// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: CSATMissionProcessor.sqf
//	@file Author: AgentRev

#define MISSION_PROC_TYPE_NAME "CSAT"
#define MISSION_PROC_TIMEOUT (["A3W_CSATMissionTimeout", 60*60] call getPublicVar)
#define MISSION_PROC_COLOR_DEFINE CSATMissionColor

#include "CSATMissions\CSATMissionDefines.sqf"
#include "missionProcessor.sqf";
