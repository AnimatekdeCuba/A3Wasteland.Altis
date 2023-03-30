// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: createLegendMarkers.sqf
//	@file Author: AgentRev

_markers =
[
	["Batallón 95", "EmptyIcon", "ColorGrey", [1,1]],
	["Animatek's HC A3Wasteland", "EmptyIcon", "ColorGrey", [1,1]],
	["It's an honor.", "EmptyIcon", "ColorGrey", [1,1]],
	["LEGEND:", "EmptyIcon", "ColorGrey", [1,1]],
	["GS: General Store", "mil_dot", "ColorBlue", [1,1]],
	["VS: Vehicle Store", "mil_dot", "ColorOrange", [1,1]],
	["Gun Store", "mil_dot", "ColorYellow", [1,1]],
	["RP: Re-Supply Point", "mil_dot", "ColorGreen", [1,1]],
	["BS: Base Parts Store", "mil_dot", "ColorRed", [1,1]],
	["Territory Capture", "mil_objective", "ColorRed", [0.5,0.5]]
];

if (["A3W_privateParking"] call isConfigOn) then
{
	_markers pushBack ["Parking", "mil_dot", "ColorCIV", [1,1]];
};

if (["A3W_privateStorage"] call isConfigOn) then
{
	_markers pushBack ["Storage", "mil_dot", "ColorUNKNOWN", [1,1]];
};

_mapSize = worldSize;
_markerSpacing = 0.025 * _mapSize;
_legendMarginX = 0.035 * _mapSize;
_legendMarginY = 0.035 * _mapSize;
_markerX = _mapSize + _legendMarginX;
_legendTop = _legendMarginY + (_markerSpacing * (count _markers - 1));

{
	_x params ["_text", "_type", "_color", "_size"];

	_marker = format ["LegendMarker%1", _forEachIndex];
	_posX = _markerX - ([0, 0.02 * _mapSize] select (_type == "EmptyIcon"));
	_posY = _legendTop - (_forEachIndex * _markerSpacing);

	deleteMarkerLocal _marker;
	createMarkerLocal [_marker, [_posX, _posY]];

	_marker setMarkerTextLocal _text;
	_marker setMarkerTypeLocal _type;
	_marker setMarkerColorLocal _color;
	_marker setMarkerSizeLocal _size;
	_marker setMarkerShapeLocal "ICON";

} forEach _markers;
