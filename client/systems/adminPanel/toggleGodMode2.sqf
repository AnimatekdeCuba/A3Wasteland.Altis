// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Name: toggleGodMode.sqf

if (isDedicated) exitWith {};

if ((getPlayerUID player) call isAdmin) then
{
	_curPlayerInvulnState = player getVariable ["isAdminInvulnerable", false];

	if (!_curPlayerInvulnState) then
	{
		player setVariable ["acex_field_rations_thirst", 1];
		player setVariable ["acex_field_rations_hunger", 1];
		player setDamage 0;
		player allowDamage false;
		vehicle player setDamage 0;
		player setVariable ["isAdminInvulnerable", true, true];
		//ACE3 Stuffs
		player setVariable ["ace_medical_inCardiacArrest", false, true];
		player setVariable ["ace_medical_inReviveState", false, true];
		player setVariable ["ace_medical_hasLostBlood", 0, true];
		player setVariable ["ace_medical_isBleeding", false, true];
		player setVariable ["ace_medical_hasPain", false, true];
		player setVariable ["ace_medical_painSuppress", 0, true];
		player setVariable ["ace_medical_bodyPartStatus", [0,0,0,0,0,0], true];
		player setVariable ["ace_medical_ivBags", nil, true];
		player setVariable ["ace_medical_fractures", []];
		player setVariable ["ace_medical_heartRate", 80];
		player setVariable ["ace_medical_heartRateAdjustments", []];
		player setVariable ["ace_medical_bloodPressure", [80, 120]];
		player setVariable ["ace_medical_peripheralResistance", 100];
		player setVariable ["ace_medical_openWounds", [], true];
		player setVariable ["ace_medical_bandagedWounds", [], true];
		player setVariable ["ace_medical_internalWounds", [], true];
		player setVariable ["ace_medical_tourniquets", [0,0,0,0,0,0], true];
		player setVariable ["ace_medical_pain", 0, true];
		player setVariable ["ace_medical_morphine", 0, true];
		player setVariable ["ace_medical_bloodVolume", 100, true];
		// meds
		private _allUsedMedication = player getVariable ["ace_medical_allUsedMedication", []];
		{
			player setVariable [_x select 0, nil];
		} forEach _allUsedMedication;
		
		if (player getVariable ["ACE_isUnconscious", false]) then
		{
			player setVariable ["ACE_isUnconscious", false, true];
		};

		(findDisplay 27910) closeDisplay 0; // ReviveBlankGUI_IDD
		//(findDisplay 27911) closeDisplay 0; // ReviveGUI_IDD

		hint "You are now invulnerable";
		if (!isNil "notifyAdminMenu") then { ["godModeNoAnnounce", "On"] call notifyAdminMenu };
	}
	else
	{
		player allowDamage true;
		player setVariable ["isAdminInvulnerable", false, true];
		hint "You are no longer invulnerable";
		if (!isNil "notifyAdminMenu") then { ["godModeNoAnnounce", "Off"] call notifyAdminMenu };
	};
};
