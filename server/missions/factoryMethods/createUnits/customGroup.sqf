// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_uPos", "_unit"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

_unitTypes =
[
	"C_man_polo_1_F", "C_man_polo_1_F_euro", "C_man_polo_1_F_afro", "C_man_polo_1_F_asia",
	"C_man_polo_2_F", "C_man_polo_2_F_euro", "C_man_polo_2_F_afro", "C_man_polo_2_F_asia",
	"C_man_polo_3_F", "C_man_polo_3_F_euro", "C_man_polo_3_F_afro", "C_man_polo_3_F_asia",
	"C_man_polo_4_F", "C_man_polo_4_F_euro", "C_man_polo_4_F_afro", "C_man_polo_4_F_asia",
	"C_man_polo_5_F", "C_man_polo_5_F_euro", "C_man_polo_5_F_afro", "C_man_polo_5_F_asia",
	"C_man_polo_6_F", "C_man_polo_6_F_euro", "C_man_polo_6_F_afro", "C_man_polo_6_F_asia"
];

for "_i" from 1 to _nbUnits do
{
	_uPos = _pos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;

	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit addHeadgear "rhsusf_lwh_helmet_marpatwd_headset_blk2";
	_unit addUniform "rhsgref_uniform_ttsko_mountain";
	_unit addVest "rhsusf_mbav_rifleman";
	_unit addItem "FirstAidKit";
	_unit linkItem "rhsusf_ANPVS_14";
	_unit addItem "rhs_mag_m67";
	_unit addItem "rhs_mag_rdg2_white";
	

	switch (true) do
	{
		// Grenadier every 3 units, starting from #2
		case ((_i + 4) % 3 == 0):
		{
			_unit addMagazine "rhs_mag_M441_HE";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
			_unit addWeapon "rhs_weap_m16a4_carryhandle_M203";
			_unit addPrimaryWeaponItem "rhsusf_acc_T1_high";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
			_unit addMagazine "rhs_mag_M441_HE";
			_unit addMagazine "rhs_mag_M441_HE";
			_unit addMagazine "rhs_mag_m4009";
			_unit addMagazine "rhs_mag_m4009";
		};
		// PCML every 6 units, starting from #6
		case (_i % 6 == 0):
		{
			_unit addBackpack "B_Carryall_cbr";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
			_unit addWeapon "rhs_weap_m16a4_carryhandle";
			_unit addPrimaryWeaponItem "rhsusf_acc_T1_high";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
			_unit addMagazine "rhs_fgm148_magazine_AT";
			_unit addWeapon "rhs_weap_fgm148";
			_unit addMagazine "rhs_fgm148_magazine_AT";
		};
		// RPG-42 every 6 units, starting from #3
		case ((_i + 3) % 6 == 0):
		{
			
			_unit addBackpack "B_Kitbag_cbr";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
			_unit addWeapon "rhs_weap_m16a4_carryhandle";
			_unit addPrimaryWeaponItem "rhsusf_acc_T1_high";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
			_unit addMagazine "rhs_mag_smaw_HEAA";
			_unit addWeapon "rhs_weap_smaw_green";
			_unit addMagazine "rhs_mag_smaw_HEAA";
			_unit addMagazine "rhs_mag_smaw_HEAA";
		};
		// Machinegunner every 4 units, starting from #3
		case ((_i + 3) % 4 == 0):
		{
			_unit addMagazine "rhsusf_200Rnd_556x45_box";
			_unit addWeapon "rhs_weap_m249_pip";
			_unit addMagazine "rhsusf_200Rnd_556x45_box";
			_unit addMagazine "rhsusf_200Rnd_556x45_box";
			_unit addItem "rhs_mag_an_m14_th3";
			_unit addItem "rhs_mag_an_m14_th3";
		};
		// AA every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit addBackpack "B_Kitbag_cbr";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
			_unit addWeapon "rhs_weap_m16a4_carryhandle";
			_unit addPrimaryWeaponItem "rhsusf_acc_T1_high";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
			_unit addMagazine "rhs_fim92_mag";
			_unit addWeapon "rhs_weap_fim92";
			_unit addMagazine "rhs_fim92_mag";
			_unit addMagazine "rhs_fim92_mag";
		};
		// Rifleman
		default
		{
			

			if (_unit == leader _group) then
			{
				_unit addMagazine "rhsusf_20Rnd_762x51_SR25_m118_special_Mag";
				_unit addWeapon "rhs_weap_sr25_ec_d";
				_unit addPrimaryWeaponItem "optic_DMS";
				_unit addPrimaryWeaponItem "rhsusf_acc_SR25S_d";
				_unit addMagazine "rhsusf_20Rnd_762x51_SR25_m118_special_Mag";
				_unit addMagazine "rhsusf_20Rnd_762x51_SR25_m118_special_Mag";
				_unit addMagazine "rhsusf_20Rnd_762x51_SR25_m118_special_Mag";
				_unit addItem "rhs_mag_m7a3_cs";
				_unit addItem "rhs_mag_m7a3_cs";
				_unit setRank "SERGEANT";
			}
			else
			{
				_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
				_unit addWeapon "rhs_weap_m4a1_carryhandle";
				_unit addPrimaryWeaponItem "rhsusf_acc_T1_high";
				_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
				_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
			};
		};
	};

	//_unit addPrimaryWeaponItem "acc_flashlight";
	_unit enablegunlights "forceOn";

	_unit addRating 1e11;
	_unit spawn addMilCap;
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
	_unit addEventHandler ["Killed", server_playerDied];
};

//[_pos] call addDefensiveMines;
[_group, _pos] call defendArea;
