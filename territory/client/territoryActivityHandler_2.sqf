// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*********************************************************#
# @@ScriptName: territoryActivityHandler_2.sqf
# @@Author: Nick 'Bewilderbeest' Ludlam <bewilder@recoil.org>, GMG_Monkey
# @@Create Date: 2013-09-15 19:33:17
# @@Modify Date: 2013-09-15 20:15:37
# @@Function:
#*********************************************************/

// Called with [_message, _money(optional)], "A3W_fnc_territoryActivityHandler", side, false] call A3W_fnc_MP;

diag_log format["A3W_fnc_territoryActivityHandler called with %1", _this];
if (typeName _this == "ARRAY" && {count _this >= 1}) then 
{
	private _justPlayers = (allPlayers - entities "HeadlessClient_F");
	private _CountAll = count _justPlayers;
	// player globalChat format ["Players online %1", _CountAll];
	private _CountOpfor = east countside _justPlayers;
	private _CountBlufor = west countside _justPlayers;
	// player globalChat format ["Blufor online %1", _CountBlufor];
	// player globalChat format ["Opfor online %1", _CountOpfor];
	private _countGroup = count units group player;
	// player globalChat format ["Player Group Count %1", _countGroup];
	private _multiplier = 1;
	private _canPayout = false;
	{
		private _marker = _x;
		if (["TERRITORY_", _marker] call fn_startsWith) then
		{
			private _playerPOS = getPos player;
			private _markerPOS = getMarkerPos _marker;
			private _distance = _playerPOS distance2D _markerPOS;
			// player globalChat format ["Distance to cap point %1", _distance];
			if (_distance <= 7000) then
			{
				_canPayout = true;
			};
		};
	} forEach allMapMarkers;
	// player globalChat format ["Can Payout = %1", _canPayout];
	if (_canPayout) then
	{
		_money = 0; 
		if (count _this >= 2) then { _money = _this select 1; };
		if (playerside == resistance ) then
		{
			if (_CountAll > _countGroup) then
			{
				_multiplier = _CountAll - _countGroup;
				
			};
		};
		if (playerside == west) then
		{
			if (_CountAll > _CountBlufor) then
			{
				_multiplier = _CountAll - _CountBlufor;
			};
		};
		if (playerside == east) then
		{
			if (_CountAll > _CountOpfor) then
			{
				_multiplier = _CountAll - _CountOpfor;
			};
		};
		// player globalChat format ["Multiplier = %1", _multiplier];
		_money = _money * _multiplier;
		// player globalChat format ["Payout = %1", _money];
		if (_money > 0) then 
		{
			//player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + _money, true];
			[player, _money] call A3W_fnc_setCMoney;
		}
		else
		{
			titletext ["No payout due to low population", "PLAIN DOWN"];
		};
	}
	else
	{
		_TerritoryLoopTime =  player getVariable ["_TerritoryLoopTime", time];
		OutOfRangeTime = time;
		if ((OutOfRangeTime - _TerritoryLoopTime) >= 30) then
		{
			titletext ["Estás a más de 7km de distancia del territorio. Pago imposible", "PLAIN DOWN"];
			player setvariable ["_TerritoryLoopTime", time, true];
		};
	};
};