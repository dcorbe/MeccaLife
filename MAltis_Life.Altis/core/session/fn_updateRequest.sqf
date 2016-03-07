#include <macro.h>
/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag"];
last_known_position = getPos player;
diag_log format ["last known position recorded as %1",last_known_position];
if (!(finite BANK)) exitWith {hint "Please go to lobby and come back, your bank account is bugged!";};
if (!(finite CASH)) exitWith {hint "Please go to lobby and come back, your cash is bugged!";};
_packet = [getPlayerUID player,(profileName),playerSide,CASH,BANK];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};

{
	_varName = LICENSE_VARNAME(configName _x,_flag);
	_array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

_packet pushBack _array;

[] call life_fnc_saveGear;
_packet pushBack life_gear;
switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
	};
};

/* Save position and life status */
_packet pushBack last_known_position;
_packet pushBack life_is_alive;

diag_log format["_packet: %1",_packet];
[_packet,"DB_fnc_updateRequest",false,false] call life_fnc_MP;