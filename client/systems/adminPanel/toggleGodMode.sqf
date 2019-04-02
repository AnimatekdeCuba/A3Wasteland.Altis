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

		if (player getVariable ["ACE_isUnconscious", false]) then
		{
			player setVariable ["ACE_isUnconscious", false, true];
		};

		(findDisplay 27910) closeDisplay 0; // ReviveBlankGUI_IDD
		//(findDisplay 27911) closeDisplay 0; // ReviveGUI_IDD

		hint "You are now invulnerable";
		if (!isNil "notifyAdminMenu") then { ["godMode", "On"] call notifyAdminMenu };
	}
	else
	{
		player allowDamage true;
		player setVariable ["isAdminInvulnerable", false, true];
		hint "You are no longer invulnerable";
		if (!isNil "notifyAdminMenu") then { ["godMode", "Off"] call notifyAdminMenu };
	};
};
