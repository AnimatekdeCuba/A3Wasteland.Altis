// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: populateGenStore.sqf
//	@file Author: [404] Deadbeat, [KoS] His_Shadow, AgentRev
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\genstoreDefines.sqf";
disableSerialization;
private ["_switch", "_dialog", "_itemlist", "_itemlisttext", "_itemDesc", "_showPicture", "_itemsArray", "_playerSideNum", "_parentCfg", "_weapon", "_picture", "_listIndex", "_showItem", "_factionCfg", "_faction", "_isUniform", "_sideCfg", "_side"];
_switch = _this select 0;

// Grab access to the controls
_dialog = findDisplay genstore_DIALOG;
_itemlist = _dialog displayCtrl genstore_item_list;
_itemlisttext = _dialog displayCtrl genstore_item_TEXT;
_itemDesc = _dialog displayCtrl genstore_item_desc;

//Clear the list
lbClear _itemlist;
_itemlist lbSetCurSel -1;
_itemlisttext ctrlSetText "";
_itemDesc ctrlSetText "";

_showPicture = true;

switch(_switch) do
{
	case 0:
	{
		_itemsArray = call headArray;
	};
	case 1:
	{
		_itemsArray = call uniformArray;
	};
	case 2:
	{
		_itemsArray = call vestArray;
	};
	case 3:
	{
		_itemsArray = call backpackArray;
	};
	case 4:
	{
		_itemsArray = call genItemArray;
	};
	case 5:
	{
		_itemsArray = call customPlayerItems;

		_excludedItems = [];

		if !(playerSide in [BLUFOR,OPFOR]) then
		{
			_excludedItems pushBack "warchest";
		};

		if (["A3W_unlimitedStamina"] call isConfigOn) then
		{
			_excludedItems pushBack "energydrink";
		};

		if !(["A3W_survivalSystem"] call isConfigOn) then
		{
			_excludedItems pushBack "water";
			_excludedItems pushBack "cannedfood";
		};

		if (count _excludedItems > 0) then
		{
			_itemsArray = [_itemsArray, { !((_x select 1) in _excludedItems) }] call BIS_fnc_conditionalSelect;
		};
	};
	case 6:
	{
		_itemsArray = call gencratesArray;
		_showPicture = false;
	};
	default
	{
		_itemsArray = [];
	};
};

_playerSideNum = switch (playerSide) do
{
	case BLUFOR:      { 1 };
	case OPFOR:       { 0 };
	case INDEPENDENT: { 2 };
	default           { 3 };
};

{
	_weaponClass = _x select 1;

	_parentCfg = switch (true) do
	{
		case (isClass (configFile >> "CfgVehicles" >> _weaponClass)):  { configFile >> "CfgVehicles" };
		case (isClass (configFile >> "CfgWeapons" >> _weaponClass)):   { configFile >> "CfgWeapons" };
		case (isClass (configFile >> "CfgMagazines" >> _weaponClass)): { configFile >> "CfgMagazines" };
		case (isClass (configFile >> "CfgGlasses" >> _weaponClass)):   { configFile >> "CfgGlasses" };
		default { nil };
	};

	_showItem = !("HIDDEN" in (_x select [3,999]));

	// Side-based filtering
	if (!isNil "_parentCfg") then
	{
		switch (configName _parentCfg) do
		{
			case "CfgVehicles":
			{
				if ({_weaponClass isKindOf _x} count ["C_IDAP_UAV_06_backpack_F","B_Static_Designator_01_weapon_F","O_Static_Designator_02_weapon_F"] > 0) exitWith {}; // allow everyone to buy all static designators

				{
					_sideCfg = call _x;

					if (isNumber _sideCfg) then
					{
						_side = getNumber _sideCfg;

						if (_side in [0,1,2] && {_side != _playerSideNum}) then
						{
							_showItem = false;
						};
					};
				}
				forEach
				[
					{ _parentCfg >> _weaponClass >> "side" },
					{ configFile >> "CfgVehicles" >> getText (_parentCfg >> _weaponClass >> "assembleInfo" >> "assembleTo") >> "side" }
				];
			};
			case "CfgWeapons":
			{
				_isUniform = isText (_parentCfg >> _weaponClass >> "ItemInfo" >> "uniformClass");
				_sideCfg = _parentCfg >> _weaponClass >> "ItemInfo" >> "side";

				switch (true) do
				{
					case (_isUniform):
					{
						if !(player isUniformAllowed _weaponClass || // indie exception for NATO jungle ghillie & thermal suit due to BIS not giving a damn
						     (playerSide == INDEPENDENT && {{_weaponClass == _x} count 
							 [
								"U_I_C_Soldier_Bandit_1_F",
								"U_I_C_Soldier_Bandit_2_F",
								"U_I_C_Soldier_Bandit_3_F",
								"U_I_C_Soldier_Bandit_4_F",
								"U_I_C_Soldier_Bandit_5_F",
								"U_B_CTRG_3",
								"U_B_CTRG_2",
								"U_B_CTRG_1",
								"U_B_CTRG_Soldier_F",
								"U_I_G_resistanceLeader_F",
								"U_B_CombatUniform_mcam_tshirt",
								"U_B_T_Soldier_F",
								"U_C_ConstructionCoverall_Black_F",
								"U_C_ConstructionCoverall_Blue_F",
								"U_C_ConstructionCoverall_Red_F",
								"U_C_ConstructionCoverall_Vrana_F",
								"U_O_OfficerUniform_ocamo",
								"U_B_CombatUniform_mcam",
								"U_O_T_Soldier_F",
								"U_O_CombatUniform_ocamo",
								"U_O_CombatUniform_oucamo",
								"U_B_FullGhillie_ard",
								"U_O_FullGhillie_ard",
								"U_B_T_FullGhillie_tna_F",
								"U_O_T_FullGhillie_tna_F",
								"U_B_FullGhillie_lsh",
								"U_O_FullGhillie_lsh",
								"U_B_FullGhillie_sard",
								"U_O_FullGhillie_sard",
								"U_B_GEN_Commander_F",
								"U_B_GEN_Soldier_F",
								"U_BG_Guerilla1_2_F",
								"U_BG_Guerrilla_6_1",
								"U_B_HeliPilotCoveralls",
								"U_C_IDAP_Man_cargo_F",
								"U_C_IDAP_Man_casual_F",
								"U_C_IDAP_Man_Jeans_F",
								"U_C_IDAP_Man_shorts_F",
								"U_C_IDAP_Man_TeeShorts_F",
								"U_C_IDAP_Man_Tee_F",
								"U_B_T_Sniper_F",
								"U_O_T_Sniper_F",
								"U_B_GhillieSuit",
								"U_O_GhillieSuit",
								"U_C_Mechanic_01_F",
								"U_C_Paramedic_01_F",
								"U_B_PilotCoveralls",
								"U_O_PilotCoveralls",
								"U_C_Poloshirt_stripped",
								"U_C_Poloshirt_burgundy",
								"U_Competitor",
								"U_C_Poloshirt_blue",
								"U_Rangemaster",
								"U_C_Poloshirt_redwhite",
								"U_C_Poloshirt_salmon",
								"U_C_Poloshirt_tricolour",
								"U_C_Driver_1_black",
								"U_C_Driver_1_blue",
								"U_C_Driver_2",
								"U_C_Driver_1",
								"U_C_Driver_1_green",
								"U_C_Driver_1_orange",
								"U_C_Driver_1_red",
								"U_C_Driver_3",
								"U_C_Driver_4",
								"U_C_Driver_1_white",
								"U_C_Driver_1_yellow",
								"U_B_CombatUniform_mcam_vest",
								"U_O_V_Soldier_Viper_F",
								"U_O_V_Soldier_Viper_hex_F",
								"U_B_survival_uniform",
								"U_I_C_Soldier_Camo_F",
								"U_C_Poor_1",
								"U_B_Protagonist_VR",
								"U_O_Protagonist_VR",
								"U_B_Wetsuit",
								"U_O_Wetsuit",
								"U_C_WorkerCoveralls"
							 ] > 0})) then
						{
							_showItem = false;
						};
					};
					case (isNumber _sideCfg):
					{
						_side = getNumber _sideCfg;

						if (_side in [0,1,2] && {_side != _playerSideNum}) then
						{
							_showItem = false;
						};
					};
				};
			};
		};
	};

	_side = _x param [4, ""];

	if !(_side isEqualType "") then { _side = "" };

	if (!(_side in [str playerSide, ""]) && _side in ["WEST","EAST","GUER","CIV"]) then
	{
		_showItem = false;
	};

	if (_showItem) then
	{
		_listIndex = _itemlist lbAdd format ["%1", if (!isNil "_parentCfg" && _x select 0 == "") then { getText (_parentCfg >> _weaponClass >> "displayName") } else { _x select 0 }];

		if (isNil "_parentCfg") then
		{
			_itemlist lbSetPicture [_listIndex, _x select 3];
		}
		else
		{
			// If BLUFOR ghillie suit, use picture from Independent ghillie suit
			if (_weaponClass == "U_B_GhillieSuit") then
			{
				_weapon = _parentCfg >> "U_I_GhillieSuit";
			}
			else
			{
				_weapon = _parentCfg >> _weaponClass;
			};

			_picture = getText (_weapon >> "picture");

			if (_showPicture) then
			{
				_itemlist lbSetPicture [_listIndex, _picture];
			};

			[_x, _parentCfg, _itemlist, _listIndex] call fn_checkStoreItemDLC;
		};

		_itemlist lbSetData [_listIndex, _weaponClass];
		
		//Disabled look for items only obtainable through missions
		if (_weaponClass in call missionOnlyItems) then {
			_itemlist lbSetColor [_listIndex, [1, 1, 1, .5]];
		};
		//Disabled look for donator only items
		if (!(getPlayerUID player call isdonor) && _weaponClass in call donatorItems) then {
			_itemlist lbSetColor [_listIndex, [0, 255, 0, .25]];
		};
	};
} forEach _itemsArray;

call getInventory;
