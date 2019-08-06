// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_getObjectProperties.sqf
//	@file Author: AgentRev

#include "functions.sqf"

private ["_obj", "_class", "_pos", "_dir", "_damage", "_allowDamage", "_variables", "_owner", "_weapons", "_magazines", "_items", "_backpacks", "_turretMags", "_ammoCargo", "_fuelCargo", "_repairCargo"];
_obj = _this select 0;

_class = typeOf _obj;

_pos = ASLtoATL getPosWorld _obj;
{ _pos set [_forEachIndex, _x call fn_numToStr] } forEach _pos;
_dir = [vectorDir _obj, vectorUp _obj];
_damage = damage _obj;
_allowDamage = if (_obj getVariable ["allowDamage", false]) then { 1 } else { 0 };

_variables = [];

switch (true) do
{
	case (_obj isKindOf "Land_Sacks_goods_F"):
	{
		_variables pushBack ["food", _obj getVariable ["food", 20]];
	};
	case ({_obj isKindOf _x} count 
	[
		"Land_BarrelWater_F",
		"StorageBladder_02_water_forest_F",
		"StorageBladder_02_water_sand_F",
		"Land_WaterTank_01_F",
		"Land_WaterTank_02_F",
		"Land_WaterTank_03_F",
		"Land_WaterTank_04_F",
		"Land_WaterCooler_01_new_F",
		"Land_WaterCooler_01_old_F",
		"Land_WaterBarrel_F",
		"Land_WaterTank_F",
		"Land_BarrelWater_grey_F"
	] > 0):
	{
		_variables pushBack ["water", [_obj] call acex_field_rations_fnc_getRemainingWater];//  getVariable ["water", 20]];
	};
	case ({_obj isKindOf _x} count 
	[
		"StorageBladder_01_fuel_forest_F",// vejiga de combustible
		"StorageBladder_01_fuel_sand_F",// vejiga de combustible
		"FlexibleTank_01_forest_F",// tanque flexible de combustible
		"FlexibleTank_01_sand_F",// tanque flexible de combustible
		"B_Slingload_01_Fuel_F",// cisterna del huron
		"Land_Pod_Heli_Transport_04_fuel_F",// cisterna del Taru
		"Land_CanisterFuel_F",// canistra verde
		"Land_CanisterFuel_Blue_F",// canistra
		"Land_CanisterFuel_Red_F",// canistra
		"Land_CanisterFuel_White_F"// canistra
	] > 0):
	{
		_variables pushBack ["ace_FuelCount", [_obj] call ace_refuel_fnc_getFuel];
	};
	case ({_obj isKindOf _x} count 
	[
		"B_Slingload_01_Ammo_F",// munición del Huron
		"Land_Pod_Heli_Transport_04_ammo_F",// munición del taru
		"Box_NATO_AmmoVeh_F",// contenedor de munición
		"Box_East_AmmoVeh_F",// contenedor de munición
		"Box_IND_AmmoVeh_F" // contenedor de munición
	] > 0):
	{
		_variables pushBack ["ace_AmmoCount", [_obj] call ace_rearm_fnc_getSupplyCount];
	};
};

private _artiCount = [_obj getVariable "artillery"] param [0,0,[0]];
if (_artiCount >= 1) then
{
	_variables pushBack ["artillery", 1]; // capped at 1 for safety
};

switch (true) do
{
	case (_obj call _isBox):
	{
		_variables pushBack ["cmoney", (_obj getVariable ["cmoney", 0]) call fn_numToStr];
	};
	case (_obj call _isWarchest):
	{
		_variables pushBack ["a3w_warchest", true];
		_variables pushBack ["R3F_LOG_disabled", true];
		_variables pushBack ["side", str (_obj getVariable ["side", sideUnknown])];
	};
	case (_obj call _isBeacon):
	{
		_variables pushBack ["a3w_spawnBeacon", true];
		_variables pushBack ["R3F_LOG_disabled", true];
		_variables pushBack ["side", str (_obj getVariable ["side", sideUnknown])];
		_variables pushBack ["packing", false];
		_variables pushBack ["groupOnly", _obj getVariable ["groupOnly", false]];
		_variables pushBack ["ownerName", toArray (_obj getVariable ["ownerName", "[Beacon]"])];
	};
};

if (unitIsUAV _obj) then
{
	if (side _obj in [BLUFOR,OPFOR,INDEPENDENT]) then
	{
		_variables pushBack ["uavSide", str side _obj];
	};

	_variables pushBack ["uavAuto", isAutonomous _obj];
};

_owner = _obj getVariable ["ownerUID", ""];

if (_obj iskindof "Static") then 
{
	{ _variables pushBack [_x select 0, _obj getVariable _x] } forEach
	[
		["bis_disabled_Door_1", 0],
		["bis_disabled_Door_2", 0],
		["bis_disabled_Door_3", 0],
		["bis_disabled_Door_4", 0],
		["bis_disabled_Door_5", 0],
		["bis_disabled_Door_6", 0],
		["bis_disabled_Door_7", 0],
		["bis_disabled_Door_8", 0],
		["Moveable", false],
		["Baselockenabled", false],
		["LockedDown", false],
		["password_door_1", ""],
		["password_door_2", ""],
		["password_door_3", ""],
		["password_door_4", ""],
		["password_door_5", ""],
		["password_door_6", ""],
		["password_door_7", ""],
		["password_door_8", ""],
		["password_door_9", ""],
		["password_door_10", ""],
		["password_door_11", ""],
		["password_door_12", ""],
		["password_door_13", ""],
		["password_door_14", ""],
		["password_door_15", ""],
		["password_door_16", ""],
		["password_door_17", ""],
		["password_door_18", ""],
		["password_door_19", ""],
		["password_door_20", ""],
		["password_door_21", ""],
		["password_door_22", ""]
	];
};

if (_obj iskindof "thing") then 
{
	{ _variables pushBack [_x select 0, _obj getVariable _x] } forEach
		[
			["Moveable", false],
			["Baselockenabled", false],
			["LockedDown", false]

		];
};

_r3fSide = _obj getVariable "R3F_Side";

if (!isNil "_r3fSide") then
{
	_variables pushBack ["R3F_Side", str _r3fSide];
};

_weapons = [];
_magazines = [];
_items = [];
_backpacks = [];

if (_class call fn_hasInventory) then
{
	// Save weapons & ammo
	//_weapons = (getWeaponCargo _obj) call cargoToPairs;
	//_magazines = (getMagazineCargo _obj) call cargoToPairs;
	//_items = (getItemCargo _obj) call cargoToPairs;
	//_backpacks = (getBackpackCargo _obj) call cargoToPairs;

	private _cargo = _obj call fn_containerCargoToPairs;
	_weapons = _cargo select 0;
	_magazines = _cargo select 1;
	_items = _cargo select 2;
	_backpacks = _cargo select 3;
};

_turretMags = [];

if (_staticWeaponSavingOn && {_class call _isStaticWeapon}) then
{
	{
		if (_x select 0 != "FakeWeapon") then
		{
			_turretMags pushBack [_x select 0, _x select 2];
		};
	} forEach magazinesAllTurrets _obj;
};

_ammoCargo = getAmmoCargo _obj;
_fuelCargo = getFuelCargo _obj;
_repairCargo = getRepairCargo _obj;
switch (true) do
{

	case ( {_obj isKindOf _x} count ["Land_SatellitePhone_F"]>0):
	{
		{ _variables pushBack [_x select 0, _obj getVariable _x] } forEach
		[
			["password", ""],
			["lights", ""],
			["lockDown", false],
			["ManagerLevel", 1]
		];
	};
	case ({_obj isKindOf _x} count ["Box_NATO_AmmoVeh_F", "Box_EAST_AmmoVeh_F", "Box_IND_AmmoVeh_F", "B_Slingload_01_Ammo_F" ]>0):
	{
		{ _variables pushBack [_x select 0, _obj getVariable _x] } forEach [["GOM_fnc_ammoCargo", 0]];
	};
	case ({_obj isKindOf _x} count  ["B_Slingload_01_Repair_F", "Land_Pod_Heli_Transport_04_repair_F"]>0):
	{
		{ _variables pushBack [_x select 0, _obj getVariable _x] } forEach [["GOM_fnc_repairCargo", 0]];
	};
	case ({_obj isKindOf _x} count ["StorageBladder_01_fuel_forest_F", "StorageBladder_01_fuel_sand_F", "Land_fs_feed_F", "Land_FuelStation_01_pump_malevil_F", "Land_FuelStation_Feed_F", "Land_Pod_Heli_Transport_04_fuel_F"]>0):
	{
		{ _variables pushBack [_x select 0, _obj getVariable _x] } forEach [["GOMfnc_fuelCargo", 0]];
	};
};
// Fix for -1.#IND
if (isNil "_ammoCargo" || {!finite _ammoCargo}) then { _ammoCargo = 0 };
if (isNil "_fuelCargo" || {!finite _fuelCargo}) then { _fuelCargo = 0 };
if (isNil "_repairCargo" || {!finite _repairCargo}) then { _repairCargo = 0 };

[
	["Class", _class],
	["Position", _pos],
	["Direction", _dir],
	["Damage", _damage],
	["AllowDamage", _allowDamage],
	["OwnerUID", _owner],
	["Variables", _variables],

	["Weapons", _weapons],
	["Magazines", _magazines],
	["Items", _items],
	["Backpacks", _backpacks],

	["TurretMagazines", _turretMags],

	["AmmoCargo", _ammoCargo],
	["FuelCargo", _fuelCargo],
	["RepairCargo", _repairCargo]
]
