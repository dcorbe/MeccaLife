/*
    File: fn_toggleInvisible.sqf
    Author: Derek Benson

    Description:
    Toggles the invisibility of the object and returns the state

*/
private["_unit","_isinvisible"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_isinvisible = [_this,1,false,[false]] call BIS_fnc_param;

if (_isinvisible) exitWith{_unit hideObjectGlobal false; false;};
if (!_isinvisible) exitWith {_unit hideObjectGlobal true; true;};