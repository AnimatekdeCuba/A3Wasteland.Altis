// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: SYNMissionController.sqf
//	@file Author: AgentRev

#define MISSION_CTRL_PVAR_LIST SYNMissions
#define MISSION_CTRL_TYPE_NAME "Syndicate"
#define MISSION_CTRL_FOLDER "SYNMissions"
#define MISSION_CTRL_DELAY (["A3W_SYNMissionDelay", 5*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE SYNMissionColor

#include "SYNMissions\SYNMissionDefines.sqf"
#include "missionController.sqf";
