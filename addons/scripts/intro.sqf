//	@file Version: 1.0
//	@file Name: intro.sqf
//	@file Author: Cael817, original file by HellsGateGaming.com and IT07
//	@file Created: 20140724 19:34

_onScreenTime = 7;

sleep 90;

_role1 = "BIENVENIDOS A";
_role1names = ["Animatek´s Advanced Combat A3Wasteland (BETA)","con Dificultad aumentada","y mayor Inmersión"];
_role2 = "Antihack";
_role2names = ["Protegido por A3W-AntiHack e InfiStar"];
_role3 = "Navegación";
_role3names = ["Usa el DGAR, el mapa y la brújula para orientarte"];
_role4 = "Survival";
_role4names = ["Mantente bebido y comido","MRE es Meal Ready-to-Eat en inglés","En Altis no se cultivan bananas"];
_role5 = "Equipamiento";
_role5names = ["Si te molesta el ruido compra Earplugs","Existen varios tipos de NVG"];
_role6 = "ATM";
_role6names = ["Puedes usar cualquier cajero que encuentres"];
_role7 = "Territorios";
_role7names = ["Es una buena manera de empezar","a ganar dinero fácil.","Nadie hará el trabajo sucio por ti"];
_role8 = "Comunícate bien";
_role8names = ["Ponte creativo para identificar a tus aliados","No confíes en nadie, las apariencias engañan","¡Y CUIDADO CON EL FUEGO AMIGO!"];
_role9 = "Sé responsable";
_role9names = ["Sé respetuoso","No te aproveches","No uses trampas"];

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
[_role8, _role8names],
[_role9, _role9names]
];