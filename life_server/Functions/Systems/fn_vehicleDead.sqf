/*
	File: fn_vehicleDead.sqf
	
	Description:
	Tells the database that this vehicle has died and can't be recovered.
*/
private["_vehicle","_plate","_uid","_query","_sql","_dbInfo","_thread","_insurance"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint str _vehicle;
if(isNull _vehicle) exitWith {}; //NULL

_dbInfo = _vehicle getVariable["dbInfo",[]];
if(count _dbInfo == 0) exitWith {};
_uid = _dbInfo select 0;
_plate = _dbInfo select 1;
_insurance = _vehicle getVariable["insurance",0];
switch (_insurance) do
{
	case 1:
	{
		_query = format["updateCarUpgrades:0:0:0:0:0:0:%1:%2",_uid,_plate];
	};
	case 2:
	{
		_query = format["removeInsurance:%1:%2",_uid,_plate];
	};
	case 3:
	{
		_query = format["removeInsurance:%1:%2",_uid,_plate];
	};
	default
	{
		_query = format["vehicleDead:0:%1:%2",_uid,_plate];
	};
};
waitUntil {!DB_Async_Active};
_thread = [_query,1] call DB_fnc_asyncCall;

["diag_log",[
		"------------- Vehicle Dead Request -------------",
		format["QUERY: %1",_query],
		"-------------------------------------------------"
	]] call TON_fnc_logIt;


sleep (1.3 * 60);
if(!isNil "_vehicle" && {!isNull _vehicle}) then {
	deleteVehicle _vehicle;
};