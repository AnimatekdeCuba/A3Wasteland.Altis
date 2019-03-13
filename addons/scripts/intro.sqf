//	@file Version: 1.0
//	@file Name: intro.sqf
//	@file Author: Cael817, original file by HellsGateGaming.com and IT07
//	@file Created: 20140724 19:34

_onScreenTime = 10;

sleep 90;

_role1 = "SERVER DE PRUEBAS! HAY ERRORES! HAY DE TODO!";
_role1names = ["Hay cosas que no van a acabar en la versión final","Ayúdennos a mejorarlo, queremos sus sugerencias","Recuerda el esfuerzo invertido ¡para que ésto funcione!"];
_role2 = "** Antihack **";
_role2names = ["Protegido por A3W-AntiHacks e InfiStar A3","¡Más cuatro negros que te romperán las rodillas!"];
_role3 = "**Orientación y Navegación**";
_role3names = ["Usa el DGAR, el mapa y la brújula para orientarte!"];
_role4 = "Vehículos";
_role4names = ["Lo vehículos NO se bloquean al reinicio del servidor.","Los vehículos bloqueados pueden ser robados con la herramienta correcta."];
_role5 = "Earplugs";
_role5names = ["Los Earplugs ahora son un ítem del ACE 3."];
_role6 = "ATM / Bank";
_role6names = [" Los cajeros no se muestran en el mapa. Ahora puedes usar cualquier cajero que halles."];
_role7 = "**NUEVO** Modo Conquista";
_role7names = ["· Los Territorios están patrullados.","· Una vez capturado, refuerzos aliados llegarán a custodiarlo.","· Los Independentes no obtendrán refuerzos."];
_role8 = "Nombre de Jugadores";
_role8names = ["El nombre de tus compañeros se verá hasta 50 metros, si no hay obstáculos en medio","El ícono de jugador aliado es pequeño, y será visible hasta 100 metros","¡CUIDADO CON EL FUEGO AMIGO!"];

{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.50' color='#f2cb0b' align='left'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='left'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [

[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names],
[_role8, _role8names]
];