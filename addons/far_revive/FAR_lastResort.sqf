// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: FAR_lastResort.sqf
//	@file Author: AgentRev

#include "FAR_defines.sqf"

if !(player getVariable ["performingDuty", false]) then
{
	_availableBombs = (magazines player) arrayIntersect ["SatchelCharge_Remote_Mag", "IEDUrbanBig_Remote_Mag", "IEDLandBig_Remote_Mag", "DemoCharge_Remote_Mag", "IEDUrbanSmall_Remote_Mag", "IEDLandSmall_Remote_Mag"]; // biggest to smallest
	_randomSound = selectRandom ["john-stamos.ogg","lastresort.ogg", "price-is-right.ogg","johncena.ogg", "scarface.ogg", "predator.ogg", "akbar.ogg", "bomb.ogg", "fired.ogg", "ilovechina.ogg", "mexicanpeople.ogg", "pussy.ogg", "sloth.ogg", "price-is-right.ogg"];

	if !(_availableBombs isEqualTo []) then
	{
		_magType = _availableBombs select 0;
		_mineType = ((_magType splitString "_") select 0) + "_F";

		if (!isClass (configFile >> "CfgVehicles" >> _mineType)) exitWith
		{
			titleText [format ["ERROR: invalid class '%1'", _mineType], "PLAIN", 0.5];
		};

		// Check for nearby enemies who might be looting
		_nearbyEnemies = [];
		{
			if (alive _x && !UNCONSCIOUS(_x) && !([player, _x] call A3W_fnc_isFriendly) && _x distance player <= 15) then {
				_nearbyEnemies pushBack _x;
			};
		} forEach (player nearEntities ["CAManBase", 15]);

		// Confirm action with player
		if ([format ["Last Resort: Activate explosive (%1)?", _magType], "", true, true] call BIS_fnc_guiMessage) then
		{
			player setVariable ["performingDuty", true];

			player removeMagazine _magType;
			playSound3D [call currMissionDir + "client\sounds\" + _randomSound, player, false, getPosASL player, 1, 1, 500];

			sleep 3;

			_oldMines = getAllOwnedMines player;
			removeAllOwnedMines player;

			_mine = createMine [_mineType, ASLtoAGL ((getPosASL player) vectorAdd [0, 0, 0.5]), [], 0];
			player addOwnedMine _mine;

			// Get explosion radius based on mine type for body cleanup
			_explosionRadius = switch (_mineType) do {
				case "SatchelCharge_F": { 20 };
				case "IEDUrbanBig_F": { 15 };
				case "IEDLandBig_F": { 15 };
				case "DemoCharge_F": { 12 };
				case "IEDUrbanSmall_F": { 8 };
				case "IEDLandSmall_F": { 8 };
				default { 10 };
			};

			if (alive player) then
			{
				player action ["TouchOff", player];
			}
			else
			{
				_mine setDamage 1;
			};

			{ player addOwnedMine _x } forEach _oldMines;

			// Mark death as lastResort for stats
			if (damage player < 1) then {
				player setVariable ["A3W_deathCause_local", ["lastresort"]];
				player setDamage 1;
			};

			// Cleanup bodies: delete player and nearby enemies within lethal radius
			sleep 0.1;
			{
				if (alive _x && _x distance player <= _explosionRadius) then {
					_x setVariable ["A3W_deathCause_local", ["lastresort_victim", player]];
					_x setDamage 1;
					// Delete body after short delay to prevent looting
					[_x] spawn {
						params ["_body"];
						sleep 5;
						if (!isNull _body) then {
							deleteVehicle _body;
						};
					};
				};
			} forEach (_nearbyEnemies + [player]);

			player setVariable ["performingDuty", nil];
		};
	}
	else
	{
		titleText ["Get an explosive charge next time, my child.", "PLAIN", 0.5];
	};
};
