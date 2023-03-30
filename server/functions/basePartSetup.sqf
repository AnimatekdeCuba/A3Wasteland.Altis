// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: basePartSetup.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

private "_obj";
_obj = _this select 0;
_obj setVariable [call vChecksum, true];

_obj addEventHandler ["Killed",
{
	_obj = _this select 0;

	if (!isNil "fn_manualObjectDelete") then
	{
		[objNull, _obj getVariable "A3W_objectID"] call fn_manualObjectDelete;
		_obj setVariable ["A3W_objectSaved", false, true];
	};
}];
//Make base objects much harder to kill
if (_obj isKindOf "Static") then
{
_obj addEventHandler ["HandleDamage", {0.00001}];
_obj addEventHandler ["Hit", {_obj setDamage 0.0001}];
};