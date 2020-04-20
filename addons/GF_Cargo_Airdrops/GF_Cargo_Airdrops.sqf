


//________________  Author : [GR]GEORGE F ___________	24.01.19	_____________

/*
________________	GF Cargo Airdrops Script - Mod	________________

https://forums.bohemia.net/forums/topic/215257-cargo_airdrops_gf-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

ArmA 3 | Notepad ++ SQF tutorial
https://www.youtube.com/watch?v=aI5P7gp3x90

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


//	If you want the script to run only in the server use the code below
//	if(!isServer) exitWith {};


diag_log "//________________ GF Cargo Airdrops Script - Mod _____________";


//________________ GF Cargo Airdrops Script - Mod _____________

//________________ Settings ________________
//________________ Set true or false  ________________

_Radio_Call               				= true;        	//	Play some Radio Sounds
_Virtual_Arsenal          				= false;       	//	Add Virtual Arsenal to Cargo
_Random_Loot							= false;         //	Add random loot , you need to select this or the one below
_Custom_loot							= true;      	//	Selected loot 
_Create_Markers    						= false;         //	Show the Airdrop position with a marker
_Number									= 2;			//	Number of the Airdrops
_Number_random							= 2;			//	+ random 5 Airdrops
_next_drop_in_sec   					= 1000 + (random 800);          	//	_next_drop_in_sec - 10 is for test
_time_marker_spawn   					= 60 + (random 60);          	//	tiempo entre marcador y spawn del cargo - 15 is for test
_height_of_drop      					= 250;       	//	_height_of_drop - 75 is for test


//________________ Enemies ________________

_Spawn_Enemy							= true;		//	Spawn Enemy at the site
_Enemy_Side								= civil;		

_Squad_Members							= 6;		//	+ floor random 5 below
_Squad_Members_random					= 6;

_set_AiSkill							= 0.50;
_set_AiSkill_random						= 0.50;

_Patrol_distance 						= 100;		//	The distance for BIS_fnc_taskPatrol
_Patrol_distance_random 				= 200;	


//________________	Enemy Array 	________________

_Pool_Infantry = [
	"rhssaf_army_m10_para_rifleman_g36","rhssaf_army_m10_para_rifleman_hk416","rhssaf_army_m10_para_rifleman_at","rhssaf_army_m10_para_spec_at","rhssaf_army_m10_para_spec_aa","rhssaf_army_m10_para_sniper_m76","rhssaf_army_m10_para_mgun_m84","rhssaf_army_m10_para_gl_ag36","rhssaf_army_m10_para_exp","rhssaf_army_m10_para_rifleman_at","rhssaf_army_m10_para_sq_lead","rhssaf_m1025_olive_m2"
	];
	
	
	
	
systemchat "C a r g o   A i r d r o p s    I n i t i a l i z e d";


if (_Radio_Call) then {

//    systemchat "_Radio_Call";
_grid = mapGridPosition getPos player;
player sideChat format ["This is %1, requesting Supply drop at the transmitting coordinates %2, OVER.", name player, _grid];
playSound3D ["A3\dubbing_f\modules\supports\drop_request.ogg", player];
sleep 6;
player sideChat format ["Affirmative %1, Supplies on route , OUT.", name player];
playSound3D ["A3\dubbing_f\modules\supports\drop_acknowledged.ogg", player];
sleep 10;
};


private ["_Plane_sound","_x"];
_x = 0;
_a = 0;	

//________________ The number of the Cargo to spawn (on random) ________________
for "_x" from 0 to (_Number + (random _Number_random)) do {
_a = _a + 1;

//________________ For spawn one Cargo ________________
//for "_x" from  1 to (1) do {

//________________ The position to drop the Cargo ________________
	_Pos = [] call BIS_fnc_randomPos; 		//    For random location
//	_Pos = getmarkerPos "MarkerName";    	//    Create a Marker if you want a certain location -


//	Create a marker
//	_Pos = getmarkerPos "DROP_Marker_1";

/*
//	or select a random marker
_Marker_array =selectRandom[    
            "DROP_Marker_1",        
            "DROP_Marker_2",
			"DROP_Marker_3"			
            ];
_Pos = getmarkerPos _Marker_array;
*/


//    this can be a Supply drop with an add action in an item or player    https://community.bistudio.com/wiki/addAction
//	_Pos = getPos player;    //    for test or for support purpose



//systemchat format ["Next AirDrop in %1 sec", _next_drop_in_sec];   //tiempo exsacto, hacer formula d division entre 60 para dar min
systemchat "Next AirDrop in about 30min";
sleep _next_drop_in_sec;
systemchat "Dropping Cargo";


//________________ Sound of plane flying above ________________
//    https://community.bistudio.com/wiki/Arma_3:_SoundFiles
//    playSound3D ["A3\Sounds_F\ambient\battlefield\battlefield_jet1.wss", _Cargo];
/*
_sound = selectRandom [
	"Plane_sound1",
	"Plane_sound2",
	"Plane_sound3"
];

publicVariable _sound;
_sound remoteExec ["playSound"];
*/

//________________	_Create_Markers	________________
	
if (_Create_Markers) then {

	_Marker_Number_Pos = format ["%1",_Pos];
	_Marker_Pos = createMarker [_Marker_Number_Pos,_Pos];		
	_Marker_Pos setMarkerShape "ICON"; 
	_Marker_Pos setMarkerType "mil_marker"; 
	_Marker_Pos setMarkerColor "ColorUNKNOWN"; 
	_Marker_Pos setMarkerText format ["Airdrop : %1",_a];	
	_Marker_Pos setMarkerSize [1,1]; 		
};

//________________	Spawn a Group at the Airdrops	________________

if (_Spawn_Enemy) then {

//    systemchat "_Spawn_Enemy";

_Pos_Spawn =  [[[_Pos, 50 + random 250]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup _Enemy_Side;

for "_x" from 0 to (_Squad_Members + floor random _Squad_Members_random) do {

_unit = _Group createunit [selectRandom _Pool_Infantry,_Pos_Spawn,[],0,"None"];
[_unit] JoinSilent _Group;
(leader _Group) setSkill _set_AiSkill + random _set_AiSkill_random;
};
[_Group,_Pos,_Patrol_distance + random _Patrol_distance_random] call BIS_fnc_taskPatrol;
};

sleep _time_marker_spawn;

if (_Radio_Call) then {

player sideChat format ["%1, The Supplies have been dropped , OUT.", name player];
playSound3D ["A3\dubbing_f\modules\supports\drop_accomplished.ogg", player];
};

//________________ Type of parachute ________________
//    B_Parachute_02_F
_parachute = createVehicle ["B_Parachute_02_F",_Pos, [], 0, "FLY"];
_parachute setPosATL [getPosATL _parachute select 0, getPosATL _parachute select 1, _height_of_drop];


//	Type_of_Cargo_array - can be anything
//  B_supplyCrate_F        B_G_Mortar_01_F        B_MRAP_01_hmg_F        B_Boat_Transport_01_F    B_Heli_Transport_03_unarmed_F

_Cargo_array =[
            "rhsusf_M1078A1P2_B_WD_CP_fmtv_usarmy",
			"rhs_gaz66_r142_msv",
            "C_IDAP_supplyCrate_F",
            "B_supplyCrate_F",
			"O_CargoNet_01_ammo_F",
            "CargoNet_01_box_F"
            ];

_Create_Cargo = selectRandom _Cargo_array;
        
_Cargo = createVehicle [_Create_Cargo, position _parachute, [], 0, 'NONE'];    
_Cargo attachTo [_parachute,[0,0,0]];
_Cargo enableSimulation false;


switch (true) do {
	case (_Cargo isKindOf "C_IDAP_supplyCrate_F" || _Cargo isKindOf "rhsusf_M1078A1P2_B_WD_CP_fmtv_usarmy" || _Cargo isKindOf "rhs_gaz66_r142_msv"):
		{
			null = [_Cargo,30+(random 50),0.01,"VSM_Gasmask_acc"] execvm "AL_radiation\radioactive_object.sqf";
		};
};
//________________ add your items here ________________

//    clear Cargo - leaves medkits in place.
//    add     clearItemCargoGlobal _Cargo;     to remove medkits
clearWeaponCargoGlobal _Cargo;
clearMagazineCargoGlobal _Cargo;
//clearItemCargoGlobal _Cargo;


//________________ add Virtual Arsenal to Cargo ________________
if (_Virtual_Arsenal) then {
//    systemchat "_Virtual_Arsenal";
_Cargo addAction ["Open Virtual Arsenal", {["Open",true] spawn BIS_fnc_arsenal}];
};


//________________ Add random loot , you need to select this or the one below ________________
if (_Random_Loot) then {


//Type of loot
_vsmweapons_Loot = selectRandom [
	
	"VSM_AK_ALPHA","VSM_AK_ALPHA_COYOTE","VSM_AK_Keymod_2","VSM_AK_Keymod","VSM_Bulldog","VSM_CASV","VSM_CASV_coyote","VSM_cx4","VSM_cx4_spray","VSM_DDM4","VSM_DDM4_PZA","VSM_DDM4_PZW","VSM_DDM4_SPRAY","VSM_DDM4_Tan","VSM_DDM4_2t2","VSM_DDM4_2t","VSM_FORTIS","VSM_FORTIS_COYOTE","VSM_Fortis_Long","VSM_416_2","VSM_416","VSM_HK416A5_11_5","VSM_HK416A5_11_5_COYOTE","VSM_HK416A5_2","VSM_HK416A5_2_COYOTE","VSM_HoneyBadger","VSM_HoneyBadger_coyote","VSM_KREBS","VSM_M14","VSM_M4","VSM_M4_coyote","VSM_SCAR_16","VSM_SCAR_16_Bowflage","VSM_SCAR_16_coyote","VSM_MK17","VSM_mk20","VSM_MPX","VSM_MPX_COYOTE","VSM_PDW","VSM_PSG1","VSM_PSG1_spray","VSM_R5_2","VSM_R5_2_coyote","VSM_R5","VSM_R5_coyote"
	
	];
	
_hlcweapons_Loot = selectRandom [
	
	"hlc_rifle_RU5562","hlc_rifle_bcmjack","hlc_rifle_CQBR","hlc_rifle_falosw","hlc_rifle_osw_GL","hlc_rifle_FAL5061Rail","hlc_rifle_g3sg1ris","hlc_rifle_G36MLIC","hlc_rifle_G36C","hlc_rifle_G36CMLIC","hlc_rifle_G36CV","hlc_rifle_G36CTac","hlc_rifle_G36KA1KSK","hlc_Rifle_G36KSKAG36","hlc_rifle_G36KMLIC","hlc_rifle_G36KV","hlc_rifle_g36KTac","hlc_rifle_G36MLIAG36","hlc_rifle_G36V","hlc_rifle_G36VAG36","hlc_rifle_G36TAC","hlc_rifle_g3a3ris","hlc_rifle_g3ka4","hlc_Rifle_g3ka4_GL","hlc_rifle_hk33a2RIS","hlc_rifle_hk33a2RIS_GL","hlc_rifle_hk53RAS","hlc_smg_mp510","hlc_smg_mp5a4","hlc_smg_9mmar","hlc_rifle_RPK12_60rnd","hlc_lmg_m60","hlc_lmg_M60E4","hlc_lmg_MG42","hlc_lmg_MG3_optic","hlc_rifle_stgw57_commando","hlc_rifle_auga2para_t","hlc_rifle_auga2carb_b","hlc_rifle_auga2lsw_t","hlc_rifle_auga2","hlc_rifle_auga3_GL","hlc_rifle_auga3","hlc_rifle_SG550Sniper_RIS","hlc_rifle_SG550_TAC","hlc_rifle_SG550_TAC_GL","hlc_rifle_SG551LB_TAC","hlc_rifle_SG551LB_TAC_GL","hlc_rifle_SG553SB_RIS","hlc_rifle_sg553RLB_TAC"
	];
	
_vsmuniforms_loot = selectRandom [
	
	"VSM_ACU_camo_Multicam_2018","VSM_ACU_camo_M81","VSM_ACU_camo_Multicam_black","VSM_ACU_camo_Multicam","VSM_ACU_camo_OD","VSM_ACU_camo_PZA","VSM_ACU_camo_PZJ","VSM_ACU_camo_PZW","VSM_ACU_camo_TAN","","VSM_M81_BDU_od_pants_Camo","VSM_M81_BDU_tan_pants_Camo","VSM_M81_BDU_Camo","VSM_Multicam_BDU_od_pants_Camo","VSM_Multicam_BDU_tan_pants_Camo","VSM_Multicam_BDU_Camo","VSM_MulticamTropic_BDU_od_pants_Camo","VSM_MulticamTropic_BDU_tan_pants_Camo","VSM_MulticamTropic_BDU_Camo","VSM_OCP_BDU_od_pants_Camo","VSM_OCP_BDU_tan_pants_Camo","VSM_OCP_BDU_Camo","VSM_ProjectHonor_BDU_od_pants_Camo","VSM_ProjectHonor_BDU_tan_pants_Camo","VSM_ProjectHonor_BDU_Camo","VSM_clandestine_camo","VSM_ColdWeatherGear_camo_multicam","VSM_ColdWeatherGear_camo_PZA","VSM_ColdWeatherGear_2_camo","VSM_G2_coverall_camo","VSM_fieldUniform_camo","VSM_fieldUniform_rolled_camo","VSM_G2_camo_Multicam_gen1_OD_Shirt","VSM_G2_camo_Multicam_gen1_Tan_Shirt","VSM_G2_camo_Multicam_gen1","VSM_G2_sweater_camo_Multicam_gen1","VSM_G2_camo_rolled_Multicam_gen1_OD_Shirt","VSM_G2_camo_rolled_Multicam_gen1_Tan_Shirt","VSM_G2_camo_rolled_Multicam_gen1","","VSM_G2_camo_MultiCam_OD_Shirt","VSM_G2_camo_MultiCam_Tan_Shirt","VSM_G2_camo_MultiCam","VSM_G2_camo_PZA_OD_Shirt","VSM_G2_camo_PZA_Tan_Shirt","VSM_G2_camo_PZA","VSM_G2_camo_PZDA_OD_Shirt","VSM_G2_camo_PZDA_Tan_Shirt","VSM_G2_camo_PZDA","VSM_G2_camo_PZJ_OD_Shirt","VSM_G2_camo_PZJ_Tan_Shirt","VSM_G2_camo_PZJ","VSM_G2_camo_PZPH_OD_Shirt","VSM_G2_camo_PZPH_Tan_Shirt","VSM_G2_camo_PZPH","VSM_G2_camo_PZW_OD_Shirt","VSM_G2_camo_PZW_Tan_Shirt","VSM_G2_camo_PZW","VSM_G2_sweater_camo_MultiCam","VSM_G2_sweater_camo_PZA","VSM_G2_sweater_camo_PZDA","VSM_G2_sweater_camo_PZJ","VSM_G2_sweater_camo_PZPH","VSM_G2_sweater_camo_PZW","","VSM_G2_camo_rolled_MultiCam_OD_Shirt","VSM_G2_camo_rolled_MultiCam_Tan_Shirt","VSM_G2_camo_rolled_MultiCam","VSM_G2_camo_rolled_PZA_OD_Shirt","VSM_G2_camo_rolled_PZA_Tan_Shirt","VSM_G2_camo_rolled_PZA","VSM_G2_camo_rolled_PZDA_OD_Shirt","VSM_G2_camo_rolled_PZDA_Tan_Shirt","VSM_G2_camo_rolled_PZDA","VSM_G2_camo_rolled_PZJ_OD_Shirt","VSM_G2_camo_rolled_PZJ_Tan_Shirt","VSM_G2_camo_rolled_PZJ","VSM_G2_camo_rolled_PZPH_OD_Shirt","VSM_G2_camo_rolled_PZPH_Tan_Shirt","VSM_G2_camo_rolled_PZPH","VSM_G2_camo_rolled_PZW_OD_Shirt","VSM_G2_camo_rolled_PZW_Tan_Shirt","VSM_G2_camo_rolled_PZW","","","","VSM_G3_GRMC_camo","VSM_M81_Crye_grey_pants_Camo","VSM_M81_Crye_grey_shirt_Camo","VSM_M81_Crye_od_pants_Camo","VSM_M81_Crye_od_shirt_Camo","VSM_M81_Crye_tan_pants_Camo","VSM_M81_Crye_tan_shirt_Camo","VSM_G3_m81_camo","VSM_M81_Crye_Camo","VSM_Multicam_Crye_grey_pants_Camo","VSM_Multicam_Crye_grey_shirt_Camo","VSM_Multicam_Crye_od_pants_Camo","VSM_Multicam_Crye_od_shirt_Camo","VSM_Multicam_Crye_tan_pants_Camo","VSM_Multicam_Crye_tan_shirt_Camo","VSM_G3_MC_camo","VSM_Multicam_Crye_Camo","VSM_MulticamTropic_Crye_grey_pants_Camo","VSM_MulticamTropic_Crye_grey_shirt_Camo","VSM_MulticamTropic_Crye_od_pants_Camo","VSM_MulticamTropic_Crye_od_shirt_Camo","VSM_MulticamTropic_Crye_tan_pants_Camo","VSM_MulticamTropic_Crye_tan_shirt_Camo","VSM_MulticamTropic_Crye_Camo","VSM_OCP_Crye_grey_pants_Camo","VSM_OCP_Crye_grey_shirt_Camo","VSM_OCP_Crye_od_pants_Camo","VSM_OCP_Crye_od_shirt_Camo","VSM_OCP_Crye_tan_pants_Camo","VSM_OCP_Crye_tan_shirt_Camo","VSM_OCP_Crye_Camo","VSM_OGA_Crye_Grey_pants_Camo","VSM_OGA_Crye_od_pants_Camo","VSM_OGA_Crye_grey_od_pants_Camo","VSM_OGA_Crye_grey_tan_pants_Camo","VSM_OGA_Crye_grey_Camo","VSM_OGA_Crye_od_grey_pants_Camo","VSM_OGA_Crye_od_tan_pants_Camo","VSM_OGA_Crye_od_Camo","VSM_OGA_Crye_Camo","VSM_ProjectHonor_Crye_grey_pants_Camo","VSM_ProjectHonor_Crye_grey_shirt_Camo","VSM_ProjectHonor_Crye_od_pants_Camo","VSM_ProjectHonor_Crye_od_shirt_Camo","VSM_ProjectHonor_Crye_tan_pants_Camo","VSM_ProjectHonor_Crye_tan_shirt_Camo","VSM_ProjectHonor_Crye_Camo","VSM_Scorpion_Crye_grey_pants_Camo","VSM_Scorpion_Crye_grey_shirt_Camo","VSM_Scorpion_Crye_od_pants_Camo","VSM_Scorpion_Crye_od_shirt_Camo","VSM_Scorpion_Crye_tan_pants_Camo","VSM_Scorpion_Crye_tan_shirt_Camo","VSM_Scorpion_Crye_Camo","VSM_G3_Tiger_camo","VSM_M81_casual_Camo","VSM_Multicam_casual_Camo","VSM_MulticamTropic_casual_Camo","VSM_OCP_casual_Camo","VSM_OGA_grey_casual_Camo","VSM_OGA_OD_casual_Camo","VSM_OGA_tan_casual_Camo","VSM_ProjectHonor_casual_Camo","VSM_Scorpion_casual_Camo","","","","VSM_M81_Crye_SS_grey_pants_Camo","VSM_M81_Crye_SS_grey_shirt_Camo","VSM_M81_Crye_SS_od_pants_Camo","VSM_M81_Crye_SS_od_shirt_Camo","VSM_M81_Crye_SS_tan_pants_Camo","VSM_M81_Crye_SS_tan_shirt_Camo","VSM_M81_Crye_SS_Camo","VSM_Multicam_Crye_SS_grey_pants_Camo","VSM_Multicam_Crye_SS_grey_shirt_Camo","VSM_Multicam_Crye_SS_od_pants_Camo","VSM_Multicam_Crye_SS_od_shirt_Camo","VSM_Multicam_Crye_SS_tan_pants_Camo","VSM_Multicam_Crye_SS_tan_shirt_Camo","VSM_Multicam_Crye_SS_Camo","VSM_MulticamTropic_Crye_SS_grey_pants_Camo","VSM_MulticamTropic_Crye_SS_grey_shirt_Camo","VSM_MulticamTropic_Crye_SS_od_pants_Camo","VSM_MulticamTropic_Crye_SS_od_shirt_Camo","VSM_MulticamTropic_Crye_SS_tan_pants_Camo","VSM_MulticamTropic_Crye_SS_tan_shirt_Camo","VSM_MulticamTropic_Crye_SS_Camo","VSM_OCP_Crye_SS_grey_pants_Camo","VSM_OCP_Crye_SS_grey_shirt_Camo","VSM_OCP_Crye_SS_od_pants_Camo","VSM_OCP_Crye_SS_od_shirt_Camo","VSM_OCP_Crye_SS_tan_pants_Camo","VSM_OCP_Crye_SS_tan_shirt_Camo","VSM_OCP_Crye_SS_Camo","VSM_OGA_Crye_SS_grey_pants_Camo","VSM_OGA_Crye_SS_od_pants_Camo","VSM_OGA_Crye_SS_grey_od_pants_Camo","VSM_OGA_Crye_SS_grey_tan_pants_Camo","VSM_OGA_Crye_SS_grey_Camo","VSM_OGA_Crye_SS_OD_grey_pants_Camo","VSM_OGA_Crye_SS_OD_tan_pants_Camo","VSM_OGA_Crye_SS_od_Camo","VSM_OGA_Crye_SS_Camo","VSM_ProjectHonor_Crye_SS_grey_pants_Camo","VSM_ProjectHonor_Crye_SS_grey_shirt_Camo","VSM_ProjectHonor_Crye_SS_od_pants_Camo","VSM_ProjectHonor_Crye_SS_od_shirt_Camo","VSM_ProjectHonor_Crye_SS_tan_pants_Camo","VSM_ProjectHonor_Crye_SS_tan_shirt_Camo","VSM_ProjectHonor_Crye_SS_Camo","VSM_Scorpion_Crye_SS_grey_pants_Camo","VSM_Scorpion_Crye_SS_grey_shirt_Camo","VSM_Scorpion_Crye_SS_od_pants_Camo","VSM_Scorpion_Crye_SS_od_shirt_Camo","VSM_Scorpion_Crye_SS_tan_pants_Camo","VSM_Scorpion_Crye_SS_tan_shirt_Camo","VSM_Scorpion_Crye_SS_Camo","VSM_M81_Crye_Tee_Camo","VSM_Multicam_Crye_Tee_Camo","VSM_MulticamTropic_Crye_Tee_Camo","VSM_OCP_Crye_Tee_Camo","VSM_ProjectHonor_Crye_Tee_Camo","VSM_Scorpion_Crye_Tee_Camo","VSM_CSAT_MulticamTropic_Camo","VSM_Gorka_camo","VSM_Gorka_OT_camo","","","VSM_M81_od_pants_Camo","VSM_M81_od_shirt_Camo","VSM_M81_tan_pants_Camo","VSM_M81_tan_shirt_Camo","VSM_M81_Camo","VSM_Multicam_od_pants_Camo","VSM_Multicam_od_shirt_Camo","VSM_Multicam_tan_pants_Camo","VSM_Multicam_tan_shirt_Camo","VSM_Multicam_Camo","VSM_MulticamTropic_od_pants_Camo","VSM_MulticamTropic_od_shirt_Camo","VSM_MulticamTropic_tan_pants_Camo","VSM_MulticamTropic_tan_shirt_Camo","VSM_MulticamTropic_Camo","VSM_OCP_od_pants_Camo","VSM_OCP_od_shirt_Camo","VSM_OCP_tan_pants_Camo","VSM_OCP_tan_shirt_Camo","VSM_OCP_Camo","VSM_OGA_OD_NG_Camo","VSM_OGA_od_pants_Camo","VSM_OGA_od_tan_pants_Camo","VSM_OGA_od_Camo","VSM_OGA_Camo","VSM_ProjectHonor_od_pants_Camo","VSM_ProjectHonor_od_shirt_Camo","VSM_ProjectHonor_tan_pants_Camo","VSM_ProjectHonor_tan_shirt_Camo","VSM_ProjectHonor_Camo","","","VSM_M81_od_pants_Camo_SS","VSM_M81_od_shirt_Camo_SS","VSM_M81_tan_pants_Camo_SS","VSM_M81_tan_shirt_Camo_SS","VSM_M81_Camo_SS","VSM_Multicam_od_pants_Camo_SS","VSM_Multicam_od_shirt_Camo_SS","VSM_Multicam_tan_pants_Camo_SS","VSM_Multicam_tan_shirt_Camo_SS","VSM_Multicam_Camo_SS","VSM_MulticamTropic_od_pants_Camo_SS","VSM_MulticamTropic_od_shirt_Camo_SS","VSM_MulticamTropic_tan_pants_Camo_SS","VSM_MulticamTropic_tan_shirt_Camo_SS","VSM_MulticamTropic_Camo_SS","VSM_OCP_od_pants_Camo_SS","VSM_OCP_od_shirt_Camo_SS","VSM_OCP_tan_pants_Camo_SS","VSM_OCP_tan_shirt_Camo_SS","VSM_OCP_Camo_SS","VSM_OGA_od_pants_Camo_SS","VSM_OGA_od_tan_pants_Camo_SS","VSM_OGA_od_Camo_SS","VSM_OGA_Camo_SS","VSM_ProjectHonor_od_pants_Camo_SS","VSM_ProjectHonor_od_shirt_Camo_SS","VSM_ProjectHonor_tan_pants_Camo_SS","VSM_ProjectHonor_tan_shirt_Camo_SS","VSM_ProjectHonor_Camo_SS","VSM_M81_Camo_TShirt","VSM_Multicam_Camo_TShirt","VSM_MulticamTropic_Camo_TShirt","VSM_OCP_Camo_TShirt","VSM_ProjectHonor_Camo_TShirt","VSM_polo_camo"
	
	];
	
_vsmvests_loot = selectRandom [
	
	"VSM_CIRAS","VSM_CIRAS_2","VSM_ciras_3","VSM_JPC","VSM_JPC_2","VSM_JPC_3","VSM_LBT_1961a","VSM_LBT_1961H","VSM_Armatus_2","VSM_Armatus_1","VSM_CIRAS_Ranger","VSM_CIRAS_2_Ranger","VSM_ciras_3_Ranger","VSM_JPC_Ranger","VSM_JPC_2_Ranger","VSM_JPC_3_Ranger","VSM_LBT_1961a_Ranger","VSM_LBT_1961H_Ranger","VSM_Armatus_2_Ranger","VSM_Armatus_1_Ranger","","","","","","","VSM_Gen2_BattleBelt_coyote","VSM_Gen2_BattleBelt_paca_coyote","VSM_2017_ChestRig_PACA_MEDIC","VSM_2017_ChestRig_PACA","VSM_2017_ChestRig","VSM_LBT1961_Black","VSM_LBT1961_CB","VSM_LBT1961_GRN","VSM_LBT6094_gen2_556","VSM_LBT6094_gen2","VSM_FAPC_Breacher_M81","VSM_FAPC_MG_M81","VSM_FAPC_Operator_M81","VSM_CarrierRig_Breacher_M81","VSM_CarrierRig_Gunner_M81","VSM_CarrierRig_Operator_M81","VSM_LBT6094_breacher_M81","VSM_LBT6094_MG_M81","VSM_LBT6094_operator_M81","VSM_RAV_Breacher_M81","VSM_RAV_MG_M81","VSM_RAV_operator_M81","VSM_MBSS_BLK","VSM_MBSS_CB","VSM_MBSS_Green","VSM_MBSS_TAN","VSM_MBSS_WTF","VSM_MBSS_PACA_BattleBelt_operator","VSM_MBSS_PACA_BLK","VSM_MBSS_PACA_CB","VSM_MBSS_PACA","VSM_MBSS_PACA_TAN","VSM_MBSS_PACA_WTF","VSM_MBSS_PACA_operator","VSM_FAPC_Breacher_Multicam","VSM_FAPC_MG_Multicam","VSM_FAPC_Operator_Multicam","VSM_CarrierRig_Breacher_Multicam","VSM_CarrierRig_Gunner_Multicam","VSM_CarrierRig_Operator_Multicam","VSM_LBT6094_breacher_Multicam","VSM_LBT6094_MG_Multicam","VSM_LBT6094_operator_Multicam","VSM_RAV_Breacher_Multicam","VSM_RAV_MG_Multicam","VSM_RAV_operator_Multicam","VSM_FAPC_Breacher_MulticamTropic","VSM_FAPC_MG_MulticamTropic","VSM_FAPC_Operator_MulticamTropic","VSM_CarrierRig_Breacher_multicamTropic","VSM_CarrierRig_Gunner_multicamTropic","VSM_CarrierRig_Operator_multicamTropic","VSM_LBT6094_breacher_multicamTropic","VSM_LBT6094_MG_multicamTropic","VSM_LBT6094_operator_multicamTropic","VSM_RAV_Breacher_MulticamTropic","VSM_RAV_MG_MulticamTropic","VSM_RAV_operator_MulticamTropic","VSM_FAPC_Breacher_OCP","VSM_FAPC_MG_OCP","VSM_FAPC_Operator_OCP","VSM_CarrierRig_Breacher_OCP","VSM_CarrierRig_Gunner_OCP","VSM_CarrierRig_Operator_OCP","VSM_LBT6094_breacher_OCP","VSM_LBT6094_MG_OCP","VSM_LBT6094_operator_OCP","VSM_RAV_Breacher_OCP","VSM_RAV_MG_OCP","VSM_RAV_operator_OCP","VSM_LBT1961_OGA_OD","VSM_FAPC_Breacher_OGA","VSM_FAPC_MG_OGA","VSM_FAPC_Operator_OGA","VSM_OGA_IOTV_2","VSM_OGA_OD_IOTV_2","VSM_OGA_IOTV_1","VSM_OGA_OD_IOTV_1","VSM_CarrierRig_Breacher_OGA","VSM_CarrierRig_Gunner_OGA","VSM_CarrierRig_Operator_OGA","VSM_LBT6094_breacher_OGA","VSM_LBT6094_MG_OGA","VSM_LBT6094_operator_OGA","VSM_FAPC_Breacher_OGA_OD","VSM_FAPC_MG_OGA_OD","VSM_FAPC_Operator_OGA_OD","VSM_CarrierRig_Breacher_OGA_OD","VSM_CarrierRig_Gunner_OGA_OD","VSM_CarrierRig_Operator_OGA_OD","VSM_LBT6094_breacher_OGA_OD","VSM_LBT6094_MG_OGA_OD","VSM_LBT6094_operator_OGA_OD","VSM_RAV_Breacher_OGA_OD","VSM_RAV_MG_OGA_OD","VSM_RAV_operator_OGA_OD","VSM_RAV_Breacher_OGA","VSM_RAV_MG_OGA","VSM_RAV_operator_OGA","VSM_OGA_Vest_1","VSM_OGA_OD_Vest_1","VSM_OGA_Vest_2","VSM_OGA_OD_Vest_2","VSM_OGA_Vest_3","VSM_OGA_OD_Vest_3","VSM_FAPC_Breacher_ProjectHonor","VSM_FAPC_MG_ProjectHonor","VSM_FAPC_Operator_ProjectHonor","VSM_CarrierRig_Breacher_ProjectHonor","VSM_CarrierRig_Gunner_ProjectHonor","VSM_CarrierRig_Operator_ProjectHonor","VSM_LBT6094_breacher_ProjectHonor","VSM_LBT6094_MG_ProjectHonor","VSM_LBT6094_operator_ProjectHonor","VSM_RAV_Breacher_ProjectHonor","VSM_RAV_MG_ProjectHonor","VSM_RAV_operator_ProjectHonor","VSM_Gen2_BattleBelt_paca_Ranger","VSM_Gen2_BattleBelt_Ranger","VSM_2017_ChestRig_PACA_MEDIC_Ranger","VSM_2017_ChestRig_PACA_Ranger","VSM_2017_ChestRig_Ranger","VSM_LBT6094_gen2_556_Ranger","VSM_LBT6094_gen2_Ranger","VSM_MBSS_PACA_BattleBelt_operator_Ranger","VSM_MBSS_PACA_operator_Ranger"
	
	];


_items_loot1 = selectRandom [
	//for RyanZombies
	//"RyanZombiesAntiVirusTemporary_Item",
	//"RyanZombiesAntiVirusCure_Item",
	
	//Vanilla
	//Tools
	"Rangefinder",			
	"Laserdesignator",
	"Laserdesignator_02",
	"Laserdesignator_03"
	];


_items_loot2 = selectRandom [
	//Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
	//BipodAttachments
	"bipod_01_F_blk",
	"bipod_01_F_mtp",
	"bipod_01_F_snd",
	"bipod_02_F_blk",
	"bipod_02_F_hex",
	"bipod_02_F_tan",
	"bipod_03_F_blk",
	"bipod_03_F_oli",
	//OpticAttachments
	"optic_Aco",
	"optic_ACO_grn",
	"optic_AMS",
	"optic_AMS_khk",
	"optic_AMS_snd",
	"optic_Arco",
	"optic_DMS",
	"optic_Hamr",
	"optic_Holosight",
	"optic_KHS_blk",
	"optic_MRCO",
	"optic_SOS",
	//Apex
	"optic_Arco_blk_F",
	"optic_DMS_ghex_F",
	"optic_Hamr_khk_F",
	"optic_ERCO_blk_F",
	//NVG
	"NVGoggles",
	"NVGoggles_INDEP",
	"NVGoggles_OPFOR",
	"VSM_Gasmask_acc"
	];
	
_items_loot21 = selectRandom [
	//Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
	//BipodAttachments
	//OpticAttachments
	"optic_Aco",
	"optic_ACO_grn",
	"optic_DMS",
	"optic_Hamr",
	"optic_Holosight",
	"optic_MRCO",
	"optic_SOS",
	//NVG
	"NVGoggles",
	"NVGoggles_INDEP",
	"NVGoggles_OPFOR",
	"VSM_Gasmask_acc"
	];


_items_loot3 = selectRandom [
	//Smokes
	"SmokeShell",
	"SmokeShellOrange",
	"SmokeShellGreen",
	"SmokeShellRed",
	"1Rnd_Smoke_Grenade_shell",
	"1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeRed_Grenade_shell",
	//Explosives
	"HandGrenade",
	"MiniGrenade",
	"B_IR_Grenade",
	"O_IR_Grenade",
	"I_IR_Grenade",
	"1Rnd_HE_Grenade_shell",
	"APERSBoundingMine_Range_Mag",
	"APERSMine_Range_Mag",
	"APERSTripMine_Wire_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"DemoCharge_Remote_Mag",
	"IEDLandBig_Remote_Mag",
	"IEDLandSmall_Remote_Mag",
	"IEDUrbanBig_Remote_Mag",
	"IEDUrbanSmall_Remote_Mag",
	"SatchelCharge_Remote_Mag",
	"SLAMDirectionalMine_Wire_Mag"
	];
	

//addweaponcargo	addItemCargo	addMagazineCargo

//	VSM weapons
_Cargo addweaponcargo [_vsmweapons_Loot, 5];	//	5 is the amount 

//	NI Arsenal weapons
_Cargo addweaponcargo [_hlcweapons_Loot, 5];	//	5 is the amount 

//	VSM Uniforms
_Cargo additemcargo [_vsmuniforms_loot, 5];

//	VSM Vest
_Cargo additemcargo [_vsmvests_loot, 5];

//	items 1  special items
_Cargo addweaponcargo [_items_loot1, 3];

//	items 2 Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
_Cargo addItemCargo [_items_loot2, 3];

//	items 21 Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
_Cargo addItemCargo [_items_loot21, 3];

//	items 2 Here ONLY :Flares , Smokes , Explosives
_Cargo addMagazineCargo [_items_loot3, 3];

//	vsm weapon's cargo mags
_magazines_weapon = getArray (configFile / "CfgWeapons" / _vsmweapons_Loot / "magazines");
_magazineClass_weapon = selectRandom _magazines_weapon; 

_Cargo addMagazineCargoGlobal [_magazineClass_weapon, 10];		//	10 mags

//	hlc weapon's cargo mags
_magazines_weapon = getArray (configFile / "CfgWeapons" / _hlcweapons_Loot / "magazines");
_magazineClass_weapon = selectRandom _magazines_weapon; 

_Cargo addMagazineCargoGlobal [_magazineClass_weapon, 10];		//	10 mags

/*//	Extra type of magazines
_magazines_Extra = getArray (configFile / "CfgWeapons" / _weapons_Loot / "magazines");
_magazineClass_Extra = selectRandom _magazines_Extra; 
_Cargo addMagazineCargoGlobal [_magazineClass_Extra, 10];	//	10 mags	
*/
};


//________________ Selected loot ________________
if (_Custom_loot) then {

//    systemchat "_Custom_loot";


// weapons
{
	_cargo addweaponcargo _x;
}forEach [
			
	//LightMachineGuns
	"arifle_MX_SW_Black_F",
	"arifle_MX_SW_F",
	"LMG_Mk200_F",
	"LMG_Zafir_F",
	"LMG_03_F",				
	"MMG_01_hex_F",
	"MMG_01_tan_F",
	"MMG_02_black_F",
	"MMG_02_camo_F",
	"MMG_02_sand_F",
	//Apex
	"LMG_03_F",

	//AssaultRifles
	"arifle_Katiba_C_F",
	"arifle_Katiba_F",
	"arifle_Katiba_GL_F",
	"arifle_Mk20_F",
	"arifle_Mk20_GL_F",
	"arifle_Mk20_GL_plain_F",
	"arifle_Mk20_plain_F",
	"arifle_Mk20C_F",
	"arifle_Mk20C_plain_F",
	"arifle_MX_Black_F",
	"arifle_MX_F",
	"arifle_MX_GL_Black_F",
	"arifle_MX_GL_F",
	"arifle_MXC_Black_F",
	"arifle_MXC_F",
	"arifle_SDAR_F",
	"arifle_TRG20_F",
	"arifle_TRG21_F",
	"arifle_TRG21_GL_F",			
	//Apex AssaultRifles
	"arifle_AK12_F",
	"arifle_AK12_GL_F",
	"arifle_AKM_F",
	"arifle_AKM_FL_F",
	"arifle_AKS_F",
	//AK x2
	"arifle_AK12_F",
	"arifle_AK12_GL_F",
	"arifle_AKM_F",
	"arifle_AKM_FL_F",
	"arifle_AKS_F",
	//
	"arifle_ARX_blk_F",
	"arifle_ARX_ghex_F",
	"arifle_ARX_hex_F",
	"arifle_CTAR_blk_F",
	"arifle_CTAR_hex_F",
	"arifle_CTAR_ghex_F",
	"arifle_CTAR_GL_blk_F",
	"arifle_CTARS_blk_F",
	"arifle_CTARS_hex_F",
	"arifle_CTARS_ghex_F",
	"arifle_SPAR_01_blk_F",
	"arifle_SPAR_01_khk_F",
	"arifle_SPAR_01_snd_F",
	"arifle_SPAR_01_GL_blk_F",
	"arifle_SPAR_01_GL_khk_F",
	"arifle_SPAR_01_GL_snd_F",
	"arifle_SPAR_02_blk_F",
	"arifle_SPAR_02_khk_F",
	"arifle_SPAR_02_snd_F",			
	"arifle_SPAR_03_blk_F",
	"arifle_SPAR_03_khk_F",
	"arifle_SPAR_03_snd_F",
	"arifle_MX_khk_F",
	"arifle_MX_GL_khk_F",
	"arifle_MXC_khk_F",
	"arifle_MXM_khk_F",

	//SniperRifles
	"arifle_MXM_Black_F",
	"arifle_MXM_F",
	"srifle_DMR_01_F",
	"srifle_DMR_02_camo_F",
	"srifle_DMR_02_F",
	"srifle_DMR_02_sniper_F",
	"srifle_DMR_03_F",
	"srifle_DMR_03_khaki_F",
	"srifle_DMR_03_multicam_F",
	"srifle_DMR_03_tan_F",
	"srifle_DMR_03_woodland_F",
	"srifle_DMR_04_F",
	"srifle_DMR_04_Tan_F",
	"srifle_DMR_05_blk_F",
	"srifle_DMR_05_hex_F",
	"srifle_DMR_05_tan_f",
	"srifle_DMR_06_camo_F",
	"srifle_DMR_06_olive_F",
	"srifle_EBR_F",
	"srifle_GM6_camo_F",
	"srifle_GM6_F",
	"srifle_LRR_camo_F",
	"srifle_LRR_F",			
	//Apex SniperRifles
	"srifle_LRR_tna_F",
	"srifle_GM6_ghex_F",
	"srifle_DMR_07_blk_F",
	"srifle_DMR_07_hex_F",
	"srifle_DMR_07_ghex_F",
	
	// Launchers
	"launch_NLAW_F",
	"launch_RPG32_F",
	"launch_RPG32_ghex_F",
	"launch_RPG7_F",
	"launch_RPG7_F",	//x2
	"launch_Titan_F",
	"launch_I_Titan_F",
	"launch_O_Titan_ghex_F",
	"launch_O_Titan_F",
	"launch_B_Titan_F",
	"launch_B_Titan_tna_F",
	"launch_Titan_short_F",
	"launch_O_Titan_short_F",
	"launch_O_Titan_short_ghex_F",
	"launch_I_Titan_short_F",
	"launch_B_Titan_short_F",
	"launch_B_Titan_short_tna_F"
];


//    Magazine
{
	_cargo addMagazineCargoGlobal _x;
} forEach [
	
	["MiniGrenade", (random 20)],
	["HandGrenade", 10],
	["Laserbatteries", 5],
	["7Rnd_408_Mag", 10],
	["9Rnd_45ACP_Mag", 10],
	["130Rnd_338_Mag", 10],
	["20Rnd_556x45_UW_mag", 10],
	["20Rnd_762x51_Mag", 10],
	["30Rnd_45ACP_Mag_SMG_01", 10],
	["30Rnd_556x45_Stanag", 10],
	["30Rnd_65x39_caseless_green", 10],
	["30Rnd_9x21_Mag", 10],
	["APERSBoundingMine_Range_Mag", 10],
	["APERSMine_Range_Mag", 10],
	["APERSTripMine_Wire_Mag", 10],
	["ATMine_Range_Mag", 10],
	["ClaymoreDirectionalMine_Remote_Mag", 10],
	["DemoCharge_Remote_Mag", 10],
	["SatchelCharge_Remote_Mag", 10],
	["SLAMDirectionalMine_Wire_Mag", 10],
	["SmokeShell", 10],
	["SmokeShellBlue", 10],
	["SmokeShellGreen", 10],
	["SmokeShellOrange", 10],
	["SmokeShellPurple", 10],
	["SmokeShellRed", 10],
	["SmokeShellYellow", 10]
];

// items
{
	_cargo addItemCargoGlobal _x;
} forEach
[
	["FirstAidKit", (10 + (random 10))],
	["Binocular", 5],
	["acc_flashlight", 5],
	["acc_pointer_IR", 5],
	["bipod_03_F_oli", 5],
	["B_UavTerminal", 5],
	["FirstAidKit", 5],
	["ItemCompass", 5],
	["ItemGPS", 5],
	["ItemMap", 5],
	["ItemRadio", 5],
	["ItemWatch", 5],
	["Laserdesignator", 5],
	["Rangefinder", 5],
	["ToolKit", 5],
	["MineDetector", 5],
	["muzzle_snds_338_green", 5],
	["muzzle_snds_93mmg_tan", 5],
	["muzzle_snds_acp", 5],
	["muzzle_snds_B", 5],
	["muzzle_snds_H", 5],
	["muzzle_snds_H_MG", 5],
	["muzzle_snds_H_SW", 5],
	["muzzle_snds_L", 5],
	["muzzle_snds_M", 5],
	["NVGoggles", 5],
	["optic_ACO_grn", 5],
	["optic_ACO_grn_smg", 5],
	["optic_AMS_snd", 5],
	["optic_Arco", 5],
	["optic_DMS", 5],
	["optic_Hamr", 5],
	["optic_Holosight", 5],
	["optic_Holosight_smg", 5],
	["optic_KHS_old", 5],
	["optic_KHS_tan", 5],
	["optic_LRPS", 5],
	["optic_MRCO", 5],
	["optic_MRD", 5],
	["optic_Nightstalker", 5],
	["optic_NVS", 5],
	["optic_SOS", 5],
	["optic_tws", 5],
	["optic_tws_mg", 5],
	["optic_Yorris", 5]
];

};
 
	
//________________ Type of Chemlight and Smoke ________________

_Chemlight_1 = "Chemlight_red" createVehicle (position _Cargo);
_Chemlight_1 attachTo [_Cargo, [0,0.5,-0.4]];
_Chemlight_2 = "Chemlight_red" createVehicle (position _Cargo);
_Chemlight_2 attachTo [_Cargo, [0,-0.5,-0.4]];
_Smoke = "SmokeShellOrange" createVehicle (position _Cargo);
_Smoke attachTo [_Cargo, [0,0,0]];


waitUntil {getPos _Cargo select 2 < 4};
_vel = velocity _Cargo;
_Cargo setVelocity _vel;

waitUntil {getPos _Cargo select 2 < 0};
playSound3D ["a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss",_Cargo];
           
detach _Cargo;
_parachute disableCollisionWith _Cargo;   

_time = time + 6;
waitUntil {time > _time};       
if (!isNull _parachute) then {deleteVehicle _parachute};
_Cargo enableSimulation true;


}; 


systemchat "C a r g o   A i r d r o p s    S p a w n e d";