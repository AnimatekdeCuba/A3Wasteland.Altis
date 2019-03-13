// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2015 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: loadTOParmaInfo.sqf
//	@file Author: Lodac

#include "dialog\TOParmaInfo_defines.hpp"

disableSerialization;

createDialog "TOParmaInfoD";

_display = (findDisplay TOParmaInfo_dialog);

_serverInfoText = _display displayCtrl TOParmaInfo_Server_Info;
_serverInfoString = format ["<t color='#A0FFFFFF'>AC A3Wasteland v1.4D.0.2 %1</t>", worldName];
_serverInfoText ctrlSetStructuredText parseText _serverInfoString;

_generalInfoText = _display displayCtrl TOParmaInfo_General_Info_BG;
_generalInfoString = "Forum: <t color='#0091CD'><a href='http://10.31.0.1/threads/arma-iii-snet.1507/'>ArmA III</a></t> FANS: <t color='#0091CD'><a href='http://10.31.0.1/groups/arma-iii.82/feeds'>HABANA.NET|ArmA III</a></t>";
_generalInfoText ctrlSetStructuredText parseText _generalInfoString;

_rules = "addons\TOParmaInfo\rules.html";
_rulestwo = "addons\TOParmaInfo\rulestwo.html";
_news = "addons\TOParmaInfo\news.html";

//Load the correct HTML into the control
//Rules
_ctrlHTML = _display displayCtrl TOParmaInfo_Content_Rules;
_ctrlHTML htmlLoad _rules;
_htmlLoaded = ctrlHTMLLoaded _ctrlHTML;

//rulestwo
_ctrlHTML = _display displayCtrl TOParmaInfo_Content_Rulestwo;
_ctrlHTML htmlLoad _rulestwo;
_htmlLoaded = ctrlHTMLLoaded _ctrlHTML;

//News
_ctrlHTML = _display displayCtrl TOParmaInfo_Content_News;
_ctrlHTML htmlLoad _news;
_htmlLoaded = ctrlHTMLLoaded _ctrlHTML;

_control = _display displayCtrl TOParmaInfo_Content_A3W;
private ["_teamrules", "_teamicon", "_teamcol"];

switch (playerSide) do {
	case BLUFOR: {
		_teamrules = "STR_WL_YouAreInTeam";
		_teamicon = "client\icons\igui_side_blufor_ca.paa";
		_teamcol = "#0066ff";
	};
	case OPFOR: {
		_teamrules = "STR_WL_YouAreInTeam";
		_teamicon = "client\icons\igui_side_opfor_ca.paa";
		_teamcol = "#ff1111";
	};
	case INDEPENDENT: {
		_teamrules = "STR_WL_YouAreInFFA";
		_teamicon = "client\icons\igui_side_indep_ca.paa";
		_teamcol = "#00ff00";
	};
	case sideEnemy: {
		_teamrules = "STR_WL_YouAreInFFA";
		_teamicon = "client\icons\igui_side_indep_ca.paa";
		_teamcol = "#00ff00";
	};
};

_message = format ["<t shadow=""1"">%1<br/>%2<br/>%3<br/></t>",
	//localize "STR_WL_WelcomeToWasteland",
	localize "STR_WL_MapMoreInfo",
	format [localize _teamrules,
		_teamicon,
		_teamcol,
		localize format ["STR_WL_Gen_Team%1", str playerSide],
		localize format ["STR_WL_Gen_Team%1_2", str playerSide]
	]
];

_control ctrlSetStructuredText (parseText _message);
