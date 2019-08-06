/**
 * MAIN CONFIGURATION FILE
 *
 * English and French comments
 * Commentaires anglais et français
 *
 * (EN)
 * This file contains the configuration variables of the logistics system.
 * For the configuration of the creation factory, see the file "config_creation_factory.sqf".
 * IMPORTANT NOTE : when a logistics feature is given to an object/vehicle class name, all the classes which inherit
 *									of the parent/generic class (according to the CfgVehicles) will also have this feature.
 *									CfgVehicles tree view example : http://madbull.arma.free.fr/A3_stable_1.20.124746_CfgVehicles_tree.html
 *
 * (FR)
 * Fichier contenant les variables de configuration du système de logistique.
 * Pour la configuration de l'usine de création, voir le fichier "config_creation_factory.sqf".
 * NOTE IMPORTANTE : lorsqu'une fonctionnalité logistique est accordée à un nom de classe d'objet/véhicule, les classes
 *									 héritant de cette classe mère/générique (selon le CfgVehicles) se verront également dotées de cette fonctionnalité.
 *									 Exemple d'arborescence du CfgVehicles : http://madbull.arma.free.fr/A3_stable_1.20.124746_CfgVehicles_tree.html
 */

/**
 * DISABLE LOGISTICS ON OBJECTS BY DEFAULT
 *
 * (EN)
 * Define if objects and vehicles have logistics features by default,
 * or if it must be allowed explicitely on specific objects/vehicles.
 *
 * If false : all objects are enabled according to the class names listed in this configuration file
 *						You can disable some objects with : object setVariable ["R3F_LOG_disabled", true];
 * If true :	all objects are disabled by default
 *						You can enable some objects with : object setVariable ["R3F_LOG_disabled", false];
 *
 *
 * (FR)
 * Défini si les objets et véhicules disposent des fonctionnalités logistiques par défaut,
 * ou si elles doivent être autorisés explicitement sur des objets/véhicules spécifiques.
 *
 * Si false : tous les objets sont actifs en accord avec les noms de classes listés dans ce fichier
 *						Vous pouvez désactiver certains objets avec : objet setVariable ["R3F_LOG_disabled", true];
 * Si true :	tous les objets sont inactifs par défaut
 *						Vous pouvez activer quelques objets avec : objet setVariable ["R3F_LOG_disabled", false];
 */
R3F_LOG_CFG_disabled_by_default = false;

/**
 * LOCK THE LOGISTICS FEATURES TO SIDE, FACTION OR PLAYER
 *
 * (EN)
 * Define the lock mode of the logistics features for an object.
 * An object can be locked to the a side, faction, a player (respawn) or a unit (life).
 * If the object is locked, the player can unlock it according to the
 * value of the config variable R3F_LOG_CFG_unlock_objects_timer.
 *
 * If "none" : no lock features, everyone can used the logistics features.
 * If "side" : the object is locked to the last side which interacts with it.
 * If "faction" : the object is locked to the last faction which interacts with it.
 * If "player" : the object is locked to the last player which interacts with it. The lock is transmitted after respawn.
 * If "unit" : the object is locked to the last player which interacts with it. The lock is lost when the unit dies.
 *
 * Note : for military objects (not civilian), the lock is initialized to the object's side.
 *
 * See also the config variable R3F_LOG_CFG_unlock_objects_timer.
 *
 * (FR)
 * Défini le mode de verrouillage des fonctionnalités logistics pour un objet donné.
 * Un objet peut être verrouillé pour une side, une faction, un joueur (respawn) ou une unité (vie).
 * Si l'objet est verrouillé, le joueur peut le déverrouiller en fonction de la
 * valeur de la variable de configiration R3F_LOG_CFG_unlock_objects_timer.
 *
 * Si "none" : pas de verrouillage, tout le monde peut utiliser les fonctionnalités logistiques.
 * Si "side" : l'objet est verrouillé pour la dernière side ayant interagit avec lui.
 * Si "faction" : l'objet est verrouillé pour la dernière faction ayant interagit avec lui.
 * Si "player" : l'objet est verrouillé pour le dernier joueur ayant interagit avec lui. Le verrou est transmis après respawn.
 * Si "unit" : l'objet est verrouillé pour le dernier joueur ayant interagit avec lui. Le verrou est perdu quand l'unité meurt.
 *
 * Note : pour les objets militaires (non civils), le verrou est initialisé à la side de l'objet.
 *
 * Voir aussi la variable de configiration R3F_LOG_CFG_unlock_objects_timer.
 */
R3F_LOG_CFG_lock_objects_mode = "none";

/**
 * COUNTDOWN TO UNLOCK AN OBJECT
 *
 * Define the countdown duration (in seconds) to unlock a locked object.
 * Set to -1 to deny the unlock of objects.
 * See also the config variable R3F_LOG_CFG_lock_objects_mode.
 *
 * Défini la durée (en secondes) du compte-à-rebours pour déverrouiller un objet.
 * Mettre à -1 pour qu'on ne puisse pas déverrouiller les objets.
 * Voir aussi la variable de configiration R3F_LOG_CFG_lock_objects_mode.
 */
R3F_LOG_CFG_unlock_objects_timer = 1;

/**
 * ALLOW NO GRAVITY OVER GROUND
 *
 * Define if movable objects with no gravity simulation can be set in height over the ground (no ground contact).
 * The no gravity objects corresponds to most of decoration and constructions items.
 *
 * Défini si les objets déplaçable sans simulation de gravité peuvent être position en hauteur sans être contact avec le sol.
 * Les objets sans gravité correspondent à la plupart des objets de décors et de construction.
 */
R3F_LOG_CFG_no_gravity_objects_can_be_set_in_height_over_ground = true;

/**
 * LANGUAGE
 *
 * Automatic language selection according to the game language.
 * New languages can be easily added (read below).
 *
 * Sélection automatique de la langue en fonction de la langue du jeu.
 * De nouveaux langages peuvent facilement être ajoutés (voir ci-dessous).
 */
R3F_LOG_CFG_language = switch (language) do
{
	case "English":{"en"};
	case "French":{"fr"};

	// Feel free to create you own language file named "XX_strings_lang.sqf", where "XX" is the language code.
	// Make a copy of an existing language file (e.g. en_strings_lang.sqf) and translate it.
	// Then add a line with this syntax : case "YOUR_GAME_LANGUAGE":{"LANGUAGE_CODE"};
	// For example :

	//case "Czech":{"cz"}; // Not supported. Need your own "cz_strings_lang.sqf"
	//case "Polish":{"pl"}; // Not supported. Need your own "pl_strings_lang.sqf"
	//case "Portuguese":{"pt"}; // Not supported. Need your own "pt_strings_lang.sqf"
	//case "YOUR_GAME_LANGUAGE":{"LANGUAGE_CODE"};	// Need your own "LANGUAGE_CODE_strings_lang.sqf"

	default {"en"}; // If language is not supported, use English
};

/**
 * CONDITION TO ALLOW LOGISTICS
 *
 * (EN)
 * This variable allow to set a dynamic SQF condition to allow/deny all logistics features only on specific clients.
 * The variable must be a STRING delimited by quotes and containing a valid SQF condition to evaluate during the game.
 * For example you can allow logistics only on few clients having a known game ID by setting the variable to :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Or based on the profile name : "profileName in [""john"", ""jack"", ""james""]"
 * Or only for the server admin : "serverCommandAvailable "#kick"""
 * The condition is evaluted in real time, so it can use condition depending on the mission progress : "alive officer && taskState task1 == ""Succeeded"""
 * Or to deny logistics in a circular area defined by a marker : "player distance getMarkerPos ""markerName"" > getMarkerSize ""markerName"" select 0"
 * Note that quotes of the strings inside the string condition must be doubled.
 * Note : if the condition depends of the aimed objects/vehicle, you can use the command cursorObject
 * To allow the logistics to everyone, just set the condition to "true".
 *
 * (FR)
 * Cette variable permet d'utiliser une condition SQF dynamique pour autoriser ou non les fonctions logistiques sur des clients spécifiques.
 * La variable doit être une CHAINE de caractères délimitée par des guillemets et doit contenir une condition SQF valide qui sera évaluée durant la mission.
 * Par exemple pour autoriser la logistique sur seulement quelques joueurs ayant un ID de jeu connu, la variable peut être défini comme suit :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Ou elle peut se baser sur le nom de profil : "profileName in [""maxime"", ""martin"", ""marc""]"
 * Ou pour n'autoriser que l'admin de serveur : "serverCommandAvailable "#kick"""
 * Les condition sont évaluées en temps réel, et peuvent donc dépendre du déroulement de la mission : "alive officier && taskState tache1 == ""Succeeded"""
 * Ou pour interdire la logistique dans la zone défini par un marqueur circulaire : "player distance getMarkerPos ""markerName"" > getMarkerSize ""markerName"" select 0"
 * Notez que les guillemets des chaînes de caractères dans la chaîne de condition doivent être doublés.
 * Note : si la condition dépend de l'objet/véhicule pointé, vous pouvez utiliser la commande cursorObject
 * Pour autoriser la logistique chez tout le monde, il suffit de définir la condition à "true".
 */
R3F_LOG_CFG_string_condition_allow_logistics_on_this_client = "true";

/**
 * CONDITION TO ALLOW CREATION FACTORY
 *
 * (EN)
 * This variable allow to set a dynamic SQF condition to allow/deny the access to the creation factory only on specific clients.
 * The variable must be a STRING delimited by quotes and containing a valid SQF condition to evaluate during the game.
 * For example you can allow the creation factory only on few clients having a known game ID by setting the variable to :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Or based on the profile name : "profileName in [""john"", ""jack"", ""james""]"
 * Or only for the server admin : "serverCommandAvailable "#kick"""
 * Note that quotes of the strings inside the string condition must be doubled.
 * Note : if the condition depends of the aimed objects/véhicule, you can use the command cursorObject
 * Note also that the condition is evaluted in real time, so it can use condition depending on the mission progress :
 * "alive officer && taskState task1 == ""Succeeded"""
 * To allow the creation factory to everyone, just set the condition to "true".
 *
 * (FR)
 * Cette variable permet d'utiliser une condition SQF dynamique pour rendre accessible ou non l'usine de création sur des clients spécifiques.
 * La variable doit être une CHAINE de caractères délimitée par des guillemets et doit contenir une condition SQF valide qui sera évaluée durant la mission.
 * Par exemple pour autoriser l'usine de création sur seulement quelques joueurs ayant un ID de jeu connu, la variable peut être défini comme suit :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Ou elle peut se baser sur le nom de profil : "profileName in [""maxime"", ""martin"", ""marc""]"
 * Ou pour n'autoriser que l'admin de serveur : "serverCommandAvailable "#kick"""
 * Notez que les guillemets des chaînes de caractères dans la chaîne de condition doivent être doublés.
 * Note : si la condition dépend de l'objet/véhicule pointé, vous pouvez utiliser la commande cursorObject
 * Notez aussi que les condition sont évaluées en temps réel, et peuvent donc dépendre du déroulement de la mission :
 * "alive officier && taskState tache1 == ""Succeeded"""
 * Pour autoriser l'usine de création chez tout le monde, il suffit de définir la condition à "true".
 */
R3F_LOG_CFG_string_condition_allow_creation_factory_on_this_client = "false";

/*
 ********************************************************************************************
 * BELOW IS THE CLASS NAMES CONFIGURATION / CI-DESSOUS LA CONFIGURATION DES NOMS DE CLASSES *
 ********************************************************************************************
 *
 * (EN)
 * There are two ways to manage new objects with the logistics system. The first one is to add these objects in the
 * following appropriate lists. The second one is to create a new external file in the /addons_config/ directory,
 * based on /addons_config/TEMPLATE.sqf, and to add a #include below to.
 * The first method is better to add/fix only some various class names.
 * The second method is better to take into account an additional addon.
 *
 * These variables are based on the inheritance principle according to the CfgVehicles tree.
 * It means that a features accorded to a class name, is also accorded to all child classes.
 * Inheritance tree view : http://madbull.arma.free.fr/A3_1.32_CfgVehicles_tree.html
 *
 * (FR)
 * Deux moyens existent pour gérer de nouveaux objets avec le système logistique. Le premier consiste à ajouter
 * ces objets dans les listes appropriées ci-dessous. Le deuxième est de créer un fichier externe dans le répertoire
 * /addons_config/ basé sur /addons_config/TEMPLATE.sqf, et d'ajouter un #include ci-dessous.
 * La première méthode est préférable lorsqu'il s'agit d'ajouter ou corriger quelques classes diverses.
 * La deuxième méthode est préférable s'il s'agit de prendre en compte le contenu d'un addon supplémentaire.
 *
 * Ces variables sont basées sur le principe d'héritage utilisés dans l'arborescence du CfgVehicles.
 * Cela signifie qu'une fonctionnalité accordée à une classe, le sera aussi pour toutes ses classes filles.
 * Vue de l'arborescence d'héritage : http://madbull.arma.free.fr/A3_1.32_CfgVehicles_tree.html
 */

/****** LIST OF ADDONS CONFIG TO INCLUDE / LISTE DES CONFIG D'ADDONS A INCLURE ******/
//#include "addons_config\A3_vanilla.sqf"
//#include "addons_config\All_in_Arma.sqf"
//#include "addons_config\R3F_addons.sqf"
//#include "addons_config\YOUR_ADDITIONAL_ADDON.sqf"

/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of ground vehicles which can tow objects.
 * Liste des noms de classes des véhicules terrestres pouvant remorquer des objets.
 */
R3F_LOG_CFG_can_tow = R3F_LOG_CFG_can_tow +
[
	// e.g. : "MyTowingVehicleClassName1", "MyTowingVehicleClassName2"
	//Base Classes
	/*"Ship_F",
	"ACE_Truck5tMG_Base",
	"Tank",
	"Car_F"*/

];

/**
 * List of class names of objects which can be towed.
 * Liste des noms de classes des objets remorquables.
 */
R3F_LOG_CFG_can_be_towed = R3F_LOG_CFG_can_be_towed +
[
	// e.g. : "MyTowableObjectClassName1", "MyTowableObjectClassName2"

	//Base Classes
	/*"ACE_EASA_Vehicle",
	"Car_F",
	"Ship_F",
	"Tank",
	"Air",
	//Specific Classes
	"B_Radar_System_01_F",
	"O_SAM_System_04_F",
	"O_Radar_System_02_F",
	"B_SAM_System_03_F"*/
];


/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of helicopters which can lift objects.
 * Liste des noms de classes des hélicoptères pouvant héliporter des objets.
 */
R3F_LOG_CFG_can_lift = R3F_LOG_CFG_can_lift +
[
	// e.g. : "MyLifterVehicleClassName1", "MyLifterVehicleClassName2"
];

/**
 * List of class names of objects which can be lifted.
 * Liste des noms de classes des objets héliportables.
 */
R3F_LOG_CFG_can_be_lifted = R3F_LOG_CFG_can_be_lifted +
[
	// e.g. : "MyLiftableObjectClassName1", "MyLiftableObjectClassName2"
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
* (EN)
 * This section uses a numeric quantification of capacity and cost of the objets.
 * For example, in a vehicle has a capacity of 100, we will be able to load in 5 objects costing 20 capacity units.
 * The capacity doesn't represent a real volume or weight, but a choice made for gameplay.
 *
 * (FR)
 * Cette section utilise une quantification numérique de la capacité et du coût des objets.
 * Par exemple, dans un véhicule d'une capacité de 100, nous pouvons charger 5 objets coûtant 20 unités de capacité.
 * La capacité ne représente ni un poids, ni un volume, mais un choix fait pour la jouabilité.
 */

/**
 * List of class names of vehicles or cargo objects which can transport objects.
 * The second element of the nested arrays is the load capacity (in relation with the capacity cost of the objects).
 *
 * Liste des noms de classes des véhicules ou "objets contenant" pouvant transporter des objets.
 * Le deuxième élément des sous-tableaux est la capacité de chargement (en relation avec le coût de capacité des objets).
 */
R3F_LOG_CFG_can_transport_cargo = R3F_LOG_CFG_can_transport_cargo +
[
	// e.g. : ["MyTransporterClassName1", itsCapacity], ["MyTransporterClassName2", itsCapacity]
	["ACE_Truck5tRepair", 35],
	["B_LSV_01_AT_F", 30],
	["B_Slingload_01_Cargo_F", 1000],
	["B_T_LSV_01_armed_F", 30],
	["B_T_LSV_01_unarmed_F", 40],
	["B_T_UAV_03_F", 10],
	["B_T_VTOL_01_armed_F", 100],
	["B_T_VTOL_01_infantry_F", 250],
	["B_T_VTOL_01_vehicle_F", 500],
	["B_Truck_01_ammo_F", 0],
	["B_Truck_01_fuel_F", 100],
	["B_Truck_01_Repair_F", 100],
	["Boat_Armed_01_base_F", 20],
	["Boat_Civil_01_base_F", 10],
	["C_Offroad_02_unarmed_F", 30],
	["C_Plane_Civil_01_F", 10],
	["C_Plane_Civil_01_Racing_F", 10],
	["Hatchback_01_base_F", 10],
	["Heli_Attack_01_base_F", 0],
	["Heli_Attack_02_base_F", 50],
	["Heli_Light_01_base_F", 10],
	["Heli_Light_02_base_F", 20],
	["Heli_light_03_base_F", 20],
	["Heli_Transport_01_base_F", 25],
	["Heli_Transport_02_base_F", 200],
	["Heli_Transport_03_base_F", 250],
	["Heli_Transport_04_base_F", 175],
	["I_C_Offroad_02_unarmed_F", 30],
	["I_Truck_02_ammo_F", 0],
	["I_Truck_02_fuel_F", 70],
	["Land_Pod_Heli_Transport_04_box_F", 175],
	["MRAP_01_base_F", 30],
	["MRAP_02_base_F", 30],
	["MRAP_03_base_F", 30],
	["O_Heli_Transport_04_ammo_F", 0],
	["O_LSV_02_AT_F", 30],
	["O_T_LSV_02_armed_F", 30],
	["O_T_LSV_02_unarmed_F", 40],
	["O_T_VTOL_02_infantry_F", 50],
	["O_T_VTOL_02_vehicle_F", 100],
	["O_Truck_02_Ammo_F", 0],
	["O_Truck_02_fuel_F", 70],
	["O_Truck_03_ammo_F", 0],
	["O_Truck_03_fuel_F", 100],
	["O_Truck_03_repair_F", 100],
	["Offroad_01_armed_base_F", 20],
	["Offroad_01_base_F", 60],
	["Offroad_01_repair_base_F", 20],
	["Quadbike_01_base_F", 5],
	["Rubber_duck_base_F", 10],
	["SUV_01_base_F", 20],
	["Tank_F", 15],
	["Truck_01_base_F", 200],
	["Truck_02_base_F", 150],
	["Truck_03_base_F", 175],
	["UGV_01_base_F", 10],
	["Van_01_base_F", 70],
	["Van_02_base_F", 100],
	["Wheeled_APC_F", 40]
];

/**
 * List of class names of objects which can be loaded in transport vehicle/cargo.
 * The second element of the nested arrays is the cost capacity (in relation with the capacity of the vehicles).
 *
 * Liste des noms de classes des objets transportables.
 * Le deuxième élément des sous-tableaux est le coût de capacité (en relation avec la capacité des véhicules).
 */
R3F_LOG_CFG_can_be_transported_cargo = R3F_LOG_CFG_can_be_transported_cargo +
[
	// e.g. : ["MyTransportableObjectClassName1", itsCost], ["MyTransportableObjectClassName2", itsCost]
	//Parant Classes
	//["ReammoBox_F", 1],
	["Tank", 250],
	["ACE_Stretcher", 2],
	["ACE_KonkursTripod_NoGeo", 5],
	["ACE_M3Tripod", 3],
	["ACE_Konkurs", 7],
	["ACE_SpottingScope", 3],
	["ACE_Lifeboat", 7],
	["ACE_Sandbag_NoGeo", 1],
	["ACE_BandageBoxWest", 4],
	["ACE_CSW_Box_Base", 12],
	["ACE_RuckBox_East", 12],
	["ACE_RuckBox_Ind", 12],
	["ACE_RUCK_Box_Base", 35],
	["ACE_Rope_Box_Base", 35],
	["ACE_SandBox", 35],
	["ACE_GuerillaCacheBox", 9],
	["ACE_RUBasicAmmunitionBox", 5],
	["ACE_RUOrdnanceBox", 9],
	["ACE_RUVehicleBox", 40],
	["ACE_RUBasicWeaponsBox", 15],
	["ACE_RULaunchers", 9],
	["ACE_RULaunchersBox", 9],
	["ACE_RUSpecialWeaponsBox", 15],
	["ACE_LocalBasicAmmunitionBox", 5],
	["ACE_LocalBasicWeaponsBox", 10],
	["ACE_EmptyBox", 5],
	["ACE_HuntIRBox", 4],
	["ACE_KnicklichtBox", 4],
	["ACE_USBasicAmmunitionBox", 4],
	["ACE_USOrdnanceBox", 4],
	["ACE_USVehicleBox", 35],
	["ACE_USVehicleBox_EP1", 35],
	["ACE_USBasicWeaponsBox", 12],
	["ACE_USLaunchersBox", 9],
	["ACE_SpecialWeaponsBox", 12],
	["ACE_USSpecialWeaponsBox", 12],
	["ACE_TargetBase", 2],
	["ACE_UsedTubes", 2],
	["ACE_MS2000_STROBE_OBJECT", 1],
	["ACE_ConcertinaWireCoil", 5],
	["StaticWeapon", 5],
	//Child Classes
	["CargoNet_01_ammo_base_F", 3],
	["APC_Tracked_01_base_F", 200],
	["APC_Tracked_02_base_F", 200],
	["APC_Tracked_03_base_F", 200],
	["ArrowDesk_L_F", 2],
	["ArrowDesk_R_F", 2],
	["B_CargoNet_01_ammo_F", 4],
	["B_supplyCrate_F", 2],
	["B_T_LSV_01_unarmed_F", 50],
	["B_T_LSV_01_armed_F", 50],
	["BlockConcrete_F", 25],
	["Boat_Armed_01_base_F", 60],
	["Boat_Civil_01_base_F", 50],
	["Box_AAF_Equip_F", 2],
	["Box_AAF_Uniforms_F", 2],
	["Box_Ammo_F", 2],
	["Box_CSAT_Equip_F", 2],
	["Box_CSAT_Uniforms_F", 2],
	["Box_East_AmmoVeh_F", 10],
	["Box_FIA_Support_F", 2],
	["Box_FIA_Wps_F", 2],
	["Box_IED_Exp_F", 2],
	["Box_IND_AmmoOrd_FF", 2],
	["Box_IND_AmmoVeh_F", 10],
	["Box_NATO_AmmoVeh_F", 10],
	["Box_NATO_Equip_F", 2],
	["Box_NATO_Uniforms_F", 2],
	["Box_Syndicate_Wps_F", 2],
	["Box_Syndicate_WpsLaunch_F", 2],
	["C_Offroad_02_unarmed_F", 40],
	["Van_02_base_F", 60],
	["C_Scooter_Transport_01_F", 15],
	["C_supplyCrate_F", 2],
	["C_T_supplyCrate_F", 2],
	["CamoNet_BLUFOR_big_F", 10],
	["CamoNet_BLUFOR_F", 10],
	["CamoNet_BLUFOR_open_F", 10],
	["CamoNet_INDP_big_F", 10],
	["CamoNet_INDP_F", 10],
	["CamoNet_INDP_open_F", 10],
	["CamoNet_OPFOR_big_F", 10],
	["CamoNet_OPFOR_F", 10],
	["CamoNet_OPFOR_open_F", 10],
	["CargoNet_01_box_F", 2],
	["ContainmentArea_01_forest_F", 10],
	["ContainmentArea_01_sand_F", 10],
	["ContainmentArea_02_forest_F", 10],
	["ContainmentArea_02_sand_F", 10],
	["Dirthump_1_F", 30],
	["Dirthump_2_F", 50],
	["Dirthump_3_F", 50],
	["Dirthump_4_F", 40],
	["EAST_Box_Base", 1],
	["FIA_Box_Base_F", 1],
	["Flag_AAF_F", 5],
	["Flag_AltisColonial_F", 5],
	["Flag_Altis_F", 5],
	["Flag_Blue_F", 5],
	["Flag_CSAT_F", 5],
	["Flag_CTRG_F", 5],
	["Flag_FIA_F", 5],
	["Flag_Fuel_F", 5],
	["Flag_Gendarmerie_F", 5],
	["Flag_Green_F", 5],
	["Flag_NATO_F", 5],
	["Flag_POWMIA_F", 5],
	["Flag_RedCrystal_F", 5],
	["Flag_Red_F", 5],
	["Flag_Syndikat_F", 5],
	["Flag_UK_F", 5],
	["Flag_UNO_F", 5],
	["Flag_US_F", 5],
	["Flag_Viper_F", 5],
	["Flag_White_F", 5],
	["FlexibleTank_01_sand_F", 30],
	["Hatchback_01_base_F", 20],
	["I_C_Offroad_02_unarmed_F", 40],
	["I_supplyCrate_F", 2],
	["I_Truck_02_ammo_F", 400],
	["IG_supplyCrate_F", 2],
	["IND_Box_Base", 2],
	["Kart_01_Base_F", 10],
	["Land_Airport_Tower_F", 150],
	["Land_AncientPillar_F", 5],
	["Land_BackAlley_01_l_1m_F", 2],
	["Land_BackAlley_01_l_gate_F", 2],
	["Land_BackAlley_01_l_gap_F", 2],
	["Land_BackAlley_02_l_1m_F", 2],
	["Land_BagBunker_Large_F", 10],
	["Land_BagBunker_Small_F", 5],
	["Land_BagBunker_Tower_F", 7],
	["Land_BagFence_Corner_F", 2],
	["Land_BagFence_End_F", 2],
	["Land_BagFence_Long_F", 3],
	["Land_BagFence_Round_F", 2],
	["Land_BagFence_Short_F", 2],
	["Land_BambooFence_01_s_8m_F", 4],
	["Land_BambooFence_01_s_4m_F", 2],
	["Land_BambooFence_01_s_pole_F", 2],
	["Land_BarGate_F", 3],
	["Land_BarrelWater_F", 5], // barril azul, el de toda la vida,  160 L
	["Land_BarrelWater_grey_F", 5], //barril gris, igual al de toda la vida,  160 L
	["Land_WaterCooler_01_old_F", 2], //Dispensador refrigerador de agua nuevo 20 L
	["Land_WaterCooler_01_new_F", 2], //Dispensador refrigerador de agua viejo 20 L
	["Land_WaterBarrel_F", 10], //barril grande 200 L
	["StorageBladder_02_water_forest_F", 10], //las bolsas gigantes 1000 L
	["StorageBladder_02_water_sand_F", 10], //las bolsas gigantes 1000 L
	["WaterPump_01_sand_F", 20], //Bomba amarilla desierto de agua recurso infinito
	["WaterPump_01_forest_F", 20], //Bomba verde borque de agua recurso infinito
	["Land_WaterTank_F", 25], //Tanque horizontal 600 L
	["Land_WaterTank_01_F", 30], //Tanque Grande 2400 L
	["Land_WaterTank_02_F", 35], //Tanque Grande en alto 2400 L
	["Land_WaterTank_03_F", 20], //Tanque mediano (verde) 200 L
	["Land_WaterTank_04_F", 20], //Tanque mediano (verde) en alto 200 L
	["Land_BC_Court_F", 100],
	["Land_Bollard_01_F", 2],
	["Land_Camping_Light_F", 2],
	["Land_CampingTable_F", 2],
	["Land_CampingTable_small_F", 2],
	["Land_Canal_Wall_10m_F", 10],
	["Land_Canal_Wall_Stairs_F", 3],
	["Land_Canal_WallSmall_10m_F", 4],
	["Land_cargo_house_slum_F", 10],
	["Land_Cargo_House_V1_F", 50],
	["Land_Cargo_House_V2_F", 50],
	["Land_Cargo_House_V3_F", 50],
	["Land_Cargo_House_V3_F", 50],
	["Land_Cargo_HQ_V1_F", 75],
	["Land_Cargo_HQ_V2_F", 75],
	["Land_Cargo_HQ_V3_F", 75],
	["Land_Cargo_Patrol_V1_F", 10],
	["Land_Cargo_Patrol_V2_F", 10],
	["Land_Cargo_Patrol_V3_F", 10],
	["Land_Cargo_Tower_V1_No5_F", 100],
	["Land_Cargo_Tower_V1_No6_F", 100],
	["Land_Cargo_Tower_V1_No1_F", 100],
	["Land_Cargo_Tower_V1_No7_F", 100],
	["Land_Cargo_Tower_V1_No2_F", 100],
	["Land_Cargo_Tower_V1_F", 100],
	["Land_Cargo_Tower_V1_No3_F", 100],
	["Land_Cargo_Tower_V1_No4_F", 100],
	["Land_Cargo_Tower_V2_F", 100],
	["Land_Cargo_Tower_V3_F", 100],
	["Land_CargoBox_V1_F", 5],
	["Land_CarService_F", 5],
	["Land_CashDesk_F", 5],
	["Land_Castle_01_tower_F", 75],
	["Land_City2_4m_F", 2],
	["Land_City2_8m_F", 4],
	["Land_City2_PillarD_F", 2],
	["Land_City_4m_F", 2],
	["Land_City_8m_F", 4],
	["Land_City_Gate_F", 2],
	["Land_City_Pillar_F", 2],
	["Land_cmp_Shed_F", 50],
	["Land_cmp_Tower_F", 50],
	["Land_CncBarrier_F", 4],
	["Land_CncBarrier_stripes_F", 4],
	["Land_CncBarrierMedium4_F", 4],
	["Land_CncBarrierMedium_F", 4],
	["Land_CncShelter_F", 2],
	["Land_CncWall1_F", 3],
	["Land_CncWall4_F", 5],
	["Land_Concrete_SmallWall_4m_F", 2],
	["Land_Concrete_SmallWall_8m_F", 4],
	["Land_ConcretePipe_F",5],
	["Land_ConcreteWall_01_l_gate_F", 2],
	["Land_ConcreteWall_01_m_pole_F", 2],
	["Land_ConcreteWall_01_l_8m_F", 4],
	["Land_ConcreteWall_01_m_4m_F", 2],
	["Land_ConcreteWall_01_m_8m_F", 4],
	["Land_ConcreteWall_01_l_4m_F", 2],
	["Land_ConcreteWall_01_l_pole_F", 2],
	["Land_ConcreteWall_01_m_gate_F", 2],
	["Land_ConcreteWall_02_m_8m_F", 4],
	["Land_ConcreteWall_02_m_gate_F", 2],
	["Land_ConcreteWall_02_m_4m_F", 2],
	["Land_ConcreteWall_02_m_2m_F", 2],
	["Land_ConcreteWall_02_m_pole_F", 2],
	["Land_Crane_F", 150],
	["Land_Crash_barrier_F", 5],
	["Land_CrashBarrier_01_8m_F", 4],
	["Land_CrashBarrier_01_end_R_F", 2],
	["Land_CrashBarrier_01_4m_F", 2],
	["Land_CrashBarrier_01_end_L_F", 2],
	["Land_Device_assembled_F", 10],
	["Land_Device_disassembled_F", 10],
	["Land_Device_slingloadable_F", 10],
	["Land_Dome_Big_F", 200],
	["Land_Dome_Small_F", 150],
	["Land_dp_bigTank_F", 80],
	["Land_dp_smallTank_F", 50],
	["Land_Factory_Tunnel_F", 40],
	["Land_fs_feed_F", 10],
	["Land_fs_roof_F", 50],
	["Land_FuelStation_Build_F", 50],
	["Land_FuelStation_Feed_F", 75],
	["Land_FuelStation_Shed_F", 50],
	["Land_GH_Gazebo_F", 100],
	["Land_GH_House_1_F", 100],
	["Land_GH_House_2_F", 150],
	["Land_GH_Stairs_F", 10],
	["Land_Graffiti_01_F", 2],
	["Land_Grave_dirt_F", 5],
	["Land_Grave_forest_F", 5],
	["Land_Grave_monument_F", 3],
	["Land_Grave_memorial_F", 3],
	["Land_Grave_obelisk_F",10],
	["Land_Grave_rocks_F", 5],
	["Land_Grave_soldier_F", 5],
	["Land_Grave_V1_F", 5],
	["Land_Grave_V2_F", 5],
	["Land_Grave_V3_F", 5],
	["Land_GuardRailing_01_F", 2],
	["Land_Hangar_F", 100],
	["Land_Hangar_F", 100],
	["Land_HBarrier_1_F", 3],
	["Land_HBarrier_3_F", 4],
	["Land_HBarrier_5_F", 5],
	["Land_HBarrier_5_F", 5],
	["Land_HBarrier_Big_F", 5],
	["Land_HBarrierBig_F", 5],
	["Land_HBarrierTower_F", 8],
	["Land_HBarrierWall4_F", 4],
	["Land_HBarrierWall6_F", 6],
	["Land_HBarrierWall_corner_F", 7],
	["Land_HBarrierWall_corridor_F", 8],
	["Land_Hedge_01_s_2m_F", 2],
	["Land_Hedge_01_s_4m_F", 4],
	["Land_HelipadCircle_F", 2],
	["Land_HelipadCivil_F", 2],
	["Land_HelipadRescue_F", 2],
	["Land_HelipadSquare_F", 2],
	["Land_i_Addon_02_V1_F", 50],
	["Land_i_Barracks_V1_F", 200],
	["Land_i_Barracks_V2_F", 200],
	["Land_i_Garage_V1_F", 100],
	["Land_i_Garage_V2_F", 100],
	["Land_i_House_Big_01_V3_F", 150],
	["Land_i_House_Big_01_V2_F", 150],
	["Land_i_House_Big_01_V1_F", 150],
	["Land_i_House_Big_02_V2_F", 150],
	["Land_i_House_Big_02_V3_F", 150],
	["Land_i_House_Big_02_V1_F", 150],
	["Land_i_House_Small_01_V2_F", 100],
	["Land_i_House_Small_01_V3_F", 100],
	["Land_i_House_Small_01_V1_F", 100],
	["Land_i_House_Small_02_V2_F", 100],
	["Land_i_House_Small_02_V3_F", 100],
	["Land_i_House_Small_02_V1_F", 100],
	["Land_i_House_Small_03_V1_F", 100],
	["Land_i_Shed_Ind_F", 100],
	["Land_i_Shop_01_V2_F", 150],
	["Land_i_Shop_01_V3_F", 150],
	["Land_i_Shop_01_V1_F", 150],
	["Land_i_Shop_02_V3_F", 150],
	["Land_i_Shop_02_V2_F", 150],
	["Land_i_Stone_HouseBig_V1_F", 150],
	["Land_i_Stone_HouseBig_V2_F", 150],
	["Land_i_Stone_HouseBig_V3_F", 150],
	["Land_i_Stone_HouseSmall_V1_F", 100],
	["Land_i_Stone_HouseSmall_V2_F", 100],
	["Land_i_Stone_HouseSmall_V3_F", 100],
	["Land_i_Stone_Shed_V1_F", 50],
	["Land_i_Stone_Shed_V2_F", 50],
	["Land_i_Stone_Shed_V3_F", 50],
	["Land_IndFnc_3_F", 2],
	["Land_IndFnc_Corner_F", 2],
	["Land_IndFnc_Pole_F", 2],
	["Land_JumpTarget_F", 2],
	["Land_Kiosk_blueking_F", 30],
	["Land_Kiosk_gyros_F", 30],
	["Land_Kiosk_papers_F", 30],
	["Land_Kiosk_redburger_F", 30],
	["Land_LampAirport_F", 5],
	["Land_LampDecor_F", 5],
	["Land_LampHalogen_F", 5],
	["Land_LampHarbour_F", 5],
	["Land_LampShabby_F", 5],
	["Land_LampSolar_F", 5],
	["Land_LampStreet_F", 5],
	["Land_LampStreet_small_F", 5],
	["Land_LandMark_F", 2],
	["Land_Laptop_unfolded_F", 2],
	["Land_LightHouse_F", 150],
	["Land_Lighthouse_small_F", 30],
	["Land_Maroula_base_F", 50],
	["Land_Maroula_F", 10],
	["Land_Medevac_house_V1_F", 30],
	["Land_Medevac_HQ_V1_F", 50],
	["Land_Metal_rack_F", 2],
	["Land_Metal_rack_Tall_F", 2],
	["Land_Metal_wooden_rack_F", 2],
	["Land_MetalBarrel_F", 2],
	["Land_Mil_ConcreteWall_F", 5],
	["Land_Mil_WallBig_4m_F", 5],
	["Land_Mil_WallBig_Corner_F", 5],
	["Land_Mil_WallBig_Gate_F", 2],
	["Land_Mil_WiredFence_Gate_F", 2],
	["Land_MilOffices_V1_F", 150],
	["Land_MobileLandingPlatform_01_F", 2],
	["Land_MolonLabe_F", 100],
	["Land_nav_pier_m_F", 100],
	["Land_Net_Fence_4m_F", 2],
	["Land_Net_Fence_8m_F", 4],
	["Land_Net_Fence_Gate_F", 2],
	["Land_Net_Fence_pole_F", 2],
	["Land_NetFence_01_m_pole_F", 2],
	["Land_NetFence_01_m_gate_F", 2],
	["Land_NetFence_02_m_pole_F", 2],
	["Land_NetFence_02_m_gate_v1_F", 2],
	["Land_NetFence_02_m_8m_F", 4],
	["Land_NetFence_02_m_4m_F", 2],
	["Land_NetFence_02_m_2m_F", 2],
	["Land_New_WiredFence_10m_F", 4],
	["Land_New_WiredFence_5m_F", 2],
	["Land_Obstacle_Bridge_F", 2],
	["Land_Obstacle_Climb_F", 2],
	["Land_Obstacle_Pass_F", 2],
	["Land_Obstacle_Ramp_F", 2],
	["Land_Obstacle_Saddle_F", 2],
	["Land_OfficeCabinet_01_F", 2],
	["Land_Offices_01_V1_F", 200],
	["Land_PartyTent_01_F", 5],
	["Land_Pavement_narrow_corner_F", 3],
	["Land_Pavement_narrow_F", 3],
	["Land_Pavement_wide_corner_F", 3],
	["Land_Pavement_wide_F", 3],
	["Land_Pier_addon", 20],
	["Land_Pier_Box_F", 100],
	["Land_Pier_F", 150],
	["Land_Pier_small_F", 20],
	["Land_PierLadder_F", 2],
	["Land_Pipe_fence_4m_F", 2],
	["Land_PipeFence_01_m_gate_v1_F", 2],
	["Land_PipeFence_01_m_4m_F", 2],
	["Land_PipeFence_01_m_8m_F", 4],
	["Land_PipeFence_01_m_gate_v2_F", 2],
	["Land_PipeFence_01_m_2m_F", 2],
	["Land_PipeFence_02_s_8m_F", 4],
	["Land_PipeFence_02_s_4m_F", 2],
	["Land_Pipes_large_F", 5],
	["Land_PipeWall_concretel_8m_F", 4],
	["Land_PlasticBarrier_01_F", 2],
	["Land_PlasticBarrier_01_line_x6_F", 4],
	["Land_PlasticBarrier_01_line_x2_F", 2],
	["Land_PlasticBarrier_01_line_x4_F", 2],
	["Land_PlasticBarrier_02_F", 2],
	["Land_PlasticBarrier_03_F", 2],
	["Land_PoleWall_01_pole_F", 2],
	["Land_PoleWall_01_6m_F", 4],
	["Land_PoleWall_01_3m_F", 2],
	["Land_PortableHelipadLight_01_F", 2],
	["Land_PortableLight_double_F", 4],
	["Land_PortableLight_single_F", 2],
	["Land_PowerPoleWooden_L_F", 10],
	["Land_Rack_F", 2],
	["Land_Rampart_F", 30],
	["Land_RampConcrete_F", 6],
	["Land_RampConcreteHigh_F", 6],
	["Land_RattanTable_01_F", 2],
	["Land_Razorwire_F", 5],
	["Land_Research_house_V1_F", 50],
	["Land_Research_HQ_F", 75],
	["Land_ReservoirTower_F", 75],
	["Land_RoadCone_01_F", 2],
	["Land_Sacks_goods_F", 2],
	["Land_SatellitePhone_F", 1],
	["Land_Scaffolding_F", 5],
	["Land_Sea_Wall_F", 80],
	["Land_Shed_Big_F", 50],
	["Land_Shed_Small_F", 30],
	["Land_ShelvesMetal_F", 2],
	["Land_ShelvesWooden_blue_F", 2],
	["Land_ShelvesWooden_F", 2],
	["Land_ShelvesWooden_khaki_F", 2],
	["Land_Shoot_House_Corner_Crouch_F", 2],
	["Land_Shoot_House_Corner_F", 2],
	["Land_Shoot_House_Corner_Prone_F", 2],
	["Land_Shoot_House_Corner_Stand_F", 2],
	["Land_Shoot_House_Panels_Crouch_F", 2],
	["Land_Shoot_House_Panels_F", 2],
	["Land_Shoot_House_Panels_Prone_F", 2],
	["Land_Shoot_House_Panels_Vault_F", 2],
	["Land_Shoot_House_Panels_Window_F", 2],
	["Land_Shoot_House_Panels_Windows_F", 2],
	["Land_Shoot_House_Tunnel_Crouch_F", 2],
	["Land_Shoot_House_Tunnel_F", 2],
	["Land_Shoot_House_Tunnel_Prone_F", 2],
	["Land_Shoot_House_Tunnel_Stand_F", 2],
	["Land_Shoot_House_Wall_Crouch_F", 2],
	["Land_Shoot_House_Wall_F", 2],
	["Land_Shoot_House_Wall_Long_Crouch_F", 2],
	["Land_Shoot_House_Wall_Long_F", 2],
	["Land_Shoot_House_Wall_Long_Prone_F", 2],
	["Land_Shoot_House_Wall_Long_Stand_F", 2],
	["Land_Shoot_House_Wall_Prone_F", 2],
	["Land_Shoot_House_Wall_Stand_F", 2],
	["Land_Sign_Mines_F", 2],
	["Land_Sign_WarningMilAreaSmall_F", 2],
	["Land_Sign_WarningMilitaryArea_F", 2],
	["Land_Sign_WarningMilitaryVehicles_F", 2],
	["Land_Sign_WarningUnexplodedAmmo_F", 2],
	["Land_Slum_House01_F", 10],
	["Land_Slum_House02_F", 10],
	["Land_Slum_House03_F", 10],
	["Land_Slums01_8m", 4],
	["Land_Slums01_pole", 2],
	["Land_Slums02_4m", 2],
	["Land_Slums02_pole", 2],
	["Land_SlumWall_01_s_2m_F", 2],
	["Land_SlumWall_01_s_4m_F", 4],
	["Land_SportGround_fence_F", 2],
	["Land_spp_Tower_F", 200],
	["Land_Stone_4m_F", 2],
	["Land_Stone_8m_F", 4],
	["Land_Stone_Gate_F", 2],
	["Land_Stone_pillar_F", 2],
	["Land_StoneWall_01_s_10m_F", 5],
	["Land_SurvivalRadio_F", 2],
	["Land_TableDesk_F", 2],
	["Land_TablePlastic_01_F", 2],
	["Land_TentHangar_V1_F", 30],
	["Land_TinWall_01_m_4m_v2_F", 2],
	["Land_TinWall_01_m_4m_v1_F", 2],
	["Land_TinWall_01_m_pole_F", 2],
	["Land_TinWall_01_m_gate_v2_F", 2],
	["Land_TinWall_01_m_gate_v1_F", 2],
	["Land_TinWall_02_l_4m_F", 2],
	["Land_TinWall_02_l_8m_F", 4],
	["Land_TinWall_02_l_pole_F", 2],
	["Land_ToiletBox_F", 2],
	["Land_TreeBin_F", 10],
	["Land_TTowerBig_1_F", 100],
	["Land_TTowerBig_2_F", 100],
	["Land_TyreBarrier_01_line_x4_F", 3],
	["Land_TyreBarrier_01_F", 2],
	["Land_TyreBarrier_01_line_x6_F", 4],
	["Land_u_Barracks_V2_F", 200],
	["Land_u_House_Big_01_V1_F", 150],
	["Land_u_House_Small_01_V1_F", 100],
	["Land_u_House_Small_02_V1_F", 100],
	["Land_u_Shop_01_V1_F", 150],
	["Land_u_Shop_02_V1_F", 150],
	["Land_Unfinished_Building_01_F", 100],
	["Land_Unfinished_Building_02_F", 100],
	["Land_VergePost_01_F", 2],
	["Land_Wall_IndCnc_2deco_F", 2],
	["Land_Wall_IndCnc_4_F", 2],
	["Land_Wall_IndCnc_Pole_F", 2],
	["Land_Wall_Tin_4_2", 2],
	["Land_Wall_Tin_4", 2],
	["Land_Wall_Tin_Pole", 2],
	["Land_WIP_F", 150],
	["Land_Wired_Fence_4mD_F", 2],
	["Land_Wired_Fence_8m_F", 4],
	["Land_WiredFence_01_4m_F", 2],
	["Land_WiredFence_01_16m_F", 8],
	["Land_WiredFence_01_pole_F", 2],
	["Land_WiredFence_01_gate_F", 2],
	["Land_WiredFence_01_8m_F", 4],
	["Land_WoodenCounter_01_F", 2],
	["Land_WoodenTable_large_F", 2],
	["Land_WoodenTable_small_F", 2],
	["Land_WoodenWall_01_m_pole_F", 2],
	["Land_WoodenWall_01_m_4m_F", 2],
	["Land_WoodenWall_01_m_8m_F", 4],
	["Land_WoodenWall_02_s_4m_F", 2],
	["Land_WoodenWall_02_s_2m_F", 2],
	["Land_WoodenWall_02_s_8m_F", 4],
	["Land_WoodenWall_02_s_gate_F", 2],
	["Land_Workbench_01_F", 2],
	["MRAP_01_base_F", 70],
	["MRAP_02_base_F", 70],
	["MRAP_03_base_F", 70],
	["NATO_Box_Base", 2],
	["O_T_LSV_02_unarmed_F", 50],
	["O_T_LSV_02_armed_F", 50],
	["O_Truck_02_Ammo_F", 400],
	["O_Truck_03_ammo_F", 400],
	["OfficeTable_01_old_F", 2],
	["OfficeTable_01_new_F", 2],
	["Offroad_01_base_F", 50],
	["PlasticBarrier_01_white_F", 2],
	["PlasticBarrier_01_red_F", 2],
	["PlasticBarrier_02_grey_F", 2],
	["PlasticBarrier_02_yellow_F", 2],
	["PlasticBarrier_03_blue_F", 2],
	["PlasticBarrier_03_orange_F", 2],
	["PortableHelipadLight_01_yellow_F", 2],
	["PortableHelipadLight_01_red_F", 2],
	["PortableHelipadLight_01_green_F", 2],
	["PortableHelipadLight_01_white_F", 2],
	["PortableHelipadLight_01_blue_F", 2],
	["Quadbike_01_base_F", 10],
	["RoadBarrier_F", 2],
	["RoadCone_F", 2],
	["RoadCone_L_F", 2],
	["Rubber_duck_base_F", 10],
	["SDV_01_base_F", 15],
	["StorageBladder_01_fuel_forest_F", 150],
	["StorageBladder_01_fuel_sand_F", 150],
	["SUV_01_base_F", 30],
	["TapeSign_F", 2],
	["Truck_02_base_F", 150],
	["Truck_03_base_F", 175],
	["TyreBarrier_01_white_F", 2],
	["TyreBarrier_01_black_F", 2],
	["UAV_01_base_F", 2],
	["UGV_01_base_F", 10],
	["Van_01_base_F", 55],
	["Wheeled_APC_F", 100],
	//Test
	["Land_BluntRock_apart", 20],
	["Land_W_sharpRock_apart", 20],
	["Land_SharpRock_apart", 20],
	["Land_Limestone_01_apart_F", 20],
	["Land_BluntRock_monolith", 100],
	["Land_W_sharpRock_monolith", 100],
	["Land_SharpRock_monolith", 100],
	["Land_Limestone_01_monolith_F", 100],
	["Land_BluntRock_wallH", 150],
	["Land_W_sharpRock_wallH", 150],
	["Land_SharpRock_wallH", 150],
	["Land_Limestone_01_wallH_F", 150],
	["Land_BluntRock_spike", 50],
	["Land_W_sharpRock_spike", 50],
	["Land_SharpRock_spike", 50],
	["Land_Limestone_01_spike_F", 50],
	["Land_BluntRock_wallV", 200],
	["Land_W_sharpRock_wallV", 200],
	["Land_SharpRock_wallV", 200],
	["Land_Limestone_01_wallV_F", 200],
	["Land_BluntStone_02", 10],
	["Land_W_sharpStone_02", 10],
	["Land_SharpStone_02", 10],
	["Land_Limestone_01_02_F", 10],
	["Land_VineyardFence_01_F", 5],
	["Land_SignM_forRent_F", 2],
	["Land_SignM_forSale_F", 2],
	["Land_SignM_WarningMilitaryArea_english_F", 2],
	["Land_Sign_WarningMilitaryArea_F", 2],
	["Land_SignM_WarningMilAreaSmall_english_F", 2],
	["Land_Sign_WarningMilAreaSmall_F", 2],
	["Land_SignM_WarningMilitaryVehicles_english_F", 2],
	["Land_Sign_WarningMilitaryVehicles_F", 2],
	["Land_FuelStation_01_pump_malevil_F", 5],
	["Land_FuelStation_01_roof_malevil_F", 50],
	["Land_FuelStation_01_prices_malevil_F", 10],
	["Land_Supermarket_01_malden_F", 100],
	["Land_PhoneBooth_01_malden_F", 5],
	["Land_PhoneBooth_02_malden_F", 5],
	["Land_Lighthouse_03_green_F", 75],
	["Land_Lighthouse_03_red_F", 75],
	["Land_CzechHedgehog_01_F", 5],
	["Land_Bunker_01_blocks_3_F", 10],
	["Land_Bunker_01_big_F", 150],
	["Land_Bunker_01_blocks_1_F", 3],
	["Land_Bunker_01_HQ_F", 100],
	["Land_Bunker_01_small_F", 100],
	["Land_Bunker_01_tall_F", 150],
	["Land_SandbagBarricade_01_half_F", 3],
	["Land_SandbagBarricade_01_F", 5],
	["Land_SandbagBarricade_01_hole_F", 5],
	["Land_Barn_01_brown_F", 100],
	["Land_Barn_01_grey_F", 100],
	["Land_Statue_02_F", 5],
	["Land_Pedestal_01_F", 5],
	["Land_Statue_01_F", 5],
	["Land_Pedestal_02_F", 5],
	["Land_Monument_01_F", 20],
	["Slingload_base_F", 1000],
	["B_SAM_System_02_F", 20],
	["B_SAM_System_01_F", 20],
	["B_AAA_System_01_F", 20]

];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects which can be carried and moved by a player.
 * Liste des noms de classes des objets qui peuvent être portés et déplacés par le joueur.
 */
R3F_LOG_CFG_can_be_moved_by_player = R3F_LOG_CFG_can_be_moved_by_player +
[

	//Parent Classes
	"ACE_ConcertinaWireCoil",
	"ACE_Stretcher",
	"ACE_Lifeboat",
	"ACE_Sandbag_NoGeo",
	"ACE_TargetBase",
	"ACE_UsedTubes",
	"ACE_MS2000_STROBE_OBJECT",
	//"ReammoBox_F",
	//Child Classes
	"ArrowDesk_L_F",
	"ArrowDesk_R_F",
	"B_CargoNet_01_ammo_F",
	"B_CargoNet_01_ammo_F",
	"B_Radar_System_01_F",
	"B_SAM_System_03_F",
	"B_Slingload_01_Cargo_F",
	"B_Slingload_01_Medevac_F",
	"B_Slingload_01_Fuel_F",
	"B_Slingload_01_Ammo_F",
	"B_Slingload_01_Repair_F",
	"B_supplyCrate_F",
	"B_supplyCrate_F",
	"BlockConcrete_F",
	"Box_AAF_Equip_F",
	"Box_AAF_Uniforms_F",
	"Box_Ammo_F",
	"Box_CSAT_Equip_F",
	"Box_CSAT_Uniforms_F",
	"Box_East_Ammo_F",
	"Box_East_AmmoOrd_F",
	"Box_East_AmmoVeh_F",
	"Box_East_Grenades_F",
	"Box_East_Support_F",
	"Box_East_Wps_F",
	"Box_East_WpsLaunch_F",
	"Box_East_WpsSpecial_F",
	"Box_FIA_Ammo_F",
	"Box_FIA_Support_F",
	"Box_FIA_Wps_F",
	"Box_GEN_Equip_F",
	"Box_IDAP_AmmoOrd_F",
	"Box_IDAP_Equip_F",
	"Box_IDAP_Uniforms_F",
	"Box_IED_Exp_F",
	"Box_IND_Ammo_F",
	"Box_IND_AmmoOrd_F",
	"Box_IND_AmmoVeh_F",
	"Box_IND_Grenades_F",
	"Box_IND_Support_F",
	"Box_IND_Wps_F",
	"Box_IND_WpsLaunch_F",
	"Box_IND_WpsSpecial_F",
	"Box_NATO_Ammo_F",
	"Box_NATO_AmmoOrd_F",
	"Box_NATO_AmmoVeh_F",
	"Box_NATO_Equip_F",
	"Box_NATO_Grenades_F",
	"Box_NATO_Support_F",
	"Box_NATO_Uniforms_F",
	"Box_NATO_Wps_F",
	"Box_NATO_WpsLaunch_F",
	"Box_NATO_WpsSpecial_F",
	"Box_Syndicate_Ammo_F",
	"Box_Syndicate_Wps_F",
	"Box_Syndicate_WpsLaunch_F",
	"Box_T_East_Ammo_F",
	"Box_T_East_Wps_F",
	"Box_T_East_WpsSpecial_F",
	"Box_T_NATO_Wps_F",
	"Box_T_NATO_WpsSpecial_F",
	"C_IDAP_CargoNet_01_supplies_F",
	"C_IDAP_supplyCrate_F",
	"C_supplyCrate_F",
	"C_T_supplyCrate_F",
	"CamoNet_BLUFOR_big_F",
	"CamoNet_BLUFOR_F",
	"CamoNet_BLUFOR_open_F",
	"CamoNet_INDP_big_F",
	"CamoNet_INDP_F",
	"CamoNet_INDP_open_F",
	"CamoNet_OPFOR_big_F",
	"CamoNet_OPFOR_F",
	"CamoNet_OPFOR_open_F",
	"CargoNet_01_box_F",
	"ContainmentAera_2_sand_F",
	"ContainmentArea_01_forest_F",
	"ContainmentArea_01_sand_F",
	"ContainmentArea_02_sand_F",
	"ContainmentArea_02_forest_F",
	"ContainmentArea_1_sand_F",
	"Dirthump_1_F",
	"Dirthump_2_F",
	"Dirthump_3_F",
	"Dirthump_4_F",
	"EAST_Box_Base",
	"FIA_Box_Base_F",
	"Flag_AAF_F",
	"Flag_AltisColonial_F",
	"Flag_Altis_F",
	"Flag_Blue_F",
	"Flag_CSAT_F",
	"Flag_CTRG_F",
	"Flag_FIA_F",
	"Flag_Fuel_F",
	"Flag_Gendarmerie_F",
	"Flag_Green_F",
	"Flag_NATO_F",
	"Flag_POWMIA_F",
	"Flag_RedCrystal_F",
	"Flag_Red_F",
	"Flag_Syndikat_F",
	"Flag_UK_F",
	"Flag_UNO_F",
	"Flag_US_F",
	"Flag_Viper_F",
	"Flag_White_F",
	"FlexibleTank_01_sand_F",
	"I_CargoNet_01_ammo_F",
	"I_supplyCrate_F",
	"I_supplyCrate_F",
	"IG_supplyCrate_F",
	"IG_supplyCrate_F",
	"IND_Box_Base",
	"Land_Airport_Tower_F",
	"Land_AncientPillar_F",
	"Land_BackAlley_01_l_gate_F",
	"Land_BackAlley_01_l_gap_F",
	"Land_BackAlley_01_l_1m_F",
	"Land_BackAlley_02_l_1m_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Tower_F",
	"Land_BagFence_Corner_F",
	"Land_BagFence_End_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_Round_F",
	"Land_BagFence_Short_F",
	"Land_BambooFence_01_s_4m_F",
	"Land_BambooFence_01_s_pole_F",
	"Land_BambooFence_01_s_8m_F",
	"Land_BarGate_F",
	"Land_BarrelWater_F", //barril azul, el de toda la vida,  160 L
	"Land_BarrelWater_grey_F", //barril gris, igual al de toda la vida,  160 L
	"Land_WaterCooler_01_old_F", //Dispensador refrigerador de agua nuevo 20 L
	"Land_WaterCooler_01_new_F", //Dispensador refrigerador de agua viejo 20 L
	"Land_WaterBarrel_F", //barril grande 200 L
	"StorageBladder_02_water_forest_F", //las bolsas gigantes 1000 L
	"StorageBladder_02_water_sand_F", //las bolsas gigantes 1000 L
	"WaterPump_01_sand_F", //Bomba amarilla desierto de agua recurso infinito
	"WaterPump_01_forest_F", //Bomba verde borque de agua recurso infinito
	"Land_WaterTank_F", //Tanque horizontal 600 L
	"Land_WaterTank_01_F", //Tanque Grande 2400 L
	"Land_WaterTank_02_F", //Tanque Grande en alto 2400 L
	"Land_WaterTank_03_F", //Tanque mediano (verde) 200 L
	"Land_WaterTank_04_F", //Tanque mediano (verde) en alto 200 L
	"Land_BC_Court_F",
	"Land_Bollard_01_F",
	"Land_Camping_Light_F",
	"Land_CampingTable_F",
	"Land_CampingTable_small_F",
	"Land_Canal_Wall_10m_F",
	"Land_Canal_Wall_Stairs_F",
	"Land_Canal_WallSmall_10m_F",
	"Land_cargo_house_slum_F",
	"Land_Cargo_House_V1_F",
	"Land_Cargo_House_V2_F",
	"Land_Cargo_House_V3_F",
	"Land_Cargo_HQ_V1_F",
	"Land_Cargo_HQ_V2_F",
	"Land_Cargo_HQ_V3_F",
	"Land_Cargo_Patrol_V1_F",
	"Land_Cargo_Patrol_V2_F",
	"Land_Cargo_Patrol_V3_F",
	"Land_Cargo_Tower_V1_No4_F",
	"Land_Cargo_Tower_V1_No3_F",
	"Land_Cargo_Tower_V1_No7_F",
	"Land_Cargo_Tower_V1_F",
	"Land_Cargo_Tower_V1_No1_F",
	"Land_Cargo_Tower_V1_No6_F",
	"Land_Cargo_Tower_V1_No2_F",
	"Land_Cargo_Tower_V1_No5_F",
	"Land_Cargo_Tower_V2_F",
	"Land_Cargo_Tower_V3_F",
	"Land_CargoBox_V1_F",
	"Land_CarService_F",
	"Land_CashDesk_F",
	"Land_Castle_01_tower_F",
	"Land_City2_8m_F",
	"Land_City2_4m_F",
	"Land_City2_PillarD_F",
	"Land_City_4m_F",
	"Land_City_8m_F",
	"Land_City_Gate_F",
	"Land_City_Pillar_F",
	"Land_cmp_Shed_F",
	"Land_cmp_Tower_F",
	"Land_CncBarrier_F",
	"Land_CncBarrier_stripes_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncBarrierMedium_F",
	"Land_CncShelter_F",
	"Land_CncWall1_F",
	"Land_CncWall4_F",
	"Land_ConcretePipe_F",
	"Land_Concrete_SmallWall_4m_F",
	"Land_Concrete_SmallWall_8m_F",
	"Land_ConcreteWall_01_m_gate_F",
	"Land_ConcreteWall_01_l_gate_F",
	"Land_ConcreteWall_01_m_pole_F",
	"Land_ConcreteWall_01_l_pole_F",
	"Land_ConcreteWall_01_m_8m_F",
	"Land_ConcreteWall_01_m_4m_F",
	"Land_ConcreteWall_01_l_4m_F",
	"Land_ConcreteWall_01_l_8m_F",
	"Land_ConcreteWall_02_m_4m_F",
	"Land_ConcreteWall_02_m_8m_F",
	"Land_ConcreteWall_02_m_pole_F",
	"Land_ConcreteWall_02_m_gate_F",
	"Land_ConcreteWall_02_m_2m_F",
	"Land_Crane_F",
	"Land_Crash_barrier_F",
	"Land_CrashBarrier_01_end_R_F",
	"Land_CrashBarrier_01_end_L_F",
	"Land_CrashBarrier_01_8m_F",
	"Land_CrashBarrier_01_4m_F",
	"Land_Device_assembled_F",
	"Land_Device_disassembled_F",
	"Land_Device_slingloadable_F",
	"Land_Dome_Big_F",
	"Land_Dome_Small_F",
	"Land_dp_bigTank_F",
	"Land_dp_smallTank_F",
	"Land_fs_feed_F",
	"Land_Factory_Tunnel_F",
	"Land_fs_roof_F",
	"Land_FuelStation_Build_F",
	"Land_FuelStation_Feed_F",
	"Land_FuelStation_Shed_F",
	"Land_GH_Gazebo_F",
	"Land_GH_House_1_F",
	"Land_GH_House_2_F",
	"Land_GH_Stairs_F",
	"Land_Graffiti_01_F",
	"Land_Grave_dirt_F",
	"Land_Grave_forest_F",
	"Land_Grave_monument_F",
	"Land_Grave_memorial_F",
	"Land_Grave_obelisk_F",
	"Land_Grave_rocks_F",
	"Land_Grave_soldier_F",
	"Land_Grave_V1_F",
	"Land_Grave_V2_F",
	"Land_Grave_V3_F",
	"Land_GuardRailing_01_F",
	"Land_Hangar_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_HBarrier_Big_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierTower_F",
	"Land_HBarrierWall4_F",
	"Land_HBarrierWall6_F",
	"Land_HBarrierWall_corner_F",
	"Land_HBarrierWall_corridor_F",
	"Land_Hedge_01_s_2m_F",
	"Land_Hedge_01_s_4m_F",
	"Land_HelipadCircle_F",
	"Land_HelipadCivil_F",
	"Land_HelipadRescue_F",
	"Land_HelipadSquare_F",
	"Land_i_Addon_02_V1_F",
	"Land_i_Barracks_V1_F",
	"Land_i_Barracks_V2_F",
	"Land_i_Garage_V1_F",
	"Land_i_Garage_V2_F",
	"Land_i_House_Big_01_V3_F",
	"Land_i_House_Big_01_V1_F",
	"Land_i_House_Big_01_V2_F",
	"Land_i_House_Big_02_V3_F",
	"Land_i_House_Big_02_V1_F",
	"Land_i_House_Big_02_V2_F",
	"Land_i_House_Small_01_V3_F",
	"Land_i_House_Small_01_V1_F",
	"Land_i_House_Small_01_V2_F",
	"Land_i_House_Small_02_V2_F",
	"Land_i_House_Small_02_V3_F",
	"Land_i_House_Small_02_V1_F",
	"Land_i_House_Small_03_V1_F",
	"Land_i_Shed_Ind_F",
	"Land_i_Shop_01_V2_F",
	"Land_i_Shop_01_V3_F",
	"Land_i_Shop_01_V1_F",
	"Land_i_Shop_02_V3_F",
	"Land_i_Shop_02_V2_F",
	"Land_i_Stone_HouseBig_V1_F",
	"Land_i_Stone_HouseBig_V2_F",
	"Land_i_Stone_HouseBig_V3_F",
	"Land_i_Stone_HouseSmall_V1_F",
	"Land_i_Stone_HouseSmall_V2_F",
	"Land_i_Stone_HouseSmall_V3_F",
	"Land_i_Stone_Shed_V1_F",
	"Land_i_Stone_Shed_V2_F",
	"Land_i_Stone_Shed_V3_F",
	"Land_IndFnc_3_F",
	"Land_IndFnc_Corner_F",
	"Land_IndFnc_Pole_F",
	"Land_InfoStand_V2_F",
	"Land_JumpTarget_F",
	"Land_Kiosk_blueking_F",
	"Land_Kiosk_gyros_F",
	"Land_Kiosk_papers_F",
	"Land_Kiosk_redburger_F",
	"Land_LampAirport_F",
	"Land_LampDecor_F",
	"Land_LampHalogen_F",
	"Land_LampHarbour_F",
	"Land_LampShabby_F",
	"Land_LampSolar_F",
	"Land_LampStreet_F",
	"Land_LampStreet_small_F",
	"Land_LandMark_F",
	"Land_Laptop_unfolded_F",
	"Land_LightHouse_F",
	"Land_Lighthouse_small_F",
	"Land_Maroula_base_F",
	"Land_Maroula_F",
	"Land_Medevac_house_V1_F",
	"Land_Medevac_HQ_V1_F",
	"Land_Metal_rack_F",
	"Land_Metal_rack_Tall_F",
	"Land_Metal_wooden_rack_F",
	"Land_MetalBarrel_F",
	"Land_Mil_ConcreteWall_F",
	"Land_Mil_WallBig_4m_F",
	"Land_Mil_WallBig_Corner_F",
	"Land_Mil_WallBig_Gate_F",
	"Land_Mil_WiredFence_Gate_F",
	"Land_MilOffices_V1_F",
	"Land_MobileLandingPlatform_01_F",
	"Land_MobilLandingPlatform_01_F",
	"Land_MolonLabe_F",
	"Land_nav_pier_m_F",
	"Land_Net_Fence_4m_F",
	"Land_Net_Fence_8m_F",
	"Land_Net_Fence_Gate_F",
	"Land_Net_Fence_pole_F",
	"Land_NetFence_01_m_pole_F",
	"Land_NetFence_01_m_gate_F",
	"Land_NetFence_02_m_pole_F",
	"Land_NetFence_02_m_8m_F",
	"Land_NetFence_02_m_2m_F",
	"Land_NetFence_02_m_4m_F",
	"Land_NetFence_02_m_gate_v1_F",
	"Land_New_WiredFence_10m_F",
	"Land_New_WiredFence_5m_F",
	"Land_Obstacle_Bridge_F",
	"Land_Obstacle_Climb_F",
	"Land_Obstacle_Pass_F",
	"Land_Obstacle_Ramp_F",
	"Land_Obstacle_Saddle_F",
	"Land_OfficeCabinet_01_F",
	"Land_Offices_01_V1_F",
	"Land_PartyTent_01_F",
	"Land_Pavement_narrow_corner_F",
	"Land_Pavement_narrow_F",
	"Land_Pavement_wide_corner_F",
	"Land_Pavement_wide_F",
	"Land_Pier_addon",
	"Land_Pier_Box_F",
	"Land_Pier_F",
	"Land_Pier_small_F",
	"Land_PierLadder_F",
	"Land_Pillar_Pier_F",
	"Land_Pipe_fence_4m_F",
	"Land_PipeFence_01_m_4m_F",
	"Land_PipeFence_01_m_8m_F",
	"Land_PipeFence_01_m_2m_F",
	"Land_PipeFence_01_m_gate_v2_F",
	"Land_PipeFence_01_m_gate_v1_F",
	"Land_PipeFence_02_s_4m_F",
	"Land_PipeFence_02_s_8m_F",
	"Land_Pipes_large_F",
	"Land_PipeWall_concretel_8m_F",
	"Land_PlasticBarrier_01_line_x4_F",
	"Land_PlasticBarrier_01_line_x6_F",
	"Land_PlasticBarrier_01_F",
	"Land_PlasticBarrier_01_line_x2_F",
	"Land_PlasticBarrier_02_F",
	"Land_PlasticBarrier_03_F",
	"Land_Pod_Heli_Transport_04_box_F",
	"Land_Pod_Heli_Transport_04_fuel_F",
	"Land_Pod_Heli_Transport_04_repair_F",
	"Land_PoleWall_01_3m_F",
	"Land_PoleWall_01_6m_F",
	"Land_PoleWall_01_pole_F",
	"Land_PortableHelipadLight_01_F",
	"Land_PortableLight_double_F",
	"Land_PortableLight_single_F",
	"Land_PowerPoleWooden_L_F",
	"Land_Rack_F",
	"Land_Rampart_F",
	"Land_RampConcrete_F",
	"Land_RampConcreteHigh_F",
	"Land_RattanTable_01_F",
	"Land_Razorwire_F",
	"Land_Research_house_V1_F",
	"Land_Research_HQ_F",
	"Land_ReservoirTower_F",
	"Land_RoadCone_01_F",
	"Land_Sacks_goods_F",
	"Land_SatellitePhone_F",
	"Land_Scaffolding_F",
	"Land_Sea_Wall_F",
	"Land_Shed_Big_F",
	"Land_Shed_Small_F",
	"Land_ShelvesMetal_F",
	"Land_ShelvesWooden_blue_F",
	"Land_ShelvesWooden_F",
	"Land_ShelvesWooden_khaki_F",
	"Land_Shoot_House_Corner_Crouch_F",
	"Land_Shoot_House_Corner_F",
	"Land_Shoot_House_Corner_Prone_F",
	"Land_Shoot_House_Corner_Stand_F",
	"Land_Shoot_House_Panels_Crouch_F",
	"Land_Shoot_House_Panels_F",
	"Land_Shoot_House_Panels_Prone_F",
	"Land_Shoot_House_Panels_Vault_F",
	"Land_Shoot_House_Panels_Window_F",
	"Land_Shoot_House_Panels_Windows_F",
	"Land_Shoot_House_Tunnel_Crouch_F",
	"Land_Shoot_House_Tunnel_F",
	"Land_Shoot_House_Tunnel_Prone_F",
	"Land_Shoot_House_Tunnel_Stand_F",
	"Land_Shoot_House_Wall_Crouch_F",
	"Land_Shoot_House_Wall_F",
	"Land_Shoot_House_Wall_Long_Crouch_F",
	"Land_Shoot_House_Wall_Long_F",
	"Land_Shoot_House_Wall_Long_Prone_F",
	"Land_Shoot_House_Wall_Long_Stand_F",
	"Land_Shoot_House_Wall_Prone_F",
	"Land_Shoot_House_Wall_Stand_F",
	"Land_Sign_Mines_F",
	"Land_Sign_WarningMilAreaSmall_F",
	"Land_Sign_WarningMilitaryArea_F",
	"Land_Sign_WarningMilitaryVehicles_F",
	"Land_Sign_WarningUnexplodedAmmo_F",
	"Land_Slum_House01_F",
	"Land_Slum_House02_F",
	"Land_Slum_House03_F",
	"Land_Slums01_8m",
	"Land_Slums01_pole",
	"Land_Slums02_4m",
	"Land_Slums02_pole",
	"Land_SlumWall_01_s_2m_F",
	"Land_SlumWall_01_s_4m_F",
	"Land_SportGround_fence_F",
	"Land_spp_Tower_F",
	"Land_Stone_4m_F",
	"Land_Stone_8m_F",
	"Land_Stone_Gate_F",
	"Land_Stone_pillar_F",
	"Land_StoneWall_01_s_10m_F",
	"Land_SurvivalRadio_F",
	"Land_TableDesk_F",
	"Land_TablePlastic_01_F",
	"Land_TentHangar_V1_F",
	"Land_TinWall_01_m_gate_v1_F",
	"Land_TinWall_01_m_4m_v1_F",
	"Land_TinWall_01_m_gate_v2_F",
	"Land_TinWall_01_m_4m_v2_F",
	"Land_TinWall_01_m_pole_F",
	"Land_TinWall_02_l_4m_F",
	"Land_TinWall_02_l_8m_F",
	"Land_TinWall_02_l_pole_F",
	"Land_ToiletBox_F",
	"Land_TreeBin_F",
	"Land_TTowerBig_1_F",
	"Land_TTowerBig_2_F",
	"Land_TyreBarrier_01_line_x6_F",
	"Land_TyreBarrier_01_line_x4_F",
	"Land_TyreBarrier_01_F",
	"Land_u_Barracks_V2_F",
	"Land_u_House_Big_01_V1_F",
	"Land_u_House_Small_01_V1_F",
	"Land_u_House_Small_02_V1_F",
	"Land_u_Shop_01_V1_F",
	"Land_u_Shop_02_V1_F",
	"Land_Unfinished_Building_01_F",
	"Land_Unfinished_Building_02_F",
	"Land_VergePost_01_F",
	"Land_Wall_IndCnc_2deco_F",
	"Land_Wall_IndCnc_4_F",
	"Land_Wall_IndCnc_Pole_F",
	"Land_Wall_Tin_4",
	"Land_Wall_Tin_4_2",
	"Land_Wall_Tin_Pole",
	"Land_WIP_F",
	"Land_Wired_Fence_4mD_F",
	"Land_Wired_Fence_8m_F",
	"Land_WiredFence_01_4m_F",
	"Land_WiredFence_01_16m_F",
	"Land_WiredFence_01_8m_F",
	"Land_WiredFence_01_gate_F",
	"Land_WiredFence_01_pole_F",
	"Land_WoodenCounter_01_F",
	"Land_WoodenTable_large_F",
	"Land_WoodenTable_small_F",
	"Land_WoodenWall_01_m_4m_F",
	"Land_WoodenWall_01_m_pole_F",
	"Land_WoodenWall_01_m_8m_F",
	"Land_WoodenWall_02_s_gate_F",
	"Land_WoodenWall_02_s_2m_F",
	"Land_WoodenWall_02_s_8m_F",
	"Land_WoodenWall_02_s_4m_F",
	"Land_Workbench_01_F",
	"O_CargoNet_01_ammo_F",
	"O_Radar_System_02_F",
	"O_SAM_System_04_F",
	"O_supplyCrate_F",
	"OfficeTable_01_new_F",
	"OfficeTable_01_old_F",
	"PlasticBarrier_01_white_F",
	"PlasticBarrier_01_red_F",
	"PlasticBarrier_02_grey_F",
	"PlasticBarrier_02_yellow_F",
	"PlasticBarrier_03_blue_F",
	"PlasticBarrier_03_orange_F",
	"PortableHelipadLight_01_blue_F",
	"PortableHelipadLight_01_red_F",
	"PortableHelipadLight_01_yellow_F",
	"PortableHelipadLight_01_white_F",
	"PortableHelipadLight_01_green_F",
	"RoadBarrier_F",
	"RoadCone_F",
	"RoadCone_L_F",
	"Static_Designator_01_base_F",
	"Static_Designator_02_base_F",
	"StaticWeapon",
	"StorageBladder_01_fuel_sand_F",
	"StorageBladder_01_fuel_forest_F",
	"TapeSign_F",
	"TyreBarrier_01_black_F",
	"TyreBarrier_01_white_F",
	//Test
	"Land_BluntRock_apart",
	"Land_W_sharpRock_apart",
	"Land_SharpRock_apart",
	"Land_Limestone_01_apart_F",
	"Land_BluntRock_monolith",
	"Land_W_sharpRock_monolith",
	"Land_SharpRock_monolith",
	"Land_Limestone_01_monolith_F",
	"Land_BluntRock_wallH",
	"Land_W_sharpRock_wallH",
	"Land_SharpRock_wallH",
	"Land_Limestone_01_wallH_F",
	"Land_BluntRock_spike",
	"Land_W_sharpRock_spike",
	"Land_SharpRock_spike",
	"Land_Limestone_01_spike_F",
	"Land_BluntRock_wallV",
	"Land_W_sharpRock_wallV",
	"Land_SharpRock_wallV",
	"Land_Limestone_01_wallV_F",
	"Land_BluntStone_02",
	"Land_W_sharpStone_02",
	"Land_SharpStone_02",
	"Land_Limestone_01_02_F",
	"Land_VineyardFence_01_F",
	"Land_SignM_forRent_F",
	"Land_SignM_forSale_F",
	"Land_SignM_WarningMilitaryArea_english_F",
	"Land_Sign_WarningMilitaryArea_F",
	"Land_SignM_WarningMilAreaSmall_english_F",
	"Land_Sign_WarningMilAreaSmall_F",
	"Land_SignM_WarningMilitaryVehicles_english_F",
	"Land_Sign_WarningMilitaryVehicles_F",
	"Land_FuelStation_01_pump_malevil_F",
	"Land_FuelStation_01_roof_malevil_F",
	"Land_FuelStation_01_prices_malevil_F",
	"Land_Supermarket_01_malden_F",
	"Land_PhoneBooth_01_malden_F",
	"Land_PhoneBooth_02_malden_F",
	"Land_Lighthouse_03_green_F",
	"Land_Lighthouse_03_red_F",
	"Land_CzechHedgehog_01_F",
	"Land_Bunker_01_blocks_3_F",
	"Land_Bunker_01_big_F",
	"Land_Bunker_01_blocks_1_F",
	"Land_Bunker_01_HQ_F",
	"Land_Bunker_01_small_F",
	"Land_Bunker_01_tall_F",
	"Land_SandbagBarricade_01_half_F",
	"Land_SandbagBarricade_01_F",
	"Land_SandbagBarricade_01_hole_F",
	"Land_Barn_01_brown_F",
	"Land_Barn_01_grey_F",
	"Land_Statue_02_F",
	"Land_Pedestal_01_F",
	"Land_Statue_01_F",
	"Land_Pedestal_02_F",
	"Land_Monument_01_F"
];
