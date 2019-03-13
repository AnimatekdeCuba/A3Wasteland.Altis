/*
Author: GMG_Monkey
FileName: DetachFromVehicle.sqf
Purpose: Detach Static Objects from attached Vehicle
*/

//Setup Variables
_vehicle = cursorTarget;
_attached = attachedObjects _vehicle;
_vehLocation = getPosATL _vehicle;

{
	if (_x getVariable ["Towed", false]) then
	{
		detach _x;
		_detachpos = [_vehLocation,5,15,3,1,0,0] call findSafePos;
		_x setPosATL _detachpos;
		_x setVariable ["Towed", false, true];
		_vehicle setVariable ["Towing", false, true];

	};
} foreach _attached;

{
	private _VehVariables =
	[
		"StaticWeaponAttached1",
		"StaticLDAttached",
		"SAMAttached",
		"SmallCrateAttached1",
		"SmallCrateAttached2",
		"SmallCrateAttached3",
		"SmallCrateAttached4",
		"SmallCrateAttached5",
		"SmallCrateAttached6",
		"SynCrateAttached1",
		"SynCrateAttached2",
		"SynCrateAttached3",
		"SynCrateAttached4",
		"SynCrateAttached1-2",
		"SynCrateAttached2-2",
		"SynCrateAttached3-2",
		"SynCrateAttached4-2",
		"SynWepCrateAttached1",
		"SynWepCrateAttached2",
		"SynWepCrateAttached3",
		"SynWepCrateAttached4",
		"SynWepCrateAttached5",
		"SynWepCrateAttached6",
		"SynWepCrateAttached1-2",
		"SynWepCrateAttached2-2",
		"SynWepCrateAttached3-2",
		"SynWepCrateAttached4-2",
		"SynWepCrateAttached5-2",
		"SynWepCrateAttached6-2",
		"SynWepCrateAttached1-3",
		"SynWepCrateAttached2-3",
		"SynWepCrateAttached3-3",
		"SynWepCrateAttached4-3",
		"SynWepCrateAttached5-3",
		"SynWepCrateAttached6-3",
		"SynWepCrateAttached1-4",
		"SynWepCrateAttached2-4",
		"SynWepCrateAttached3-4",
		"SynWepCrateAttached4-4",
		"SynWepCrateAttached5-4",
		"SynWepCrateAttached6-4",
		"BasicWepAttached1",
		"BasicWepAttached2",
		"BasicWepAttached3",
		"BasicWepAttached1-2",
		"BasicWepAttached2-2",
		"BasicWepAttached3-2",
		"SpecialWepAttached1",
		"SpecialWepAttached1-2",
		"EquipmentCrateAttached1",
		"EquipmentCrateAttached2",
		"EquipmentCrateAttached3",
		"EquipmentCrateAttached4",
		"LauncherCrateAttached1",
		"LauncherCrateAttached2",
		"LauncherCrateAttached3",
		"LauncherCrateAttached3B",
		"LauncherCrateAttached3B-2",
		"LauncherCrateAttached1-2",
		"LauncherCrateAttached2-2",
		"LauncherCrateAttached3-2",
		"SupplyCrateAttached",
		"CargoCratesAttached",
		"SupportCacheAttached",
		"AmmoCacheAttached",
		"WeaponCacheAttached",
		"VehAmmoCrateAttached",
		"HuronContainerAttached",
		"TaruContainerAttached"
	];
	if (_x getVariable ["Attached", false]) then
	{
		detach _x;
		_detachpos = [_vehLocation,5,10,3,1,0,0] call findSafePos;
		_x setPosATL _detachpos;
		_x setVariable ["Attached", false, true];
		_x setVariable ["moveable", true, true];
		{_vehicle setvariable [_x, false, true]} forEach _VehVariables;
	};
} foreach _attached;

