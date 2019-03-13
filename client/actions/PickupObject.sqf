/*
Author: GMG_Monkey
FileName: PickupObject.sqf
Purpose: Allow player to move static objects
*/


//Setup Variables
_object = cursorobject;



switch (true) do
{
	case (_object iskindof "StaticWeapon"): // [["O_Soldier_A_F",[-0.1,3,2.1]]]
	{
		_object attachTo [player, [-0.1,3,2.1]];
		player setVariable ["Carrying", true, true];
		_object setVariable ["Carried", true, true];
	};
	case (_object isKindOf "Reammobox_F"): //[["O_Soldier_A_F",[0.0999999,1.5,1]]]
	{
		_object attachTo [player, [0.0999999,1.5,1]];
		player setVariable ["Carrying", true, true];
		_object setVariable ["Carried", true, true];
	};
	case (_object iskindof "Items_base_F"): //[["O_Soldier_A_F",[-7.45058e-008,1,1]]]
	{
		_object attachTo [player, [-7.45058e-008,1,1]];
		player setVariable ["Carrying", true, true];
		_object setVariable ["Carried", true, true];
	};
	case (_object isKindOf "NonStrategic"): // [["O_Soldier_A_F",[1,39.4,5.4]]]
	{
		_object attachTo [player, [1,39.4,5.4]];
		player setVariable ["Carrying", true, true];
		_object setVariable ["Carried", true, true];
	};
};