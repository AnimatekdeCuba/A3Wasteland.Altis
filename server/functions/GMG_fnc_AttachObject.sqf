/*
Filename: GMG_fnc_AttachObject.sqf
Author: GMG_Monkey
Purpose: Make server handle vehicle attachment because the client can't handle oriantation.
*/

private _object = _this select 0;
private _vehicle = _this select 1;
private _position = _this select 2;
private _direction = _this select 3;
private _vehicleSetup = _this select 4;
_object attachTo [_vehicle, _position];
_object setdir _direction;
_object attachTo [_vehicle, _position];
{
	private _component = _x select 0;
	private _state = _x select 1;
	_vehicle animate [_component, _state];
} foreach _vehicleSetup;