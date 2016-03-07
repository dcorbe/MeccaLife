class Life_virtInv_house {
	idd = 6000;
	name= "life_virtInv_house";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {};
	
	class controls {

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by RyanTT | AltisLifeRPG, v1.063, #Syzima)
////////////////////////////////////////////////////////

class RscText_1000: Life_RscText
{
	idc = 1000;

	x = 0.276617 * safezoneW + safezoneX;
	y = 0.235933 * safezoneH + safezoneY;
	w = 0.446778 * safezoneW;
	h = 0.528217 * safezoneH;
	colorText[] = {0,0,0,0.8};
	colorBackground[] = {0,0,0,0.8};
};
class RscText_1001: Life_RscText
{
	idc = 6005;

	text = "House Virtual Inventory"; //--- ToDo: Localize;
	x = 0.276617 * safezoneW + safezoneX;
	y = 0.235933 * safezoneH + safezoneY;
	w = 0.446778 * safezoneW;
	h = 0.0220091 * safezoneH;
	colorText[] = {0,0,0,0.8};
	colorBackground[] = {0.8,0.44,0,1};
};
class lbHaus: Life_RscListbox
{
	idc = 6003;
	x = 0.282339 * safezoneW + safezoneX;
	y = 0.345938 * safezoneH + safezoneY;
	w = 0.189021 * safezoneW;
	h = 0.407166 * safezoneH;
	sizeEx = 0.035;
	onLBSelChanged = "[] spawn {[0] call life_fnc_displayStats;};";
};
class lbInv: Life_RscListbox
{
	idc = 6013;
	x = 0.528641 * safezoneW + safezoneX;
	y = 0.345938 * safezoneH + safezoneY;
	w = 0.189021 * safezoneW;
	h = 0.407166 * safezoneH;
	sizeEx = 0.035;

	onLBSelChanged = "[] spawn {[1] call life_fnc_displayStats;};";
};
class RscButtonMenu_2400: Life_RscButtonMenu
{
	idc = 2400;
	text = "←"; //--- ToDo: Localize;
	x = 0.477088 * safezoneW + safezoneX;
	y = 0.378951 * safezoneH + safezoneY;
	w = 0.0458234 * safezoneW;
	h = 0.022009 * safezoneH;
	onButtonClick = "[1] spawn life_fnc_swapItem;";
};
class RscButtonMenu_2401: Life_RscButtonMenu
{
	idc = 2401;
	text = "→"; //--- ToDo: Localize;
	x = 0.477088 * safezoneW + safezoneX;
	y = 0.411964 * safezoneH + safezoneY;
	w = 0.0458234 * safezoneW;
	h = 0.022009 * safezoneH;
	onButtonClick = "[0] spawn life_fnc_swapItem;";
};
class RscText_1002: Life_RscText
{
	idc = 1002;

	text = "House Inventory"; //--- ToDo: Localize;
	x = 0.288079 * safezoneW + safezoneX;
	y = 0.279945 * safezoneH + safezoneY;
	w = 0.103103 * safezoneW;
	h = 0.0220091 * safezoneH;
};
class RscText_1003: Life_RscText
{
	idc = 1003;

	text = "Your inventory"; //--- ToDo: Localize;
	x = 0.534384 * safezoneW + safezoneX;
	y = 0.279945 * safezoneH + safezoneY;
	w = 0.103103 * safezoneW;
	h = 0.0220091 * safezoneH;
};
class hausClassname: Life_RscText
{
	idc = 6001;

	text = "<Item>"; //--- ToDo: Localize;
	x = 0.288079 * safezoneW + safezoneX;
	y = 0.30195 * safezoneH + safezoneY;
	w = 0.503103 * safezoneW;
	h = 0.0220091 * safezoneH;
};
class hausAmount: Life_RscText
{
	idc = 6002;

	text = "<Number>"; //--- ToDo: Localize;
	x = 0.288079 * safezoneW + safezoneX;
	y = 0.319555 * safezoneH + safezoneY;
	w = 0.103103 * safezoneW;
	h = 0.0220091 * safezoneH;
};
class invClassname: Life_RscText
{
	idc = 6011;

	text = "<Item>"; //--- ToDo: Localize;
	x = 0.534384 * safezoneW + safezoneX;
	y = 0.30195 * safezoneH + safezoneY;
	w = 0.503103 * safezoneW;
	h = 0.0220091 * safezoneH;
};
class invAmount: Life_RscText
{
	idc = 6012;

	text = "<Number>"; //--- ToDo: Localize;
	x = 0.534499 * safezoneW + safezoneX;
	y = 0.319555 * safezoneH + safezoneY;
	w = 0.103103 * safezoneW;
	h = 0.0220091 * safezoneH;
};
class RscButtonMenu_2402: Life_RscButtonMenu
{
	idc = 2402;

	text = "Close"; //--- ToDo: Localize;
	x = 0.631743 * safezoneW + safezoneX;
	y = 0.766309 * safezoneH + safezoneY;
	w = 0.0916468 * safezoneW;
	h = 0.022009 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.8};
	onButtonClick = "[] spawn {[2] call life_fnc_displayStats;};closeDialog 0;";
};
class RscText_1014: Life_RscText
{
	idc = -1;

	x = 0.276503 * safezoneW + safezoneX;
	y = 0.125906 * safezoneH + safezoneY;
	w = 0.446995 * safezoneW;
	h = 0.0990249 * safezoneH;
	colorText[] = {0,0,0,0.8};
	colorBackground[] = {0,0,0,0.8};
};
class RscText_1015: Life_RscText
{
	idc = -1;

	text = "CAUTION: Before removing a weapon or a backpack, make sure you have no weapon"; //--- ToDo: Localize;
	x = 0.282233 * safezoneW + safezoneX;
	y = 0.136909 * safezoneH + safezoneY;
	w = 0.435533 * safezoneW;
	h = 0.0220028 * safezoneH;
	colorText[] = {1,0,0,1};
};
class RscText_1016: Life_RscText
{
	idc = -1;

	text = "and no backpack attached to your current player. If you have either a weapon or"; //--- ToDo: Localize;
	x = 0.282233 * safezoneW + safezoneX;
	y = 0.156713 * safezoneH + safezoneY;
	w = 0.435533 * safezoneW;
	h = 0.0220028 * safezoneH;
	colorText[] = {1,0,0,1};
};
class RscText_1017: Life_RscText
{
	idc = -1;

	text = "a backpack on and you attempt to remove yours from the inventory, the one you"; //--- ToDo: Localize;
	x = 0.282233 * safezoneW + safezoneX;
	y = 0.172118 * safezoneH + safezoneY;
	w = 0.439802 * safezoneW;
	h = 0.0220055 * safezoneH;
	colorText[] = {1,0,0,1};
};
class RscText_1018: Life_RscText
{
	idc = -1;

	text = "have equipped will be overwritten!"; //--- ToDo: Localize;
	x = 0.282233 * safezoneW + safezoneX;
	y = 0.18752 * safezoneH + safezoneY;
	w = 0.269343 * safezoneW;
	h = 0.0330083 * safezoneH;
	colorText[] = {1,0,0,1};
};
};
};