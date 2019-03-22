//Client Function for Airdrop Assistance (not really a function, as it is called via ExecVM from command menu)
//This takes values from command menu, and some passed variables, and interacts with client and sends commands to server
//Author: Apoc, GMG_Monkey
//Credits: Some methods taken from Cre4mpie's airdrop scripts, props for the idea!
//Starts off much the same as the client start.  This is to find information from config arrays


private ["_type","_selection","_player","_aircraftDirection"]; //Variables coming from command menu and client side APOC_cli_startAirdrop
_type = _this select 0;
_selectionNumber = _this select 1;
_player = _this select 2;
_aircraftDirection = _this select 3;

diag_log format ["SERVER - Apoc's Airdrop Assistance - Player: %1, Drop Type: %2, Selection #: %3",name _player,_type,_selectionNumber];
//hint format ["Well we've made it this far! %1, %2, %3,",_player,_type,_selectionNumber];
_selectionArray = [];

switch (_type) do
{
	case "vehicle": {_selectionArray = APOC_AA_VehOptions};
	case "supply": 	{_selectionArray = APOC_AA_SupOptions};
	case "food":	{_selectionArray = APOC_AA_SupOptions};
	case "water":	{_selectionArray = APOC_AA_SupOptions};
	case "vicammo":	{_selectionArray = APOC_AA_SupOptions};
	case "base":	{_selectionArray = APOC_AA_SupOptions};
	default 		{_selectionArray = APOC_AA_VehOptions; diag_log "AAA - Default Array Selected - Something broke";};
};

_selectionName 	= (_selectionArray select _selectionNumber) select 0;
_selectionClass = (_selectionArray select _selectionNumber) select 1;
_price 			= (_selectionArray select _selectionNumber) select 2;
// Moved money removal until after the drop point.

//OK, now the real fun

/////// Let's spawn us  an AI helo to carry the cargo /////////////////////////////////////////////////

_aircraftType = "RHS_C130J";
_grp = createGroup civilian;
if(isNil("_grp2"))then{_grp2 = createGroup civilian;}else{_grp2 = _grp2;};
_flyHeight = 350;
_dropSpot = [(position _player select 0),(position _player select 1),_flyHeight];
_aircraftStartDistance = 5000;
_spos=[(_dropSpot select 0) - (sin _aircraftDirection) * _aircraftStartDistance, (_dropSpot select 1) - (cos _aircraftDirection) * _aircraftStartDistance, (_flyHeight+200)];

diag_log format ["AAA - aircraft Spawned at %1", _spos];
_aircraft = createVehicle [_aircraftType, _spos, [], 0, "FLY"];
_aircraft setVariable ["R3F_LOG_disabled", true, true];
[_aircraft] call vehicleSetup;


_crew = [_grp, _spos, "NATO", "aircraftPilot"] call createsoldier;

_crew moveInDriver _aircraft;

_aircraft setCaptive true;

_aircraftDistance = 2000;
_dir = ((_dropSpot select 0) - (_spos select 0)) atan2 ((_dropSpot select 1) - (_spos select 1));
_flySpot = [(_dropSpot select 0) + (sin _dir) * _aircraftDistance, (_dropSpot select 1) + (cos _dir) * _aircraftDistance, _flyHeight];

_grp setCombatMode "BLUE";
_grp setBehaviour "CARELESS";

{_x disableAI "AUTOTARGET"; _x disableAI "TARGET";} forEach units _grp;

_wp0 = _grp addWaypoint [_dropSpot, 0, 1];
[_grp,1] setWaypointBehaviour "CARELESS";
[_grp,1] setWaypointCombatMode "BLUE";
[_grp,1] setWaypointCompletionRadius 20;
_wp1 = _grp addWaypoint [_flySpot, 0, 2];
[_grp,2] setWaypointBehaviour "CARELESS";
[_grp,2] setWaypointCombatMode "BLUE";
[_grp,2] setWaypointCompletionRadius 20;
_aircraft flyInHeight _flyHeight;


//Wait until the aircraft completes the drop waypoint, then move on to dropping the cargo and all of that jazz

While {true} do {
	sleep 0.1;
	if (currentWaypoint _grp >= 2) exitWith {};  //Completed Drop Waypoint
};
// Let's handle the money after this tricky spot - This way players won't be charged for non-delivered goods!
_playerMoney = _player getVariable ["bmoney", 0];
if (_price > _playerMoney) exitWith{
	{ _x setDamage 1; } forEach units _grp;
	_aircraft setDamage 1;
	_object setDamage 1;
	diag_log format ["Apoc's Airdrop Assistance - Player Account Too Low, Drop Aborted. %1. Bank:$%2. Cost: $%3", _player, _playerMoney, _price];  //A little log love to mark the Scallywag who tried to cheat the valiant pilot
	};  //Thought you'd be tricky and not pay, eh?

//Server Style Money handling
_balance = _player getVariable ["bmoney", 0];
_newBalance = _balance - _price;
_player setVariable ["bmoney", _newBalance, true];
[getPlayerUID _player, [["BankMoney", _newBalance]], []] call fn_saveAccount;

//  Now on to the fun stuff:

diag_log format ["Apoc's Airdrop Assistance - Object at %1, Detach Up Next", position _aircraft];  //A little log love to confirm the location of this new creature
//////// Create Purchased Object //////////////////////////////////////////////
_object = switch (_type) do
{
	case "vehicle":
	{
		_DropPos = getPos _aircraft;
		_objectSpawnPos = [(_DropPos select 0), (_DropPos select 1), (_DropPos select 2) - 10];
		_object = createVehicle [_selectionClass, _objectSpawnPos, [], 0, "None"];
		diag_log format ["Apoc's Airdrop Assistance - Object Spawned at %1", position _object];
		_object setVariable ["moveable", true, true];
		[_object, false] call vehicleSetup;
		_object
	};
	case "supply":
	{
		_DropPos = getPos _aircraft;
		_objectSpawnPos = [(_DropPos select 0), (_DropPos select 1), (_DropPos select 2) - 10];
		_object = createVehicle ["B_supplyCrate_F", _objectSpawnPos, [], 0, "None"];
		_object setVariable ["A3W_purchasedStoreObject", true];
		_object setVariable ["R3F_LOG_Disabled", false, true];
		[_object, _selectionClass] call fn_refillbox;
		_object setVariable ["A3W_inventoryLockR3F", false, true];
		_object setVariable ["moveable", true, true];
		_object
	};
	case "food":  //Beware of Bears!
	{
		_DropPos = getPos _aircraft;
		_objectSpawnPos = [(_DropPos select 0), (_DropPos select 1), (_DropPos select 2) - 10];
		_object = createVehicle ["Land_Sacks_goods_F", _objectSpawnPos, [], 0, "None"];
		diag_log format ["Apoc's Airdrop Assistance - Object Spawned at %1", position _object];
		_object setVariable ["A3W_purchasedStoreObject", true];
		_object setVariable ["moveable", true, true];
		_object setVariable ["food", 50, true];
		_object setVariable ["R3F_LOG_Disabled", false, true];
		_object
	};
	case "water":  //Beware of Bears!
	{
		_DropPos = getPos _aircraft;
		_objectSpawnPos = [(_DropPos select 0), (_DropPos select 1), (_DropPos select 2) - 10];
		_object = createVehicle ["Land_BarrelWater_F", _objectSpawnPos, [], 0, "None"];
		diag_log format ["Apoc's Airdrop Assistance - Object Spawned at %1", position _object];
		_object setVariable ["A3W_purchasedStoreObject", true];
		_object setVariable ["moveable", true, true];
		_object setVariable ["water",50, true];
		_object setVariable ["R3F_LOG_Disabled", false, true];
		_object
	};
	case "base":
	{
		_DropPos = getPos _aircraft;
		_objectSpawnPos = [(_DropPos select 0), (_DropPos select 1), (_DropPos select 2) - 10];
		_object = createVehicle ["Land_Pod_aircraft_Transport_04_box_F", _objectSpawnPos, [], 0, "None"];
		diag_log format ["Apoc's Airdrop Assistance - Object Spawned at %1", position _object];
		_object setVariable ["A3W_purchasedStoreObject", true];
		_object setVariable ["R3F_LOG_disabled",false,true];
		_object setVariable ["moveable", true, true];
		[_object, ["Land_Cargo_Tower_V1_F", ["Land_Canal_Wall_Stairs_F", 2], ["Land_Mil_WallBig_4m_F", 5], ["Land_Canal_WallSmall_10m_F", 10], ["Land_RampConcreteHigh_F",2], ["Land_RampConcrete_F", 2],["BlockConcrete_F",4],["Land_BagFence_Round_F",2],["Land_BagFence_Short_F",4],["Land_HBarrier_3_F",2],["Land_Crash_barrier_F",2],["Land_LampShabby_F",4]] ] execVM "addons\R3F_LOG\auto_load_in_vehicle.sqf";
		clearBackpackCargoGlobal _object;
		clearMagazineCargoGlobal _object;
		clearWeaponCargoGlobal _object;
		clearItemCargoGlobal _object;
		_object setVariable ["allowDamage", false, true];
		_object
	};
	case "vicammo":
	{
		_DropPos = getPos _aircraft;
		_objectSpawnPos = [(_DropPos select 0), (_DropPos select 1), (_DropPos select 2) - 10];
		_object = createVehicle ["Box_NATO_AmmoVeh_F", _objectSpawnPos, [], 0, "None"];
		diag_log format ["Apoc's Airdrop Assistance - Object Spawned at %1", position _object];
		_object setVariable ["A3W_purchasedStoreObject", true];
		_object setVariable ["moveable", true, true];
		_object setVariable ["R3F_LOG_Disabled", false, true];
		_object
	};
	default {
		_DropPos = getPos _aircraft;
		_objectSpawnPos = [(_DropPos select 0), (_DropPos select 1), (_DropPos select 2) - 10];
		_object = createVehicle ["B_supplyCrate_F", _objectSpawnPos, [], 0, "None"];
		_object setVariable ["A3W_purchasedStoreObject", true];
		_object setVariable ["R3F_LOG_Disabled", false, true];
		[_object, "mission_USSpecial"] call fn_refillbox;
		_object setVariable ["A3W_inventoryLockR3F", false, true];
		_object setVariable ["moveable", true, true];
		_object
		};
};
_object allowDamage false; //Let's not let these things get destroyed on the way there, shall we?

diag_log format ["Apoc's Airdrop Assistance - Object at %1", position _object];  //A little log love to confirm the location of this new creature

_objectPosDrop = position _object;
sleep 2;
playSound3D ["a3\sounds_f\sfx\radio\ambient_radio22.wss",_player,false,getPosASL _player,3,1,25];

//Delete aircraft once it has proceeded to end point
[_aircraft,_grp,_flySpot,_dropSpot,_aircraftDistance] spawn
{
	private ["_aircraft","_grp","_flySpot","_dropSpot","_aircraftDistance"];
	_aircraft = _this select 0;
	_grp = _this select 1;
	_flySpot = _this select 2;
	_dropSpot = _this select 3;
	_aircraftDistance = _this select 4;
	while{([_aircraft, _flySpot] call BIS_fnc_distance2D)>200}do{
		if(!alive _aircraft || !canMove _aircraft)exitWith{};
		sleep 5;
	};
	waitUntil{([_aircraft, _dropSpot] call BIS_fnc_distance2D)>(_aircraftDistance * .5)};
	{ deleteVehicle _x; } forEach units _grp;
	deleteVehicle _aircraft;
};


WaitUntil {(((position _object) select 2) < (_flyHeight-20))};
_objectPosDrop = position _object;
_para = createVehicle ["B_Parachute_02_F", _objectPosDrop, [], 0, "NONE"];
_object attachTo [_para,[0,0,-1.5]];


if (_type == "vehicle") then {_object allowDamage true;}; //Turn on damage for vehicles once they're in the 'chute.  Could move this until they hit the ground.  Admins choice.

WaitUntil {((((position _object) select 2) < 1))};
detach _object;
_smoke2= "SmokeShellGreen" createVehicle getPos _object;
//_smoke2 attachto [_object,[0,0,-0.5]];
_flare2= "F_40mm_Green" createVehicle getPos _object;
//_flare2 attachto [_object,[0,0,-0.5]];
//Time based deletion of the aircraft, in case it gets distracted
[_aircraft,_grp] spawn
{
	private ["_aircraft","_grp"];
	_aircraft = _this select 0;
	_grp = _this select 1;
	sleep 30;
	if (alive _aircraft) then
	{
		{ deleteVehicle _x; } forEach units _grp;
		deleteVehicle _aircraft;
		diag_log "AIRDROP SYSTEM - Deleted aircraft after Drop";
	};
};

