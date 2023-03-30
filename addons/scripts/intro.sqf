//	@file Version: 1.0
//	@file Name: intro.sqf
//	@file Author: Cael817, original file by HellsGateGaming.com and IT07
//	@file Created: 20140724 19:34

_onScreenTime = 7;

sleep 90;

_role1 = "Welcome to";
_role1names = ["Animatek's HardCore A3Wasteland (BETA)","MilSim RolePlay","and inmersive"];
_role2 = "Antihack";
_role2names = ["Protected by A3W-AntiHack & InfiStar"];
_role3 = "Navigate";
_role3names = ["Use DGAR, Map Tools and Compass to find your way"];
_role4 = "Survival";
_role4names = ["Eat and Drink","MRE is short of Meal Ready-to-Eat","Altis is hot place"];
_role5 = "Equipment Tip";
_role5names = ["Use Earplugs for loud sounds","There's several types of NVG"];
_role6 = "ATM";
_role6names = ["Save and transfer money"];
_role7 = "Territories";
_role7names = ["It's a good way to start","Make easy money","Do the dirty job"];
_role8 = "Comms";
_role8names = ["Ident your enemies and alies","Trust no one","¡BE AWARE OF FRIENDLY FIRE!"];
_role9 = "Be nice";
_role9names = ["Respect","Don't Exploit","No Cheating"];

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