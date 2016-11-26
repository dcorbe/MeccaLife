#include "\life_server\script_macros.hpp"
/*
	File: fn_updateUpgrades.sqf
	Author: Derek
	
	Description:
	Upgrades the vehicle in the database.
*/
private["_vehicle","_plate","_uid","_query","_sql","_dbInfo","_thread","_insurance","_hooks","_gps","_trunk","_security"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
/*_gps = [_this,1,false] call BIS_fnc_param;
_security = [_this,2,false] call BIS_fnc_param;
_trunk = [_this,3,0] call BIS_fnc_param;
_insurance = [_this,4,0] call BIS_fnc_param;
_hooks = [_this,5,false] call BIS_fnc_param;
_uid = [_this,6,-1] call BIS_fnc_param;
_plate = [_this,7,-1] call BIS_fnc_param;*/
if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
	["diag_log",[
			"------------- UpdateCar Upgrades Request -------------",
			format["Car: %1",_vehicle],
			"------------------------------------------------"
		]] call TON_fnc_logIt;
};
hint str _vehicle;
if(isNull _vehicle) exitWith {}; //NULL

_dbInfo = _vehicle getVariable["dbInfo",[]];
if(count _dbInfo == 0) exitWith {};
_uid = _dbInfo select 0;
_plate = _dbInfo select 1;
_insurance = _vehicle getVariable["insurance",0];
_gps = _vehicle getVariable["gps",false];
_hooks = _vehicle getVariable["hooks",false];
_trunk = _vehicle getVariable["trunklevel",0];
_security = _vehicle getVariable["security",false];

_gps = [_gps, 0] call DB_fnc_bool;
_security = [_security, 0] call DB_fnc_bool;
_hooks = [_hooks, 0] call DB_fnc_bool;

_query = format["updateCarUpgrades:1:%1:%2:%3:%4:%5:%6:%7",_gps,_security,_trunk,_insurance,_hooks,_uid,_plate];

if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
	["diag_log",[
		"------------- UpdateCar Upgrades Request -------------",
		format["QUERY: %1",_query],
		"------------------------------------------------"
	]] call TON_fnc_logIt;
};

waitUntil {!DB_Async_Active};
_thread = [_query,1] call DB_fnc_asyncCall;