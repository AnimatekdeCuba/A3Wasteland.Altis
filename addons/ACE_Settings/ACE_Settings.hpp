/**********************
Con la intención de configurar los módulos que no aparecen por defecto
en los settings desde el editor.
La configuración externa puede que sobreescriba algunos de estas 
configuraciones. Pero lo más probable sea que no. No sé.
************************/

class ACE_Settings;														// No es necesario crear subclases, a no ser que el módulo lo requiera.
{
	class ACE_Tags 
	{
		class ACE_XRed {
			displayName = "OPFOR";  // Name of your tag being displayed in the interaction menu
			requiredItem = "ACE_SpraypaintRed";  // Required item to have in the inventory to be able to spray your tag (eg. `"ACE_SpraypaintBlack"`, `"ACE_SpraypaintRed"`, `"ACE_SpraypaintGreen"`, `"ACE_SpraypaintBlue"` or any custom item from `CfgWeapons`)
			textures[] = {"client\icons\igui_side_opfor_ca.paa"};  // List of texture variations (one is randomly selected when tagging)
			icon = "";  // Icon being displayed in the interaction menu
			typeName = BOOL;
			values[] = call ace_tagging_fnc_addCustomTag;
		};
		class ACE_XBlue {
			displayName = "BLUFOR";  // 
			requiredItem = "ACE_SpraypaintBlue";  // 
			textures[] = {"client\icons\igui_side_blufor_ca.paa"};  // 
			icon = "";  // 
			typeName = BOOL;
			values[] = call ace_tagging_fnc_addCustomTag;
		};
			class ACE_XGreen {
			displayName = "GUER";  // 
			requiredItem = "ACE_SpraypaintGreen";  // 
			textures[] = {"client\icons\igui_side_indep_ca.paa"};  // 
			icon = "client\icons\igui_side_indep_ca.paa";  // 
			typeName = BOOL;
			values[] = {call ace_tagging_fnc_addCustomTag};
		};
	};
};
class CfgWeapons
	{
		class rhs_weap_fim92
		{
			ace_javelin_enabled = 1;  										// Enable Javelin-style locking (0-disabled, 1-enabled)
			weaponInfoType = "ACE_RscOptics_javelin";						// Inteface
			modelOptics = "\z\ace\addons\javelin\data\reticle_titan.p3d";	// Optics model
			canLock = 0;  													// Disable vanilla locking (0-disabled, 1-enabled)
			lockingTargetSound[] = {"", 0, 1};								// Locking sound
			lockedTargetSound[] = {"", 0, 1};								// Target acquired sound
		};
		class ace_missileguidance 
		{																	// Begin ACE guidance Configs
			enabled = 1; 													// Enable missile guidance (0-disabled, 1-enabled)

			minDeflection = 0.00025;  					// Minimum flap deflection for guidance
			maxDeflection = 0.001;  					// Maximum flap deflection for guidance
			incDeflection = 0.0005; 					// The increment in which deflection adjusts

			canVanillaLock = 0;  						// Enable vanilla lock, only applicable to non-cadet modes, 'recruit' always uses vanilla locking (0-disabled, 1-enabled)

			defaultSeekerType = "SALH";  				// Default seeker type
			seekerTypes[] = {"SALH", "LIDAR", "SARH", "Optic", "Thermal", "GPS", "SACLOS", "MCLOS"};  // Seeker types available

			defaultSeekerLockMode = "LOAL";  			// Default seeker lock mode
			seekerLockModes[] = {"LOAL", "LOBL"};  		// Seeker lock modes available

			seekerAngle = 60;  							// Angle in front of the missile which can be searched
			seekerAccuracy = 1;  						// Seeker accuracy multiplier

			seekerMinRange = 1;  						// Minimum range from the missile which the seeker can visually search
			seekerMaxRange = 2500;  					// Maximum from the missile which the seeker can visually search

			defaultAttackProfile = "LIN";  				// Default attack profile
			attackProfiles[] = {"LIN", "DIR", "MID", "HI"};  // Attack profiles available
		};
	};
/*class ACE_module_sampleSetting 
	{
	// Following 2 entries are redundant if isClientSettable = 0
	displayName = $STR_ACE_Common_SettingName;   // Stringtable entry with the setting name
	description = $STR_ACE_Common_SettingDescription;   // Stringtable entry with the setting description

	isClientSettable = 0;   // Show in client options menu (0-no, 1-yes)
	typeName = SCALAR;   // Type (BOOLSCALARSTRINGARRAYCOLOR)
	value = 1;   // Value

	// Following entry is redundant if typeName is NOT SCALAR
	values[] = {Disabled, Enabled, Only Cursor, Only On Keypress, Only Cursor and KeyPress};   // (Optional) Stringtable entries that describe the options

	// Following entry is present only in export
	force = 0;   // Force the setting (0-no, 1-yes), exported settings are forced by default
	};*/