class VehicleUpgrade
{
	idd = 5500;
	name = "VehicleUpgrade";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class Background: Life_RscText
		{
			idc = 1000;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.374 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			colorActive[] = {0,0,0,0.7};
		};
		class TitleBackground: Life_RscText
		{
			idc = 1001;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.35,0,0,0.7};
			colorActive[] = {0.35,0,0,0.7};
		};
		class Title: Life_RscText
		{
			idc = 1002;
			text = "Upgrade Vehicle"; //--- ToDo: Localize;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class InsuranceLabel: Life_RscText
		{
			idc = 1007;
			text = "Insurance:"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class TrunkLevelLabel: Life_RscText
		{
			idc = 1005;
			text = "Trunk Level:"; //--- ToDo: Localize;
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class InsuranceLevelLabel: Life_RscText
		{
			idc = 1008;
			text = "Insurance Level:"; //--- ToDo: Localize;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class SecurityLabel: Life_RscText
		{
			idc = 1009;
			text = "HQ Security:"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class HooksLabel: Life_RscText
		{
			idc = 1010;
			text = "Sling Hooks:"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class GPSLabel: Life_RscText
		{
			idc = 1011;
			text = "GPS Tracker:"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class PriceLabel: Life_RscText
		{
			idc = 1012;
			text = "Cost of Upgrades:"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class TrunkLabel: Life_RscText
		{
			idc = 1003;
			text = "Trunk Space:"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
	
	class Controls
	{
		class TrunkSlider: Life_RscSlider
		{
			idc = 1900;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class TrunkLevel: Life_RscText
		{
			idc = 1004;
			text = "4"; //--- ToDo: Localize;
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class InsuranceSlider: Life_RscSlider
		{
			idc = 1902;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class InsuranceLevel: Life_RscText
		{
			idc = 1006;
			text = "3"; //--- ToDo: Localize;
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class SecurityCheck: Life_RscCheckbox
		{
			idc = 2800;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class HooksCheck: Life_RscCheckbox
		{
			idc = 2801;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GPSCheck: Life_RscCheckbox
		{
			idc = 2802;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ConfirmButton: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Confirm"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.35,0,0,0.7};
			colorActive[] = {0.35,0,0,0.7};
		};
		class CancelButton: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.35,0,0,0.7};
			colorActive[] = {0.35,0,0,0.7};
		};
	};
};