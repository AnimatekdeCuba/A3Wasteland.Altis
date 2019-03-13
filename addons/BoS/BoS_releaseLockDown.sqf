//	@file Version:
//	@file Name:
//	@file Author: Cael817 edited by: GMG_Monkey
//	@file Created:


private _manager = nearestObject [player, "Land_SatellitePhone_F"];
private _lockdown = false;
//Get manager level
private _ManagerLevel = _manager getVariable ["ManagerLevel", 1];
//set default base radius for level 1 manager
private _BaseRadius = 10;
//set base radius based on manager level
switch (_ManagerLevel) do
{
	case (2):
	{
		_BaseRadius = 20;
	};
	case (3):
	{
		_BaseRadius = 30;
	};
	case (4):
	{
		_BaseRadius = 40;
	};
	case (5):
	{
		_BaseRadius = 50;
	};
};

_managers = nearestObjects [ _manager, ["Land_SatellitePhone_F"], (_BaseRadius * 2), true];
if ( count _managers > 1) then 
{
	_getmanagerstatus = [{_x getVariable ["Baselockenabled", false]} foreach _managers];
	_checker = [true];
	_findlockedmanager = _checker arrayIntersect _getmanagerstatus;
	if (count _findlockedmanager > 0) then 
	{
		_lockdown = true;
	};
} else 
{
	_lockdown = false;
};

if (_lockdown) then 
{
	hint "Base Underlockdown. Action Aborted";
} else 
{
	_baseobjects = nearestObjects [_manager, ["All"], 35];
	{ _x setVariable ["Moveable", true, true]} foreach _baseobjects;
	{ _x setVariable ["lockeddown", false, true]} foreach _baseobjects;
	_manager setvariable ["Baselockenabled", false, true];
	cursorobject enableSimulationGlobal true;
	hint "Released Lock Down";
};