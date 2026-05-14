// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
#include "vehiclestoreNew_defines.hpp"

#define VehStoreNew_TextSize (0.04 * TEXT_SCALE)

class vehshopNewd
{
	idd = vehshopNew_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[[0], populateVehicleStoreNew] execFSM 'call.fsm'";

	class ControlsBackground
	{
		#define VehStoreNewMainBG_W (0.95 * SZ_SCALE)
		#define VehStoreNewMainBG_H (0.75 * SZ_SCALE)
		#define VehStoreNewMainBG_X CENTER(1, VehStoreNewMainBG_W)
		#define VehStoreNewMainBG_Y CENTER(1, VehStoreNewMainBG_H)

		class MainBackground: IGUIBack
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.6};
			moving = true;

			x = VehStoreNewMainBG_X;
			y = VehStoreNewMainBG_Y;
			w = VehStoreNewMainBG_W;
			h = VehStoreNewMainBG_H;
		};

		class TopBar: IGUIBack
		{
			idc = -1;
			colorBackground[] = {A3W_UICOLOR_R, A3W_UICOLOR_G, A3W_UICOLOR_B, 0.8};

			#define VehStoreNewTopBar_H (0.05 * SZ_SCALE)

			x = VehStoreNewMainBG_X;
			y = VehStoreNewMainBG_Y;
			w = VehStoreNewMainBG_W;
			h = VehStoreNewTopBar_H;
		};

		class DialogTitleText: w_RscTextCenter
		{
			idc = -1;
			text = "RHS Vehicle Store (NEW)";
			sizeEx = 0.06 * TEXT_SCALE;

			x = VehStoreNewMainBG_X;
			y = VehStoreNewMainBG_Y;
			w = VehStoreNewMainBG_W;
			h = VehStoreNewTopBar_H;
		};

		class PreviewBackground: IGUIBack
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.4};

			#define VehStoreNewPreview_W (0.35 * SZ_SCALE)
			#define VehStoreNewPreview_H (0.35 * SZ_SCALE)
			#define VehStoreNewPreview_X (VehStoreNewMainBG_X + (0.30 * SZ_SCALE))
			#define VehStoreNewPreview_Y (VehStoreNewMainBG_Y + (0.07 * SZ_SCALE))

			x = VehStoreNewPreview_X;
			y = VehStoreNewPreview_Y;
			w = VehStoreNewPreview_W;
			h = VehStoreNewPreview_H;
		};

		class DescriptionBackground: IGUIBack
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.3};

			#define VehStoreNewDesc_W (0.35 * SZ_SCALE)
			#define VehStoreNewDesc_H (0.12 * SZ_SCALE)
			#define VehStoreNewDesc_X VehStoreNewPreview_X
			#define VehStoreNewDesc_Y (VehStoreNewPreview_Y + VehStoreNewPreview_H + (0.01 * SZ_SCALE))

			x = VehStoreNewDesc_X;
			y = VehStoreNewDesc_Y;
			w = VehStoreNewDesc_W;
			h = VehStoreNewDesc_H;
		};

		class PriceBackground: IGUIBack
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.5};

			#define VehStoreNewPrice_W (0.20 * SZ_SCALE)
			#define VehStoreNewPrice_H (0.08 * SZ_SCALE)
			#define VehStoreNewPrice_X (VehStoreNewMainBG_X + VehStoreNewMainBG_W - VehStoreNewPrice_W - (0.02 * SZ_SCALE))
			#define VehStoreNewPrice_Y (VehStoreNewMainBG_Y + VehStoreNewMainBG_H - VehStoreNewPrice_H - (0.02 * SZ_SCALE))

			x = VehStoreNewPrice_X;
			y = VehStoreNewPrice_Y;
			w = VehStoreNewPrice_W;
			h = VehStoreNewPrice_H;
		};
	};

	class Controls
	{
		// Lista principal de vehículos (izquierda)
		class VehicleList: w_RscList
		{
			idc = vehshopNew_veh_list;
			onLBSelChanged = "call onVehicleSelectedNew";
			font = "RobotoCondensed";
			sizeEx = 0.04 * TEXT_SCALE;
			rowHeight = 0.05 * TEXT_SCALE;
			colorPictureSelected[] = {0,0,0,1};

			#define VehStoreNewVehList_W (0.28 * SZ_SCALE)
			#define VehStoreNewVehList_H (0.55 * SZ_SCALE)
			#define VehStoreNewVehList_X (VehStoreNewMainBG_X + (0.02 * SZ_SCALE))
			#define VehStoreNewVehList_Y (VehStoreNewMainBG_Y + (0.07 * SZ_SCALE))

			x = VehStoreNewVehList_X;
			y = VehStoreNewVehList_Y;
			w = VehStoreNewVehList_W;
			h = VehStoreNewVehList_H;
		};

		// Lista de variantes (centro-izquierda)
		class VariantList: w_RscList
		{
			idc = vehshopNew_variant_list;
			onLBSelChanged = "call onVariantSelectedNew";
			font = "RobotoCondensed";
			sizeEx = 0.035 * TEXT_SCALE;
			rowHeight = 0.045 * TEXT_SCALE;

			#define VehStoreNewVarList_W (0.20 * SZ_SCALE)
			#define VehStoreNewVarList_H (0.25 * SZ_SCALE)
			#define VehStoreNewVarList_X (VehStoreNewVehList_X + VehStoreNewVehList_W + (0.01 * SZ_SCALE))
			#define VehStoreNewVarList_Y VehStoreNewVehList_Y

			x = VehStoreNewVarList_X;
			y = VehStoreNewVarList_Y;
			w = VehStoreNewVarList_W;
			h = VehStoreNewVarList_H;
		};

		// Lista de texturas (centro-derecha)
		class TextureList: w_RscList
		{
			idc = vehshopNew_texture_list;
			onLBSelChanged = "call onTextureSelectedNew";
			font = "RobotoCondensed";
			sizeEx = 0.035 * TEXT_SCALE;
			rowHeight = 0.045 * TEXT_SCALE;

			#define VehStoreNewTexList_W (0.20 * SZ_SCALE)
			#define VehStoreNewTexList_H (0.25 * SZ_SCALE)
			#define VehStoreNewTexList_X (VehStoreNewVarList_X + VehStoreNewVarList_W + (0.01 * SZ_SCALE))
			#define VehStoreNewTexList_Y VehStoreNewVehList_Y

			x = VehStoreNewTexList_X;
			y = VehStoreNewTexList_Y;
			w = VehStoreNewTexList_W;
			h = VehStoreNewTexList_H;
		};

		// Lista de features (debajo de variantes)
		class FeatureList: w_RscList
		{
			idc = vehshopNew_feature_list;
			onLBSelChanged = "call onFeatureSelectedNew";
			font = "RobotoCondensed";
			sizeEx = 0.035 * TEXT_SCALE;
			rowHeight = 0.045 * TEXT_SCALE;

			#define VehStoreNewFeatList_W (0.20 * SZ_SCALE)
			#define VehStoreNewFeatList_H (0.25 * SZ_SCALE)
			#define VehStoreNewFeatList_X VehStoreNewVarList_X
			#define VehStoreNewFeatList_Y (VehStoreNewVarList_Y + VehStoreNewVarList_H + (0.02 * SZ_SCALE))

			x = VehStoreNewFeatList_X;
			y = VehStoreNewFeatList_Y;
			w = VehStoreNewFeatList_W;
			h = VehStoreNewFeatList_H;
		};

		// Vista previa 3D
		class PreviewCtrl: Rsc3DPreview
		{
			idc = vehshopNew_preview_ctrl;

			#define VehStoreNewPreviewCtrl_W (0.33 * SZ_SCALE)
			#define VehStoreNewPreviewCtrl_H (0.33 * SZ_SCALE)
			#define VehStoreNewPreviewCtrl_X (VehStoreNewMainBG_X + (0.31 * SZ_SCALE))
			#define VehStoreNewPreviewCtrl_Y (VehStoreNewMainBG_Y + (0.08 * SZ_SCALE))

			x = VehStoreNewPreviewCtrl_X;
			y = VehStoreNewPreviewCtrl_Y;
			w = VehStoreNewPreviewCtrl_W;
			h = VehStoreNewPreviewCtrl_H;
			
			direction[] = {0.3, -0.3, 0.7};
			difficulty[] = {0.3, -0.3, 0.7};
			up[] = {0, 0, 1};
			center[] = {0, 0, 0};
			zoom = 0.8;
		};

		// Descripción del vehículo
		class DescriptionCtrl: w_RscStructuredTextLeft
		{
			idc = vehshopNew_description_ctrl;
			size = 0.035 * TEXT_SCALE;

			#define VehStoreNewDescCtrl_W (0.33 * SZ_SCALE)
			#define VehStoreNewDescCtrl_H (0.10 * SZ_SCALE)
			#define VehStoreNewDescCtrl_X VehStoreNewPreviewCtrl_X
			#define VehStoreNewDescCtrl_Y (VehStoreNewPreviewCtrl_Y + VehStoreNewPreviewCtrl_H + (0.01 * SZ_SCALE))

			x = VehStoreNewDescCtrl_X;
			y = VehStoreNewDescCtrl_Y;
			w = VehStoreNewDescCtrl_W;
			h = VehStoreNewDescCtrl_H;
		};

		// Precio
		class PriceCtrl: w_RscStructuredTextLeft
		{
			idc = vehshopNew_price_ctrl;
			size = 0.045 * TEXT_SCALE;
			colorText[] = {0, 1, 0, 1};

			#define VehStoreNewPriceCtrl_W (0.18 * SZ_SCALE)
			#define VehStoreNewPriceCtrl_H (0.06 * SZ_SCALE)
			#define VehStoreNewPriceCtrl_X (VehStoreNewMainBG_X + VehStoreNewMainBG_W - VehStoreNewPriceCtrl_W - (0.03 * SZ_SCALE))
			#define VehStoreNewPriceCtrl_Y (VehStoreNewMainBG_Y + VehStoreNewMainBG_H - VehStoreNewPriceCtrl_H - (0.10 * SZ_SCALE))

			x = VehStoreNewPriceCtrl_X;
			y = VehStoreNewPriceCtrl_Y;
			w = VehStoreNewPriceCtrl_W;
			h = VehStoreNewPriceCtrl_H;
		};

		// Capacidad R3F
		class CapacityCtrl: w_RscStructuredTextLeft
		{
			idc = vehshopNew_capacity_ctrl;
			size = 0.035 * TEXT_SCALE;

			#define VehStoreNewCapCtrl_W (0.18 * SZ_SCALE)
			#define VehStoreNewCapCtrl_H (0.04 * SZ_SCALE)
			#define VehStoreNewCapCtrl_X VehStoreNewPriceCtrl_X
			#define VehStoreNewCapCtrl_Y (VehStoreNewPriceCtrl_Y + VehStoreNewPriceCtrl_H + (0.01 * SZ_SCALE))

			x = VehStoreNewCapCtrl_X;
			y = VehStoreNewCapCtrl_Y;
			w = VehStoreNewCapCtrl_W;
			h = VehStoreNewCapCtrl_H;
		};

		// Dinero del jugador
		class MoneyCtrl: w_RscText
		{
			idc = vehshopNew_money;
			text = "Cash: $0";
			sizeEx = 0.04 * TEXT_SCALE;

			x = VehStoreNewMainBG_X + (0.60 * SZ_SCALE);
			y = VehStoreNewMainBG_Y + (0.005 * SZ_SCALE);
			w = 0.15 * SZ_SCALE;
			h = 0.04 * SZ_SCALE;
		};

		// Botón Comprar
		class BuyButton: w_RscButton
		{
			idc = vehshopNew_BuyButton_IDC;
			action = "[] call confirmPurchaseNew";
			text = "Buy";
			sizeEx = VehStoreNew_TextSize;

			x = VehStoreNewMainBG_X + (0.40 * SZ_SCALE);
			y = VehStoreNewMainBG_Y + (0.60 * SZ_SCALE);
			w = 0.12 * SZ_SCALE;
			h = 0.05 * SZ_SCALE;
		};

		// Botón Cancelar
		class CancelButton: w_RscButton
		{
			idc = vehshopNew_CancelButton_IDC;
			action = "closeDialog 0";
			text = "Cancel";
			sizeEx = VehStoreNew_TextSize;

			x = VehStoreNewMainBG_X + (0.02 * SZ_SCALE);
			y = VehStoreNewMainBG_Y + (0.65 * SZ_SCALE);
			w = 0.10 * SZ_SCALE;
			h = 0.05 * SZ_SCALE;
		};

		// Botones de categoría
		class StoreButton0: w_RscButton
		{
			idc = vehshopNew_button0;
			action = "[0] call populateVehicleStoreNew";
			text = "Land";
			sizeEx = VehStoreNew_TextSize;

			x = VehStoreNewMainBG_X + (0.68 * SZ_SCALE);
			y = VehStoreNewMainBG_Y + (0.07 * SZ_SCALE);
			w = 0.12 * SZ_SCALE;
			h = 0.04 * SZ_SCALE;
		};

		class StoreButton1: w_RscButton
		{
			idc = vehshopNew_button1;
			action = "[1] call populateVehicleStoreNew";
			text = "Armored";
			sizeEx = VehStoreNew_TextSize;

			x = VehStoreNewMainBG_X + (0.82 * SZ_SCALE);
			y = VehStoreNewMainBG_Y + (0.07 * SZ_SCALE);
			w = 0.12 * SZ_SCALE;
			h = 0.04 * SZ_SCALE;
		};

		class StoreButton2: w_RscButton
		{
			idc = vehshopNew_button2;
			action = "[2] call populateVehicleStoreNew";
			text = "Tanks";
			sizeEx = VehStoreNew_TextSize;

			x = VehStoreNewMainBG_X + (0.68 * SZ_SCALE);
			y = VehStoreNewMainBG_Y + (0.12 * SZ_SCALE);
			w = 0.12 * SZ_SCALE;
			h = 0.04 * SZ_SCALE;
		};

		class StoreButton3: w_RscButton
		{
			idc = vehshopNew_button3;
			action = "[3] call populateVehicleStoreNew";
			text = "Helicopters";
			sizeEx = VehStoreNew_TextSize;

			x = VehStoreNewMainBG_X + (0.82 * SZ_SCALE);
			y = VehStoreNewMainBG_Y + (0.12 * SZ_SCALE);
			w = 0.12 * SZ_SCALE;
			h = 0.04 * SZ_SCALE;
		};

		class StoreButton4: w_RscButton
		{
			idc = vehshopNew_button4;
			action = "[4] call populateVehicleStoreNew";
			text = "Planes";
			sizeEx = VehStoreNew_TextSize;

			x = VehStoreNewMainBG_X + (0.68 * SZ_SCALE);
			y = VehStoreNewMainBG_Y + (0.17 * SZ_SCALE);
			w = 0.12 * SZ_SCALE;
			h = 0.04 * SZ_SCALE;
		};

		class StoreButton5: w_RscButton
		{
			idc = vehshopNew_button5;
			action = "[5] call populateVehicleStoreNew";
			text = "Boats";
			sizeEx = VehStoreNew_TextSize;

			x = VehStoreNewMainBG_X + (0.82 * SZ_SCALE);
			y = VehStoreNewMainBG_Y + (0.17 * SZ_SCALE);
			w = 0.12 * SZ_SCALE;
			h = 0.04 * SZ_SCALE;
		};

		class StoreButton6: w_RscButton
		{
			idc = vehshopNew_button6;
			action = "[6] call populateVehicleStoreNew";
			text = "Autonomous";
			sizeEx = VehStoreNew_TextSize;

			x = VehStoreNewMainBG_X + (0.68 * SZ_SCALE);
			y = VehStoreNewMainBG_Y + (0.22 * SZ_SCALE);
			w = 0.12 * SZ_SCALE;
			h = 0.04 * SZ_SCALE;
		};
	};
};
