/*
	File: fn_prisionbreak.sqf
*/
private["_unit","_obj","_handle"];
_unit = lbData[8101,(lbCurSel 8101)];
_obj = objNull;
{
	_temp = format["%1", _x];
	if(_temp == _unit) exitWith {
		_obj = _x;
	};
} forEach nearestObjects [getMarkerPos "jail_marker",["Man"],15]; 
// 15 = distance from jail_marker
// this adds all the prisioners around the jail_marker within 15 meters

playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
[[4, format["%1 is hacking into Mecca Central Criminal Database [M.C.C.D] to break prisoners out of the jail!", name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

[_obj] spawn life_fnc_progressBaren;