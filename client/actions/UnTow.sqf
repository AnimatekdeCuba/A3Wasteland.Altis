/*
Author: GMG_Monkey
FileName: DetachFromVehicle.sqf
Purpose: Untow vehicle from attached Vehicle
*/

//Setup Variables
_vehicle = cursorTarget;  
_attached = attachedObjects _vehicle;
_vehLocation = getPosATL _vehicle

{
	if (_x getVariable ["Towed", false]) then 
	{
		detach _x;
		_detachpos = [_vehLocation,5,15,3,1,0,0];
		_x setPosATL _detachpos;
		{_x setVariable ["Towed", false, true]} foreach _attached;
		_vehicle setVariable ["Towing", false, true];
} foreach _attached;

