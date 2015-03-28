class Life_My_Gang_Diag {
	idd = 2620;
	name= "life_my_gang_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
	
	    class fondtablet: Life_RscPicture
		{
			idc = 9090909;
			text = "textures\menu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};
		
		class MainBackground:life_RscText {
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class PlayerList:Life_RscListbox
		{
			idc = 2621;
			sizeEx = 0.035;
			x = 0.1125;
			y = 0.26;
			w = 0.4625;
			h = 0.54;
		};
		class DisplayGroupButton:Life_RscButtonMenu
		{
			idc = 2401;
			text = "Group"; //--- ToDo: Localize;
			x = 0.6;
			y = 0.28;
			w = 0.2;
			h = 0.04;
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0; [] call life_fnc_groupMenu;";
		};
		class InviteGangButton: DisplayGroupButton
		{
			idc = 2630;
			text = "$STR_Gang_Invite_Player";
			onButtonClick = "[] spawn life_fnc_gangInvitePlayer";
			y = 0.44;
		};
		class LeaveGangButton: DisplayGroupButton
		{
			idc = 2403;
			text = "$STR_Gang_Leave";
			onButtonClick = "[] call life_fnc_gangLeave";
			y = 0.36;
		};
		class PromoteGangButton: DisplayGroupButton
		{
			idc = 2625;
			text = "$STR_Gang_SetLeader";
			onButtonClick = "[] spawn life_fnc_gangNewLeader";
			y = 0.6;
		};
		class DisbandGangButton: DisplayGroupButton
		{
			idc = 2405;
			text = "$STR_Gang_Disband_Gang";
			onButtonClick = "[] spawn life_fnc_gangDisband";
			y = 0.68;
		};
		class KickGangButton: DisplayGroupButton
		{
			idc = 2624;
			text = "$STR_Gang_Kick";
			onButtonClick = "[] call life_fnc_gangKick";
			y = 0.52;
		};
		class CloseButton: DisplayGroupButton
		{
			idc = -1;
			text = "Close"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.82;
			w = 0.1;
			h = 0.04;
		};
		class GangNameLabel:Life_RscText
		{
			idc = 1003;
			text = "Your Gang:"; //--- ToDo: Localize;
			x = 0.1125;
			y = 0.2;
			w = 0.462499;
			h = 0.06;
		};
	};
};

class Life_Create_Gang_Diag {
	idd = 2520;
	name= "life_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(call life_gangPrice)] call life_fnc_numberText]};";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls {
	
		class InfoMsg : Life_RscStructuredText
		{
			idc = 2523;
			sizeEx = 0.020;
			text = "";
			x = 0.1;
			y = 0.25;
			w = 0.5; h = .11;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Gang_Title";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangCreateField : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Create";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_createGang";
			x = 0.27;
			y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class CreateGangText : Life_RscEdit
		{
			idc = 2522;
			text = "$STR_Gang_YGN";
			
			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.35;
			w = (13 / 40);
			h = (1 / 25);
		};
	};
};


class Life_My_Group_Diag {
	idd = 2620;
	name= "life_my_groups_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[false] spawn life_fnc_gangManagement;";
	
	class controlsBackground {
	
	    class fondtablet: Life_RscPicture
		{
			idc = 9090909;
			text = "textures\menu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};
		
		class MainBackground:life_RscText {
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class PlayerList:Life_RscListbox
		{
			idc = 2621;
			sizeEx = 0.035;
			x = 0.1125;
			y = 0.26;
			w = 0.4625;
			h = 0.54;
		};
		class DisplayGroupButton:Life_RscButtonMenu
		{
			idc = 2401;
			text = "Gang"; //--- ToDo: Localize;
			x = 0.6;
			y = 0.28;
			w = 0.2;
			h = 0.04;
			onButtonClick = "closeDialog 0; [] call life_fnc_gangMenu;";
			colorBackground[] = {0, 0, 0, 0};
		};
		class LockGroupButton: DisplayGroupButton
		{
			idc = 2622;
			text = "Lock";
			onButtonClick = "[] spawn life_fnc_lockGang";
			y = 0.44;
		};
		class UnlockGroupButton: LockGroupButton
		{
			idc = 2623;
			text = "Unlock";
			onButtonClick = "[] spawn life_fnc_unlockGang";
			y = 0.44;
		};
		class LeaveGangButton: DisplayGroupButton
		{
			idc = 2403;
			text = "$STR_Gang_Leave";
			onButtonClick = "[] call life_fnc_leaveGang";
			y = 0.36;
		};
		class PromoteGangButton: DisplayGroupButton
		{
			idc = 2625;
			text = "$STR_Gang_SetLeader";
			onButtonClick = "[] spawn life_fnc_setGangLeader";
			y = 0.6;
		};
		class KickGangButton: DisplayGroupButton
		{
			idc = 2624;
			text = "$STR_Gang_Kick";
			onButtonClick = "[] call life_fnc_kickGang";
			y = 0.52;
		};
		class CloseButton: DisplayGroupButton
		{
			idc = -1;
			text = "Close"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.82;
			w = 0.1;
			h = 0.04;
		};
		class GangNameLabel:Life_RscText
		{
			idc = 1003;
			text = "Your Gang:"; //--- ToDo: Localize;
			x = 0.1125;
			y = 0.2;
			w = 0.462499;
			h = 0.06;
		};
	};
};