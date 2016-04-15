#include "\life_server\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches all the players houses and sets them up.
*/
private["_query","_houses","_gang","_gangid","_containers"];
if(_this == "") exitWith {};

_gang = missionNamespace getVariable[format["gang_%1",_this],[]];
if (count _gang > 0) then {
	_gangid = _gang select 0;
} else {
	_gangid = -1;
};

_query = format["housingFetchPlayerHouse:%1:%2",_this,_gangid];
waitUntil{!DB_Async_Active};
_houses = [_query,2,true] call DB_fnc_asyncCall;
if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
	["diag_log",[
			"------------- housingFetchPlayerHouse Request -------------",
			format["QUERY: %1",_query],
			format["Result: %1",_houses],
			"-------------------------------------------------"
		]] call TON_fnc_logIt;
};



_return = [];
{
	_pos = call compile format["%1",_x select 1];
	_house = nearestBuilding _pos;
	if (typeOf _house == "Land_i_Shed_Ind_F") then {
		_containers = _house getVariable["containers",[]];
	} else {
		_house allowDamage false;
		_containers = [];
		_content = [];
		_house setVariable["slots",[],true];
		_convert = false;
		_containerData = _x select 3;
		if (count _containerData > 0) then {
			if (typeName (_containerData select 0 select 1) == "ARRAY") then { _convert = true; };
		};
		_trunk = _x select 2;
		_house setVariable["Trunk",_trunk,true];
		if (_convert) then
		{
			{
				_className = _x select 0;
				_weapons = (_x select 1) select 0; // [[`Binocular`],[1]]
				_magazines = (_x select 1) select 1; // [[`Chemlight_yellow`],[1]]
				_items = (_x select 1) select 2;
				_backpacks = (_x select 1) select 3;
	
				_content pushBack [_className,1];
	
				_index = -1;
				{
					_index = _index + 1;
					_itemName = _x;
					_itemAmount = (_weapons select 1) select _index;
					_wasInArray = false;
					_index2 = -1;
					{
						_wasInArray = false;
						_index2 = _index2 + 1;
						if (_x select 0 == _itemName) then {
							_wasInArray = true;
							_content set [_index2,[_itemName,((_content select _index2) select 1)+_itemAmount]];
						};
					} forEach _content;
					if (!_wasInArray) then {
						_content set [count _content,[_itemName,_itemAmount]];
					};
				} forEach (_weapons select 0);
	
				_index = -1;
				{
					_index = _index + 1;
					_itemName = _x;
					_itemAmount = (_magazines select 1) select _index;
					_wasInArray = false;
					_index2 = -1;
					{
						_wasInArray = false;
						_index2 = _index2 + 1;
						if (_x select 0 == _itemName) then {
							_wasInArray = true;
							_content set [_index2,[_itemName,((_content select _index2) select 1)+_itemAmount]];
						};
					} forEach _content;
					if (!_wasInArray) then {
						_content set [count _content,[_itemName,_itemAmount]];
					};
				} forEach (_magazines select 0);
	
				_index = -1;
				{
					_index = _index + 1;
					_itemName = _x;
					_itemAmount = (_items select 1) select _index;
					_wasInArray = false;
					_index2 = -1;
					{
						_wasInArray = false;
						_index2 = _index2 + 1;
						if (_x select 0 == _itemName) then {
							_wasInArray = true;
							_content set [_index2,[_itemName,((_content select _index2) select 1)+_itemAmount]];
						};
					} forEach _content;
					if (!_wasInArray) then {
						_content set [count _content,[_itemName,_itemAmount]];
					};
				} forEach (_items select 0);
	
				_index = -1;
				{
					_index = _index + 1;
					_itemName = _x;
					_itemAmount = (_backpacks select 1) select _index;
					_wasInArray = false;
					_index2 = -1;
					{
						_wasInArray = false;
						_index2 = _index2 + 1;
						if (_x select 0 == _itemName) then {
							_wasInArray = true;
							_content set [_index2,[_itemName,((_content select _index2) select 1)+_itemAmount]];
						};
					} forEach _content;
					if (!_wasInArray) then {
						_content set [count _content,[_itemName,_itemAmount]];
					};
				} forEach (_backpacks select 0);
			} forEach _containerData;
		} else {
			_content = _containerData;
		};
		
		_house setVariable["containers",_containers,true];
		_house setVariable ["content", _content,true];
	};
	_return pushBack [_x select 1,_containers];
} foreach _houses;

missionNamespace setVariable[format["houses_%1",_this],_return];