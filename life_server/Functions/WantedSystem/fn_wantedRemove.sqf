/*
	File: fn_wantedRemove.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm
	
	Description:
	Removes a person from the wanted list.
*/
private["_uid","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if(_uid == "") exitWith {}; //Bad data

_query = format["wantedRemoveCrimes:%1",_uid];
waitUntil{!DB_Async_Active};
[_query,2] call DB_fnc_asyncCall;

[] spawn life_fnc_wantedSyncList;