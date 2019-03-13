//	@file Version:
//	@file Name:
//	@file Author: Cael817 Edited By: GMG_Monkey
//	@file Created:

#define BoS_Menu_option 17001
disableSerialization;

private ["_panelType","_displayBoS","_BoS_select","_money"];
_uid = getPlayerUID player;
if (!isNil "_uid") then
{
	_panelType = _this select 0;

	_displayBoS = uiNamespace getVariable ["BoS_Menu", displayNull];

	switch (true) do
	{
		case (!isNull _displayBoS): //BoS panel
		{
			_BoS_select = _displayBoS displayCtrl BoS_Menu_option;

			switch (lbCurSel _BoS_select) do
			{
				case 0: //Turn off all lights
				{
					execVM "addons\BoS\BoS_lightsOff.sqf";;
				};
				case 1: //Turn on all lighs
				{
					execVM "addons\BoS\BoS_lightsOn.sqf";
				};
				case 2: //Lock Doors
				{
					execVM "addons\Bos\LockDoors.sqf";
				};
				Case 3: //Unlock Doors
				{
					execVM "addons\Bos\UnlockDoors.sqf";
				};
				case 4: //Mark Owned Object
				{
					execVM "addons\BoS\BoS_markOwned.sqf";
				};
				case 5: //Show Base Border
				{
					closeDialog 0;
					execVM "addons\BoS\BoS_showBorder.sqf";
				};
				case 6: //Lock Down Base
				{
					closeDialog 0;
					execVM "addons\BoS\BoS_lockDown.sqf";
				};
				case 7: //Release Lock Down
				{
					closeDialog 0;
					execVM "addons\BoS\BoS_releaseLockDown.sqf";
				};
				case 8: //Relock Base Objects
				{
					execVM "addons\BoS\BoS_reLock.sqf";
				};
				case 9: //Resupply Service Objects
				{
					closedialog 0;
					execVM "addons\BoS\ResupplyServiceObjects.sqf";
				};
				case 10: //Change Password
				{
					closeDialog 0;
					execVM "addons\BoS\password_change.sqf";
				};
				case 11: //Upgrade Base
				{
					execVM "addons\BoS\UpgradeBase.sqf";
				}
			};
		};
	};
};
