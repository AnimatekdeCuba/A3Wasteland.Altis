// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: initSurvival.sqf
//	@file Author: MercyfulFate, [404] Deadbeat, [404] Costlyy, TAW_Tonic (original)
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define TIME_DELTA 1 //seconds between each "check"
#define HEALTH_TIME (60*5) //seconds till death
#define HUNGER_TIME (60*60) //seconds till starving
#define THIRST_TIME (60*50) //seconds till dehydrated
#define HEALTH_DELTA TIME_DELTA*(100/HEALTH_TIME)/100
private _HUNGER_DELTA = player getVariable ["acex_field_rations_hunger", 0];
private _THIRST_DELTA = player getVariable ["acex_field_rations_thirst", 0];
#define STARVATION "<t size='2' color='#ffff00'> E.P.D.</t><br/><br/>Has muerto de <br/><t size='2' color='#ff0000'>hambre</t><br/><br/>Debes alimentarte bien para sobrevivir aquí!<br/>"
#define DEHYDRATION "<t size='2' color='#ffff00'> E.P.D.</t><br/><br/>Has muerto <br/><t size='2' color='#ff0000'>desidratado</t><br/><br/>Debes hidratarte bien para sobrevivir aquí!<br/>"

private["_warnf1","_warnf2","_warnf3","_warnf4","_warnd1","_warnd2","_warnd3","_warnd4"];

_warnf1 = true;
_warnf2 = true;
_warnf3 = true;
_warnf4 = true;
_warnd1 = true;
_warnd2 = true;
_warnd3 = true;
_warnd4 = true;
// acex_field_rations_hunger
// acex_field_rations_thirst
if (!isNil "mf_survival_handle1") then { terminate mf_survival_handle1 };
mf_survival_handle1 = [] spawn
{
	scriptName "mf_survival_handle1";

	_incrementHunger = {
		if (hungerLevel > 0) then {hungerLevel = (_HUNGER_DELTA - hungerLevel) +  hungerLevel};
	};

	_incrementThirst = {
		if (thirstLevel > 0) then {thirstLevel = (_THIRST_DELTA - thirstLevel) + thirstLevel};
	};

	while {true} do {
		sleep TIME_DELTA;
		waitUntil {!respawnDialogActive && alive player};
		if (round random 1 == 0) then _incrementHunger;
		if (round random 1 == 0) then  _incrementThirst;
		switch (true) do {
			case (hungerLevel >= 100): {
				hint parseText STARVATION;
			};
			case (thirstLevel >= 100): {
				hint parseText DEHYDRATION;
			};
		};
	};
};

if (!isNil "mf_survival_handle2") then { terminate mf_survival_handle2 };
mf_survival_handle2 = [] spawn
{
	scriptName "mf_survival_handle2";

	_warnf1 = true; _warnf2 = true; _warnf3 = true; _warnf4 = true;
	while{true} do {
		sleep TIME_DELTA;
		waitUntil {!respawnDialogActive};
		switch(true) do { // the original levels are decrease from 100 to 0, those of the ACEX increase from 0 to 100, so I inverted the original conditions values
			case (hungerLevel >= 100 && _warnf1): {_warnf1 = false; hint parseText format["<t size='2' color='#ff0000'>Advertencia</t><br/><br/>Estás sufriendo desnutrición severa!", round hungerLevel];};
			case (hungerLevel >= 90 && hungerLevel < 100 && _warnf2): {_warnf2 = false; _warnf1 = true; hint parseText format["<t size='2' color='#ff0000'>Aviso!</t><br/><br/>Estás hambriento, debes hallar algo de comida o morirás!", round hungerLevel];};
			case (hungerLevel >= 85 && hungerLevel < 90 && _warnf3): {_warnf3 = false; _warnf2 = true; hint format["No has comido nada desde hace rato y tienes mucha hambre %1\n\n Deberías hallar algo de comer, pronto!", round hungerLevel];};
			case (hungerLevel >= 80 && hungerLevel < 85 && _warnf4): {_warnf4 = false; _warnf3 = true; hint format["No has comido nada, empiezas a sentir hambre %1", round hungerLevel];};
			case (hungerLevel > 80 && !_warnf4): {_warnf4 = true};
		};
	};
};

if (!isNil "mf_survival_handle3") then { terminate mf_survival_handle3 };
mf_survival_handle3 = [] spawn
{
	scriptName "mf_survival_handle3";

	_warnd1 = true; _warnd2 = true; _warnd3 = true; _warnd4 = true;
	while{true} do {
		sleep TIME_DELTA;
		waitUntil {!respawnDialogActive};
		switch(true) do { // the original levels are decrease from 100 to 0, those of the ACEX increase from 0 to 100, so I inverted the original conditions values
			case (thirstLevel > 80 && !_warnd4): {_warnd4 = true};
			case (thirstLevel >= 80 && thirstLevel < 85 && _warnd4): {_warnd4 = false; _warnd3 = true; hint format["No has bebido nada, empiezas a deshidratarte %1", round thirstLevel];};
			case (thirstLevel >= 85 && thirstLevel < 90 && _warnd3): {_warnd3 = false; _warnd2 = true; hint format["No has bebido nada desde hace rato y estás deshidratado %1\n\n Deberías hallar algo de beber, pronto.", round thirstLevel];};
			case (thirstLevel >= 90 && thirstLevel < 100 && _warnd2): {_warnd2 = false; _warnd1 = true; hint parseText format["<t size='2' color='#ff0000'>Aviso!</t><br/><br/>No has bebido nada en mucho tiempo, debes hallar algo de beber pronto o morirás!", round thirstLevel];};
			case (thirstLevel >= 100 && _warnd1): {_warnd1 = false; hint parseText format["<t size='2' color='#ff0000'>Advertencia</t><br/><br/>Estás sufriendo deshidratación severa!", round thirstLevel];};
		};
	};
};

{ A3W_scriptThreads pushBack _x } forEach [mf_survival_handle1, mf_survival_handle2, mf_survival_handle3];
