class MECCA_Life_My_Group_Diag {
	idd = 2620;
	name= "life_my_group_menu";
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

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Group Management";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class GangMemberList : Life_RscListBox 
		{
			idc = 2621;
			text = "";
			sizeEx = 0.035;
			
			x = 0.12; y = 0.26;
			w = 0.350; h = 0.370;
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangLeave : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Leave";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call life_fnc_leaveGang";
			x = 0.50;
			y = 0.26;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangLock : Life_RscButtonMenu 
		{
			idc = 2622;
			text = "Lock";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call life_fnc_lockGang";
			x = 0.50;
			y = 0.31;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangUnlock : Life_RscButtonMenu 
		{
			idc = 2623;
			text = "Unlock";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call life_fnc_unlockGang";
			x = 0.50;
			y = 0.31;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangKick : Life_RscButtonMenu 
		{
			idc = 2624;
			text = "$STR_Gang_Kick";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call life_fnc_kickGang";
			x = 0.50;
			y = 0.36;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangLeader : Life_RscButtonMenu 
		{
			idc = 2625;
			text = "$STR_Gang_SetLeader";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call life_fnc_setGangLeader";
			x = 0.50;
			y = 0.41;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangName : Title {
			idc = 601;
			style = 1;
			text = "";
		};
	};
};

class MECCA_Life_Browse_Gang_Diag {
	idd = 2520;
	name= "life_my_gang_menu_browse";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_gangBrowser";
	
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

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Group Management - Current Groups";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class GangList : Life_RscListBox 
		{
			idc = 2521;
			text = "";
			sizeEx = 0.035;
			
			x = 0.12; y = 0.26;
			w = 0.56; h = 0.370;
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0; [] call life_fnc_p_updateMenu;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangJoin : Life_RscButtonMenu {
			idc = 2522;
			text = "$STR_Gang_Join";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call life_fnc_joinGang";
			x = 0.32;
			y = 0.65;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class MECCA_Life_Create_Group_Diag {
	idd = 2520;
	name= "life_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	
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
	
		class InfoMsg : Life_RscStructuredText
		{
			idc = 2523;
			sizeEx = 0.020;
			text = "You can create a group for free.";
			x = 0.1;
			y = 0.25;
			w = 0.5; h = 0.11;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Group Menu";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangCreateField : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Create";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call life_fnc_createGroup";
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

class MECCA_Life_Gang_Prompt
{
	idd = 2550;
	name = "Gang_Prompt";
	movingEnabled = false;
	enableSimulation = true;
	
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
	
	class controls 
	{
		class InfoMsg : Life_RscStructuredText
		{
			idc = -1;
			sizeEx = 0.020;
			text = "Create or Choose a group!";
			x = 0.287;
			y = 0.2 + (11 / 250);
			w = 0.5; h = 0.12;
		};

		class life_gang_browse : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Browse";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0; createDialog ""MECCA_Life_Browse_Gang_Diag""";
			x = (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class life_gang_create_button : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Create";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0; createDialog ""MECCA_Life_Create_Group_Diag""; ctrlShow[2522,true]";
			x = 0.2 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};