// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getDefaultClothing.sqf
//	@file Author: AgentRev
//      @file Modifications to LOADOUTS: [BC]CeccaTTo

private ["_unit", "_item", "_side", "_result"];

_unit = _this select 0;
_item = _this select 1;

if (typeName _unit == "OBJECT") then
{
	_side = if (_unit == player) then { playerSide } else { side _unit };
	_unit = typeOf _unit;
}
else
{
	_side = _this select 2;
};

_result = "";

switch (_side) do
{
	case BLUFOR:
	{
		switch (true) do
		{
			default
			{
				if (_item == "uniform") then { _result = "rhs_uniform_FROG01_wd" };
			};
		};
		if (_item == "headgear") then { _result = "rhs_booniehat2_marpatwd" };
	};
	case OPFOR:
	{
		switch (true) do
		{
			default
			{
				if (_item == "uniform") then { _result = "rhs_uniform_vdv_emr" };
			};
		};
		if (_item == "headgear") then { _result = "rhs_Booniehat_digi" };
	};
	default
	{
		switch (true) do
		{
			default
			{
				if (_item == "uniform") then { _result = "rhsgref_uniform_ttsko_mountain" };
			};
		};
		if (_item == "headgear") then { _result = "rhsgref_fieldcap_ttsko_mountain" };
	};
};

_result