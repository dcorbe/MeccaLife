/*
	Author: Murali
	
	Description:
	Blindfolds the target
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
[[player], "life_fnc_copBlindfold", cursortarget, false] call life_fnc_MP;