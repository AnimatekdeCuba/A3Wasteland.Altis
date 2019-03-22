// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 	BadVolt 	*
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: password_change.sqf
//	@file Author: BadVolt
//	@file Description: Changes password for building and locks all doors.

_object = cursorTarget;

OutputText = nil;

createDialog "AF_Keypad";

waitUntil {!(isNil "OutputText")};

_object setVariable ["password", OutputText, true];

if (OutputText=="")then {

	["PIN lock desactivado.", 5] call mf_notify_client;	
}else{
	["Has cambiado correctamente tu PIN", 5] call mf_notify_client;	
	};	


OutputText = nil;