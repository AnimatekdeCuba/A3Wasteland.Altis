// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: NATOMissionProcessor.sqf
//	@file Author: AgentRev

#define MISSION_PROC_TYPE_NAME "NATO"
#define MISSION_PROC_TIMEOUT (["A3W_NATOMissionTimeout", 60*60] call getPublicVar)
#define MISSION_PROC_COLOR_DEFINE NATOMissionColor

#include "NATOMissions\NATOMissionDefines.sqf"
#include "missionProcessor.sqf";
