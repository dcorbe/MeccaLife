#include "\life_server\script_macros.hpp"
/*
	File: fn_wantedPerson.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm
	
	Description:
	Fetches a specific person from the wanted array.
*/
private["_unit","_index","_wanted","_list"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {[]};
_uid = getPlayerUID player;

/*_result = format["wantedFetchPerson:%1",_uid];
waitUntil{!DB_Async_Active};
_queryResult = [_result,2] call DB_fnc_asyncCall;
if(count _queryResult == 0) exitWith {[]};*/
_list = missionNamespace getVariable "wantedList";

{
	if (EQUAL(_uid, SEL(_x,0))) then {
		_wanted = [SEL(_x,0),SEL(_x,1),SEL(_x,3)];
	};
} forEach _list;
if(isNil "_wanted") exitWith {[]};


_wanted;