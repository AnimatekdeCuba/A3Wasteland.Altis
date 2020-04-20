// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: getPlayerData.sqf
//	@file Author: AgentRev

private ["_player", "_saveLocation", "_data", "_hitPoints", "_hpDamage", "_pos", "_loadedMags", "_mag", "_ammo", "_loaded", "_type", "_wastelandItems", "_spawnPos"];
_player = _this select 0;
_saveLocation = if (count _this > 1) then { _this select 1 } else { true };

_data = if (_player == player) then {
	[
		["Hunger", ["hungerLevel", _player getVariable ["acex_field_rations_hunger", 0]]call getPublicVar],
		["Thirst", ["thirstLevel", _player getVariable ["acex_field_rations_thirst", 0]]call getPublicVar]
	]
} else {
	[]
};

_hitPoints = [];
_hpDamage = getAllHitPointsDamage _player;

{
	if (_x != "") then
	{
		_hitPoints pushBack [_x, (_hpDamage select 2) select _forEachIndex];
	};
} forEach (_hpDamage select 0);

{ _data pushBack _x } forEach
[
	["Damage", damage _player],
	["HitPoints", _hitPoints],
	["Money", _player getVariable ["cmoney", 0]] // Money is always saved, but only restored if A3W_moneySaving = 1
];

// Only save those when on ground or underwater (you probably wouldn't want to spawn 500m in the air if you get logged off in flight)
if (_saveLocation && {isTouchingGround vehicle _player || {(getPos _player) select 2 < 0.5 || (getPosASL _player) select 2 < 0.5}}) then
{
	_pos = getPosATL _player;
	_spawnPos = getMarkerPos "respawn_guerrila";

	if (_spawnPos distance2D _pos > 500) then
	{
		{ _pos set [_forEachIndex, _x call fn_numToStr] } forEach _pos;

		_data pushBack ["Position", _pos];
		_data pushBack ["Direction", getDir _player];

		if (vehicle _player == player) then
		{
			_data pushBack ["CurrentWeapon", currentWeapon player];
			_data pushBack ["Stance", [player, ["P"]] call getMoveParams];
		};
	};
};

{ _data pushBack _x } forEach
[
	["Uniform", uniform _player],
	["Vest", vest _player],
	["Backpack", backpack _player],
	["Goggles", goggles _player],
	["Headgear", headgear _player],

	["PrimaryWeapon", primaryWeapon _player],
	["SecondaryWeapon", secondaryWeapon _player],
	["HandgunWeapon", handgunWeapon _player],

	["PrimaryWeaponItems", primaryWeaponItems _player],
	["SecondaryWeaponItems", secondaryWeaponItems _player],
	["HandgunItems", handgunItems _player],

	["AssignedItems", assignedItems _player]
];


_loadedMags = [];

{
	_mag = _x select 0;
	_ammo = _x select 1;
	_loaded = _x select 2;
	_type = _x select 3;

	// if loaded in weapon, not empty, and not hand grenade
	if (_loaded && _ammo > 0 && _type != 0) then
	{
		_loadedMags pushBack [_mag, _ammo];
	};
} forEach magazinesAmmoFull _player;

((uniformContainer _player) call fn_containerCargoToPairs) params ["_uniWeps", "_uniMags", "_uniItems"];
((vestContainer _player) call fn_containerCargoToPairs) params ["_vestWeps", "_vestMags", "_vestItems"];
((backpackContainer _player) call fn_containerCargoToPairs) params ["_backWeps", "_backMags", "_backItems"];

{ _data pushBack _x } forEach
[
	["UniformWeapons", _uniWeps],
	["UniformItems", _uniItems],
	["UniformMagazines", _uniMags],

	["VestWeapons", _vestWeps],
	["VestItems", _vestItems],
	["VestMagazines", _vestMags],

	["BackpackWeapons", _backWeps],
	["BackpackItems", _backItems],
	["BackpackMagazines", _backMags],

	["LoadedMagazines", _loadedMags]
];

if (_player == player) then
{
	_wastelandItems = [];
	{
		if (_x select 1 > 0) then
		{
			_wastelandItems pushBack [_x select 0, _x select 1];
		};
	} forEach call mf_inventory_all;

	_data pushBack ["WastelandItems", _wastelandItems];
};

// Uniform and backpack texture saving
_uniformTexture = uniformContainer _player getVariable ["uniformTexture", ""];

if (call A3W_savingMethod == "extDB") then
{
	_uniformTexture = (_uniformTexture splitString "\") joinString "\\";

};

_backpackTexture = backpackContainer _player getVariable ["backpackTexture", ""];

if (call A3W_savingMethod == "extDB") then
{
	_backpackTexture = (_backpackTexture splitString "\") joinString "\\";

};

{ _data pushBack _x } forEach
[
	["UniformTexture", _uniformTexture],
	["BackpackTexture", _backpackTexture]
];

// zade BACKPACKONCHEST

	_zade_Backpack = [_player] call zade_boc_fnc_chestpack;
	
	_zade_BackpackItem = [_player, false] call zade_boc_fnc_chestpackItems;
	
	_zade_BackpackMags = [_player] call zade_boc_fnc_chestpackMagazines;
	
{ _data pushBack _x } forEach
[
	["BackPackOnChest", _zade_Backpack],
	["BackpackOnChestItem", _zade_BackpackItem],
	["BackpackOnChestMags", _zade_BackpackMags]
];
// ACE3 PLAYER'S HEALTH STATUS
_ace_getBloodLoss = _player call ACE_medical_fnc_getBloodLoss;
{ _data pushBack _x } forEach
[
	["ACEPain", _player getVariable ["ace_medical_pain", 0]],
	["ACEbloodVolume", _player getVariable ["ace_medical_bloodVolume", 0]],
	["ACEBloodLoss", _ace_getBloodLoss],
	["ACEtourniquets", _player getVariable ["ace_medical_tourniquets", []]],
	["ACEopenWounds", _player getVariable ["ace_medical_openWounds", []]],
	["ACEheartRate", _player getVariable ["ace_medical_heartRate", 0]],
	["ACEbodyPartStatus", _player getVariable ["ace_medical_bodyPartStatus", []]]
];
/*
{ _data pushBack _x } forEach
[
	["ActualPlayerSide", playerSide]
];
*/
_data
