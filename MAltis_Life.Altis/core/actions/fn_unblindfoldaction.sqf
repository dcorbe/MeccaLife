/*
	Author: Murali
	
	Description:
	Unblindfolds the target
*/
private["_unit"];
_unit = cursorTarget;
[[player], "life_fnc_copUnblindfold", _unit, false] call life_fnc_MP;