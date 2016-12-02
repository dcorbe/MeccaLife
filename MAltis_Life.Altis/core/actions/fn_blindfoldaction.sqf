/*
	Author: Murali
	
	Description:
	Blindfolds the target
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
[[player], "life_fnc_copBlindfold", _unit, false] call life_fnc_MP;