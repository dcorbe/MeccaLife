#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((FETCH_CONST(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};
[] spawn
{
    while {true} do
    {
        waitUntil {backpack player == "B_Carryall_oucamo"};
        (unitbackpack player) setObjectTextureGlobal [0, ""]; 
        waitUntil {backpack player != "B_Carryall_oucamo"}; 
    };
};
_igiload = execVM "IgiLoad\IgiLoadInit.sqf";

player setVariable["medrank",(FETCH_CONST(life_medicLevel)),true];

[] spawn life_fnc_INFO;
	waitUntil{!isNull (findDisplay 999999)}; //Wait for the welcome to be open.
	waitUntil{isNull (findDisplay 999999)}; //Wait for the welcome to be done.

[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	
[] call life_fnc_Uniformscolor;
