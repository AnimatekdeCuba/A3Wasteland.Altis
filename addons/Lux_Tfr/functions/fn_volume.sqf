//Volume check by 2RGT Lux

private ["_unit2","_volume"];

if (hasInterface) then  {

_unit2 = _this select 0;
_volume2 = _this select 1;

                         _unit2   = _this select 0;  
                         _volume2 = _this select 1; 
					     if (_volume2 >= 0 && _volume2 <= 10) then {distanza = 1; if (debug == 1) then {hint "Susurrar"} else {};};
				         if (_volume2 > 10 && _volume2 <= 40) then {distanza = 2; if (debug == 1) then {hint "Normal"} else {};};
					     if (_volume2 > 40 ) then {distanza = 3; if (debug == 1) then {hint "Gritar"} else {};};
						};