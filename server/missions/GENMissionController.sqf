// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mainMissionController.sqf
//	@file Author: AgentRev

#define MISSION_CTRL_PVAR_LIST GENMissions
#define MISSION_CTRL_TYPE_NAME "Gendarmarie"
#define MISSION_CTRL_FOLDER "GENMissions"
#define MISSION_CTRL_DELAY (["A3W_GENMissionDelay", 20*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE GENMissionColor

#include "GENMissions\GENMissionDefines.sqf"
#include "missionController.sqf";
