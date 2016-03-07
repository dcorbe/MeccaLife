#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player about an invite.
*/
private["_name","_group"];
_name = [_this,0,"",[""]] call BIS_fnc_param;
_ganginfo = [_this,1,[],[[]]] call BIS_fnc_param;
if(_name == "" OR EQUAL(_ganginfo,[])) exitWith {}; //Fail horn anyone?
if(life_gangrank > 0) exitWith {hint "Someone has invited you to a gang but you are already in a gang"};

_gangName = SEL(_ganginfo,4);
_action = [
	format[localize "STR_GNOTF_InviteMSG",_name,_gangName],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	life_gangid = SEL(_ganginfo,0);
	life_gangowner = SEL(_ganginfo,1);
	life_gangbank = SEL(_ganginfo,2);
	life_gangmembers = SEL(_ganginfo,3);
	if(!(isNull SEL(_ganginfo,5))) then {
		[[life_gangid,SEL(_ganginfo,5)],"life_fnc_updateGangHouse",true,false] call life_fnc_MP;	
	};
	_members = life_gangmembers;
	if (typeName (_members select 0) != "ARRAY") then {
		_members = [[_members],[getPlayerUID player, player GVAR ["realname",name player]],1];
	} else {
		_members pushBack [getPlayerUID player, player GVAR ["realname",name player],1];
	};
	life_gangmembers = _members;
	[[life_gangid,life_gangowner,life_gangbank,life_gangmembers],"life_fnc_updateGangInfo",true,false] spawn life_fnc_MP;
	life_in_gang = true;
	[] spawn life_fnc_initGang;
} else {
	hint "You declined the offer.";
};