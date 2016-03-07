#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private["_unitID","_members"];
if(life_gangrank == 5) exitWith {hint localize "STR_GNOTF_LeaderLeave"};
_unitID = getPlayerUID player;
_members = life_gangmembers;
if(isNil "_members") exitWith {};
if(!(EQUAL(typeName _members,"ARRAY"))) exitWith {};

{
	_uid = _x select 0;
	if (str(_uid) == str(_unitID)) then {
		_members set [_forEachIndex, -1];
	};
} forEach _members;

SUB(_members,[-1]);

life_gangmembers = _members;

[player] joinSilent (createGroup civilian);


[[life_gangid,-1,-1,life_gangmembers],"life_fnc_updateGangInfo",true,false] spawn life_fnc_MP;

[life_gangid] call life_fnc_updateGangHouse;

life_gangid = -1;
life_gangowner = -1;
life_gangname = "";
life_gangbank = 0;
life_gangrank = 0;
life_in_gang = false;
life_ganggroup = ObjNull;
closeDialog 0;