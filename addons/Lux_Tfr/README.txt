AI Reaction Script - by 2RGT Lux

October 2018 

V 1.2


###################################################################################### USE: 

MODS you MUST USE;

-TFR (Task Force Radio)
-CBA

######################################################################################## HOW TO INSTALL

------------------------------------------------------------------------------------------------------------In the init use (You can use InitPlayerLocal instead of Init) EXEMPLE:
if (hasInterface) then {
[1,0,[abc],60,10,25,50] call Lux_mix_fnc_intercettato;
};

###############################################################################################  NOTE

1 - Debug (message - HINT)
0 - Alert the allied faction (0-no 1-yes)
[abc] - Array; variable name of each AI wich is not work with allert script (eg. an Hostages)
60 - Percentage of possibility to fully alert the AI
10 - low volume distance
25 - normal volume distance
50 - high volume distance

---------------------------------------------------------------------------------------------------------In description.ext :

class CfgFunctions {

	class Lux_MIX {
		tag = "Lux_MIX";

		class functions {
			file = "Lux-Tfr\functions";

			class volume {};
			class allerta {};
			class intercettato {};
			};		
	};
};



###########################################################       HOW IT WORK:    

With this script, AI can "ear" you if you speak near...
Is a new feature for Task Force Radio!
When u set you voice volume , reaction distance change.... 
All the distance are configurable.

Initially, AI ear you and put himself in Defence mode.... if you continue to speak... The AI start a patrol in a search and destroy mode,in your direction! 

#######################################################################################################################

Any suggestion/feedback is appreciated!!!

Find us on STEAM : 2RGT Lux

