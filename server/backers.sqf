/*
Filename: backers.sqf
Author: GMG_Monkey
Purpose: Declare backers and their level.
*/

if (!isServer) exitWith {};

if (loadFile (externalConfigFolder + "\backers.sqf") != "") then
{
	call compile preprocessFileLineNumbers (externalConfigFolder + "\backers.sqf");
}
else
{
	// Level 1 backers
	level1 =
	[

	];

	//Level 2 backers
	level2 =
	[
		
	];

	//Level 3 backers
	level3 =
	[

	];

	//Level 4 backers
	level4 =
	[

	];

	//Level 5 backers, Custom Uniforms
	level5 =
	[

	];

	//Level 6 backers
	level6 =
	[

	];
};

publicVariable "level1";
publicVariable "level2";
publicVariable "level3";
publicVariable "level4";
publicVariable "level5";
publicVariable "level6";

BaseSystemBackers = level3 + level4 + level5 + level6;
publicVariable "BaseSystemBackers";
