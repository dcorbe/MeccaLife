#include "\life_server\script_macros.hpp"
/*
	Author: Dillon "Itsyuka" Modine-Thuen
	File: fn_preCheckHouse.sqf
	Description: Checks to see if the house is owned (mainly for the purchase function)
*/
private["_query","_queryResult","_house","_housePos"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _house) exitWith {false;};
if(isNull _unit) exitWith {false;};
_housePos = getPosATL _house;

_query = format ["housingCheckHouse:%1",_housePos];
waitUntil {!DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

["diag_log",[
			"------------- Housing Precheck -------------",
			format["Result: %1",_queryResult],
			"------------------------------------------------"
		]] call TON_fnc_logIt;


if(EQUAL(_queryResult,[])) exitWith {[[_house],"life_fnc_boughtHouse",_unit,false] call life_fnc_MP};
[[],"life_fnc_boughtHouseFail",_unit,false] call life_fnc_MP;