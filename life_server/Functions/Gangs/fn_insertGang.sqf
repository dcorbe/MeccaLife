#include "\life_server\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	File: fn_initGang.sq
	
	Description:
	Inserts the gang into the database.
*/
private["_ownerID","_uid","_gangName","_query","_queryResult","_gangMembers","_group"];
_ownerID = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = [_this,1,"",[""]] call BIS_fnc_param;
_gangName = [_this,2,"",[""]] call BIS_fnc_param;
_playerName = [_this,3,"",[""]] call BIS_fnc_param;
_group = group _ownerID;

if(isNull _ownerID OR EQUAL(_uid,"") OR EQUAL(_gangName,"")) exitWith {}; //Fail

_ownerID = owner _ownerID;
_query = format["gangNameSelectID:%1:%2",_gangName,1];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if the gang name already exists.
if(!(EQUAL(count _queryResult,0))) exitWith {
	[[1,"There is already a gang created with that name please pick another name."],"life_fnc_broadcast",_ownerID,false] call life_fnc_MP;
	life_action_gangInUse = nil;
	PVAR_ID("life_action_gangInUse",_ownerID);
};

_query = format["gangIDPlayer:%2%1%2",_uid,"%"];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if this person already owns or belongs to a gang.
if(!(EQUAL(count _queryResult,0))) exitWith {
	[[1,"You are currently already active in a gang, please leave the gang first."],"life_fnc_broadcast",_ownerID,false] call life_fnc_MP;
	life_action_gangInUse = nil;
	PVAR_ID("life_action_gangInUse",_ownerID);
};

//Check to see if a gang with that name already exists but is inactive.
_query = format["gangNameSelectID:%1:%2",_gangName,0];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;
_gangMembers = [_uid,_playerName,5];

if(!(EQUAL(count _queryResult,0))) then {
	_query = format["gangUpdate:%1:[%2]:%3",_uid,_gangMembers,(_queryResult select 0)];
} else {
	_query = format["gangInsert:%1:%2:[%3]",_uid,_gangName,_gangMembers];
};
waitUntil{!DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;

_group setVariable["gang_name",_gangName,true];
_group setVariable["gang_owner",_uid,true];
_group setVariable["gang_bank",0,true];
_group setVariable["gang_maxMembers",100,true];
_group setVariable["gang_members",[[_uid,_playerName,5]],true];
_group setVariable["gang",true,true];

_query = format["gangOwnerSelectID:%1:%2",_uid,1];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

_group SVAR ["gang_id",_queryResult select 0,true];

[[_gangName,_uid,_queryResult select 0,0,[_gangMembers]],"life_fnc_gangCreated",_ownerID,false] call life_fnc_MP;


