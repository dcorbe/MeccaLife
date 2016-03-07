#include <macro.h>
/*
	Author: Derek
	
	File: fn_updateGangHouse.sqf
	
	Description:
	Adds or removes the house from all online players.
	life_houses = [[location,inventory]
*/
private["_gang_id","_gang_house","_pos","_gang_members","_sheds"];
_gang_id = [_this,0,-1,[-1]] call BIS_fnc_param;
_gang_house = [_this,1,objNull,[objNull]] call BIS_fnc_param;
if(isServer) exitWith{};

if (life_gangid != _gang_id) exitWith {};
if ({_position = call compile format["%1",_x select 0]; _b = nearestBuilding _position; typeOf _b == "Land_i_Shed_Ind_F"}count life_houses > 0) then {
    _sheds = [];
    {
        _position = call compile format["%1",_x select 0];
        _b = nearestBuilding _position;
        if (typeOf _b == "Land_i_Shed_Ind_F") then {
            _sheds pushBack _b;
            life_houses set [_foreachindex, -1];
    	    deleteMarkerLocal format["house_%1",_b getVariable "uid"];
        };
    }foreach life_houses;
    SUB(life_houses,[-1]);
    {
        if(_x in _sheds) then {
            life_vehicles set [_foreachindex, -1];
        };
    }foreach life_vehicles;
    SUB(life_vehicles,[-1]);
};
if (!(isNull _gang_house)) then {
    life_vehicles pushBack _gang_house;
    _pos = getPosATL _gang_house;
    life_houses pushBack [str(_pos), _gang_house getVariable["containers",[]]];
    _house = _gang_house;
    _marker = createMarkerLocal [format["house_%1",(_house GVAR "uid")],getPosATL _house];
    _houseName = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _house), "displayName");
    _marker setMarkerTextLocal _houseName;
    _marker setMarkerColorLocal "ColorBlue";
    _marker setMarkerTypeLocal "loc_Lighthouse";
};