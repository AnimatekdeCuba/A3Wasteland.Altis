// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: playerActions.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, AgentRev, GMG_Monkey
//	@file Created: 20/11/2012 05:19

{ [player, _x] call fn_addManagedAction } forEach
[
	//Emergency Eject
	[format ["<t color='#FF0000'>Emergency eject (Ctrl+%1)</t>", (actionKeysNamesArray "GetOver") param [0,"<'Step over' keybind>"]],	{ [[], fn_emergencyEject] execFSM "call.fsm" }, [], 99, false, true, "", "(vehicle player) isKindOf 'Air' && !((vehicle player) isKindOf 'ParachuteBase')"],
	//Open Magic Parachute
	//[format ["<t color='#FF00FF'>Open magic parachute (%1)</t>", (actionKeysNamesArray "GetOver") param [0,"<'Step over' keybind>"]], A3W_fnc_openParachute, [], 99, true, true, "", "vehicle player == player && (getPos player) select 2 > 2.5"],
	//Heal Self
	//["Curarse", "client\actions\healSelf.sqf",0,2,false,false,"","(damage player)>0.01 && 'Medikit' in (items player)"],
	//Hide Body
	["<img image='client\icons\cancel.paa'/> Hide Body", "client\actions\hide.sqf", [], 1, false, false, "", "!isNull cursorObject && !alive cursorObject && {cursorObject isKindOf 'Man' && player distance cursorObject <= (sizeOf typeOf cursorObject / 3) max 2}"],
	//Take Gear
	["<img image='client\icons\cancel.paa'/> Take Gear", "client\actions\TakeGear.sqf", [], 1, false, false, "", "!isNull cursorObject && !alive cursorObject && {cursorObject isKindOf 'Man' && player distance cursorObject <= (sizeOf typeOf cursorObject / 3) max 2} && side player != west && side player != east"],
	//Put on Uniform
	["Ponerse el uniforme", "client\actions\PutOnUniform.sqf", [], 1, false, false, "", "!isNull cursorObject && {cursorObject isKindOf 'GroundWeaponHolder' && player distance cursorObject <= (sizeOf typeOf cursorObject / 3) max 2} && side player != west && side player != east"],
	//Re-initialize UAV
	["Re-Initilize UAV", "client\actions\reinitializeUAV.sqf", ["Re-Initilize"], 1, false, false, "", "{_x in ['B_UavTerminal','O_UavTerminal','I_UavTerminal']} count assignedItems player > 0 && {cursorTarget iskindof _x} count ['UAV_02_base_F', 'UAV_04_base_F', 'UAV_03_base_F', 'UGV_01_base_F', 'StaticWeapon', 'UAV_05_Base_F', 'B_Radar_System_01_F', 'O_SAM_System_04_F', 'O_Radar_System_02_F', 'B_SAM_System_03_F'] >0"],
	//Disable UAV
	["Disable UAV", "client\actions\disableUAV.sqf", [], 1, false, false, "", "{_x in ['B_UavTerminal','O_UavTerminal','I_UavTerminal']} count assignedItems player > 0 && {cursorTarget iskindof _x} count ['UAV_02_base_F', 'UAV_04_base_F', 'UAV_03_base_F', 'UGV_01_base_F', 'StaticWeapon', 'UAV_05_Base_F', 'B_Radar_System_01_F', 'O_SAM_System_04_F', 'O_Radar_System_02_F', 'B_SAM_System_03_F'] >0"],
	// Set UAV Sentry MODE
	//["Set UAV Sentry MODE", "client\actions\reinitializeUAV.sqf", ["Sentry"], 1, false, false, "", "{_x in ['B_UavTerminal','O_UavTerminal','I_UavTerminal']} count assignedItems player > 0 && {cursorTarget iskindof _x} count ['UAV_02_base_F', 'UAV_04_base_F', 'UAV_03_base_F', 'UGV_01_base_F', 'StaticWeapon', 'UAV_05_Base_F', 'B_Radar_System_01_F', 'O_SAM_System_04_F', 'O_Radar_System_02_F', 'B_SAM_System_03_F'] >0"],
	//Attach Static Weapon To Vehicle
	["Attach To Vehicle", "client\actions\AttachtoVehicle.sqf", [], -10, false, false, "", "(cursorTarget iskindof 'StaticWeapon' || cursorTarget iskindof 'Reammobox_F')&& !(cursorTarget getVariable ['Attached', false])"],
	//Dettach Static Object To Vehicle
	["Dettach From Vehicle", "client\actions\DetachFromVehicle.sqf", [], -10, false, false, "", "cursorTarget iskindof 'Car_F' && cursorTarget getVariable ['Attached', false]"],
	//Push Land Vehicle
	["Push vehicle", "server\functions\pushVehicle.sqf", [2.5, true], 1, false, false, "", "[2.5] call canPushVehicleOnFoot"],
	// Push Water Vehicle
	["Push vehicle forward", "server\functions\pushVehicle.sqf", [2.5], 1, false, false, "", "[2.5] call canPushWatercraft"],
	["Push vehicle backward", "server\functions\pushVehicle.sqf", [-2.5], 1, false, false, "", "[-2.5] call canPushWatercraft"],
	//TakeOwnership
	["<img image='client\icons\r3f_unlock.paa'/> Adquirir Vehículo", "client\actions\takeOwnership.sqf", [cursorObject], 1, false, false, "", "alive cursorObject && player distance cursorObject <= (sizeOf typeOf cursorObject / 3) max 3 && {{cursorObject isKindOf _x} count ['LandVehicle','Ship','Air'] > 0 && {locked cursorObject < 2 && !(cursorObject getVariable ['objectLocked',false]) && cursorObject getVariable ['ownerUID','0'] != getPlayerUID player && 'ACE_key_lockpick' in items player}}"],
	//Picku Money
	["<img image='client\icons\money.paa'/> Pickup Money", "client\actions\pickupMoney.sqf", [], 1, false, false, "", "{_x getVariable ['owner', ''] != 'mission'} count (player nearEntities ['Land_Money_F', 5]) > 0"],
	//Holster Weapon
	//["Holster Weapon", { player action ["SwitchWeapon", player, player, 100] }, [], -11, false, false, "", "vehicle player == player && currentWeapon player != '' && (stance player != 'CROUCH' || currentWeapon player != handgunWeapon player)"],
	//Remote Base Access
	["Acess Remote Base Management", "client\actions\BaseManegement.sqf", [], -98, false, true, "","{_x in ['B_UavTerminal','O_UavTerminal','I_UavTerminal']} count assignedItems player > 0"],
	//Base Cracking
	["Hack Base", "client\actions\BaseCracking.sqf", [], 99, false, false, "", "(vehicle player) iskindof 'O_Truck_03_device_F'"],
	//Cancel Action
	["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa'/> <t color='#FFFFFF'>Cancel Action</t>", { doCancelAction = true }, [], 1, false, false, "", "mutexScriptInProgress"],
	//Salvage Vehicle
	["<img image='client\icons\repair.paa'/> Salvage", "client\actions\salvage.sqf", [], 1.1, false, false, "", "!isNull cursorObject && !alive cursorObject && {cursorObject isKindOf 'AllVehicles' && !(cursorObject isKindOf 'Man') && player distance cursorObject <= (sizeOf typeOf cursorObject / 3) max 3}"],
	//Push Plain
	["[0]"] call getPushPlaneAction,
	// TanksCamo Nets
	["Deploy Camo Nets", "client\actions\CustomizeVehicle.sqf",["DeployCamo"], -99, false, true, "", "{cursorObject isKindOf _x} count ['Tank_F', 'Wheeled_APC_F']>0 && !(cursorObject getvariable ['CamoDeployed', false])"],
	["Stow Camo Nets", "client\actions\CustomizeVehicle.sqf",["StowCamo"], -99, false, true, "", "{cursorObject isKindOf _x} count ['Tank_F', 'Wheeled_APC_F']>0 && (cursorObject getvariable ['CamoDeployed', false])"],
	// Driver Assist
	["<img image='client\icons\driver.paa'/> Enable driver assist", fn_enableDriverAssist, [], 0.5, false, true, "", "_veh = objectParent player; alive _veh && !alive driver _veh && {effectiveCommander _veh == player && player in [gunner _veh, commander _veh] && {_veh isKindOf _x} count ['LandVehicle','Ship'] > 0 && !(_veh isKindOf 'StaticWeapon')}"],
	["<img image='client\icons\driver.paa'/> Disable driver assist", fn_disableDriverAssist, [], 0.5, false, true, "", "_driver = driver objectParent player; isAgent teamMember _driver && {(_driver getVariable ['A3W_driverAssistOwner', objNull]) in [player,objNull]}"],
	//Detect Beacons
	["<img image='addons\spawnBeaconDetector\spawnBeaconDetector.paa'/> Beacon Detector On", "addons\spawnBeaconDetector\spawnBeaconDetector.sqf",0,-10,false,false,"","('MineDetector' in (items player)) && !spawnBeaconDetectorInProgress && vehicle player == player"],
	["<img image='addons\spawnBeaconDetector\spawnBeaconDetector.paa'/> Beacon Detector Off", {spawnBeaconDetectorInProgress = false},0,-10,false,false,"","(spawnBeaconDetectorInProgress)"],
	//Mark Owned Objects on Map
 	["<t color='#FFE496'><img image='client\icons\search.paa'/> Mark your stuff on the map</t>", "addons\scripts\markOwned.sqf", [], -95,false,false,"","{_x in ['ItemGPS','B_UavTerminal','O_UavTerminal','I_UavTerminal']} count assignedItems player > 0"],
	//Open Player Menu
	[format ["<img image='client\icons\playerMenu.paa' color='%1'/> <t color='%1'>[</t>Player Menu<t color='%1'>]</t>", "#FF8000"], "client\systems\playerMenu\init.sqf", [], -99, false]
];
//Door Locking
// For some reason this diesn't work with add managed action.
player addaction ["Lock Door","client\actions\DoorLocking.sqf", ["lock"], -99, false, true, "", "(cursorObject getVariable [format ['bis_disabled_%1',getCursorObjectParams select 1 select 0], 0]) == 0 && {[['door_'],getCursorObjectParams select 1 select 0] call fn_startsWith} && cursorObject getVariable ['objectLocked', false]"];
player addaction ["Unlock Door","client\actions\DoorLocking.sqf", ["unlock"], -99, false, true, "", "(cursorObject getVariable [format ['bis_disabled_%1',getCursorObjectParams select 1 select 0], 0]) == 1 && {[['door_'],getCursorObjectParams select 1 select 0] call fn_startsWith} && cursorObject getVariable ['objectLocked', false]"];
player addaction ["Set Door PIN","client\actions\DoorLocking.sqf", ["ChangePin"], -99, false, true, "", "(cursorObject getVariable 'ownerUID') == (getPlayerUID player) && {[['door_'],getCursorObjectParams select 1 select 0] call fn_startsWith}"];


//Pick Vehicle Lock
	if (["A3W_vehicleLocking"] call isConfigOn) then
	{
		[player, ["<img image='client\icons\r3f_unlock.paa'/> Pick Lock", "addons\scripts\lockPick.sqf", [cursorTarget], 1, false, false, "", "alive cursorTarget && player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 3 && {{cursorTarget isKindOf _x} count ['LandVehicle','Ship','Air'] > 0 && {locked cursorTarget == 2 && !(cursorTarget getVariable ['A3W_lockpickDisabled',false]) && cursorTarget getVariable ['ownerUID','0'] != getPlayerUID player && 'ACE_key_lockpick' in items player}}"]] call fn_addManagedAction;
	};

	// Hehehe...
	if !(288520 in getDLCs 1) then
	{
		[player, ["<t color='#00FFFF'>Get in as Driver</t>", "client\actions\moveInDriver.sqf", [], 6, true, true, "", "cursorTarget isKindOf 'Kart_01_Base_F' && player distance cursorTarget < 3.4 && isNull driver cursorTarget"]] call fn_addManagedAction;
	};
//Force Save Vehicle
	if (["A3W_savingMethod", "profile"] call getPublicVar == "extDB") then
	{
		if (["A3W_vehicleSaving"] call isConfigOn) then
		{
		[player, ["<img image='client\icons\save.paa'/> Force Save Vehicle", { cursorTarget call fn_forceSaveVehicle }, [], -9.5, false, true, "", "call canForceSaveVehicle"]] call fn_addManagedAction;
		};

		if (["A3W_staticWeaponSaving"] call isConfigOn) then
		{
		[player, ["<img image='client\icons\save.paa'/> Force Save Turret", { cursorTarget call fn_forceSaveObject }, [], -9.5, false, true, "", "call canForceSaveStaticWeapon"]] call fn_addManagedAction;
		};
	};