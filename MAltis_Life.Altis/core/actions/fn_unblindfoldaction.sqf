/*
	Author: Murali
	
	Description:
	Unblindfolds the target
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
[[player], "life_fnc_copUnblindfold", _unit, false] call life_fnc_MP;