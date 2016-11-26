/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah
*/
private["_house","_uid","_housePos","_query"];
_uid = [_this,0,-1] call BIS_fnc_param;
_house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
["diag_log",[
		"------------- House Add Request -------------",
		"Called House Add",
		format["UID: %1, house: %2",_uid,_house],
		"------------------------------------------------"
	]] call TON_fnc_logIt;
if(isNull _house) exitWith {};

["diag_log",[
		"------------- House Add Request -------------",
		"Made it past the null checks.",
		"------------------------------------------------"
	]] call TON_fnc_logIt;

_housePos = getPosATL _house;

waitUntil{!DB_Async_Active};
_query = format["housingAddHouse:%1:%2:%3:%4:%5",_uid,_housePos,[[],0],[],1];
_queryResult = [_query,2] call DB_fnc_asyncCall;
systemChat format["House ID assigned: %1",_queryResult select 0];

["diag_log",[
		"------------- House Add Request -------------",
		format["QUERY: %1",_query],
		format["Result: %1",_queryResult],
		"------------------------------------------------"
	]] call TON_fnc_logIt;

_house setVariable["house_id",(_queryResult select 0),true];