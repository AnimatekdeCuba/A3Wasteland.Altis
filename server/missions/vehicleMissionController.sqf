// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mainMissionController.sqf
//	@file Author: AgentRev

#define MISSION_CTRL_PVAR_LIST vehicleMissions
#define MISSION_CTRL_TYPE_NAME "Vehicle"
#define MISSION_CTRL_FOLDER "vehicleMissions"
#define MISSION_CTRL_DELAY (["A3W_vehicleMissionDelay", 10*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE vehicleMissionColor

#include "vehicleMissions\vehicleMissionDefines.sqf"
#include "missionController.sqf";
