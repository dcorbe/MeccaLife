#include "\life_server\script_macros.hpp"
/*
	File: fn_changeSlingLoad.sqf
	Author: Derek
	
	Description:
	Enables or disables a vehicles slingload
*/
private["_vehicle","_state"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_state = [_this,1,false] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};

_vehicle enableRopeAttach _state;

