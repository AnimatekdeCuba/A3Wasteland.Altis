// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: createMissionVehicle2.sqf
//	@file Author: [404] Deadbeat, AgentRev, GMG_Monkey
//	@file Created: 26/1/2013 15:19

// if (!isServer && hasinterface) exitWith {};

private ["_class2", "_pos", "_fuel", "_ammo", "_damage", "_special", "_veh2"];

_class2 = _this select 0;
_pos = _this select 1;
_fuel = param [2, 1, [0]];
_ammo = param [3, 1, [0]];
_ammo = param [3, 1, [0]];
_damage = param [4, 0, [0]];
_special = param [5, "None", [""]];

_veh2 = createVehicle [_class2, _pos, [], 0, _special];

[_veh2] call vehicleSetup;

if (_fuel != 1) then { _veh2 setFuel _fuel };
if (_ammo != 1) then { _veh2 setVehicleAmmo _ammo };
_veh2 setDamage _damage;
if ({_veh2 iskindof _x} count 
[
	"C_Offroad_01_repair_F",
	"C_Van_02_service_F",
	"C_Van_01_fuel_F",
	"B_G_Van_01_fuel_F",
	"B_Truck_01_fuel_F",
	"B_Truck_01_Repair_F",
	"B_Truck_01_ammo_F",
	"O_Truck_03_fuel_F",
	"O_Truck_03_repair_F",
	"O_Truck_03_ammo_F",
	"I_Truck_02_fuel_F",
	"I_Truck_02_ammo_F",
	"I_Truck_02_box_F",	
	"B_APC_Tracked_01_CRV_F",
	"O_Heli_Transport_04_ammo_F",
	"O_Heli_Transport_04_repair_F",
	"O_Heli_Transport_04_fuel_F"
] > 0) then	
{
	private _AmmoResourcesMax =
	[
		["B_Truck_01_ammo_F",						25000],
		["O_Truck_03_ammo_F", 						15000],
		["I_Truck_02_ammo_F",						10000],
		["B_APC_Tracked_01_CRV_F",					500],
		["O_Heli_Transport_04_ammo_F",				20000]

	];
	private _FuelResourcesMax =
	[
		["C_Van_01_fuel_F",							1000],
		["B_G_Van_01_fuel_F",						1000],
		["B_Truck_01_fuel_F",						25000],
		["O_Truck_03_fuel_F",						20000],
		["I_Truck_02_fuel_F",						15000],
		["B_APC_Tracked_01_CRV_F",					500],
		["O_Heli_Transport_04_fuel_F",				22000]
	];
	private _RepairResourcesMax =
	[
		["C_Offroad_01_repair_F",					500],
		["C_Van_02_service_F",						1000],
		["B_Truck_01_Repair_F",						25000],
		["O_Truck_03_repair_F",						20000],
		["I_Truck_02_box_F",						15000],
		["B_APC_Tracked_01_CRV_F",					500],
		["O_Heli_Transport_04_repair_F",			22000]
	];
	_veh2 setAmmoCargo 0;
	_veh2 setFuelCargo 0;
	_veh2 setRepairCargo 0;
	_veh2 spawn GOM_fnc_addAircraftLoadoutToObject;
	{
		private _check = _x select 0;
		private _value = _x select 1;
		if (_veh2 iskindof _check) then
		{
			_veh2 setVariable ["GOM_fnc_ammoCargo", _value, true];
		};
	} foreach _AmmoResourcesMax;
	{
		private _check = _x select 0;
		private _value = _x select 1;
		if (_veh2 iskindof _check) then
		{
			_veh2 setVariable ["GOM_fnc_fuelCargo", _value, true];
		};
	} foreach _FuelResourcesMax;
	{
		private _check = _x select 0;
		private _value = _x select 1;
		if (_veh2 iskindof _check) then
		{
			_veh2 setVariable ["GOM_fnc_repairCargo", _value, true];
		};
	} foreach _RepairResourcesMax;
};
_veh2
