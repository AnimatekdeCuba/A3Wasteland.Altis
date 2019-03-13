/*
filename: PutOnUniform.sqf
Author: GMG_Monkey
Purpose: Allow player to wear cross faction uniform, when placed on the ground
*/

private _target = cursorObject;
private _uniform = "";
if ( typeName ((getItemCargo _target) select 0 select 0) == "STRING") then
{
	_uniform = (getItemCargo _target) select 0 select 0;
};
if (_uniform iskindof ['Uniform_Base', configfile >> 'CfgWeapons']) then
{
	deleteVehicle _target;
	private _playerUniformItems = uniformItems player;
	player forceAddUniform _uniform;
	{player addItemToUniform _x} foreach _playerUniformItems;
}
else
{
	titleText ["That's not a uniform silly!", "PLAIN DOWN"];
};