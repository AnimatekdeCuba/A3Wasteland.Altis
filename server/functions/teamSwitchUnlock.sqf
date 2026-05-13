// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: teamSwitchUnlock.sqf
//	@file Author: AgentRev
//  @file Modified: Persistent faction lock system with DB unlock support

private "_uid";
_uid = _this;

if (typeName _uid != "STRING" || {_uid in ["","0"]}) exitWith {};

// Remove from runtime list
[pvar_teamSwitchList, _uid] call fn_removeFromPairs;
publicVariable "pvar_teamSwitchList";

// Also clear LastSide from database to allow faction change after restart
// This is used by admins to unlock a player's faction lock persistently
_info = [["LastSide", ""]];
_data = [];
[call compile format ["%1", _uid], _info, _data] spawn {
	params ["_UID", "_info", "_data"];
	_UID call fn_saveAccount;
};
