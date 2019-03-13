// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mainMissionController.sqf
//	@file Author: AgentRev

#define MISSION_CTRL_PVAR_LIST AAFMissions
#define MISSION_CTRL_TYPE_NAME "AAF"
#define MISSION_CTRL_FOLDER "AAFMissions"
#define MISSION_CTRL_DELAY (["A3W_AAFMissionDelay", 5*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE AAFMissionColor

#include "AAFMissions\AAFMissionDefines.sqf"
#include "missionController.sqf";
