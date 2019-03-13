// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: initPlayerLocal.sqf
//	@file Author: AgentRev

if (!isServer) then
{
	"BIS_fnc_MP_packet" addPublicVariableEventHandler compileFinal preprocessFileLineNumbers "server\antihack\filterExecAttempt.sqf";
};
null = [player] execVM "addons\GrassCutter\grasscutter.sqf";
player addEventhandler["respawn","_this execVM 'addons\GrassCutter\grasscutter.sqf'"];

// // TFR-Reaction-script START
if (hasInterface) then 
{
	[1,0,["C_Nikos_aged"],60,10,25,50] call Lux_mix_fnc_intercettato;
};