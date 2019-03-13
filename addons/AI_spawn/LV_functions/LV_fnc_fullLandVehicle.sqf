//ARMA3Alpha function LV_fnc_fullLandVehicle v1.2 - by SPUn / lostvar
//Spawns random vehicle full of random units and returns driver 
private ["_BLUhq","_BLUgrp","_veh","_grp","_OPFhq","_OPFgrp","_INDhq","_INDgrp","_roads","_radius","_pos1","_man1","_man","_i","_pos","_side","_BLUveh","_OPFveh","_INDveh","_men","_veh1","_vehSpots","_roadFound","_vehicle","_vCrew","_allUnitsArray","_crew","_driver"];
_pos = _this select 0;
_side = _this select 1;

_BLUveh = [
	//"B_Quadbike_01_F",
	//"B_MBT_01_arty_F"
	//"B_MBT_01_mlrs_F"
	"rhsusf_M1220_usarmy_d",
	"rhsusf_M1220_M153_M2_usarmy_d",
	"rhsusf_M1220_MK19_usarmy_d"
	//"B_Truck_01_transport_F",
	//"B_Truck_01_covered_F",
	//"rhsusf_m113_usarmy",
	//"rhs_zsu234_aa",
	//"rhs_btr80a_vv",
	//"B_MBT_01_cannon_F"
];
	
_OPFveh = [
	//"O_MBT_02_arty_F",
	//"O_Quadbike_01_F",
	"rhs_tigr_m_msv",
	"rhs_tigr_sts_msv",
	"rhsgref_ins_uaz_dshkm"
	//"O_Truck_02_transport_F",
	//"O_Truck_02_covered_F",
	//"rhs_bmd2",
	//"rhs_gaz66_zu23_vv", "RHS_Ural_Zu23_VV_01",
	//"rhs_bmp2d_vv",
	//"O_MBT_02_cannon_F"
];

_INDveh = [
	"rhsgref_ins_uaz_open",
	"rhsgref_ins_uaz_ags",
	"rhsgref_ins_uaz_dshkm"
	//"I_Quadbike_01_F",
	//"I_Truck_02_transport_F",
	//"I_Truck_02_covered_F",
	//"I_APC_Wheeled_03_cannon_F",
	//"I_APC_Wheeled_03_cannon_F",
	//"I_APC_Wheeled_03_cannon_F"
];

_men = [];
_veh = [];

switch(_side)do{
	case 0:{
		_BLUhq = createCenter west;
		_BLUgrp = createGroup west;
		_veh = _BLUveh;
		_grp = _BLUgrp;
	};
	case 1:{
		_OPFhq = createCenter east;
		_OPFgrp = createGroup east;
		_veh = _OPFveh;
		_grp = _OPFgrp;
	};
	case 2:{
		_INDhq = createCenter resistance;
		_INDgrp = createGroup resistance;
		_veh = _INDveh;
		_grp = _INDgrp;
	};
};

_veh1 = _veh select (floor(random(count _veh)));
_vehSpots = getNumber (configFile >> "CfgVehicles" >> _veh1 >> "transportSoldier");

_radius = 40;
_roads = [];
while{(count _roads) == 0}do{
	_roads = _pos nearRoads _radius;
	_radius = _radius + 10;
};
if(((_roads select 0) distance _pos)<200)then{
	_pos = getPos(_roads select 0);
	_pos1 = [_pos,0,25,5,0,1,0] call BIS_fnc_findSafePos;
}else{
	_pos1 = [_pos,0,200,5,0,1,0] call BIS_fnc_findSafePos;
};
_pos = [_pos1 select 0, _pos1 select 1, 0];

sleep 0.5;

_vehicle = createVehicle [_veh1, _pos, [], 0, "NONE"];
_vehicle setPos _pos;

_vehicle allowDamage false;
sleep 2;
if(((vectorUp _vehicle) select 2) != 0)then{ _vehicle setvectorup [0,0,0]; };
sleep 2;
_vehicle allowDamage true;

_vCrew = [_vehicle, _grp] call BIS_fnc_spawnCrew;
//_allUnitsArray set [(count _allUnitsArray), _vehicle];
_crew = crew _vehicle;

if(_vehSpots > 0)then{
	_i = 1; 
	for "_i" from 1 to _vehSpots do {
		_man1 = getText (configFile >> "CfgVehicles" >> _veh1 >> "crew");
		_man = _grp createUnit [_man1, _pos, [], 0, "NONE"];
		_man moveInCargo _vehicle;
		sleep 0.3;
	};
};

_driver = driver _vehicle;
_driver