#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: UnNamed , Cal
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

//if(!(str(player) in ["cop_1","cop_2","cop_3","cop_4","cop_5","cop_6"])) then {
if((FETCH_CONST(life_coplevel) == 0) && (FETCH_CONST(life_adminlevel) == 0)) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
	player setVariable["rank",(FETCH_CONST(life_coplevel)),true];
};

/*
Moving this into uniformscolor
[] spawn
{
    while {true} do
    {
        waitUntil {backpack player == "B_Carryall_oucamo"};
        (unitbackpack player) setObjectTextureGlobal [0, ""]; 
        waitUntil {backpack player != "B_Carryall_oucamo"}; 
    };
};
*/

player setVariable["rank",(FETCH_CONST(life_coplevel)),true];
[] spawn life_fnc_INFO;
	waitUntil{!isNull (findDisplay 999999)}; //Wait for the welcome to be open.
	waitUntil{isNull (findDisplay 999999)}; //Wait for the welcome to be done.

[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
[] call life_fnc_Uniformscolor;