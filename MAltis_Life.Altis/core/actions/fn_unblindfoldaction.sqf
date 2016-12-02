/*
	Author: Murali
	
	Description:
	Blindfolds the target
*/
private["_unit"];
_unit = cursorTarget;
[[player], "life_fnc_copUnblindfold", cursortarget, false] call life_fnc_MP;