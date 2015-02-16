#include <macro.h>
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

switch(playerSide) do {
	case west: {
		ctrlShow[2011,false];
		
		if(FETCH_CONST(life_coplevel) == 1) then
		{
			ctrlShow[2012,false];
		};	
	};
	
	case civilian: {
		ctrlShow[2012,false]; Civs cannot see wanted list
	};
	
	case independent: {
		ctrlShow[2012,false]; Medics cannot see wanted list.
	};
};

if(FETCH_CONST(life_adminlevel) < 1) then {
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};

[] call life_fnc_p_updateMenu;

if(FETCH_CONST(life_adminlevel) < 1) then {
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};