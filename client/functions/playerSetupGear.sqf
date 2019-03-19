// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev
//  @file Modifications to LOADOUTS: [BC]CeccaTTo

private ["_player", "_bmoney", "_playerScore", "_uniform", "_headgear"];
_player = _this;
_bmoney = _player getVariable ["bmoney", 0];
_playerScore = (([_player, "playerKills"] call fn_getScore) - ([_player, "teamKills"] call fn_getScore));
_uniform = [_player, "uniform"] call getDefaultClothing;
_headgear = [_player, "headgear"] call getDefaultClothing;

if (_uniform != "") then { _player addUniform _uniform };
if (_headgear != "") then { _player addHeadgear _headgear };

sleep 0.1;

switch (true) do {
	case (_bmoney >= 0 && _bmoney <= 499999): {//ACP-C2 .45 ACP + PDW2000 9mm
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_Parachute";
		_player addWeapon "Binocular";
		_player addItem "ACE_DAGR";
		_player addItem "ACE_MapTools";
		_player addItem "ACE_EarPlugs";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "SmokeShell";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		_player addWeapon "rhs_weap_makarov_pm";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		[_player,"rhsusf_falconii_mc"] call zade_boc_fnc_addChestpack;
		_player linkItem "ACE_NVG_Gen1";
	};
	case (_bmoney >= 500000 && _bmoney <= 999999): {//ACP-C2 .45 ACP + Vermin SMG .45 ACP
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_Parachute";
		_player addWeapon "Binocular";
		_player addItem "ACE_DAGR";
		_player addItem "ACE_MapTools";
		_player addItem "ACE_EarPlugs";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "SmokeShell";
		_player addMagazine "rhsgref_10rnd_765x17_vz61";
		_player addWeapon "rhs_weap_savz61";
		_player addMagazine "rhsgref_10rnd_765x17_vz61";
		_player addMagazine "rhsgref_10rnd_765x17_vz61";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		_player addWeapon "rhs_weap_makarov_pm";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		[_player,"rhsusf_falconii_mc"] call zade_boc_fnc_addChestpack;
		_player linkItem "ACE_NVG_Gen1";
	};
	case (_bmoney >= 1000000 && _bmoney <= 1499999): {//ACP-C2 .45 ACP + TRG-20 5.56mm
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_Parachute";
		_player addWeapon "Binocular";
		_player addItem "ACE_DAGR";
		_player addItem "ACE_MapTools";
		_player addItem "ACE_EarPlugs";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "SmokeShell";
		_player addMagazine "rhsgref_10rnd_765x17_vz61";
		_player addWeapon "rhs_weap_savz61";
		_player addMagazine "rhsgref_10rnd_765x17_vz61";
		_player addMagazine "rhsgref_10rnd_765x17_vz61";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		_player addWeapon "rhs_weap_makarov_pm";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		[_player,"rhsusf_falconii_mc"] call zade_boc_fnc_addChestpack;
		_player linkItem "ACE_NVG_Gen1";
	};
	case (_bmoney >= 1500000 && _bmoney <= 1999999): {//ACP-C2 .45 ACP + Katiba Carbine 6.5mm
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addBackpack "B_Parachute";
		_player addWeapon "Binocular";
		_player addItem "ACE_DAGR";
		_player addItem "ACE_MapTools";
		_player addItem "ACE_EarPlugs";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "SmokeShell";
		_player addMagazine "rhs_30Rnd_762x39mm";
		_player addWeapon "rhs_weap_akm";
		_player addMagazine "rhs_30Rnd_762x39mm";
		_player addMagazine "rhs_30Rnd_762x39mm";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		_player addWeapon "rhs_weap_makarov_pm";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		[_player,"rhsusf_falconii_mc"] call zade_boc_fnc_addChestpack;
		_player linkItem "ACE_NVG_Gen2";
	};
	case (_bmoney >= 2000000 && _bmoney <= 2499999): {//ACP-C2 .45 ACP + MXC 6.5mm
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_Parachute";
		_player addWeapon "Binocular";
		_player addItem "ACE_DAGR";
		_player addItem "ACE_MapTools";
		_player addItem "ACE_EarPlugs";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "SmokeShell";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red";
		_player addWeapon "rhs_weap_m16a4";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		_player addWeapon "rhs_weap_makarov_pm";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		_player addMagazine "rhs_mag_9x18_8_57N181S";
		[_player,"rhsusf_falconii_mc"] call zade_boc_fnc_addChestpack;
		_player linkItem "ACE_NVG_Gen2";
	};	
	case (_bmoney >= 2500000 && _bmoney <= 2999999): {//ACP-C2 .45 ACP + MX 3GL 6.5mm
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_Parachute";
		_player addWeapon "Binocular";
		_player addItem "ACE_DAGR";
		_player addItem "ACE_MapTools";
		_player addItem "ACE_EarPlugs";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "SmokeShell";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red";
		_player addWeapon "rhs_weap_m16a4";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red";
		_player addMagazine "3Rnd_HE_Grenade_shell";
		_player addMagazine "3Rnd_HE_Grenade_shell";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		_player addWeapon "rhsusf_weap_m1911a1";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		[_player,"rhsusf_falconii_mc"] call zade_boc_fnc_addChestpack;
		_player linkItem "ACE_NVG_Gen4";
	};
	case (_bmoney >= 3000000 && _bmoney <= 3499999): {//ACP-C2 .45 ACP + MX SW 6.5mm
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_Parachute";
		_player addWeapon "Binocular";
		_player addItem "ACE_DAGR";
		_player addItem "ACE_MapTools";
		_player addItem "ACE_EarPlugs";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "SmokeShell";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red";
		_player addWeapon "rhs_weap_m16a4_carryhandle_M203";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red";
		_player addMagazine "rhs_mag_M433_HEDP";
		_player addMagazine "rhs_mag_M433_HEDP";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		_player addWeapon "rhsusf_weap_m1911a1";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		[_player,"rhsusf_falconii_mc"] call zade_boc_fnc_addChestpack;
		_player linkItem "ACE_NVG_Gen4";
	};
	case (_bmoney >= 3500000 && _bmoney <= 3999999): {//ACP-C2 .45 ACP + Mk200 6.5mm
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_Parachute";
		_player addWeapon "Binocular";
		_player addItem "ACE_DAGR";
		_player addItem "ACE_MapTools";
		_player addItem "ACE_EarPlugs";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "SmokeShell";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red";
		_player addWeapon "rhs_weap_m16a4_carryhandle_M203";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red";
		_player addMagazine "rhs_mag_M433_HEDP";
		_player addMagazine "rhs_mag_M433_HEDP";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		_player addWeapon "rhsusf_weap_m1911a1";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		[_player,"rhsusf_falconii_mc"] call zade_boc_fnc_addChestpack;
		_player linkItem "ACE_NVG_Gen4";
	};
	case (_bmoney >= 4000000 && _bmoney <= 4499999): {//ACP-C2 .45 ACP + Zafir 7.62mm
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_Parachute";
		_player addWeapon "Binocular";
		_player addItem "ACE_MapTools";
		_player addItem "ACE_DAGR";
		_player addItem "ACE_EarPlugs";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "SmokeShell";
		_player addMagazine "rhs_100Rnd_762x54mmR_green";
		_player addWeapon "rhs_weap_pkm";
		_player addMagazine "rhs_100Rnd_762x54mmR_green";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		_player addWeapon "rhsusf_weap_m1911a1";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		[_player,"rhsusf_falconii_mc"] call zade_boc_fnc_addChestpack;
		_player linkItem "ACE_NVG_Wide";
	};
	case (_bmoney >= 4500000 && _bmoney <= 5000000): {//ACP-C2 .45 ACP + M320 LRR .408
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_Parachute";
		_player addWeapon "Binocular";
		_player addItem "ACE_DAGR";
		_player addItem "ACE_MapTools";
		_player addItem "ACE_EarPlugs";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_quikclot";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_morphine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "ACE_epinephrine";
		_player addItem "SmokeShell";
		_player addMagazine "rhsgref_30rnd_556x45_m21_t";
		_player addWeapon "rhs_weap_m21a_pr_pbg40";
		_player addMagazine "rhsgref_30rnd_556x45_m21_t";
		_player addMagazine "rhsgref_30rnd_556x45_m21_t";
		_player addMagazine "rhsgref_30rnd_556x45_m21_t";
		_player addMagazine "rhs_mag_M433_HEDP";
		_player addMagazine "rhs_mag_M433_HEDP";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		_player addWeapon "rhsusf_weap_m1911a1";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		_player addMagazine "rhsusf_mag_7x45acp_MHP";
		[_player,"rhsusf_falconii_mc"] call zade_boc_fnc_addChestpack;
		_player linkItem "ACE_NVG_Wide";
	};
};

switch (true) do {
	case (["_medic_", typeOf _player] call fn_findString != -1):
	{
		_player removeItem "FirstAidKit";
		//_player addItem "Medikit";
		{ ([player] + _x) call zade_boc_fnc_addItemToChestpack } forEach
		[
			["ACE_packingBandage",15],
			["ACE_morphine",10],
			["ACE_epinephrine",10],
			["ACE_bloodIV_250",3]
		];
	};
	case (["_engineer_", typeOf _player] call fn_findString != -1):
	{
		_player addItem "MineDetector";
		// _player addItem "Toolkit";
		_player addItem "ACE_DefusalKit";
		[_player,"Toolkit"] call zade_boc_fnc_addItemToChestpack;
	};
	case (["_sniper_", typeOf _player] call fn_findString != -1):
	{
		_player removeItem "Binocular";
		_player addWeapon "ACE_Yardage450";
	};
};

switch (true) do {//Additional
	case (_playerScore >= 100 && _playerScore <= 149): {
		_player setUnitRank "PRIVATE";
		_player addItem "rhs_mag_f1";
		_player addItem "rhs_mag_m67";
	};
	case (_playerScore >= 150 && _playerScore <= 199): {
		_player setUnitRank "CORPORAL";
		_player addItem "rhs_mag_f1";
		_player addItem "rhs_mag_f1";
		_player addItem "rhs_mag_m67";
		_player addItem "rhs_mag_m67";
	};
	case (_playerScore >= 200 && _playerScore <= 249): {
		_player setUnitRank "SERGEANT";
		_player addItem "rhs_mag_f1";
		_player addItem "rhs_mag_m67";
		_player addItem "APERSTripMine_Wire_Mag";
	};
	case (_playerScore >= 250 && _playerScore <= 299): {
		_player setUnitRank "LIEUTENANT";
		_player addItem "rhs_mag_f1";
		_player addItem "rhs_mag_m67";
		_player addItem "APERSBoundingMine_Range_Mag";
	};
	case (_playerScore >= 300 && _playerScore <= 349): {
		_player setUnitRank "CAPTAIN";
		_player addItem "rhs_mag_f1";
		_player addItem "rhs_mag_m67";
		_player addItem "APERSMine_Range_Mag";
	};
	case (_playerScore >= 350 && _playerScore <= 399): {
		_player setUnitRank "CAPTAIN";
		_player addItem "rhs_mag_f1";
		_player addItem "rhs_mag_m67";
		_player addItem "ClaymoreDirectionalMine_Remote_Mag";
	};
	case (_playerScore >= 400 && _playerScore <= 449): {
		_player setUnitRank "MAJOR";
		_player addItem "rhs_mag_f1";
		_player addItem "rhs_mag_m67";
		_player addItem "SLAMDirectionalMine_Wire_Mag";
	};
	case (_playerScore >= 450 && _playerScore <= 499): {
		_player setUnitRank "MAJOR";
		_player addItem "rhs_mag_f1";
		_player addItem "rhs_mag_m67";
		_player addItem "DemoCharge_Remote_Mag";
		_player addItem "ACE_Clacker";
	};
	case (_playerScore >= 500 && _playerScore <= 999): {
		_player setUnitRank "COLONEL";
		_player addItem "rhs_mag_f1";
		_player addItem "rhs_mag_m67";
		_player addItem "DemoCharge_Remote_Mag";
		_player addItem "ACE_Clacker";
	};
	case (_playerScore >= 1000): {
		_player setUnitRank "COLONEL";
		_player removeItem "Binocular";
		_player removeItem "Rangefinder";
		_player addWeapon "ACE_Yardage450";
		_player addItem "rhs_mag_f1";
		_player addItem "rhs_mag_m67";
		_player addItem "DemoCharge_Remote_Mag";
		_player addItem "ACE_Clacker";
	};
};

if (_player == player) then
{
	thirstLevel = 100;
	hungerLevel = 100;
};