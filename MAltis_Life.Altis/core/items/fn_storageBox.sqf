#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tries to place a storage box in the nearest house.
*/
private["_boxType","_house","_positions","_containers","_pos","_houseCfg"];
_boxType = _this select 0;

_house = nearestBuilding (getPosATL player);
if(!(_house in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse"};
_containers = _house getVariable["containers",[]];
_houseCfg = M_CONFIG(getNumber,"Houses",typeOf(_house),"maxStorage");
if(_houseCfg == 0) exitWith {}; //What the fuck just happened?

_boxClass = switch(_boxType) do {
	case "storagesmall": {"Box_IND_Grenades_F";};
	case "storagebig": {"B_supplyCrate_F";};
	default {""};
};
if(_boxClass == "") exitWith {};

_full = false;
_boxWasInstalled = false;
if (isNil {cursorTarget getVariable "content"}) then {} else {
	_content = cursorTarget getVariable "content";
	_boxes = 0;
	{
		if (_x select 0 == "B_supplyCrate_F") then {_boxes = _boxes + 1;};
		if (_x select 0 == "Box_IND_AmmoVeh_F") then {_boxes = _boxes + 1;};
		if (_x select 0 == "Box_IND_WpsSpecial_F") then {_boxes = _boxes + 1;};
		if (_x select 0 == "Box_IND_Grenades_F") then {_boxes = _boxes + 1;};
	} forEach _content;

	if (_boxes<_houseCfg) then {
		_content pushBack [_boxClass,1];
		_house setVariable ["content",_content,true];
		_full = false;
	} else {
		_full = true;
	};
};

if (!_full) then {
	hint "You placed a storage crate!";
	[false,_boxType,1] call life_fnc_handleInv;
	[[_house],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
} else {
	hint localize "STR_ISTR_Box_HouseFull";
};
