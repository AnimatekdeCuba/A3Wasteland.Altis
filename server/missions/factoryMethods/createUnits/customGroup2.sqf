// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup2.sqf
//	@file Author: AgentRev, JoSchaap

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_uPos", "_unit"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

_unitTypes =
[
	"C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro",
	"C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_polo_1_F",
	"C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F",
	"C_man_p_beggar_F","C_man_p_beggar_F_afro",
	"C_man_p_fugitive_F","C_journalist_F","C_Orestes",
	"C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F",
	"C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F",
	"C_man_w_worker_F","C_man_p_beggar_F","C_man_p_beggar_F_afro",
	"C_man_p_fugitive_F"
];

for "_i" from 1 to _nbUnits do
{
	_uPos = _pos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;

	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeVest _unit;
	removeBackpack _unit;
	_unit addHeadgear "rhsgref_helmet_pasgt_olive";
	_unit addUniform "rhsgref_uniform_woodland";
	_unit addVest "rhs_6b5_rifleman_ttsko";
	_unit addItem "FirstAidKit";
	_unit linkItem "rhs_1PN138";
	_unit addItem "rhssaf_mag_br_m75";
	_unit addItem "rhssaf_mag_brd_m83_white";

	switch (true) do
	{
		// Grenadier every 3 units
		case (_i % 3 == 0):
		{
			_unit addMagazine "rhs_VOG25";
			_unit addMagazine "rhssaf_30Rnd_762x39mm_M67";
			_unit addWeapon "rhs_weap_m70b3n_pbg40";
			_unit addPrimaryWeaponItem "rhs_acc_ekp8_02";
			_unit addMagazine "rhs_VOG25";
			_unit addMagazine "rhs_VOG25";
			_unit addMagazine "rhs_VG40TB";
			_unit addMagazine "rhs_VG40TB";
			_unit addMagazine "rhssaf_30Rnd_762x39mm_M67";
			_unit addMagazine "rhssaf_30Rnd_762x39mm_M67";
			
		};
		// RPG every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit addBackpack "rhs_rpg_empty";
			_unit addMagazine "rhssaf_30Rnd_762x39mm_M67";
			_unit addWeapon "rhs_weap_m70b3n";
			_unit addPrimaryWeaponItem "rhs_acc_ekp8_02";
			_unit addMagazine "rhssaf_30Rnd_762x39mm_M67";
			_unit addMagazine "rhssaf_30Rnd_762x39mm_M67";
			_unit addItem "rhssaf_mag_brk_m79";
			_unit addItem "rhssaf_mag_brk_m79";
			_unit addMagazine "rhs_rpg7_PG7V_mag";
			_unit addWeapon "rhs_weap_rpg7";
			_unit addMagazine "rhs_rpg7_PG7V_mag";
			_unit addMagazine "rhs_rpg7_PG7V_mag";
			_unit addMagazine "rhs_rpg7_OG7V_mag";
		};
		// AA every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit addBackpack "B_Kitbag_rgr";
			_unit addMagazine "rhssaf_30Rnd_762x39mm_M67";
			_unit addWeapon "rhs_weap_m70b3n";
			_unit addPrimaryWeaponItem "rhs_acc_ekp8_02";
			_unit addMagazine "rhssaf_30Rnd_762x39mm_M67";
			_unit addMagazine "rhssaf_30Rnd_762x39mm_M67";
			_unit addMagazine "rhs_mag_9k38_rocket";
			_unit addWeapon "rhs_weap_igla";
			_unit addMagazine "rhs_mag_9k38_rocket";
		};
		// Rifleman
		default
		{
			if (_unit == leader _group) then
			{
				_unit addMagazine "rhsgref_10Rnd_792x57_m76";
				_unit addWeapon "rhs_weap_m76";
				_unit addPrimaryWeaponItem "rhs_acc_pso1m21";
				_unit addPrimaryWeaponItem "rhs_acc_pbs1";
				_unit addMagazine "rhsgref_10Rnd_792x57_m76";
				_unit addMagazine "rhsgref_10Rnd_792x57_m76";
				_unit addMagazine "rhsgref_10Rnd_792x57_m76";
				_unit addMagazine "rhsgref_10Rnd_792x57_m76";
				_unit addItem "rhs_weap_rpg75";
				_unit addWeapon "rhs_weap_m76";
				_unit setRank "SERGEANT";
			}
			else
			{
				_unit addMagazine "rhssaf_30Rnd_762x39mm_M67";
				_unit addWeapon "rhs_weap_m92";
				_unit addMagazine "rhssaf_30Rnd_762x39mm_M67";
				_unit addMagazine "rhssaf_30Rnd_762x39mm_M67";
			};
		};
	};

	//_unit addPrimaryWeaponItem "rhs_acc_ekp8_02";
	_unit enablegunlights "forceOn";

	_unit addRating 1e11;
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
	_unit addEventHandler ["Killed", server_playerDied];
};

//[_pos] call addDefensiveMines;
