// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: applyPlayerData.sqf
//	@file Author: AgentRev

// This is where you load player status & inventory data which will be wiped upon death, for persistent variables use c_applyPlayerInfo.sqf instead

private ["_data", "_removal", "_name", "_value"];

_data = _this;
_removal = param [1, true];


if (_removal isEqualTo false) then
{
	_data = param [0, [], [[]]];
}
else
{
	removeAllWeapons player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeGoggles player;
	removeHeadgear player;
};

{
	_x params ["_name", "_value"];

	switch (_name) do
	{
		case "Damage": { player setDamage _value };
		case "HitPoints":
		{
			player allowDamage true;
			{ player setHitPointDamage _x } forEach _value;
			player allowDamage !(player getVariable ["playerSpawning", true]);
		};
		case "Hunger": { hungerLevel = _value };
		case "Thirst": { thirstLevel = _value };
		case "Money": { [player, _value, true] call A3W_fnc_setCMoney }; //{ player setVariable ["cmoney", _value, true] };
		/*case "Position":
		{
			if (count _value == 3) then
			{
				{ if (typeName _x == "STRING") then { _value set [_forEachIndex, parseNumber _x] } } forEach _value;
				player setPosATL _value;
			};
		};
		case "Direction": { player setDir _value };*/
		case "Uniform":
		{
			// If uniform cannot be worn by player due to different team, try to convert it, else give default instead
			if (_value != "") then
			{
				if (player isUniformAllowed _value || // indie exception for NATO jungle ghillie & thermal suit due to BIS not giving a damn
				    (playerSide == INDEPENDENT && {{_value == _x} count 
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
					player forceAddUniform _value;
				}
				else
				{
					_newUniform = [player, _value] call uniformConverter;

					if (player isUniformAllowed _newUniform ||
					    (playerSide == INDEPENDENT && {{_newUniform == _x} count 
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
						player forceAddUniform _newUniform;
					}
					else
					{
						player forceAddUniform ([player, "uniform"] call getDefaultClothing);
					}
				};
			};
		};
		case "Vest": { if (_value != "") then { player addVest _value } };
		case "Backpack":
		{
			removeBackpack player;

			if (_value != "") then
			{
				if (_value isKindOf "Weapon_Bag_Base" && [["_UAV_","_Designator_"], _value] call fn_findString == -1) then
				{
					player addBackpack "B_AssaultPack_rgr"; // NO SOUP FOR YOU
				}
				else
				{
					player addBackpack _value;
				};
			};
		};
		case "Goggles": { if (_value != "") then { player addGoggles _value } };
		case "Headgear":
		{
			// If wearing one of the default headgears, give the one belonging to actual team instead
			if (_value != "") then
			{
				_defHeadgear = [player, "headgear"] call getDefaultClothing;
				_defHeadgears =
				[
					[typeOf player, "headgear", BLUFOR] call getDefaultClothing,
					[typeOf player, "headgear", OPFOR] call getDefaultClothing,
					[typeOf player, "headgear", INDEPENDENT] call getDefaultClothing
				];

				if (_value != _defHeadgear && {_defHeadgear != ""} && {{_value == _x} count _defHeadgears > 0}) then
				{
					player addHeadgear _defHeadgear;
				}
				else
				{
					player addHeadgear _value;
				};
			};
		};
		case "LoadedMagazines":
		{
			player addBackpack "B_Carryall_Base"; // temporary backpack to hold mags
			{ player addMagazine _x } forEach _value;
		};
		case "PrimaryWeapon": { player addWeapon _value; removeAllPrimaryWeaponItems player };
		case "SecondaryWeapon": { player addWeapon _value };
		case "HandgunWeapon": { player addWeapon _value; removeAllHandgunItems player };
		case "PrimaryWeaponItems": { { if (_x != "") then { player addPrimaryWeaponItem _x } } forEach _value };
		case "SecondaryWeaponItems": { { if (_x != "") then { player addSecondaryWeaponItem _x } } forEach _value };
		case "HandgunItems": { { if (_x != "") then { player addHandgunItem _x } } forEach _value };
		case "AssignedItems":
		{
			{
				if ([player, _x] call isAssignableBinocular) then
				{
					if (_x select [0,15] == "Laserdesignator" && {{_x == "Laserbatteries"} count magazines player == 0}) then
					{
						[player, "Laserbatteries"] call fn_forceAddItem;
					};

					player addWeapon _x;
				}
				else
				{
					if (["_UavTerminal", _x] call fn_findString != -1) then
					{
						_x = switch (playerSide) do
						{
							case BLUFOR: { "B_UavTerminal" };
							case OPFOR:  { "O_UavTerminal" };
							default      { "I_UavTerminal" };
						};
					};

					player linkItem _x;
				};
			} forEach _value;
		};
		case "CurrentWeapon": { player selectWeapon _value };
		case "Stance": { [player, [player, _value] call getFullMove] call switchMoveGlobal; uiSleep 1 }; // 1 sec sleep to ensure full stance transition before moving player to fimal location
		case "UniformWeapons": { { (uniformContainer player) addWeaponCargoGlobal _x } forEach _value };
		case "UniformItems": { { (uniformContainer player) addItemCargoGlobal _x } forEach _value };
		case "UniformMagazines": { [uniformContainer player, _value] call processMagazineCargo };
		case "VestWeapons": { { (vestContainer player) addWeaponCargoGlobal _x } forEach _value };
		case "VestItems": { { (vestContainer player) addItemCargoGlobal _x } forEach _value };
		case "VestMagazines": { [vestContainer player, _value] call processMagazineCargo };
		case "BackpackWeapons": { { (backpackContainer player) addWeaponCargoGlobal _x } forEach _value };
		case "BackpackItems": { { (backpackContainer player) addItemCargoGlobal _x } forEach _value };
		case "BackpackMagazines": { [backpackContainer player, _value] call processMagazineCargo };
		case "PartialMagazines": { { player addMagazine _x } forEach _value };
		case "WastelandItems": { { [_x select 0, _x select 1, true] call mf_inventory_add } forEach _value };
		case "UniformTexture": 
		{ 
			if (_value != "") then
			{
				[player, [0, _value]] spawn applyPlayerTexture; // Doing this externally otherwise the texture is not broadcasted globally correctly
				uniformContainer player setVariable ["uniformTexture", _value, true]; 
			};
		};
		case "BackpackTexture": 
		{ 
			if (_value != "") then
			{
				[backpackContainer player, [0, _value]] spawn applyPlayerTexture; // Doing this externally otherwise the texture is not broadcasted globally correctly
				backpackContainer player setVariable ["backpackTexture", _value, true];
			};
		};
	};
} forEach _data;
