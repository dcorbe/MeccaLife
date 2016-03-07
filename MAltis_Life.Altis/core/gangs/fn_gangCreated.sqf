#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	File: fn_gangCreated.sqf
	
	Description:
	Tells the player that the gang is created and throws him into it.
*/
private "_group";
_gang_name = [_this,0,"",[""]] call BIS_fnc_param;
_gang_owner = [_this,1,-1] call BIS_fnc_param;
_gang_id = [_this,2,-1] call BIS_fnc_param;
_gang_bank = [_this,3,-1,[-1]] call BIS_fnc_param;
_gang_members = [_this,4,[],[[]]] call BIS_fnc_param;

life_action_gangInUse = nil;

if(BANK < (LIFE_SETTINGS(getNumber,"gang_price"))) exitWith {
	[[_gang_id],"TON_fnc_removeGang",false,false] call life_fnc_MP;
	hint format[localize "STR_GNOTF_NotEnoughMoney",[((LIFE_SETTINGS(getNumber,"gang_price"))-BANK)] call life_fnc_numberText];
	life_in_gang = false;
	life_gangid = -1;
	life_gangowner = -1;
	life_gangname = -1;
	life_gangbank = -1;
	life_gangmembers = -1;
	life_gangrank = 0;
};

SUB(BANK,(LIFE_SETTINGS(getNumber,"gang_price")));
life_in_gang = true;
life_gangid = _gang_id;
life_gangowner = _gang_owner;
life_gangname = _gang_name;
life_gangbank = _gang_bank;
life_gangmembers = _gang_members;
life_gangrank = 5;

hint format[localize "STR_GNOTF_CreateSuccess",life_gangname,[(LIFE_SETTINGS(getNumber,"gang_price"))] call life_fnc_numberText];