#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	File: fn_initGang.sqf
	
	Description:
	Main initialization for gangs?
*/
private["_exitLoop","_group","_wait"];
if(playerSide != civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);

_wait = round(random(8));
sleep _wait;

//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
	_groupName = _x GVAR "gang_name";
	if(!isNil "_groupName") then {
		_groupID = _x GVAR "gang_id";
		if(isNil "_groupID") exitWith {}; //Seriously?
		if(EQUAL(life_gangid,_groupID)) exitWith {_group = _x; _exitLoop = true;};
	};
} foreach allGroups;

if(!isNil "_group") then {
	[player] join _group;
	if(life_gangrank == 5) then {
		_group selectLeader player;
		[[player,_group],"TON_fnc_clientGangLeader",(units _group),false] call life_fnc_MP;
	};
	life_in_gang = true;
	life_ganggroup = _group;
} else {
	_group = group player;
	_group SVAR ["gang_id",life_gangid,true];
	_group SVAR ["gang_name",life_gangname,true];
	_group SVAR ["gang",true,true];
	life_in_gang = true;
	life_ganggroup = _group;
};

