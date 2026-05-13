// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: teamSwitchLock.sqf
//	@file Author: AgentRev
//  @file Modified: Persistent faction lock system

private ["_uid", "_side", "_forceSave"];
_uid = param [0, "", [""]];
_side = param [1, sideUnknown, [sideUnknown]];
_forceSave = param [2, false, [false]]; // Optional flag to force save to DB

if (_uid in ["","0"] || !(_side in [BLUFOR,OPFOR,INDEPENDENT])) exitWith {};

// Add/update to runtime list
[pvar_teamSwitchList, _uid, _side] call fn_setToPairs;
publicVariable "pvar_teamSwitchList";

// If forced save flag is set, persist to database immediately
if (_forceSave) then {
	// Update LastSide in playerinfo table via persistent storage
	_info = [["LastSide", str _side]];
	_data = [];
	[call compile format ["%1", _uid], _info, _data] spawn {
		params ["_UID", "_info", "_data"];
		_UID call fn_saveAccount;
	};
};
