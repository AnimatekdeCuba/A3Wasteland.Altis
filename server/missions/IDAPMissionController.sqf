// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: IDAPMissionController.sqf
//	@file Author: AgentRev

#define MISSION_CTRL_PVAR_LIST IDAPMissions
#define MISSION_CTRL_TYPE_NAME "IDAP"
#define MISSION_CTRL_FOLDER "IDAPMissions"
#define MISSION_CTRL_DELAY (["A3W_IDAPMissionDelay", 15*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE IDAPMissionColor

#include "IDAPMissions\IDAPMissionDefines.sqf"
#include "missionController.sqf";
