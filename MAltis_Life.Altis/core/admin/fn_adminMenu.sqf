#include <macro.h>
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};

switch(FETCH_CONST(life_adminlevel)) do
{
	case 1: {ctrlShow [2904,false];ctrlShow [2908,false];ctrlShow [2909,false];ctrlShow [2910,false];ctrlShow [2912,false];};
	case 2: {ctrlShow [2904,false];ctrlShow [2909,false];ctrlShow [2912,false];};
};

//2904: Compensate, 2905: Spectate, 2906:Teleport, 2907: TpHere, 2908: GodMode, 2909: Freeze, 2910: Markers, 2911: Invisible, 2912: Revive All

//Purge List
lbClear _list;

{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; case independent : {"Med"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};