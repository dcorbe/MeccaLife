#include "\life_server\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the storage for a house blah blah
*/
private["_house","_houseID","_trunkData","_query"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};

_trunkData = _house getVariable["Trunk",[[],0]];
_houseID = _house getVariable["house_id",-1];

_query = format["housingUpdateInventory:%1:%2",_trunkData,_houseID];

if(EQUAL(_houseID,-1)) then {
	_housePos = getPosATL _house;
	_query = format["housingUpdateInventory2:%1:%2",_trunkData,_housePos];
	
} else {
	_query = format["housingUpdateInventory:%1:%2",_trunkData,_houseID];
};



waitUntil{!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;