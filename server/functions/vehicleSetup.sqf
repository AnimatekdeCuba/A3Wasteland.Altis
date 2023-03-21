// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: vehicleSetup.sqf
//	@file Author: AgentRev, GMG_Monkey
//	@file Created: 15/06/2013 19:57

if (!isServer) exitWith {};

params [["_vehicle",objNull,[objNull]], ["_brandNew",true,[false]]]; // _brandNew: true for newly spawned/purchased vehicle (default), false for vehicles restored from save
private ["_class", "_getInOut", "_centerOfMass", "_weapons"];
_class = typeOf _vehicle;

_vehicle setVariable [call vChecksum, true];

clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;

if !(_class isKindOf "AllVehicles") exitWith {}; // if not actual vehicle, finish here

clearBackpackCargoGlobal _vehicle;

// Disable thermal on all manned vehicles
if (!unitIsUAV _vehicle) then
{
	_vehicle disableTIEquipment true;
};

//Remove This?
if ({_vehicle isKindOf _x} count ["StaticMGWeapon","StaticGrenadeLauncher","StaticMortar"] > 0) then
{
	_vehicle enableWeaponDisassembly false;
};

_vehicle setUnloadInCombat [false, false]; // Try to prevent AI from getting out of vehicles while in combat (not sure if this actually works...)


_vehicle setVariable ["A3W_handleDamageEH", _vehicle addEventHandler ["HandleDamage", vehicleHandleDamage]];
_vehicle setVariable ["A3W_dammagedEH", _vehicle addEventHandler ["Dammaged", vehicleDammagedEvent]];
_vehicle setVariable ["A3W_engineEH", _vehicle addEventHandler ["Engine", vehicleEngineEvent]];

_vehicle addEventHandler ["GetIn", fn_vehicleGetInOutServer];
_vehicle addEventHandler ["GetOut", fn_vehicleGetInOutServer];
_vehicle addEventHandler ["Killed", fn_vehicleKilledServer];

//Setup Vpin
_vehicle setVariable ["vPin", true, true];
_vehicle setVariable ["password", 0000, true];
if ({_class isKindOf _x} count ["Air","UGV_01_base_F"] > 0) then
{
	_vehicle remoteExec ["A3W_fnc_setupAntiExplode", 0, _vehicle];
};

if (_vehicle getVariable ["A3W_resupplyTruck", false] || getNumber (configFile >> "CfgVehicles" >> _class >> "transportAmmo") > 0) then
{
	[_vehicle] remoteExecCall ["A3W_fnc_setupResupplyTruck", 0, _vehicle];
};

[_vehicle, _brandNew] call A3W_fnc_setVehicleLoadout;

// Vehicle customization
switch (true) do
{
	//Disable Autonomous mode
	case ({_vehicle iskindof _x} count ['StaticWeapon','B_Radar_System_01_F', 'O_SAM_System_04_F', 'O_Radar_System_02_F', 'B_SAM_System_03_F']>0):
	{
		_vehicle setAutonomous false;
	};
	//Recon Drones
	case ({_vehicle iskindof _x} count [ "O_UAV_02_F",  "I_UAV_02_F", "B_UAV_02_F" ]>0):
	{ 
	_vehicle animate ["hideweapons",1]; 
	_vehicle removeweapon "missiles_SCALPEL"; 
	}; 
	case (_class isKindOf "SUV_01_base_F"):
	{
		// Lower SUV center of mass to prevent rollovers
		_centerOfMass = getCenterOfMass _vehicle;
		_centerOfMass set [2, -0.657]; // original = -0.557481
		_vehicle setCenterOfMass _centerOfMass;
	};
	case (_class isKindOf "MRAP_02_base_F"):
	{
		// Lower Ifrit center of mass to prevent rollovers
		_centerOfMass = getCenterOfMass _vehicle;
		_centerOfMass set [2, (_centerOfMass select 2) - 0.1]; // cannot be static number like SUV due to different values for each variant
		_vehicle setCenterOfMass _centerOfMass;
	};
	case ({_class isKindOf _x} count ["Heli_Light_01_base_F","Plane_Civil_01_base_F"] > 0):
	{
		// Add flares to poor MH-9 and Caesar BTT
		_vehicle removeWeaponTurret ["CMFlareLauncher", [-1]];

		if (_brandNew) then
		{
			_vehicle addMagazineTurret ["60Rnd_CMFlare_Chaff_Magazine", [-1]];
		};

		_vehicle addWeaponTurret ["CMFlareLauncher", [-1]];
	};
	case (_class isKindOf "Plane_Fighter_03_base_F"):
	{
		if (_brandNew) then
		{
			_vehicle addMagazineTurret ["300Rnd_20mm_shells", [-1]];
		};
	};
	case ({_class isKindOf _x} count ["Wheeled_APC_F","Tank"] > 0):
	{
		// Give smoke launchers to armor drivers and gunners
		{
			_vehicle removeWeaponTurret ["SmokeLauncher", _x];

			if (_brandNew && !("SmokeLauncherMag" in (_vehicle magazinesTurret _x))) then
			{
				_vehicle addMagazineTurret ["SmokeLauncherMag", _x];
			};

			_vehicle addWeaponTurret ["SmokeLauncher", _x];
		} forEach [[-1],[0]];

		// Convert lousy-ass 200Rnd_762x51_Belt mags to 1000Rnd_762x51_Belt, wtf Bohemia
		private _lmgCoaxes = (_vehicle weaponsTurret [0]) arrayIntersect ["LMG_coax","LMG_coax_ext"];

		if !(_lmgCoaxes isEqualTo []) then
		{
			private _200rndMags = (_vehicle magazinesTurret [0]) select {_x select [0,18] == "200Rnd_762x51_Belt"};
			private _magCount = count _200rndMags;
			if (_magCount > 3 && _magCount < 10) then { _magCount = (ceil (_magCount / 5)) * 5 }; // ceil to next multiple of 5

			{ _vehicle removeWeaponTurret [_x,[0]] } forEach _lmgCoaxes;

			if (_brandNew && _magCount >= 5) then
			{
				{ _vehicle removeMagazinesTurret [_x,[0]] } forEach (_200rndMags arrayIntersect _200rndMags); // X arrayIntersect X = filter unique values, forEach 3x faster

				private "_i";
				for "_i" from 1 to floor (_magCount / 5) do
				{
					_vehicle addMagazineTurret ["1000" + (_200rndMags select 0 select [3]), [0]];
				};
			};

			_vehicle addWeaponTurret ["LMG_coax",[0]];
		};
	};
};

// Disable AH-9 painted crosshair when not needed
if (_class isKindOf "Heli_Light_01_armed_base_F" && difficultyOption "weaponCrosshair" > 0) then
{
	_vehicle setObjectTextureGlobal [1,""];
};

_weapons = getArray (configFile >> "CfgVehicles" >> _class >> "weapons");

// Horn customizations
switch (true) do
{
	case ({_x == "TruckHorn"} count _weapons > 0):
	{
		// Replace clown bike horn to something better
		_vehicle removeWeaponTurret ["TruckHorn", [-1]];
		_vehicle addWeaponTurret ["TruckHorn2", [-1]];
	};
	case ({_x == "CarHorn"} count _weapons > 0):
	{
		// Replace other clown bike horn to something better
		_vehicle removeWeaponTurret ["CarHorn", [-1]];
		_vehicle addWeaponTurret ["SportCarHorn", [-1]];
	};
	case (_class isKindOf "Truck_01_base_F"):
	{
		// Give real truck horn to HEMTT
		_vehicle removeWeaponTurret ["TruckHorn2", [-1]];
		_vehicle addWeaponTurret ["TruckHorn3", [-1]];
	};
	case (_class isKindOf "Kart_01_Base_F"):
	{
		// Add quadbike horn to karts
		_vehicle addWeaponTurret ["MiniCarHorn", [-1]];
	};
	case (_class isKindOf "B_GEN_Offroad_01_gen_F"):
	{
		_vehicle removeWeaponTurret ["SportCarHorn", [-1]];
		_vehicle addWeaponTurret ["AmbulanceHorn", [-1]];
	};
};

// Tigris FLAK ADDON
switch (true) do
{
	case ({_class isKindOf _x} count [
	"rhsgref_cdf_b_zsu234",
	"rhsgref_ins_zsu234",
	"rhs_zsu234_aa",
	"rhsgref_ins_g_zsu234",
	"rhsgref_cdf_zsu234",
	"rhsgref_ins_ural_Zu23",
	"rhsgref_ins_gaz66_zu23",
	"rhsgref_ins_ZU23",
	"rhs_gaz66_zu23_msv",
	"RHS_Ural_Zu23_MSV_01",
	"RHS_ZU23_MSV",
	"rhs_gaz66_zu23_vdv",
	"RHS_Ural_Zu23_VDV_01",
	"RHS_ZU23_VDV",
	"rhs_gaz66_zu23_vmf",
	"RHS_Ural_Zu23_VMF_01",
	"RHS_ZU23_VMF",
	"rhs_gaz66_zu23_vv",
	"RHS_Ural_Zu23_VV_01",
	"rhsgref_ins_g_gaz66_zu23",
	"rhsgref_ins_g_ural_Zu23",
	"rhsgref_ins_g_ZU23",
	"rhsgref_cdf_gaz66_zu23",
	"rhsgref_cdf_ural_Zu23",
	"RHSgref_cdf_ZU23",
	"rhsgref_nat_ural_Zu23",
	"rhsgref_nat_ZU23",
	"B_AAA_System_01_",
	"B_T_APC_Tracked_01_AA_",
	"O_APC_Tracked_02_AA_"] > 0):
	{
		// Add FLAK Addon Script turning Autocannons into FLAK cannons.
		this removeMagazinesTurret ["4Rnd_Titan_long_missiles", [0]]; this addEventHandler ["Fired", {deleteVehicle (_this select 6); _this execVM "addons/Flak/flak.sqf";}];
	};
};

// Double minigun ammo to compensate for Bohemia's incompetence (http://feedback.arma3.com/view.php?id=21613)
if (_brandNew) then
{
	{
		_x params ["_mag", "_path"];
		if (_mag select [0,5] != "Pylon" && (toLower getText (configFile >> "CfgMagazines" >> _mag >> "ammo")) find "_minigun_" != -1) then
		{
			_vehicle addMagazineTurret [_mag, _path];
		};
	} forEach magazinesAllTurrets _vehicle;

	private "_magCfg";
	{
		_magCfg = configFile >> "CfgMagazines" >> _x;
		if ((toLower getText (_magCfg >> "ammo")) find "_minigun_" != -1) then
		{
			_vehicle setAmmoOnPylon [_forEachIndex + 1, 2 * getNumber (_magCfg >> "count")];
		};
	} forEach getPylonMagazines _vehicle;
};
