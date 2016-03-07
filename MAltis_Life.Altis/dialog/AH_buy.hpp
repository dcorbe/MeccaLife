class AH_buy 
{
	idd = 15100;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {};
	
	class controls {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.235956 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.528089 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Currently active Offers"; //--- ToDo: Localize;
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.246958 * safezoneH + safezoneY;
			w = 0.163935 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 15101;
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.279963 * safezoneH + safezoneY;
			w = 0.461447 * safezoneW;
			h = 0.440074 * safezoneH;
			sizeEx = 0.04;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = -1;
			text = "Accept selected Offer"; //--- ToDo: Localize;
			onButtonClick = "[] spawn life_fnc_CAH_Buy;";
			x = 0.530358 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.200365 * safezoneW;
			h = 0.0220037 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.24,0.58,0,1};
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = -1;
			text = "Close this window"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.127505 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = -1;
			text = "Create a offer"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;[] spawn life_fnc_CAH_loadInventory;";
			x = 0.399211 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.128719 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
	};
};