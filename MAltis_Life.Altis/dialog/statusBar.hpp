#define ST_RIGHT 0x01

class osefStatusBar {
	idd = -1;
	onLoad = "uiNamespace setVariable ['osefStatusBar', _this select 0]";
	onUnload = "uiNamespace setVariable ['osefStatusBar', objNull]";
	onDestroy = "uiNamespace setVariable ['osefStatusBar', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 1000;
			x = safezoneX + safezoneW - 0.35;
			y = safezoneY + safezoneH - 0.04;
			w = 1.2;
			h = 0.04;
			shadow = 2;
			colorBackground[] = { 0, 0, 0, 0.5 }; 
			font = "puristaLight";
			size = 0.03;
			type = 13;
			style = 1;
			text="Loading server info...";
			class Attributes {
				align="left";
				color = "#FF8700";
			};
		};
	};
};