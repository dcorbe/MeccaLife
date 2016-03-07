#include <macro.h>
/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_resourceZones","_zone"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","frog_1","mushroom_1","slave_trader_center"];
_zone = "";
if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
life_action_gathering = true;
//Find out what zone we're near 
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(EQUAL(_zone,"")) exitWith {life_action_gathering = false;};
if!(EQUAL(currentWeapon player,"")) exitWith {hint localize "STR_Civ_GatherGun"}; //prevents faster farming by spamming windows key while holding a weapon 
//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = ["apple",5];};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = ["peach",5];};
	case (_zone in ["heroin_1"]): {_gather = ["heroin_unprocessed",5];};
	case (_zone in ["cocaine_1"]): {_gather = ["cocaine_unprocessed",5];};
	case (_zone in ["weed_1"]): {_gather = ["cannabis",5];};
	case (_zone in ["frog_1"]): {_gather = ["frog",5];};
	case (_zone in ["mushroom_1"]): {_gather = ["mushroom",5];};
	case (_zone in ["slave_trader_center"]): {_gather = ["tobacco",5];};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {};

_diff = [SEL(_gather,0),SEL(_gather,1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_gathering = true;

for "_i" from 0 to 2 do {
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 3.5;
};

if(([true,SEL(_gather,0),_diff] call life_fnc_handleInv)) then {
	_itemName = M_CONFIG(getText,"VirtualItems",SEL(_gather,0),"displayName");
	titleText[format[localize "STR_NOTF_Gather_Success",(localize _itemName),_diff],"PLAIN"];
};

life_action_gathering = false;

//["query_log",[format["%1 has gathered %2 %3",name player,_diff,_itemName]]] call TON_fnc_logIt;