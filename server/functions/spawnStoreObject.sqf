// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: spawnStoreObject.sqf
//	@file Author: AgentRev Edited By: GMG_Monkey 
//	@file Created: 11/10/2013 22:17
//	@file Args:

if (!isServer) exitWith {};

scopeName "spawnStoreObject";
private ["_isGenStore", "_isGunStore", "_isVehStore", "_timeoutKey", "_objectID", "_playerSide", "_objectsArray", "_results", "_itemEntry", "_itemPrice", "_safePos", "_object"];
params [["_player",objNull,[objNull]], ["_itemEntrySent",[],[[]]], ["_npcName","",[""]], ["_key","",[""]]];
_itemEntrySent params [["_class","",[""]]];
_isGenStore = ["GenStore", _npcName] call fn_startsWith;
_isGunStore = ["GunStore", _npcName] call fn_startsWith;
_isVehStore = ["VehStore", _npcName] call fn_startsWith;
_isBaseStore = ["BaseStore", _npcName] call fn_startsWith; 

private _storeNPC = missionNamespace getVariable [_npcName, objNull];
private _marker = _npcName;

if (_key != "" && _player isKindOf "Man" && {_isGenStore || _isGunStore || _isVehStore || _isBaseStore}) then
{
	_timeoutKey = _key + "_timeout";
	_objectID = "";
	private _seaSpawn = false;
	private _playerGroup = group _player;
	_playerSide = side _playerGroup;
	if (_isGenStore || _isGunStore || _isBaseStore) then
	{
		_npcName = _npcName + "_objSpawn";
		switch (true) do
		{
			case _isGenStore: { _objectsArray = gencratesArray };
			case _isGunStore: { _objectsArray = staticGunsArray };
			case _isBaseStore: { _objectsArray = AllBaseParts};
		};
		if (!isNil "_objectsArray") then
		{
			_results = (call _objectsArray) select {_x select [1,999] isEqualTo _itemEntrySent};
			if (count _results > 0) then
			{
				_itemEntry = _results select 0;
				_marker = _marker + "_objSpawn";
			};
		};
	};
	if (_isVehStore) then
	{
		// LAND VEHICLES and autonomous Weapons
		{
			_results = (call _x) select {_x select [1,999] isEqualTo _itemEntrySent};
			if (count _results > 0) then
			{
				_itemEntry = _results select 0;
				_marker = _marker + "_landSpawn";
			};
		} forEach [landArray, armoredArray, tanksArray, AutonomousArray];
		// SEA VEHICLES
		if (isNil "_itemEntry") then
		{
			_results = (call boatsArray) select {_x select [1,999] isEqualTo _itemEntrySent};
			if (count _results > 0) then
			{
				_itemEntry = _results select 0;
				_marker = _marker + (["_seaSpawn","_landSpawn"] select (markerType (_marker + "_seaSpawn") isEqualTo "")); // allow boat on landSpawn if no seaSpawn
				_seaSpawn = true;
			};
		};
		// HELICOPTERS
		if (isNil "_itemEntry") then
		{
			_results = (call helicoptersArray) select {_x select [1,999] isEqualTo _itemEntrySent};
			if (count _results > 0) then
			{
				_itemEntry = _results select 0;
				_marker = _marker + "_heliSpawn";
			};
		};
		// AIRPLANES
		if (isNil "_itemEntry") then
		{
			_results = (call planesArray) select {_x select [1,999] isEqualTo _itemEntrySent};
			if (count _results > 0) then
			{
				_itemEntry = _results select 0;
				_marker = _marker + "_planeSpawn";
			};
		};
	};
	if (!isNil "_itemEntry" && markerShape _marker != "") then
	{
		_itemPrice = _itemEntry select 2;
		_skipSave = "SKIPSAVE" in (_itemEntry select [3,999]);
		if (_player getVariable ["cmoney", 0] >= _itemPrice) then
		{
			private _markerPos = markerPos _marker;
			private _npcPos = getPosASL _storeNPC;
			private _canFloat = (round getNumber (configFile >> "CfgVehicles" >> _class >> "canFloat") > 0);
			private _waterNonBoat = false;
			private "_spawnPosAGL";
			// non-boat spawn over water (e.g. aircraft carrier)
			if (!isNull _storeNPC && surfaceIsWater _npcPos && !_seaSpawn) then
			{
				_markerPos set [2, _npcPos select 2];
				_spawnPosAGL = ASLtoAGL _markerPos;
				_safePos = if (_canFloat) then { _spawnPosAGL } else { ASLtoATL _markerPos };
				_waterNonBoat = true;
			}
			else // normal spawn
			{
				private _water = 0; 
				if (_seaSpawn) then 
				{ 
					_water = 1; 
				}; 
				_safePos = [_markerPos, 0, 25, 5,_water,0,0] call findSafePos; 
				if (count _safePos == 0) then { _safePos = _markerPos };
				_spawnPosAGL = _safePos;
				if (_seaSpawn) then { _safePos vectorAdd [0,0,0.05] };
			};
			// delete wrecks near spawn
			{
				if (!alive _x) then
				{
					deleteVehicle _x;
				};
			} forEach nearestObjects [_spawnPosAGL, ["LandVehicle","Air","Ship"], 25 max sizeOf _class];
			if (_player getVariable [_timeoutKey, true]) then { breakOut "spawnStoreObject" }; // Timeout
			_object = createVehicle [_class, _safePos, [], 0, "NONE"];
			_object setVariable ["moveable", true, true]; 
			if (_waterNonBoat) then
			{
				private _posSurf = getPos _object;
				private _posASL = getPosASL _object;
				if (_posSurf select 2 < 0) then
				{
					_object setPosASL [_posSurf select 0, _posSurf select 1, (_posASL select 2) - (_posSurf select 2) + 0.05];
				};
			};
			if (_player getVariable [_timeoutKey, true]) then // Timeout
			{
				deleteVehicle _object;
				breakOut "spawnStoreObject";
			};
			_objectID = netId _object;
			_object setVariable ["A3W_purchasedStoreObject", true];
			_object setVariable ["ownerUID", getPlayerUID _player, true];
			_object setVariable ["ownerName", name _player, true];
			private _variant = (_itemEntry select {_x isEqualType "" && {_x select [0,8] == "variant_"}}) param [0,""];
			if (_variant != "") then
			{
				_object setVariable ["A3W_vehicleVariant", _variant select [8], true];
			};
			private _isUAV = (round getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") > 0);
			if (_isUAV) then
			{
				createVehicleCrew _object;

				//assign AI to the vehicle so it can actually be used
				[_object, _playerSide, _playerGroup] spawn
				{
					params ["_uav", "_playerSide", "_playerGroup"];
					_grp = [_uav, _playerSide, true] call fn_createCrewUAV;
					if (isNull (_uav getVariable ["ownerGroupUAV", grpNull])) then
					{
						_uav setVariable ["ownerGroupUAV", _playerGroup, true]; // not currently used
					};
				};
			};

			if !(_player getVariable [_timeoutKey, true]) then
			{
				[_player, -_itemPrice] call A3W_fnc_setCMoney;
				_player setVariable [_key, _objectID, true];
			}
			else // Timeout
			{
				if (!isNil "_object") then { deleteVehicle _object };
				breakOut "spawnStoreObject";
			};
			if (_object isKindOf "AllVehicles" && !(_object isKindOf "StaticWeapon")) then
			{
				if (!surfaceIsWater _safePos) then
				{
					_object setPosATL [_safePos select 0, _safePos select 1, 0.05];
				};
				_object setVelocity [0,0,0.01];
				// _object spawn cleanVehicleWreck;
				_object setVariable ["A3W_purchasedVehicle", true, true];
				if (["A3W_vehicleLocking"] call isConfigOn && !_isUAV) then
				{
					[_object, 2] call A3W_fnc_setLockState; // Lock
				};
			};
			_object setDir (if (_object isKindOf "Plane") then { markerDir _marker } else { random 360 });

			_isDamageable = !(_object isKindOf "ReammoBox_F"); // ({_object isKindOf _x} count ["AllVehicles", "Lamps_base_F", "Cargo_Patrol_base_F", "Cargo_Tower_base_F"] > 0);

			[_object] call vehicleSetup;
			_object allowDamage _isDamageable;
			_object setVariable ["allowDamage", _isDamageable, true];
			clearBackpackCargoGlobal _object;

			if ({_object iskindof _x} count 
			[
				"Box_NATO_AmmoVeh_F",
				"Box_EAST_AmmoVeh_F",
				"Box_IND_AmmoVeh_F",
				"B_Slingload_01_Ammo_F",
				"B_Slingload_01_Fuel_F",
				"B_Slingload_01_Medevac_F",
				"B_Slingload_01_Repair_F",
				"StorageBladder_01_fuel_forest_F",
				"StorageBladder_01_fuel_sand_F",
				"Land_fs_feed_F",
				"Land_FuelStation_01_pump_malevil_F",
				"Land_FuelStation_Feed_F",
				"Land_Pod_Heli_Transport_04_fuel_F",
				"Land_Pod_Heli_Transport_04_repair_F",
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
					["Box_NATO_AmmoVeh_F",						5000],
					["Box_EAST_AmmoVeh_F",						5000],
					["Box_IND_AmmoVeh_F",						5000],
					["B_Slingload_01_Ammo_F",					30000],
					["B_Truck_01_ammo_F",						25000],
					["O_Truck_03_ammo_F", 						15000],
					["I_Truck_02_ammo_F",						10000],
					["B_APC_Tracked_01_CRV_F",					500],
					["O_Heli_Transport_04_ammo_F",				20000]

				];
				private _FuelResourcesMax =
				[
					["B_Slingload_01_Fuel_F",					20000],
					["StorageBladder_01_fuel_forest_F",			15000],
					["StorageBladder_01_fuel_sand_F",			15000],
					["Land_fs_feed_F",							100000],
					["Land_FuelStation_01_pump_malevil_F",		100000],
					["Land_FuelStation_Feed_F",					100000],
					["Land_Pod_Heli_Transport_04_fuel_F",		22000],
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
					["B_Slingload_01_Repair_F",					25000],
					["Land_Pod_Heli_Transport_04_repair_F",		22000],
					["C_Offroad_01_repair_F",					500],
					["C_Van_02_service_F",						1000],
					["B_Truck_01_Repair_F",						25000],
					["O_Truck_03_repair_F",						20000],
					["I_Truck_02_box_F",						15000],
					["B_APC_Tracked_01_CRV_F",					500],
					["O_Heli_Transport_04_repair_F",			22000]
				];
				_object setAmmoCargo 0;
				_object setFuelCargo 0;
				_object setRepairCargo 0;
				_object spawn GOM_fnc_addAircraftLoadoutToObject;
				{
					private _check = _x select 0;
					private _value = _x select 1;
					if (_object iskindof _check) then
					{
						_object setVariable ["GOM_fnc_ammoCargo", _value, true];
					};
				} foreach _AmmoResourcesMax;
				{
					private _check = _x select 0;
					private _value = _x select 1;
					if (_object iskindof _check) then
					{
						_object setVariable ["GOM_fnc_fuelCargo", _value, true];
					};
				} foreach _FuelResourcesMax;
				{
					private _check = _x select 0;
					private _value = _x select 1;
					if (_object iskindof _check) then
					{
						_object setVariable ["GOM_fnc_repairCargo", _value, true];
					};
				} foreach _RepairResourcesMax;
			};

			// give diving gear to RHIB, Speedboat, and SDV
			if ({_object isKindOf _x} count ["Boat_Transport_02_base_F","Boat_Armed_01_base_F","SDV_01_base_F"] > 0) then
			{
				switch (side _player) do
				{
					case BLUFOR:
					{
						_object addItemCargoGlobal ["U_B_Wetsuit", 1];
						_object addItemCargoGlobal ["V_RebreatherB", 1];
					};
					case OPFOR:
					{
						_object addItemCargoGlobal ["U_O_Wetsuit", 1];
						_object addItemCargoGlobal ["V_RebreatherIR", 1];
					};
					default
					{
						_object addItemCargoGlobal ["U_I_Wetsuit", 1];
						_object addItemCargoGlobal ["V_RebreatherIA", 1];
					};
				};
				_object addItemCargoGlobal ["G_Diving", 1];
				_object addWeaponCargoGlobal ["arifle_SDAR_F", 1];
				_object addMagazineCargoGlobal ["20Rnd_556x45_UW_mag", 4];
				_object addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 2];
			};
			if (_skipSave) then
			{
				_object setVariable ["A3W_skipAutoSave", true, true];
			}
			else
			{
				if (_object getVariable ["A3W_purchasedVehicle", false] && !isNil "fn_manualVehicleSave") then
				{
					_object call fn_manualVehicleSave;
				};
			};
			if (_object isKindOf "AllVehicles") then
			{
				if (isNull group _object) then
				{
					_object setOwner owner _player; // tentative workaround for exploding vehicles
				}
				else
				{
					(group _object) setGroupOwner owner _player;
				};
			};
		};
	};
};
