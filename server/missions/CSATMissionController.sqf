// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: CSATMissionController.sqf
//	@file Author: AgentRev

#define MISSION_CTRL_PVAR_LIST CSATMissions
#define MISSION_CTRL_TYPE_NAME "CSAT"
#define MISSION_CTRL_FOLDER "CSATMissions"
#define MISSION_CTRL_DELAY (["A3W_CSATMissionDelay", 15*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE CSATMissionColor

#include "CSATMissions\CSATMissionDefines.sqf"
#include "missionController.sqf";
