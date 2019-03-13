/*
Authorthen GMG_Monkey
Filenamethen AttachtoVehicle.sqf
Purpose: Attach static weapons and objects to Vehicles
*/

//Define the static weapon
private _static = cursortarget;
//Find the nearest vehicle
private _vehicle = nearestObject [_static, "Car_F"];
//Get the class Names
private _VehClass = typeof _vehicle;
private _StaticClass = typeOf _static;
//Find the position of the static weapon
private _posstatic = getPos _static;
//Find the position of the vehicle
private _posvehicle = getPos _vehicle;
//get the distance between the two objects
private _distance = _posstatic distance _posvehicle;
//Get the name of the vehicle
private _VehDisplayName = gettext (configFile>>"cfgVehicles">>_VehClass>>"displayName");
private _StaticDisplayName = getText (configFile>>"cfgVehicles">>_StaticClass>>"displayName");
private _FailText_CannotAttach = format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName];


private _AttachmentArray =
[
	["StaticWeaponAttached1",		_vehicle getVariable ["StaticWeaponAttached1", 				false]],
	["StaticWeaponAttached2",		_vehicle getVariable ["StaticWeaponAttached2", 				false]],
	["StaticWeaponAttached3",		_vehicle getVariable ["StaticWeaponAttached3", 				false]],
	["StaticWeaponAttached4",		_vehicle getVariable ["StaticWeaponAttached4", 				false]],
	["StaticLDAttached", 			_vehicle getVariable ["StaticLDAttached", 					false]],
	["SAMAttached", 				_vehicle getVariable ["SAMAttached", 						false]],

	["SmallCrateAttached1", 		_vehicle getVariable ["SmallCrateAttached1", 				false]],
	["SmallCrateAttached2", 		_vehicle getVariable ["SmallCrateAttached2", 				false]],
	["SmallCrateAttached3", 		_vehicle getVariable ["SmallCrateAttached3", 				false]],
	["SmallCrateAttached4", 		_vehicle getVariable ["SmallCrateAttached4", 				false]],
	["SmallCrateAttached5", 		_vehicle getVariable ["SmallCrateAttached5", 				false]],
	["SmallCrateAttached6", 		_vehicle getVariable ["SmallCrateAttached6", 				false]],

	["SynCrateAttached1", 			_vehicle getVariable ["SynCrateAttached1", 					false]],
	["SynCrateAttached2", 			_vehicle getVariable ["SynCrateAttached2", 					false]],
	["SynCrateAttached3", 			_vehicle getVariable ["SynCrateAttached3", 					false]],
	["SynCrateAttached4", 			_vehicle getVariable ["SynCrateAttached4", 					false]],
	["SynCrateAttached1-2", 		_vehicle getVariable ["SynCrateAttached1-2", 				true]],
	["SynCrateAttached2-2", 		_vehicle getVariable ["SynCrateAttached2-2", 				true]],
	["SynCrateAttached3-2", 		_vehicle getVariable ["SynCrateAttached3-2", 				true]],
	["SynCrateAttached4-2", 		_vehicle getVariable ["SynCrateAttached4-2", 				true]],

	["SynWepCrateAttached1", 		_vehicle getVariable ["SynWepCrateAttached1", 				false]],
	["SynWepCrateAttached2", 		_vehicle getVariable ["SynWepCrateAttached2", 				false]],
	["SynWepCrateAttached3", 		_vehicle getVariable ["SynWepCrateAttached3", 				false]],
	["SynWepCrateAttached4", 		_vehicle getVariable ["SynWepCrateAttached4", 				false]],
	["SynWepCrateAttached5", 		_vehicle getVariable ["SynWepCrateAttached5", 				false]],
	["SynWepCrateAttached6", 		_vehicle getVariable ["SynWepCrateAttached6", 				false]],
	["SynWepCrateAttached1-2", 		_vehicle getVariable ["SynWepCrateAttached1-2", 			true]],
	["SynWepCrateAttached2-2", 		_vehicle getVariable ["SynWepCrateAttached2-2", 			true]],
	["SynWepCrateAttached3-2", 		_vehicle getVariable ["SynWepCrateAttached3-2", 			true]],
	["SynWepCrateAttached4-2", 		_vehicle getVariable ["SynWepCrateAttached4-2", 			true]],
	["SynWepCrateAttached5-2", 		_vehicle getVariable ["SynWepCrateAttached5-2", 			true]],
	["SynWepCrateAttached6-2", 		_vehicle getVariable ["SynWepCrateAttached6-2", 			true]],
	["SynWepCrateAttached1-3", 		_vehicle getVariable ["SynWepCrateAttached1-3", 			true]],
	["SynWepCrateAttached2-3", 		_vehicle getVariable ["SynWepCrateAttached2-3", 			true]],
	["SynWepCrateAttached3-3", 		_vehicle getVariable ["SynWepCrateAttached3-3", 			true]],
	["SynWepCrateAttached4-3", 		_vehicle getVariable ["SynWepCrateAttached4-3", 			true]],
	["SynWepCrateAttached5-3", 		_vehicle getVariable ["SynWepCrateAttached5-3", 			true]],
	["SynWepCrateAttached6-3", 		_vehicle getVariable ["SynWepCrateAttached6-3", 			true]],
	["SynWepCrateAttached1-4", 		_vehicle getVariable ["SynWepCrateAttached1-4", 			true]],
	["SynWepCrateAttached2-4", 		_vehicle getVariable ["SynWepCrateAttached2-4", 			true]],
	["SynWepCrateAttached3-4", 		_vehicle getVariable ["SynWepCrateAttached3-4", 			true]],
	["SynWepCrateAttached4-4", 		_vehicle getVariable ["SynWepCrateAttached4-4", 			true]],
	["SynWepCrateAttached5-4", 		_vehicle getVariable ["SynWepCrateAttached5-4", 			true]],
	["SynWepCrateAttached6-4", 		_vehicle getVariable ["SynWepCrateAttached6-4", 			true]],

	["BasicWepAttached1", 			_vehicle getVariable ["BasicWepAttached1", 					false]],
	["BasicWepAttached2", 			_vehicle getVariable ["BasicWepAttached2", 					false]],
	["BasicWepAttached3", 			_vehicle getVariable ["BasicWepAttached3", 					false]],
	["BasicWepAttached1-2", 		_vehicle getVariable ["BasicWepAttached1-2", 				true]],
	["BasicWepAttached2-2", 		_vehicle getVariable ["BasicWepAttached2-2", 				true]],
	["BasicWepAttached3-2", 		_vehicle getVariable ["BasicWepAttached3-2", 				true]],

	["SpecialWepAttached1", 		_vehicle getVariable ["SpecialWepAttached1", 				false]],
	["SpecialWepAttached1-2", 		_vehicle getVariable ["SpecialWepAttached1-2", 				true]],

	["EquipmentCrateAttached1", 	_vehicle getVariable ["EquipmentCrateAttached1", 			false]],
	["EquipmentCrateAttached2", 	_vehicle getVariable ["EquipmentCrateAttached2", 			false]],
	["EquipmentCrateAttached3", 	_vehicle getVariable ["EquipmentCrateAttached3", 			false]],
	["EquipmentCrateAttached4", 	_vehicle getVariable ["EquipmentCrateAttached4", 			false]],

	["LauncherCrateAttached1", 		_vehicle getVariable ["LauncherCrateAttached1", 			false]],
	["LauncherCrateAttached2", 		_vehicle getVariable ["LauncherCrateAttached2", 			false]],
	["LauncherCrateAttached3", 		_vehicle getVariable ["LauncherCrateAttached3", 			false]],
	["LauncherCrateAttached3B", 	_vehicle getVariable ["LauncherCrateAttached3B", 			true]],
	["LauncherCrateAttached3B-2", 	_vehicle getVariable ["LauncherCrateAttached3B-2", 			true]],
	["LauncherCrateAttached1-2", 	_vehicle getVariable ["LauncherCrateAttached1-2", 			true]],
	["LauncherCrateAttached2-2", 	_vehicle getVariable ["LauncherCrateAttached2-2", 			true]],
	["LauncherCrateAttached3-2", 	_vehicle getVariable ["LauncherCrateAttached3-2", 			true]],

	["SupplyCrateAttached", 		_vehicle getVariable ["SupplyCrateAttached", 				false]],

	["CargoCratesAttached", 		_vehicle getVariable ["CargoCratesAttached", 				false]],

	["SupportCacheAttached", 		_vehicle getVariable ["SupportCacheAttached", 				false]],

	["AmmoCacheAttached", 			_vehicle getVariable ["AmmoCacheAttached", 					false]],

	["WeaponCacheAttached", 		_vehicle getVariable ["WeaponCacheAttached", 				false]],

	["VehAmmoCrateAttached", 		_vehicle getVariable ["VehAmmoCrateAttached", 				false]],


	["HuronContainerAttached", 		_vehicle getVariable ["HuronContainerAttached", 			false]],
	["TaruContainerAttached", 		_vehicle getVariable ["TaruContainerAttached", 				false]]
];

private _attachLocationArray = [];
private _vehicleSetup = [];
private _variableNameArray = [];
private _TotalBlockers = [];
private _availableArray = [];
private _availableLocArray = [];

// Attachment Points
player globalChat "Finding Attach Location";
switch (true) do
{
	//HMG and GMG
		case ({_static isKindOf _x} count ["HMG_01_base_F","GMG_01_base_F"]>0):
		{
			if ({_static iskindof _x} count ["HMG_01_high_base_F","HMG_01_high_base_F"]>0) then
			{
				switch (true) do
				{
					case (_vehicle iskindof "Offroad_01_base_F"):
					{
						if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
						_attachLocationArray = [["StaticWeaponAttached1",[0.16,-1.6,0.969999]]];
					};
					case ((typeof _vehicle) == "B_Truck_01_transport_F"):
					{
						_attachLocationArray = [["StaticWeaponAttached1",[0.21,-0.34,1.12]],["StaticWeaponAttached2",[-0.07,-2.06,1.12],90],["StaticWeaponAttached3",[0.21,-2.48,1.12],270],["StaticWeaponAttached4",[-0.17,-3.96,1.12],180]];
					};
					default { player globalChat _FailText_CannotAttach};
				};
			}
			else
			{
				switch (true) do
				{
					case (_vehicle iskindof "Offroad_01_base_F"):
					{
						if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
						_attachLocationArray = [["StaticWeaponAttached1",[-0.14,-1.86,0.46],180]];
						_vehicleSetup = [["HideDoor3",1]];
					};
					default { player globalChat _FailText_CannotAttach};
				};
			};
		};
	//AT and AA
		case ({_static isKindOf _x} count  ["AA_01_base_F","AT_01_base_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["StaticWeaponAttached1",[-0.01,-1.63,0.31],180]];
				};
				case ((typeof _vehicle) == "B_Truck_01_transport_F"):
				{
					_attachLocationArray = [["StaticWeaponAttached1",[0.21,-0.34,1.12]],["StaticWeaponAttached2",[-0.07,-2.06,1.12],90],["StaticWeaponAttached3",[0.21,-2.48,1.12],270],["StaticWeaponAttached4",[-0.17,-3.96,1.12],180]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
	//Mortor
		case (_static isKindOf "Mortar_01_base_F"):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["StaticWeaponAttached1",[-0.11,-2.17,0.0500001]]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
	//Static LDs
		case ({_static iskindof _x} count ["Static_Designator_01_base_F","Static_Designator_02_base_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["StaticLDAttached",[-0.02,0,0.939999]]];
				};
			};
			default { player globalChat _FailText_CannotAttach};
		};
	//SAM Turrets
		case (_static isKindOf "B_SAM_System_02_F"):
		{
			switch (true) do
			{
				case (_vehicle iskindof "UGV_01_base_F"):
				{
					if (_vehicle iskindof "UGV_01_rcws_base_F") exitwith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["SAMAttached",[0.4,-0.5,1.2]]];
				};
				case (_vehicle iskindof "B_Truck_01_mover_F"):
				{
					//if (_vehicle iskindof "B_Truck_01_mover_F") exitwith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["SAMAttached",[1.49012e-008,-3.1,1.6]]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
		case (_static isKindOf "B_SAM_System_01_F"):
		{
			switch (true) do
			{
				case (_vehicle iskindof "UGV_01_base_F"):
				{
					if (_vehicle iskindof "UGV_01_rcws_base_F") exitwith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["SAMAttached",[0.4,-0.5,0.9]]];
				};
				case (_vehicle iskindof "B_Truck_01_mover_F"):
				{
					//if (_vehicle iskindof "B_Truck_01_mover_F") exitwith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["SAMAttached",[1.49012e-008,-3.1,1.37]]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
		case (_static isKindOf "B_AAA_System_01_F"):
		{
			switch (true) do
			{
				case (_vehicle iskindof "UGV_01_base_F"):
				{
					if (_vehicle iskindof "UGV_01_rcws_base_F") exitwith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["SAMAttached",[0.5,-0.2,1.6]]];
				};
				case (_vehicle iskindof "B_Truck_01_mover_F"):
				{
					//if (_vehicle iskindof "B_Truck_01_mover_F") exitwith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["SAMAttached",[1.49012e-008,-2.6,2.15]]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
	//Small Supply Crates
		case ({_static isKindOf _x} count ["Box_IND_Ammo_F","Box_T_East_Ammo_F","Box_East_Ammo_F","Box_NATO_Ammo_F","Box_IND_AmmoOrd_F","Box_East_AmmoOrd_F","Box_IDAP_AmmoOrd_F","Box_NATO_AmmoOrd_F","Box_IND_Grenades_F","Box_East_Grenades_F","Box_NATO_Grenades_F","Box_IND_Support_F","Box_East_Support_F","Box_NATO_Support_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["SmallCrateAttached1",[-0.42,-1.02,-0.37]],["SmallCrateAttached2",[0.02,-1.02,-0.37]],["SmallCrateAttached3",[-0.42,-1.68,-0.37]],["SmallCrateAttached4",[0.02,-1.68,-0.37]],["SmallCrateAttached5",[-0.42,-2.34,-0.37]],["SmallCrateAttached6",[0.02,-2.34,-0.37]]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
	//Syndicate Crates
		case ({_static isKindOf _x} count ["Box_Syndicate_Ammo_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["SynCrateAttached1",[-0.41,-1.15,-0.47],90],["SynCrateAttached2",[0.11,-1.16,-0.47],90],["SynCrateAttached3",[-0.43,-1.98,-0.47],90],["SynCrateAttached4",[0.09,-1.98,-0.47],90],["SynCrateAttached1-2",[-0.42,-1.15,-0.05],90],["SynCrateAttached2-2",[0.09,-1.15,-0.05],90],["SynCrateAttached3-2",[-0.44,-1.98,-0.05],90],["SynCrateAttached4-2",[0.07,-1.98,-0.05],90]];
				};
			};
			default { player globalChat _FailText_CannotAttach};
		};
		case ({_static isKindOf _x} count ["Box_IED_Exp_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["SynCrateAttached1",[-0.41,-1.15,-0.47],90],["SynCrateAttached2",[0.11,-1.16,-0.47],90],["SynCrateAttached3",[-0.43,-1.98,-0.47],90],["SynCrateAttached4",[0.09,-1.98,-0.47],90],["SynCrateAttached1-2",[-0.42,-1.15,-0.05],90],["SynCrateAttached2-2",[0.09,-1.15,-0.05],90],["SynCrateAttached3-2",[-0.44,-1.98,-0.05],90],["SynCrateAttached4-2",[0.07,-1.98,-0.05],90]];
				};
			};
			default { player globalChat _FailText_CannotAttach};
		};
		case ({_static isKindOf _x} count ["Box_Syndicate_Wps_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["SynWepCrateAttached1",[-0.46,-1.22,-0.6],90],["SynWepCrateAttached2",[-0.05,-1.22,-0.6],90],["SynWepCrateAttached3",[0.36,-1.22,-0.6],90],["SynWepCrateAttached4",[-0.46,-2.14,-0.6],90],["SynWepCrateAttached5",[-0.05,-2.14,-0.6],90],["SynWepCrateAttached6",[0.36,-2.14,-0.6],90],["SynWepCrateAttached1-2",[-0.46,-1.23,-0.46],90],["SynWepCrateAttached2-2",[-0.05,-1.23,-0.46],90],["SynWepCrateAttached3-2",[0.36,-1.23,-0.46],90],["SynWepCrateAttached4-2",[-0.46,-2.15,-0.46],90],["SynWepCrateAttached5-2",[-0.05,-2.15,-0.46],90],["SynWepCrateAttached6-2",[0.36,-2.15,-0.46],90],["SynWepCrateAttached1-3",[-0.46,-1.24,-0.32],90],["SynWepCrateAttached2-3",[-0.05,-1.24,-0.32],90],["SynWepCrateAttached3-3",[0.36,-1.24,-0.32],90],["SynWepCrateAttached4-3",[-0.46,-2.16,-0.32],90],["SynWepCrateAttached5-3",[-0.05,-2.16,-0.32],90],["SynWepCrateAttached6-3",[0.36,-2.16,-0.32],90],["SynWepCrateAttached1-4",[-0.46,-1.24,-0.19],90],["SynWepCrateAttached2-4",[-0.05,-1.24,-0.19],90],["SynWepCrateAttached3-4",[0.36,-1.24,-0.19],90],["SynWepCrateAttached4-4",[-0.46,-2.16,-0.19],90],["SynWepCrateAttached5-4",[-0.05,-2.16,-0.19],90],["SynWepCrateAttached6-4",[0.36,-2.16,-0.19],90]];
				};
			};
			default { player globalChat _FailText_CannotAttach};
		};
	//Basic Weapons Crates
		case ({_static isKindOf _x} count ["Box_IND_Wps_F","Box_East_Wps_F","Box_T_NATO_Wps_F","Box_T_East_Wps_F","Box_NATO_Wps_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["BasicWepAttached1",[-0.04,-1.04,-0.53]],["BasicWepAttached2",[-0.04,-1.72,-0.53]],["BasicWepAttached3",[-0.04,-2.4,-0.53]],["BasicWepAttached1-2",[-0.04,-1.03,-0.2]],["BasicWepAttached2-2",[-0.04,-1.71,-0.2]],["BasicWepAttached3-2",[-0.04,-2.39,-0.2]]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
	//Special Weapon Crates
		case ({_static isKindOf _x} count ["Box_IND_WpsSpecial_F","Box_T_East_WpsSpecial_F","Box_East_WpsSpecial_F","Box_T_NATO_WpsSpecial_F","Box_NATO_WpsSpecial_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["SpecialWepAttached1",[-0.30,-1.79,-0.51],90], ["SpecialWepAttached1-2",[-0.30,-1.79,-0.19],90]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
	//Equipment Crates
		case ({_static isKindOf _x} count ["Box_GEN_Equip_F","Box_AAF_Uniforms_F","Box_CSAT_Uniforms_F","Box_IDAP_Uniforms_F","Box_NATO_Uniforms_F","Box_AAF_Equip_F","Box_IDAP_Equip_F","Box_CSAT_Equip_F","Box_NATO_Equip_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["EquipmentCrateAttached1",[0,-1.02,-0.31],90],["EquipmentCrateAttached2",[0,-1.62,-0.31],90],["EquipmentCrateAttached3",[0,-2.22,-0.31],90]];
				};
			};
			default { player globalChat _FailText_CannotAttach};
		};
	//Launcher Crates
		case ({_static isKindOf _x} count ["Box_IND_WpsLaunch_F","Box_East_WpsLaunch_F","Box_NATO_WpsLaunch_F","Box_Syndicate_WpsLaunch_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["LauncherCrateAttached1",[-0.5,-1.76,-0.47],90],["LauncherCrateAttached2",[-0.15,-1.76,-0.47],90],["LauncherCrateAttached3",[0.2,-1.76,-0.47],90],["LauncherCrateAttached3B",[0.43,-1.75,-0.53],90],["LauncherCrateAttached3B-2", [0.43,-1.75,-0.18],90],["LauncherCrateAttached1-2",[-0.5,-1.76,-0.14],90],["LauncherCrateAttached2-2",[-0.15,-1.76,-0.14],90], ["LauncherCrateAttached3-2",[0.2,-1.76,-0.14],90]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
	//Supply Crates
		case ({_static isKindOf _x} count ["I_supplyCrate_F","O_supplyCrate_F","C_T_supplyCrate_F","C_supplyCrate_F","IG_supplyCrate_F","C_IDAP_supplyCrate_F","B_supplyCrate_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["SupplyCrateAttached",[1.49012e-008,-1.3,1.7],90]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
	//Cargo Net Crates
		case ({_static isKindOf _x} count ["CargoNet_01_box_F","I_CargoNet_01_ammo_F","O_CargoNet_01_ammo_F","C_IDAP_CargoNet_01_supplies_F","B_CargoNet_01_ammo_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["CargoCratesAttached",[1.49012e-008,-1.2,1.7]]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
	//Caches
		case ({_static isKindOf _x} count ["Box_FIA_Support_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["SupportCacheAttached",[-0.1,-2,1.5]]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
		case ({_static isKindOf _x} count ["Box_FIA_Ammo_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["AmmoCacheAttached",[-0.1,-2,1.5]]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
		case ({_static isKindOf _x} count ["Box_FIA_Wps_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["WeaponCacheAttached",[-0.1,-2,1.5]]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
	//Vehicle Ammo Crates
		case ({_static isKindOf _x} count ["Box_NATO_AmmoVeh_F","Box_EAST_AmmoVeh_F","Box_IND_AmmoVeh_F"]>0):
		{
			switch (true) do
			{
				case (_vehicle iskindof "Offroad_01_base_F"):
				{
					if ({_vehicle iskindof _x} count ["Offroad_01_AT_base_F","Offroad_01_armed_base_F","Offroad_01_repair_base_F"]>0) exitWith { player globalChat format ["Cannot Attach %1 to %2",  _StaticDisplayName, _VehDisplayName]};
					_attachLocationArray = [["VehAmmoCrateAttached",[0,-1.71,0.29]]];
					_vehicleSetup = [["HideDoor3",0]];
				};
				default { player globalChat _FailText_CannotAttach};
			};
		};
	//Huron Containers
		case ({_static isKindOf _x} count ["B_Slingload_01_Ammo_F","B_Slingload_01_Cargo_F","B_Slingload_01_Fuel_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F"]>0):
		{
			switch (true) do
			{
				default { player globalChat _FailText_CannotAttach};
			};
			_variableNameArray =
			[
				["HuronContainerAttached", 0]
			];
		};
	//Taru Containers
		case ({_static isKindOf _x} count ["Land_Pod_Heli_Transport_04_ammo_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_repair_F"]>0):
		{
			switch (true) do
			{
				default { player globalChat _FailText_CannotAttach};
			};
			_variableNameArray =
			[
				["TaruContainerAttached", 0]
			];
		};
};
player globalChat format ["Attach Location Array", _attachLocationArray];

{
	private _Location = _x select 0;
	private _inUse = _x select 1;
	if !(_inuse) then
	{
		_availableArray pushback _Location;
	};
} foreach _AttachmentArray;
player globalChat format ["Available Array = %1", _availableArray];
player globalChat format ["Attachment Location Array = %1", _attachLocationArray];

{
	private _AttachLocationName = _x select 0;
	private _AttachCoords = _x select 1;
	private _rot = 0;
	if (_x select 2 != 0) then
	{
		_rot = _x select 2;
	};
	player globalChat format ["object rotation = %1", _rot];
	{
		private _available = _x;
		player globalchat format ["%1 ?= %2", _AttachLocationName, _available];
		if (_AttachLocationName == _available) then
		{
			_availableLocArray pushback [_AttachLocationName, _AttachCoords, _rot];
		};
	} foreach _availableArray;
} foreach _attachLocationArray;
player globalChat format ["Available Locations = %1", _availableLocArray];
private _ocluded = [];
private _enabled = [];
player globalChat format ["%1 Available", count _availableLocArray];
if ((count _availableLocArray) > 0) then
{
	player globalChat format ["Attempting to attach %1 to %2", _StaticDisplayName, _VehDisplayName];
	private _AttachPoint = _availableLocArray select 0;
	private _AttachName = _AttachPoint select 0;
	private _attachLocation = _AttachPoint select 1;
	private _rotation = _AttachPoint select 2;
	player globalChat format ["object rotation = %1", _rotation];
	[_static, _vehicle, _attachLocation, _rotation,_vehicleSetup] remoteExecCall ["GMG_fnc_AttachObject", 0];
	switch (true) do
	{
		case (_vehicle iskindof "Offroad_01_base_F"):
		{
			switch (_AttachName) do
			{
				case "StaticWeaponAttached1":
				{
					_ocluded = ["StaticWeaponAttached1","StaticLDAttached","SAMAttached","SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached1","SynCrateAttached2","SynCrateAttached3","SynCrateAttached4","SynCrateAttached1-2","SynCrateAttached2-2","SynCrateAttached3-2","SynCrateAttached4-2","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached3","SynWepCrateAttached4","SynWepCrateAttached1-2","SynWepCrateAttached2-2","SynWepCrateAttached3-2","SynWepCrateAttached4-2","SynWepCrateAttached1-3","SynWepCrateAttached2-3","SynWepCrateAttached3-3","SynWepCrateAttached4-3","SynWepCrateAttached1-4","SynWepCrateAttached2-4","SynWepCrateAttached3-4","SynWepCrateAttached4-4","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","BasicWepAttached1-2","BasicWepAttached2-2","BasicWepAttached3-2","SpecialWepAttached1","SpecialWepAttached1-2","EquipmentCrateAttached1","EquipmentCrateAttached2","EquipmentCrateAttached3","EquipmentCrateAttached4","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","LauncherCrateAttached3B","LauncherCrateAttached3B-2","LauncherCrateAttached1-2","LauncherCrateAttached2-2","LauncherCrateAttached3-2","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached","HuronContainerAttached","TaruContainerAttached"];

				};
				case "StaticLDAttached":{};
				case "SAMAttached":
				{
					_ocluded = ["StaticWeaponAttached1","StaticLDAttached","SAMAttached","SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached1","SynCrateAttached2","SynCrateAttached3","SynCrateAttached4","SynCrateAttached1-2","SynCrateAttached2-2","SynCrateAttached3-2","SynCrateAttached4-2","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached3","SynWepCrateAttached4","SynWepCrateAttached1-2","SynWepCrateAttached2-2","SynWepCrateAttached3-2","SynWepCrateAttached4-2","SynWepCrateAttached1-3","SynWepCrateAttached2-3","SynWepCrateAttached3-3","SynWepCrateAttached4-3","SynWepCrateAttached1-4","SynWepCrateAttached2-4","SynWepCrateAttached3-4","SynWepCrateAttached4-4","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","BasicWepAttached1-2","BasicWepAttached2-2","BasicWepAttached3-2","SpecialWepAttached1","SpecialWepAttached1-2","EquipmentCrateAttached1","EquipmentCrateAttached2","EquipmentCrateAttached3","EquipmentCrateAttached4","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","LauncherCrateAttached3B","LauncherCrateAttached3B-2","LauncherCrateAttached1-2","LauncherCrateAttached2-2","LauncherCrateAttached3-2","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached","HuronContainerAttached","TaruContainerAttached"];
				};
				case "SmallCrateAttached1":
				{
					_ocluded = ["SynCrateAttached1","SynWepCrateAttached1","BasicWepAttached1","EquipmentCrateAttached1","LauncherCrateAttached1","LauncherCrateAttached2","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "SmallCrateAttached2":
				{
					_ocluded = ["SynCrateAttached2","SynWepCrateAttached2","BasicWepAttached1","EquipmentCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["LauncherCrateAttached3B"];
				};
				case "SmallCrateAttached3":
				{
					_ocluded = ["SynCrateAttached1","SynCrateAttached3","SynWepCrateAttached1","SynWepCrateAttached3","BasicWepAttached2","EquipmentCrateAttached2","LauncherCrateAttached1","LauncherCrateAttached2","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "SmallCrateAttached4":
				{
					_ocluded = ["SynCrateAttached2","SynCrateAttached4","SynWepCrateAttached2","SynWepCrateAttached4","BasicWepAttached2","EquipmentCrateAttached2","LauncherCrateAttached2","LauncherCrateAttached3","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "SmallCrateAttached5":
				{
					_ocluded = ["SynCrateAttached3","SynWepCrateAttached3","BasicWepAttached3","EquipmentCrateAttached3","EquipmentCrateAttached4","LauncherCrateAttached1","LauncherCrateAttached2","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "SmallCrateAttached6":
				{
					_ocluded = ["SynCrateAttached4","SynWepCrateAttached4","BasicWepAttached3","EquipmentCrateAttached4","LauncherCrateAttached2","LauncherCrateAttached3","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "SynCrateAttached1":
				{
					_ocluded = ["SmallCrateAttached1","SmallCrateAttached3","SynWepCrateAttached1","SynWepCrateAttached2","BasicWepAttached1","BasicWepAttached2","EquipmentCrateAttached1","EquipmentCrateAttached2","LauncherCrateAttached1","LauncherCrateAttached2","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynCrateAttached1-2"];
				};
				case "SynCrateAttached2":
				{
					_ocluded = ["SmallCrateAttached2","SmallCrateAttached4","SynWepCrateAttached2","SynWepCrateAttached3","BasicWepAttached1","BasicWepAttached2","EquipmentCrateAttached1","EquipmentCrateAttached2","LauncherCrateAttached2","LauncherCrateAttached3","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynCrateAttached2-2"];
				};
				case "SynCrateAttached3":
				{
					_ocluded = ["SmallCrateAttached3","SmallCrateAttached5","SynWepCrateAttached4","SynWepCrateAttached5","BasicWepAttached2","BasicWepAttached3","EquipmentCrateAttached2","EquipmentCrateAttached3","LauncherCrateAttached1","LauncherCrateAttached2","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynCrateAttached3-2"];
				};
				case "SynCrateAttached4":
				{
					_ocluded = ["SmallCrateAttached4","SmallCrateAttached6","SynWepCrateAttached5","SynWepCrateAttached6","BasicWepAttached2","BasicWepAttached3","EquipmentCrateAttached2","EquipmentCrateAttached3","LauncherCrateAttached2","LauncherCrateAttached3","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynCrateAttached4-2"];
				};
				case "SynCrateAttached1-2":
				{
					_ocluded = [];
				};
				case "SynCrateAttached2-2":
				{
					_ocluded = [];
				};
				case "SynCrateAttached3-2":
				{
					_ocluded = [];
				};
				case "SynCrateAttached4-2":
				{
					_ocluded = [];
				};
				case "SynWepCrateAttached1":
				{
					_ocluded = ["SmallCrateAttached1","SmallCrateAttached3","SynCrateAttached1","SynCrateAttached3","BasicWepAttached1","BasicWepAttached2","EquipmentCrateAttached1","EquipmentCrateAttached2","LauncherCrateAttached1","LauncherCrateAttached2","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached1-2"];
				};
				case "SynWepCrateAttached2":
				{
					_ocluded = ["SmallCrateAttached2","SmallCrateAttached4","SynCrateAttached1","SynCrateAttached2","BasicWepAttached1","BasicWepAttached2","EquipmentCrateAttached1","EquipmentCrateAttached2","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached2-2","LauncherCrateAttached3B"];
				};
				case "SynWepCrateAttached3":
				{
					_ocluded = ["LauncherCrateAttached3","LauncherCrateAttached3B","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached3-2"];
				};
				case "SynWepCrateAttached4":
				{
					_ocluded = ["SmallCrateAttached3","SmallCrateAttached5","SynCrateAttached3","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","EquipmentCrateAttached2","EquipmentCrateAttached3","LauncherCrateAttached1","LauncherCrateAttached2","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached4-2"];
				};
				case "SynWepCrateAttached5":
				{
					_ocluded = ["SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached4","BasicWepAttached2","BasicWepAttached3","EquipmentCrateAttached2","EquipmentCrateAttached3","LauncherCrateAttached2","LauncherCrateAttached3","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached5-2"];
				};
				case "SynWepCrateAttached6":
				{
					_ocluded = ["SmallCrateAttached4","SmallCrateAttached6","SynCrateAttached4","BasicWepAttached2","BasicWepAttached3","EquipmentCrateAttached2","EquipmentCrateAttached3","LauncherCrateAttached3B","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached6-2"];
				};
				case "SynWepCrateAttached1-2":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached1-3"];
				};
				case "SynWepCrateAttached2-2":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached2-3"];
				};
				case "SynWepCrateAttached3-2":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached3-3"];
				};
				case "SynWepCrateAttached4-2":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached4-3"];
				};
				case "SynWepCrateAttached5-2":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached5-3"];
				};
				case "SynWepCrateAttached6-2":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached6-3"];
				};
				case "SynWepCrateAttached1-3":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached1-4"];
				};
				case "SynWepCrateAttached2-3":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached2-4"];
				};
				case "SynWepCrateAttached3-3":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached3-4"];
				};
				case "SynWepCrateAttached4-3":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached4-4"];
				};
				case "SynWepCrateAttached5-3":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached5-4"];
				};
				case "SynWepCrateAttached6-3":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SynWepCrateAttached6-4"];
				};
				case "SynWepCrateAttached1-4":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "SynWepCrateAttached2-4":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "SynWepCrateAttached3-4":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "SynWepCrateAttached4-4":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "BasicWepAttached1":
				{
					_ocluded = ["SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SynCrateAttached1","SynCrateAttached2","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached3","EquipmentCrateAttached1","EquipmentCrateAttached2","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["BasicWepAttached1-2"];
				};
				case "BasicWepAttached2":
				{
					_ocluded = ["SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached1","SynCrateAttached2","SynCrateAttached3","SynCrateAttached4","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached3","SynWepCrateAttached4","SynWepCrateAttached5","SynWepCrateAttached6","EquipmentCrateAttached2","EquipmentCrateAttached3","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","LauncherCrateAttached3B","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["BasicWepAttached2-2"];
				};
				case "BasicWepAttached3":
				{
					_ocluded = ["SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached3","SynCrateAttached4","SynWepCrateAttached4","SynWepCrateAttached5","SynWepCrateAttached6","EquipmentCrateAttached3","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","LauncherCrateAttached3B","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["BasicWepAttached3-2"];
				};
				case "BasicWepAttached1-2":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "BasicWepAttached2-2":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "BasicWepAttached3-2":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "SpecialWepAttached1":
				{
					_ocluded = ["SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached1","SynCrateAttached2","SynCrateAttached3","SynCrateAttached4","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached4","SynWepCrateAttached5","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","EquipmentCrateAttached1","EquipmentCrateAttached2","EquipmentCrateAttached3","LauncherCrateAttached1","LauncherCrateAttached2","StaticWeaponAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["SpecialWepAttached1-2"];
				};
				case "SpecialWepAttached1-2":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "EquipmentCrateAttached1":
				{
					_ocluded = ["SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SynCrateAttached1","SynCrateAttached2","SynWepCrateAttached1","SynWepCrateAttached2","BasicWepAttached1","BasicWepAttached2","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "EquipmentCrateAttached2":
				{
					_ocluded = ["SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SynCrateAttached1","SynCrateAttached2","SynCrateAttached3","SynCrateAttached4","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached3","SynWepCrateAttached4","BasicWepAttached1","BasicWepAttached2","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","LauncherCrateAttached3B","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "EquipmentCrateAttached3":
				{
					_ocluded = ["SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached3","SynCrateAttached4","SynWepCrateAttached4","SynWepCrateAttached5","SynWepCrateAttached6","BasicWepAttached3", "LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","LauncherCrateAttached3B","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "EquipmentCrateAttached4":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "LauncherCrateAttached1":
				{
					_ocluded = ["SmallCrateAttached1","SmallCrateAttached3","SmallCrateAttached5","SynCrateAttached1","SynCrateAttached3","SynWepCrateAttached1","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","EquipmentCrateAttached1","EquipmentCrateAttached2","EquipmentCrateAttached3","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					_enabled = ["LauncherCrateAttached1-2"];
				};
				case "LauncherCrateAttached2":
				{
					_ocluded = ["SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached1","SynCrateAttached2","SynCrateAttached4","SynWepCrateAttached5","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached4","SynWepCrateAttached5","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","EquipmentCrateAttached1","EquipmentCrateAttached2","EquipmentCrateAttached3","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					
					_enabled = ["LauncherCrateAttached2-2"];
				};
				case "LauncherCrateAttached3":
				{
					_ocluded = ["SmallCrateAttached2","SmallCrateAttached4","SmallCrateAttached6","SynCrateAttached2","SynCrateAttached4","SynWepCrateAttached2","SynWepCrateAttached3","SynWepCrateAttached5","SynWepCrateAttached6","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","EquipmentCrateAttached1","EquipmentCrateAttached2","EquipmentCrateAttached3","StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					
					_enabled = ["LauncherCrateAttached3-2"];
				};
				case "LauncherCrateAttached3B":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
					
					_enabled = ["LauncherCrateAttached3B-2"];
				};
				case "LauncherCrateAttached3B-2":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "LauncherCrateAttached1-2":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "LauncherCrateAttached2-2":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "LauncherCrateAttached3-2":
				{
					_ocluded = ["StaticWeaponAttached1","SpecialWepAttached1","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached"];
				};
				case "SupplyCrateAttached":
				{
					_ocluded = ["StaticWeaponAttached1","StaticLDAttached","SAMAttached","SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached1","SynCrateAttached2","SynCrateAttached3","SynCrateAttached4","SynCrateAttached1-2","SynCrateAttached2-2","SynCrateAttached3-2","SynCrateAttached4-2","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached3","SynWepCrateAttached4","SynWepCrateAttached1-2","SynWepCrateAttached2-2","SynWepCrateAttached3-2","SynWepCrateAttached4-2","SynWepCrateAttached1-3","SynWepCrateAttached2-3","SynWepCrateAttached3-3","SynWepCrateAttached4-3","SynWepCrateAttached1-4","SynWepCrateAttached2-4","SynWepCrateAttached3-4","SynWepCrateAttached4-4","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","BasicWepAttached1-2","BasicWepAttached2-2","BasicWepAttached3-2","SpecialWepAttached1","SpecialWepAttached1-2","EquipmentCrateAttached1","EquipmentCrateAttached2","EquipmentCrateAttached3","EquipmentCrateAttached4","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","LauncherCrateAttached3B","LauncherCrateAttached3B-2","LauncherCrateAttached1-2","LauncherCrateAttached2-2","LauncherCrateAttached3-2","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached","HuronContainerAttached","TaruContainerAttached"];
				};
				case "CargoCratesAttached":
				{
					_ocluded = ["StaticWeaponAttached1","StaticLDAttached","SAMAttached","SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached1","SynCrateAttached2","SynCrateAttached3","SynCrateAttached4","SynCrateAttached1-2","SynCrateAttached2-2","SynCrateAttached3-2","SynCrateAttached4-2","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached3","SynWepCrateAttached4","SynWepCrateAttached1-2","SynWepCrateAttached2-2","SynWepCrateAttached3-2","SynWepCrateAttached4-2","SynWepCrateAttached1-3","SynWepCrateAttached2-3","SynWepCrateAttached3-3","SynWepCrateAttached4-3","SynWepCrateAttached1-4","SynWepCrateAttached2-4","SynWepCrateAttached3-4","SynWepCrateAttached4-4","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","BasicWepAttached1-2","BasicWepAttached2-2","BasicWepAttached3-2","SpecialWepAttached1","SpecialWepAttached1-2","EquipmentCrateAttached1","EquipmentCrateAttached2","EquipmentCrateAttached3","EquipmentCrateAttached4","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","LauncherCrateAttached3B","LauncherCrateAttached3B-2","LauncherCrateAttached1-2","LauncherCrateAttached2-2","LauncherCrateAttached3-2","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached","HuronContainerAttached","TaruContainerAttached"];
				};
				case "SupportCacheAttached":
				{
					_ocluded = ["StaticWeaponAttached1","StaticLDAttached","SAMAttached","SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached1","SynCrateAttached2","SynCrateAttached3","SynCrateAttached4","SynCrateAttached1-2","SynCrateAttached2-2","SynCrateAttached3-2","SynCrateAttached4-2","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached3","SynWepCrateAttached4","SynWepCrateAttached1-2","SynWepCrateAttached2-2","SynWepCrateAttached3-2","SynWepCrateAttached4-2","SynWepCrateAttached1-3","SynWepCrateAttached2-3","SynWepCrateAttached3-3","SynWepCrateAttached4-3","SynWepCrateAttached1-4","SynWepCrateAttached2-4","SynWepCrateAttached3-4","SynWepCrateAttached4-4","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","BasicWepAttached1-2","BasicWepAttached2-2","BasicWepAttached3-2","SpecialWepAttached1","SpecialWepAttached1-2","EquipmentCrateAttached1","EquipmentCrateAttached2","EquipmentCrateAttached3","EquipmentCrateAttached4","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","LauncherCrateAttached3B","LauncherCrateAttached3B-2","LauncherCrateAttached1-2","LauncherCrateAttached2-2","LauncherCrateAttached3-2","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached","HuronContainerAttached","TaruContainerAttached"];
				};
				case "AmmoCacheAttached":
				{
					_ocluded = ["StaticWeaponAttached1","StaticLDAttached","SAMAttached","SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached1","SynCrateAttached2","SynCrateAttached3","SynCrateAttached4","SynCrateAttached1-2","SynCrateAttached2-2","SynCrateAttached3-2","SynCrateAttached4-2","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached3","SynWepCrateAttached4","SynWepCrateAttached1-2","SynWepCrateAttached2-2","SynWepCrateAttached3-2","SynWepCrateAttached4-2","SynWepCrateAttached1-3","SynWepCrateAttached2-3","SynWepCrateAttached3-3","SynWepCrateAttached4-3","SynWepCrateAttached1-4","SynWepCrateAttached2-4","SynWepCrateAttached3-4","SynWepCrateAttached4-4","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","BasicWepAttached1-2","BasicWepAttached2-2","BasicWepAttached3-2","SpecialWepAttached1","SpecialWepAttached1-2","EquipmentCrateAttached1","EquipmentCrateAttached2","EquipmentCrateAttached3","EquipmentCrateAttached4","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","LauncherCrateAttached3B","LauncherCrateAttached3B-2","LauncherCrateAttached1-2","LauncherCrateAttached2-2","LauncherCrateAttached3-2","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached","HuronContainerAttached","TaruContainerAttached"];
				};
				case "WeaponCacheAttached":
				{
					_ocluded = ["StaticWeaponAttached1","StaticLDAttached","SAMAttached","SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached1","SynCrateAttached2","SynCrateAttached3","SynCrateAttached4","SynCrateAttached1-2","SynCrateAttached2-2","SynCrateAttached3-2","SynCrateAttached4-2","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached3","SynWepCrateAttached4","SynWepCrateAttached1-2","SynWepCrateAttached2-2","SynWepCrateAttached3-2","SynWepCrateAttached4-2","SynWepCrateAttached1-3","SynWepCrateAttached2-3","SynWepCrateAttached3-3","SynWepCrateAttached4-3","SynWepCrateAttached1-4","SynWepCrateAttached2-4","SynWepCrateAttached3-4","SynWepCrateAttached4-4","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","BasicWepAttached1-2","BasicWepAttached2-2","BasicWepAttached3-2","SpecialWepAttached1","SpecialWepAttached1-2","EquipmentCrateAttached1","EquipmentCrateAttached2","EquipmentCrateAttached3","EquipmentCrateAttached4","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","LauncherCrateAttached3B","LauncherCrateAttached3B-2","LauncherCrateAttached1-2","LauncherCrateAttached2-2","LauncherCrateAttached3-2","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached","HuronContainerAttached","TaruContainerAttached"];
				};
				case "VehAmmoCrateAttached":
				{
					_ocluded = ["StaticWeaponAttached1","StaticLDAttached","SAMAttached","SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached1","SynCrateAttached2","SynCrateAttached3","SynCrateAttached4","SynCrateAttached1-2","SynCrateAttached2-2","SynCrateAttached3-2","SynCrateAttached4-2","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached3","SynWepCrateAttached4","SynWepCrateAttached1-2","SynWepCrateAttached2-2","SynWepCrateAttached3-2","SynWepCrateAttached4-2","SynWepCrateAttached1-3","SynWepCrateAttached2-3","SynWepCrateAttached3-3","SynWepCrateAttached4-3","SynWepCrateAttached1-4","SynWepCrateAttached2-4","SynWepCrateAttached3-4","SynWepCrateAttached4-4","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","BasicWepAttached1-2","BasicWepAttached2-2","BasicWepAttached3-2","SpecialWepAttached1","SpecialWepAttached1-2","EquipmentCrateAttached1","EquipmentCrateAttached2","EquipmentCrateAttached3","EquipmentCrateAttached4","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","LauncherCrateAttached3B","LauncherCrateAttached3B-2","LauncherCrateAttached1-2","LauncherCrateAttached2-2","LauncherCrateAttached3-2","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached","HuronContainerAttached","TaruContainerAttached"];
				};
				case "HuronContainerAttached":
				{
					_ocluded = ["StaticWeaponAttached1","StaticLDAttached","SAMAttached","SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached1","SynCrateAttached2","SynCrateAttached3","SynCrateAttached4","SynCrateAttached1-2","SynCrateAttached2-2","SynCrateAttached3-2","SynCrateAttached4-2","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached3","SynWepCrateAttached4","SynWepCrateAttached1-2","SynWepCrateAttached2-2","SynWepCrateAttached3-2","SynWepCrateAttached4-2","SynWepCrateAttached1-3","SynWepCrateAttached2-3","SynWepCrateAttached3-3","SynWepCrateAttached4-3","SynWepCrateAttached1-4","SynWepCrateAttached2-4","SynWepCrateAttached3-4","SynWepCrateAttached4-4","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","BasicWepAttached1-2","BasicWepAttached2-2","BasicWepAttached3-2","SpecialWepAttached1","SpecialWepAttached1-2","EquipmentCrateAttached1","EquipmentCrateAttached2","EquipmentCrateAttached3","EquipmentCrateAttached4","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","LauncherCrateAttached3B","LauncherCrateAttached3B-2","LauncherCrateAttached1-2","LauncherCrateAttached2-2","LauncherCrateAttached3-2","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached","HuronContainerAttached","TaruContainerAttached"];
				};
				case "TaruContainerAttached":
				{
					_ocluded = ["StaticWeaponAttached1","StaticLDAttached","SAMAttached","SmallCrateAttached1","SmallCrateAttached2","SmallCrateAttached3","SmallCrateAttached4","SmallCrateAttached5","SmallCrateAttached6","SynCrateAttached1","SynCrateAttached2","SynCrateAttached3","SynCrateAttached4","SynCrateAttached1-2","SynCrateAttached2-2","SynCrateAttached3-2","SynCrateAttached4-2","SynWepCrateAttached1","SynWepCrateAttached2","SynWepCrateAttached3","SynWepCrateAttached4","SynWepCrateAttached1-2","SynWepCrateAttached2-2","SynWepCrateAttached3-2","SynWepCrateAttached4-2","SynWepCrateAttached1-3","SynWepCrateAttached2-3","SynWepCrateAttached3-3","SynWepCrateAttached4-3","SynWepCrateAttached1-4","SynWepCrateAttached2-4","SynWepCrateAttached3-4","SynWepCrateAttached4-4","BasicWepAttached1","BasicWepAttached2","BasicWepAttached3","BasicWepAttached1-2","BasicWepAttached2-2","BasicWepAttached3-2","SpecialWepAttached1","SpecialWepAttached1-2","EquipmentCrateAttached1","EquipmentCrateAttached2","EquipmentCrateAttached3","EquipmentCrateAttached4","LauncherCrateAttached1","LauncherCrateAttached2","LauncherCrateAttached3","LauncherCrateAttached3B","LauncherCrateAttached3B-2","LauncherCrateAttached1-2","LauncherCrateAttached2-2","LauncherCrateAttached3-2","SupplyCrateAttached","CargoCratesAttached","SupportCacheAttached","AmmoCacheAttached","WeaponCacheAttached","VehAmmoCrateAttached","HuronContainerAttached","TaruContainerAttached"];
				};
			};
		};
	};
	_vehicle setVariable [_AttachName, true, true];
	_Static setvariable ["Attached", true, true];
	_vehicle setvariable ["Attached", true, true];
	{_vehicle setVariable [_x, true, true]} foreach _ocluded;
	{_vehicle setVariable [_x, false, true]} foreach _enabled;
};