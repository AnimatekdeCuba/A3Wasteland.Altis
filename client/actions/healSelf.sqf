//	Name: healSelf.sqf
//	Author: GMG_Monkey
//	Purpose: Allow player to heal themselves using a Medkit

// Keep the player locked in medic animation for the full duration of the placement.
if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then 
{
	player switchMove "AinvPknlMstpSlayWrflDnon_medic";
};
// sleep 5;
player setDamage 0;
