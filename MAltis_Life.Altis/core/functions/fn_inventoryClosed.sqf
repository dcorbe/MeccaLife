#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
*/
private "_container";
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {}; //MEH

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	
	if(!(_house isKindOf "House_F")) exitWith {systemChat localize "STR_House_ContainerError"};
	[[_house],"TON_fnc_updateHouseContainers",false,false] call life_fnc_MP;
};
[] call life_fnc_Uniformscolor;