// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_getVehicleProperties.sqf
//	@file Author: AgentRev edited by Animatek for use with ACE3

private ["_veh", "_flying", "_class", "_purchasedVehicle", "_missionVehicle", "_pos", "_dir", "_vel", "_fuel", "_damage", "_hitPoints", "_hpDamage", "_variables", "_owner", "_doubleBSlash", "_textures", "_tex", "_texArr", "_weapons", "_magazines", "_items", "_backpacks", "_turretMags", "_turretMags2", "_turretMags3", "_hasDoorGuns", "_turrets", "_path", "_ammoCargo", "_fuelCargo", "_repairCargo", "_props"];

_veh = _this select 0;
_flying = if (count _this > 1) then { _this select 1 } else { false };

_class = typeOf _veh;
private _vehCfg = configFile >> "CfgVehicles" >> _class;
_purchasedVehicle = _veh getVariable ["A3W_purchasedVehicle", false];
_missionVehicle = (_veh getVariable ["A3W_missionVehicle", false] && !(_veh getVariable ["R3F_LOG_disabled", false]));

_pos = ASLtoATL getPosWorld _veh;
{ _pos set [_forEachIndex, _x call fn_numToStr] } forEach _pos;
_dir = [vectorDir _veh, vectorUp _veh];
_vel = velocity _veh;
_fuel = fuel _veh;
_damage = damage _veh;
_hitPoints = [];
_hpDamage = getAllHitPointsDamage _veh;

{
	if (_x != "") then
	{
		_hitPoints pushBack [_x, (_hpDamage select 2) select _forEachIndex];
	};
} forEach (_hpDamage select 0);

// same display conditions as in BIS_fnc_garage (vehicle appearance editor)
private _animPhases = (configProperties [_vehCfg >> "AnimationSources", "getText (_x >> 'displayName') != '' && {getNumber (_x >> 'scope') > 1 || !isNumber (_x >> 'scope')}"])
                      apply { [configName _x, [0,1] select (_veh animationPhase configName _x >= 1)] };

_variables = [];

switch (true) do
{
	case _purchasedVehicle:
	{
		_variables pushBack ["A3W_purchasedVehicle", true];
	};
	case _missionVehicle:
	{
		_variables pushBack ["A3W_missionVehicle", true];
	};
};

private _variant = _veh getVariable ["A3W_vehicleVariant", ""];

if (_variant != "") then
{
	_variables pushBack ["A3W_vehicleVariant", _variant];
};

private _resupplyTruck = _veh getVariable ["A3W_resupplyTruck", false];

if (_resupplyTruck) then
{
	_variables pushBack ["A3W_resupplyTruck", true];
};

private _isUav = unitIsUAV _veh;

if (_isUav) then
{
	if (side _veh in [BLUFOR,OPFOR,INDEPENDENT]) then
	{
		_variables pushBack ["uavSide", str side _veh];
	};

	_variables pushBack ["uavAuto", isAutonomous _veh];
};

_owner = _veh getVariable ["ownerUID", ""];
private _ownerName = _veh getVariable ["ownerName", ""];

if (_ownerName != "") then
{
	_variables pushBack ["ownerName", toArray _ownerName];
};

private _artiCount = [_veh getVariable "artillery"] param [0,0,[0]];
if (_artiCount >= 1) then
{
	_variables pushBack ["artillery", 1]; // capped at 1 for safety
};

private _locked = 1 max locked _veh; // default vanilla state is always 1, so we ignore 0's

_textures = [];
private _texturesVar = _veh getVariable ["A3W_objectTextures", []];

if (_texturesVar isEqualType "") then // TextureSource
{
	_textures = _texturesVar;
}
else // texture paths
{
	_doubleBSlash = (call A3W_savingMethod == "extDB");
	private _missionDir = [_veh getVariable "A3W_objectTextures_missionDir"] param [0, call currMissionDir, [""]];
	private _missionDirLen = count _missionDir;
	private _addTexture =
	{
		if (!isNil "_x") then
		{
			_tex = _x;

			if (_tex select [0, _missionDirLen] == _missionDir) then
			{
				_tex = _tex select [_missionDirLen]; // exclude mission dir from path
			};

			if (_doubleBSlash) then
			{
				_tex = (["","\\"] select (_tex select [0,1] == "\")) + (_tex splitString "\" joinString "\\");
			};

			[_textures, _tex, [_forEachIndex]] call fn_addToPairs;
		};
	};

	// vehicle has at least 2 random textures, save everything
	if (count getArray (_vehCfg >> "textureList") >= 4) then
	{
		_addTexture forEach getObjectTextures _veh;
	}
	else // only save custom ones
	{
		_addTexture forEach _texturesVar;
	};
};

_weapons = [];
_magazines = [];
_items = [];
_backpacks = [];

if (_class call fn_hasInventory) then
{
	// Save weapons & ammo
	//_weapons = (getWeaponCargo _veh) call cargoToPairs;
	//_magazines = _veh call fn_magazineAmmoCargo;
	//_items = (getItemCargo _veh) call cargoToPairs;
	//_backpacks = (getBackpackCargo _veh) call cargoToPairs;

	private _cargo = _veh call fn_containerCargoToPairs;
	_weapons = _cargo select 0;
	_magazines = _cargo select 1;
	_items = _cargo select 2;
	_backpacks = _cargo select 3;
};

// _turretMags is deprecated, leave empty
_turretMags = []; // magazinesAmmo _veh;
_turretMags2 = (magazinesAllTurrets _veh) select {_x select 0 != "FakeWeapon" && !isText (configFile >> "CfgMagazines" >> (_x select 0) >> "pylonWeapon")} apply {_x select [0,3]};
_turretMags3 = _veh call fn_getPylonsAmmo;



_ammoCargo = getAmmoCargo _veh;
_fuelCargo = getFuelCargo _veh;
_repairCargo = getRepairCargo _veh;

// Fix for -1.#IND
if (isNil "_ammoCargo" || {!finite _ammoCargo}) then { _ammoCargo = 0 };
if (isNil "_fuelCargo" || {!finite _fuelCargo}) then { _fuelCargo = 0 };
if (isNil "_repairCargo" || {!finite _repairCargo}) then { _repairCargo = 0 };

// Save Vehicle Status
{ _variables pushBack [_x select 0, _veh getVariable _x] } forEach
[
  ["vPin", false],
  ["password", ""]
];

//ACE SERVICE system
if ({_veh isKindOf _x} count 
	[
		"rhsgref_cdf_b_ural_fuel", // URAL fuel
		"RHS_Ural_Fuel_MSV_01",// URAL fuel
		"RHS_Ural_Fuel_VDV_01",// URAL fuel
		"RHS_Ural_Fuel_VMF_01",// URAL fuel
		"RHS_Ural_Fuel_VV_01",// URAL fuel
		"rhsgref_cdf_ural_fuel",// URAL fuel
		"rhsgref_nat_van_fuel", // Fuel Van Vanilla versión gref de RHS
		"rhssaf_army_ural_fuel",// URAL fuel
		"C_Van_01_fuel_F",
		"B_G_Van_01_fuel_F",
		"B_Truck_01_fuel_F",
		"O_Truck_03_fuel_F",
		"I_Truck_02_fuel_F",
		"O_Heli_Transport_04_fuel_F"
	]>0) then
	{
		_variables pushBack ["ace_FuelCount", [_veh] call ace_refuel_fnc_getFuel];
	};
	
if ({_veh isKindOf _x} count 
	[
		"rhsgref_cdf_b_gaz66_ammo",
		"rhsusf_M977A4_AMMO_usarmy_d",
		"rhsusf_M977A4_AMMO_BKIT_usarmy_d",
		"rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d",
		"rhsusf_M977A4_AMMO_usarmy_wd",
		"rhsusf_M977A4_AMMO_BKIT_usarmy_wd",
		"rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd",
		"rhsgref_ins_gaz66_ammo",
		"rhs_gaz66_ammo_msv",
		"rhs_gaz66_ammo_vdv",
		"rhs_gaz66_ammo_vmf",
		"rhs_gaz66_ammo_vv",
		"rhsgref_ins_g_gaz66_ammo",
		"rhsgref_cdf_gaz66_ammo",
		"B_Truck_01_ammo_F",
		"O_Truck_03_ammo_F",
		"I_Truck_02_ammo_F",
		"O_Heli_Transport_04_ammo_F"
	]>0) then
	{
		_variables pushBack ["ace_AmmoCount", [_veh] call ace_rearm_fnc_getSupplyCount];
	};
	
//GOM Service system
if ({_veh isKindOf _x} count 
	[
		"C_Van_01_fuel_F",
		"B_G_Van_01_fuel_F",
		"B_Truck_01_fuel_F",
		"O_Truck_03_fuel_F",
		"I_Truck_02_fuel_F",
		"B_APC_Tracked_01_CRV_F",
		"O_Heli_Transport_04_fuel_F"
	]>0) then
	{ 
		{_variables pushBack [_x select 0, _veh getVariable _x]} forEach [["GOM_fnc_fuelCargo", 0]];
	};
if ({_veh isKindOf _x} count 
	[
		"B_Truck_01_ammo_F",
		"O_Truck_03_ammo_F",
		"I_Truck_02_ammo_F",
		"B_APC_Tracked_01_CRV_F",
		"O_Heli_Transport_04_ammo_F"
	]>0) then
	{ 
		{_variables pushBack [_x select 0, _veh getVariable _x]} forEach [["GOM_fnc_ammoCargo", 0]];
	};
if ({_veh isKindOf _x} count 
	[
		"C_Offroad_01_repair_F",
		"C_Van_02_service_F",
		"B_Truck_01_Repair_F",
		"O_Truck_03_repair_F",
		"I_Truck_02_box_F",	
		"B_APC_Tracked_01_CRV_F",
		"O_Heli_Transport_04_repair_F"
	]>0) then
	{ 
		{_variables pushBack [_x select 0, _veh getVariable _x]} forEach [["GOM_fnc_repairCargo", 0]];
	};

_owner = _veh getVariable ["ownerUID", ""];

_props =
[
	["Class", _class],
	["Position", _pos],
	["Direction", _dir],
	["Velocity", _vel],
	["Fuel", _fuel],
	["Damage", _damage],
	["HitPoints", _hitPoints],
	["AnimPhases", _animPhases],
	["OwnerUID", _owner],
	["LockState", _locked],
	["Variables", _variables],
	["Textures", _textures],

	["Weapons", _weapons],
	["Magazines", _magazines],
	["Items", _items],
	["Backpacks", _backpacks],

	["TurretMagazines", _turretMags],
	["TurretMagazines2", _turretMags2],
	["TurretMagazines3", _turretMags3],

	["AmmoCargo", _ammoCargo],
	["FuelCargo", _fuelCargo],
	["RepairCargo", _repairCargo]
];

// If flying and not UAV, do not save current pos/dir/vel
if (_flying && !_isUav) then
{
	_props deleteRange [1,3];
};

_props
