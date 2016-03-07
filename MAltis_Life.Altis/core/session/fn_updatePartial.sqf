#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through life_fnc_MP
	
	File: fn_updatePartial.sqf
*/
private["_mode","_packet","_array","_flag"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_packet = [steamid,playerSide,nil,_mode];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
if (!(finite BANK)) exitWith {hint "Please go to lobby and come back, your bank account is bugged!";};
if (!(finite CASH)) exitWith {hint "Please go to lobby and come back, your cash is bugged!";};

switch(_mode) do {
	case 0: {
		_packet set[2,CASH];
	};
	
	case 1: {
		_packet set[2,BANK];
	};
	
	case 2: {
		{
			_varName = LICENSE_VARNAME(configName _x,_flag);
			_array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
		} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));
		
		_packet set[2,_array];
	};
	
	case 3: {
		[] call life_fnc_saveGear;
		life_copgear = life_gear;
		_packet set[2,life_gear];
	};
	
	case 4: {
		_packet set[2, life_is_alive];
	};
	
	case 5: {
		_packet set[2,life_is_arrested];
	};
	
	case 6: {
		_packet set[2,CASH];
		_packet set[4,BANK];
	};
	
	case 7: {
		_packet set[2,[]];	
		_packet set[3,3];
	};
};

diag_log format ["------------------Update Partial-----------------"];
diag_log format ["Packet: %1",_packet];
diag_log format ["SteamID: %1", steamid];
diag_log format ["Playerside: %1",playerSide];
diag_log format ["Mode: %1", _mode];

[[_packet],"DB_fnc_updatePartial",false,false] spawn life_fnc_MP;