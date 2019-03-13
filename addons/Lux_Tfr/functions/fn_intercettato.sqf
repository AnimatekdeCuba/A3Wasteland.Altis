private ["_faz","_faz2","_debug","_percentuale","_min","_med","_max","_allertaamici"];

_debug = _this select 0;
_allertaamici = _this select 1;
_variabili = _this select 2;
_percentuale = _this select 3;
_min = _this select 4;
_med = _this select 5;
_max = _this select 6;

distanza = 2;					

allertaamici = _allertaamici;
sussurrare = _min;
normale = _med;
gridare = _max;
percentuale = _percentuale;
variabili = _variabili;
debug = _debug;
noncambia = 0;
counterallerta = 0; 

// Event HANDLERS - Volume

["MyID", "OnSpeakVolume", { 
                           [_this select 0,_this select 1] call Lux_mix_fnc_volume;
                           }, player] call TFAR_fnc_addEventHandler;
 
// Event HANDLER - On Speak
 
["MyID", "OnSpeak", { 
                    if (distanza == 1 && (_this select 1)) then {    // SUSSURRARE----------------------------------------------------------------------------------------------------------------------
                                                                 [sussurrare,allertaamici,debug,variabili,percentuale] call Lux_mix_fnc_allerta;
					                                              };
					
					if (distanza == 2 && (_this select 1)) then {   // NORMALE--------------------------------------------------------------------------------------------------------------------------
                                                                 [normale,allertaamici,debug,variabili,percentuale] call Lux_mix_fnc_allerta;
											                     };
				  
										
					if (distanza ==  3 && (_this select 1)) then {  // GRIDARE-------------------------------------------------------------------------------------------------------------------------
                                                                  [gridare,allertaamici,debug,variabili,percentuale] call Lux_mix_fnc_allerta;
				                                                  };
                    
                    }, player] call TFAR_fnc_addEventHandler;
					
