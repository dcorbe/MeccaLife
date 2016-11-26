#include "\life_server\script_macros.hpp"
/*
	File: fn_wantedFetch.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm

	Description:
	Displays wanted list information sent from the server.
*/
private["_ret","_list","_result","_queryResult","_units","_inStatement"];
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _ret) exitWith {};
_ret = owner _ret;

_list = missionNamespace getVariable "wantedList";

[[_list],"life_fnc_wantedList",_ret,false] spawn life_fnc_MP;

