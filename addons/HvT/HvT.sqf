//	@file Version: 2.0
//	@file Name: HvT.sqf
//	@file Author: Cael817, CRE4MPIE, LouD, AgentRev

#define HVT_AMOUNT 1000000  // how much a player needs to be carrying to become a HvT
#define HINT_DELAY 120  // number of seconds between each HvT reminder hint
#define MARKER_REFRESH 60  // number of seconds between each HvT marker refresh

if (isServer) then
{
	addMissionEventHandler ["PlayerDisconnected", { deleteMarker ("HvT_" + (_this select 1)) }];
};

if (!hasInterface) exitWith {};

waitUntil {sleep 0.1; alive player && !(player getVariable ["playerSpawning", true])};

_lastHint = -HINT_DELAY;
_lastMarker = -MARKER_REFRESH;
_markerTarget = objNull;
_hasMarker = false;

while {true} do
{
	_isHvT = (player getVariable ["cmoney",0] >= HVT_AMOUNT && alive player && !(player getVariable ["playerSpawning", true]));

	if (_isHvT && diag_tickTime - _lastHint >= HINT_DELAY) then
	{
		hint parseText ([
			"<t color='#FF0000' size='1.5' align='center'>High Value Target</t>",
			//profileName,
			"<t color='#FFFFFF' shadow='1' shadowColor='#000000' align='center'>Tienes demasiado dinero encima. Alguien ha marcado tu posición en el mapa!</t>"
		] joinString "<br/>");

		_lastHint = diag_tickTime;
		//playSound "Topic_Done";
	};

	if (diag_tickTime - _lastMarker >= MARKER_REFRESH || (!alive _markerTarget && _hasMarker)) then
	{
		_markerName = "HvT_" + getPlayerUID player;

		if (_hasMarker) then
		{
			deleteMarker _markerName;
			_hasMarker = false;
		};

		if (_isHvT) then
		{
			createMarker [_markerName, getPosWorld player];
			_markerName setMarkerColor "ColorRed";
			_markerName setMarkerText format [" HVT: %1 ($%2MM)", profileName, (floor ((player getVariable ["cmoney",0]) / 1000000)) call fn_numToStr];
			_markerName setMarkerSize [0.55, 0.55];
			_markerName setMarkerShape "ICON";
			_markerName setMarkerType "mil_warning";

			_lastMarker = diag_tickTime;
			_markerTarget = player;
			_hasMarker = true;
			//playSound "Topic_Done";
		};
	};

	sleep 0.5;
};