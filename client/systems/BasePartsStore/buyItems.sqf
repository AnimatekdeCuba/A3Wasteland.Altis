// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: buyItems.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = buy to player 1 = buy to crate)]

if (!isNil "storePurchaseHandle" && {typeName storePurchaseHandle == "SCRIPT"} && {!scriptDone storePurchaseHandle}) exitWith {hint "Please wait, your previous purchase is being processed"};

#include "dialog\BaseStoreDefines.sqf";

#define PURCHASED_CRATE_TYPE_AMMO 60
#define PURCHASED_CRATE_TYPE_WEAPON 61

#define CEIL_PRICE(PRICE) (ceil ((PRICE) / 5) * 5)

storePurchaseHandle = _this spawn
{
	disableSerialization;

	private ["_playerMoney", "_size", "_price", "_dialog", "_itemlist", "_totalText", "_playerMoneyText", "_itemText", "_class", "_uniformClass", "_vestClass", "_backpackClass", "_itemClass", "_markerPos", "_obj", "_currentBinoc", "_confirmResult", "_successHint", "_hasNVG", "_requestKey"];

	//Initialize Values
	_playerMoney = player getVariable ["cmoney", 0];
	_successHint = true;

	// Grab access to the controls
	_dialog = findDisplay BaseStore_DIALOG;
	_itemlist = _dialog displayCtrl BaseStore_item_list;
	_totalText = _dialog displayCtrl BaseStore_total;
	_playerMoneyText = _Dialog displayCtrl BaseStore_money;

	_itemIndex = lbCurSel BaseStore_item_list;
	_itemText = _itemlist lbText _itemIndex;
	_itemData = _itemlist lbData _itemIndex;

	_showInsufficientFundsError =
	{
		_itemText = _this select 0;
		hint parseText format ["Not enough money for<br/>""%1""", _itemText];
		playSound "FD_CP_Not_Clear_F";
		_price = -1;
	};

	_showInsufficientSpaceError =
	{
		_itemText = _this select 0;
		hint parseText format ["Not enough space for<br/>""%1""", _itemText];
		playSound "FD_CP_Not_Clear_F";
		_price = -1;
	};

	_showItemSpawnTimeoutError =
	{
		_itemText = _this select 0;
		hint parseText format ["<t color='#ffff00'>An unknown error occurred.</t><br/>The purchase of ""%1"" has been cancelled.", _itemText];
		playSound "FD_CP_Not_Clear_F";
		_price = -1;
	};

	_showItemSpawnedOutsideMessage =
	{
		_itemText = _this select 0;
		hint format ["""%1"" has been spawned outside, in front of the store.", _itemText];
		playSound "FD_Finish_F";
		_successHint = false;
	};

	_showReplaceConfirmMessage =
	{
		_itemText = _this select 0;

		if (param [1, false, [false]]) then
		{
			_itemText = format ["Purchasing these %1 will replace your current ones.", _itemText];
		}
		else
		{
			if (param [2, false, [false]]) then
			{
				_itemText = format ["Purchasing this %1 will replace your current one.", _itemText];
			}
			else
			{
				_itemText = format ["Purchasing this %1 will replace your current one, and its contents will be lost.", _itemText];
			};
		};

		_confirmResult = [parseText _itemText, "Confirm", "Buy", true] call BIS_fnc_guiMessage;

		if (!_confirmResult) then
		{
			_price = -1;
		};

		_confirmResult
	};

	_showAlreadyHaveItemMessage =
	{
		_itemText = _this select 0;

		if (param [1, false, [false]]) then
		{
			_itemText = format ["You already have these %1.", _itemText];
		}
		else
		{
			_itemText = format ["You already have this %1.", _itemText];
		};

		playSound "FD_CP_Not_Clear_F";
		_price = -1;

		[parseText _itemText, "Error"] call BIS_fnc_guiMessage
	};

	if (isNil "_price") then
	{
		{
			if (_itemData == _x select 1) exitWith
			{
				_class = _x select 1;
				_price = _x select 2;

				// Ensure the player has enough money
				if (_price > _playerMoney) exitWith
				{
					[_itemText] call _showInsufficientFundsError;
				};

				_requestKey = call A3W_fnc_generateKey;
				_x call requestStoreObject;
			};
		} forEach (call AllBaseParts);
	};
	
	if (!isNil "_price" && {_price > -1}) then
	{
		// Re-check for money after purchase
		if (isNil "_requestKey" && _price > player getVariable ["cmoney", 0]) exitWith
		{
			[_itemText] call _showInsufficientFundsError;
		};

		if (isNil "_requestKey") then // baseparts price now handled in spawnStoreObject.sqf
		{
			[player, -_price] call A3W_fnc_setCMoney;
		};

		_playerMoneyText ctrlSetText format ["Cash: $%1", [player getVariable ["cmoney", 0]] call fn_numbersText];
		if (_successHint) then { hint "Purchase successful!" };
		playSound "FD_Finish_F";
	};

	if (!isNil "_requestKey" && {!isNil _requestKey}) then
	{
		missionNamespace setVariable [_requestKey, nil];
	};

	sleep 0.25; // double-click protection
};

if (typeName storePurchaseHandle == "SCRIPT") then
{
	private "_storePurchaseHandle";
	_storePurchaseHandle = storePurchaseHandle;
	waitUntil {scriptDone _storePurchaseHandle};
};

storePurchaseHandle = nil;
