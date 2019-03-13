//AI Reaction function by 2RGT Lux

private ["_raggio","_debug","_enemySides","_unita","_vicini","_isolato","_variabili","_mySides","_unitaamiche","_percentuale","_perc","_contaunita","_allertaamici"];

if (hasInterface) then {

_raggio = _this select 0;
_allertaamici = _this select 1;
_debug = _this select 2;
_variabili = _this select 3;
_percentuale = _this select 4;

//Random possibilitiy
_perc = floor (random 100);

// Know your enemy! (and your friends...)
_enemySides = [side player] call BIS_fnc_enemySides;
_unita = allUnits select {_x distance player <= _raggio && side _x in _enemySides && !(_x in _variabili)};  // Enemy faction
_contaunita = count _unita;
_mySides = playerSide; 
_unitaamiche = allUnits select {_x distance player <= _raggio && side _x == playerSide && !isPlayer _x && !(_x in _variabili)};  // Your AI faction


_isolato = player call TFAR_fnc_vehicleIsIsolatedAndInside;  // Player is in a vehicle?

if (noncambia == 0) then {
                              if (_contaunita > 1 && !_isolato) then { 
                                                                  if ({(combatMode _x) == "RED" || (behaviour _x) == "CARELESS"} foreach _unita) then {if (_debug == 1) then {/* hint "Group already allerted (or excluded from script)";*/counterallerta = 0} else {};} else {
																  counterallerta = counterallerta + 1; 
															     if (_debug == 1) then {/*hint format ["%1 - You've been heard",_perc]*/} else {};
															     };} else {};   //_debug
                         
                              if (counterallerta == 2 && !_isolato) then {
															              if (_debug == 1) then {/* hint format ["%1 - Enemy has become suspicious",_perc]*/} else {};
														                  // EDIT BELOW for AI Reaction -------------> FROM HERE
																		 if (_allertaamici == 0) then {} else {
																											  if ({(combatMode _x) == "RED" || (behaviour _x) == "CARELESS"} foreach _unitaamiche) then {if (_debug == 1) then { /*hint "Group already allerted (or excluded from script)";*/counterallerta = 0} else {};} else {
																											  {[group _x, getPos formationLeader _x, 2] call BIS_fnc_taskPatrol} foreach _unitaamiche;
																											  {group _x setCombatMode "YELLOW"} foreach _unitaamiche;
																								              {group _x setBehaviour "AWARE"} foreach _unitaamiche;};																										   
																											   };
																		if ({(combatMode _x) == "RED" || (behaviour _x) == "CARELESS"} foreach _unita) then {if (_debug == 1) then { /*hint "Group already allerted (or excluded from script)";*/counterallerta = 0} else {};} else {
																														                                    {[group _x, getPos formationLeader _x, 2] call BIS_fnc_taskPatrol} foreach _unita;
																													                                        {group _x setCombatMode "YELLOW"} foreach _unita;
																								                    	                                     {group _x setBehaviour "AWARE"} foreach _unita;};
															              // -----------------------------------------> TO HERE
														                                                                
																		 };
                              if (counterallerta >= 3 && !_isolato && (_perc <= _percentuale)) then { 
                                                                                                     if (_debug == 1) then {/*hint format["%1 -The enemy is alerted",_perc]*/} else {}; 
															                                          // EDIT BELOW for AI Reaction --------------> FROM HERE
																		                            if (_allertaamici == 0) then {} else {
																									                                      if ({(combatMode _x) == "RED" || (behaviour _x) == "CARELESS"} foreach _unitaamiche) then {if (_debug == 1) then { /*hint "Group already allerted (or excluded from script)";*/counterallerta = 0} else {};} else {
																									                                      {[group _x, getPos player,10] call BIS_fnc_taskPatrol} foreach _unitaamiche;
																									                                      {group _x setCombatMode "RED"} foreach _unitaamiche;
																									                                      {group _x setBehaviour "COMBAT"} foreach _unitaamiche;};
																									                                      };
																								    if ({(combatMode _x) == "RED" || (behaviour _x) == "CARELESS"} foreach _unita) then {if (_debug == 1) then { /*hint "Group already allerted (or excluded from script)";*/counterallerta = 0} else {};} else {
																									{[group _x, getPos player,10] call BIS_fnc_taskPatrol} foreach _unita;
																									{group _x setCombatMode "RED"} foreach _unita;
																									{group _x setBehaviour "COMBAT"} foreach _unita;};
																									// -----------------------------------------> TO HERE
																													  
															                                        counterallerta = 0;
																	     
																                                    noncambia = 1;
																         
																                                    };
                              if (counterallerta >= 0 && _isolato) exitwith {counterallerta = 0};
                          } else {if (_debug == 1) then { /*hint "Group already allerted (or excluded from script)";*/} else {};};

if (_contaunita < 1) exitwith {noncambia = 0;if (_debug == 1) then {/*hint "No units can hear you (or excluded from script)";*/} else {};};	
} else {};
																