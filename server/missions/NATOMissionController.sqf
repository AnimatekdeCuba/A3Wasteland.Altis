// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: NATOMissionController.sqf
//	@file Author: AgentRev

#define MISSION_CTRL_PVAR_LIST NATOMissions
#define MISSION_CTRL_TYPE_NAME "NATO"
#define MISSION_CTRL_FOLDER "NATOMissions"
#define MISSION_CTRL_DELAY (["A3W_NATOMissionDelay", 10*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE NATOMissionColor

#include "NATOMissions\NATOMissionDefines.sqf";
#include "missionController.sqf";
