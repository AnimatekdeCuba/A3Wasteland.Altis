// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
#include "BaseStoreDefines.sqf"

#define BaseStoreButton_textSize (0.04 * TEXT_SCALE)

class BaseStore
{
	idd = BaseStore_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[[0], populateBaseStore] execFSM 'call.fsm'";

	class ControlsBackground
	{
		#define BaseStoreMainBG_W (0.7333 * SZ_SCALE)
		#define BaseStoreMainBG_H (0.65 * SZ_SCALE)
		#define BaseStoreMainBG_X CENTER(1, BaseStoreMainBG_W)
		#define BaseStoreMainBG_Y CENTER(1, BaseStoreMainBG_H)

		class MainBackground: IGUIBack
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.6};
			moving = true;

			x = BaseStoreMainBG_X;
			y = BaseStoreMainBG_Y;
			w = BaseStoreMainBG_W;
			h = BaseStoreMainBG_H;
		};

		class TopBar: IGUIBack
		{
			idc = -1;
			colorBackground[] = {A3W_UICOLOR_R, A3W_UICOLOR_G, A3W_UICOLOR_B, 0.8};

			#define BaseStoreTopBar_H (0.05 * SZ_SCALE)

			x = BaseStoreMainBG_X;
			y = BaseStoreMainBG_Y;
			w = BaseStoreMainBG_W;
			h = BaseStoreTopBar_H;
		};

		class DialogTitleText: w_RscTextCenter
		{
			idc = -1;
			text = "Base Parts Store";
			sizeEx = 0.06 * TEXT_SCALE;

			x = BaseStoreMainBG_X;
			y = BaseStoreMainBG_Y;
			w = BaseStoreMainBG_W;
			h = BaseStoreTopBar_H;
		};


		class ItemSelectedPrice: w_RscStructuredTextLeft
		{
			idc = BaseStore_item_TEXT;
			size = 0.04 * TEXT_SCALE;

			x = BaseStoreMainBG_X + (0.15 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.514 * SZ_SCALE);
			w = 0.119 * SZ_SCALE;
			h = 0.0689 * SZ_SCALE;
		};

		class SellSelectedPrice: w_RscStructuredTextLeft
		{
			idc = BaseStore_sell_TEXT;
			size = 0.04 * TEXT_SCALE;

			x = BaseStoreMainBG_X + (0.439 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.514 * SZ_SCALE);
			w = 0.119 * SZ_SCALE;
			h = 0.0689 * SZ_SCALE;
		};
	};

	class Controls
	{
		class SelectionList: w_RscList
		{
			idc = BaseStore_item_list;
			onLBSelChanged = "[] execVM 'client\systems\BasePartsStore\itemInfo.sqf'";
			sizeEx = 0.04 * TEXT_SCALE;
			rowHeight = 0.05 * TEXT_SCALE;

			x = BaseStoreMainBG_X + (0.1533 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.075 * SZ_SCALE);
			w = 0.276 * SZ_SCALE;
			h = 0.3382 * SZ_SCALE;
		};

		class ItemDescription: w_RscStructuredTextLeft
		{
			idc = BaseStore_item_desc;
			size = 0.039 * TEXT_SCALE;
			colorBackground[] = {0, 0, 0, 0.3};

			x = BaseStoreMainBG_X + (0.1533 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.417 * SZ_SCALE);
			w = 0.276 * SZ_SCALE;
			h = 0.088 * SZ_SCALE;
		};

		class SellList: w_RscList
		{
			idc = BaseStore_sell_list;
			onLBSelChanged = "[] execVM 'client\systems\BasePartsStore\sellInfo.sqf'";
			sizeEx = 0.04 * TEXT_SCALE;
			rowHeight = 0.05 * TEXT_SCALE;

			x = BaseStoreMainBG_X + (0.4433 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.075 * SZ_SCALE);
			w = 0.276 * SZ_SCALE;
			h = 0.4222 * SZ_SCALE;
		};

		class BuyItem: w_RscButton
		{
			idc = BaseStore_buy;
			action = "[0] execVM 'client\systems\BasePartsStore\buyParts.sqf'";
			text = "Buy";
			sizeEx = BaseStoreButton_textSize;

			x = BaseStoreMainBG_X + (0.334 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.507 * SZ_SCALE);
			w = 0.096 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellItem: w_RscButton
		{
			idc = BaseStore_sell;
			action = "[0] execVM 'client\systems\BasePartsStore\sellItems.sqf'";
			text = "Sell";
			sizeEx = BaseStoreButton_textSize;

			x = BaseStoreMainBG_X + (0.6233 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.507 * SZ_SCALE);
			w = 0.096 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton0: w_RscButton
		{
			idc = -1;
			action = "[0] call populateBaseStore";
			text = "Base Management";
			sizeEx = BaseStoreButton_textSize;

			x = BaseStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.075 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton1: w_RscButton
		{
			idc = -1;
			action = "[1] call populateBaseStore";
			text = "Buildings";
			sizeEx = BaseStoreButton_textSize;

			x = BaseStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.125 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton2: w_RscButton
		{
			idc = -1;
			action = "[2] call populateBaseStore";
			text = "Fences & Walls";
			sizeEx = BaseStoreButton_textSize;

			x = BaseStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.175 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton3: w_RscButton
		{
			idc = -1;
			action = "[3] call populateBaseStore";
			text = "Lights";
			sizeEx = BaseStoreButton_textSize;

			x = BaseStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.225 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton4: w_RscButton
		{
			idc = -1;
			action = "[4] call populateBaseStore";
			text = "Objects";
			sizeEx = BaseStoreButton_textSize;

			x = BaseStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.275 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton5: w_RscButton
		{
			idc = -1;
			action = "[5] call populateBaseStore";
			text = "Service Objects";
			sizeEx = BaseStoreButton_textSize;

			x = BaseStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.325 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton6: w_RscButton
		{
			idc = -1;
			action = "[6] call populateBaseStore";
			text = "Towers";
			sizeEx = BaseStoreButton_textSize;

			x = BaseStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.375 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellWeapon: w_RscButton
		{
			idc = -1;
			action = "[] execVM 'client\systems\selling\sellWeapon.sqf'";
			text = "Sell Weapon";
			sizeEx = BaseStoreButton_textSize;

			x = BaseStoreMainBG_X + (0.23 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellUniform: w_RscButton
		{
			idc = -1;
			action = "[] execVM 'client\systems\selling\sellUniform.sqf'";
			text = "Sell Uniform";
			sizeEx = BaseStoreButton_textSize;

			x = BaseStoreMainBG_X + ((0.604 - 0.25) * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellVest: w_RscButton
		{
			idc = -1;
			action = "[] execVM 'client\systems\selling\sellVest.sqf'";
			text = "Sell Vest";
			sizeEx = BaseStoreButton_textSize;

			x = BaseStoreMainBG_X + (0.478 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellBackpack: w_RscButton
		{
			idc = -1;
			action = "[] execVM 'client\systems\selling\sellBackpack.sqf'";
			text = "Sell Backpack";
			sizeEx = BaseStoreButton_textSize;

			x = BaseStoreMainBG_X + (0.602 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class CancelButton: w_RscButton
		{
			idc = -1;
			action = "closeDialog 0";
			text = "Cancel";
			sizeEx = BaseStoreButton_textSize;

			x = BaseStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = BaseStoreMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.096 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};
	};
};
