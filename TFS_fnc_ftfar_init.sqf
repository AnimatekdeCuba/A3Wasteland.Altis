/**
 * TheForsakenSurvivors Community
 * www.theforsakensurvivors.co.uk
 * © 2017 TheForsakenSurvivors Community
 * endMission "LOSER";
 * Author: KamikazeXeX
 *	https://github.com/KamikazeXeX
 *
 * This work is property of TheForsakenSurvivors. You do not have permissions to use/edit/distribute any of this content
 * without written permission from the TheForsakenSurvivors community.
 */

//Wait for main display to exist.
waitUntil { !isNull player };
waitUntil { uiSleep 2; (!isNull (findDisplay 46)) };

//Check if CfgPatches entry exists, if not client did not launch game with TFAR.
if !(isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitWith
{
	[] spawn
	{
		//Kick player after disaplying TFAR Not found warning.
		disableUserInput true;
		disableUserInput true;
		private _message = "TaskForceRadio no está activado en ArmA 3!\nPor favor, reinicie el juego con TaskForceRadio activado!";
		
		private _timer = ftfar_wait_for_action_time;
		while {_timer > 0} do
		{
			cutText [format["%1\n%2", _message, format["Regresarás al lobby en %1 segundo/s.", _timer]], "BLACK FADED", 999];
			uiSleep 1;
			_timer = _timer - 1;
		};

		(findDisplay 46) closeDisplay 0;
		true
	};
};

//Custom TFAR Settings.
ftfar_server_name = getText (missionConfigFile >> "ForceTFAR" >> "ftfar_server_name");
ftfar_server_ipaddress = getText (missionConfigFile >> "ForceTFAR" >> "ftfar_server_ipaddress");
ftfar_server_password = getText (missionConfigFile >> "ForceTFAR" >> "ftfar_server_password");
ftfar_wait_for_action_time = getNumber (missionConfigFile >> "ForceTFAR" >> "ftfar_wait_for_action_time");

//Function to check current TeamSpeak server.
TFS_fnc_ftfar_checkTeamSpeakServer =
{
	private _currentServerName = call TFAR_fnc_getTeamSpeakServerName;
	if (_currentServerName isEqualTo ftfar_server_name) exitWith { true };
	false
};

//Function to retreive wrong TeamSpeak server message.
TFS_fnc_ftfar_getWrongServerString =
{
	if !(ftfar_server_password isEqualTo "") exitWith { format["No estás conectado en el servidor de TeamSpeak: %1!\nPor favor, conéctese al servidor en %2  %3!", ftfar_server_name, ftfar_server_ipaddress, ftfar_server_password]; };
	format["No estás en el servidor de TeamSpeak: %1!\nPor favor, conéctese al %2!", ftfar_server_name, ftfar_server_ipaddress];
};

//Function to check current TeamSpeak channel.
TFS_fnc_ftfar_checkTeamSpeakChannel =
{
	private _currentChannelName = call TFAR_fnc_getTeamSpeakChannelName;
	if (_currentChannelName isEqualTo tf_radio_channel_name) exitWith { true };
	false
};

//Function to retreive wrong TeamSpeak channel message.
TFS_fnc_ftfar_getWrongChannelString =
{
	if !(tf_radio_channel_password isEqualTo "") exitWith { format["Estás en el canal de TeamSpeak incorrecto!\nPor favor, únase al canal %1 con la contraseña %2!", tf_radio_channel_name, tf_radio_channel_password]; };
	format["Estás en el canal de TeamSpeak incorrecto!\nPor favor, únase al canal %1!", tf_radio_channel_name];
};

FTFAR_waitForActionThread = nil;

//Start monitor loop.
while {true} do
{
	//If we're not already waiting for user to "do something", check server and channel!
	if (isNil "FTFAR_waitForActionThread") then
	{
		try
		{
			//Check if TS plugin is actually enabled.
			if !(call TFAR_fnc_isTeamSpeakPluginEnabled) throw ["El plugin de Task Force Radio no está activado en el TeamSpeak !\nPor favor, instálelo y/o actívelo en Herramientas / Opciones / Complementos!", TFAR_fnc_isTeamSpeakPluginEnabled];
			
			//Check if player is on in TeamSpeak server.
			if !(call TFS_fnc_ftfar_checkTeamSpeakServer) throw [call TFS_fnc_ftfar_getWrongServerString, TFS_fnc_ftfar_checkTeamSpeakServer];

			//Check if player is on in TeamSpeak channel.
			if !(call TFS_fnc_ftfar_checkTeamSpeakChannel) throw [call TFS_fnc_ftfar_getWrongChannelString, TFS_fnc_ftfar_checkTeamSpeakChannel];
		}
		catch
		{
			//Handle check action.
			FTFAR_waitForActionThread = _exception spawn
			{
				params [["_message", ""],["_checkFunction", ""]];
				disableUserInput true;
				disableUserInput true;
				private _timer = ftfar_wait_for_action_time;
				while {_timer > 0} do
				{
					cutText [format["%1\n%2", _message, format["Te quedan %1 segundo/s para ser expulsado (Kickeado)!", _timer]], "BLACK FADED", 999];
					uiSleep 1;
					_timer = _timer - 1;
					if (call _checkFunction) exitWith {};
				};

				if ((call TFS_fnc_ftfar_checkTeamSpeakServer) || (call TFS_fnc_ftfar_checkTeamSpeakChannel)) exitWith
				{
					cutText ["", "BLACK IN", 2];
					disableUserInput false;
					disableUserInput false;
					FTFAR_waitForActionThread = nil;
				};

				(findDisplay 46) closeDisplay 0;
				true
			};
		};
	};

	uiSleep 0.01;
};
true