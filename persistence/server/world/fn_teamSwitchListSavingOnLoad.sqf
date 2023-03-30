/*teamSwitchListSavingOnLoad.sqf

*/
{	if !(["A3W_teamSwitchListSavingOn"] call isConfigOn) exitWith {};
			_uid = getPlayerUID player;
			if ((!_uid call isAdmin) && playerSide in [BLUFOR,OPFOR]) then {
				if (_value != "") then {
					if (_value != playerSide) exitWith
					{
					pvar_teamSwitchLock = [_uid, _value]; // Force faction from DB
					publicVariableServer "pvar_teamSwitchLock";
					// Back to lobby
					player allowDamage false;
					player setUnconscious true;
					9999 cutText ["", "BLACK", 0.01];
					0 fadeSound 0;
					uiNamespace setVariable ["BIS_fnc_guiMessage_status", false];

					_sideName = switch (_value) do
					{
						case BLUFOR: { "BLUFOR" };
						case OPFOR:  { "OPFOR" };
					};

					_msgBox = [format [localize "STR_WL_Loading_Teamswitched", _sideName]] spawn BIS_fnc_guiMessage;
					_time = diag_tickTime;

					waitUntil {scriptDone _msgBox || diag_tickTime - _time >= 20};
					endMission "LOSER";
					waitUntil {uiNamespace setVariable ["BIS_fnc_guiMessage_status", false]; closeDialog 0; false};
				};
			};
		} else {
        cutText ["You have used your admin to join the enemy team. Only do this for admin duties.", "PLAIN DOWN", 1];
	};
};