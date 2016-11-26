/*
	Author: Bryan "Tonic" Boardwine

	Description:
	WHAT THE HELL DO YOU THINK IT DOES?!?!!??!?!!?!??!
*/
private["_queryResult","_query","_count","_query2","_queryresult2","_pos","_nogood","_b"];

/* Warehouses that should not be bought */
/* Heroin Processing, DP 11 Chop, DP 11 Chop, DP 8 Chop, DP 19 Chop, Sofia Chop*/
_nogood = [[8439.86,12758.9,0.132305],[8972.68,15504.6,0.681137],[8946.03,15514.5,0.131012],[5231.96,11527.9,0.394684],[19028.9,14568.4,0.213081],[24660.4,23181.1,0.308233]];
{
	_b = nearestBuilding _x;
	_b setVariable ["house_owner",["0","Unknown"],true];
} foreach _nogood;

waitUntil{!DB_Async_Active};
_count = (["housingCount",2] call DB_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	waitUntil{!DB_Async_Active};
	_query = format["housingInit:%1",_x];
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	
	/*if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
		["diag_log",[
			"------------- initHouses Request -------------",
			format["QUERY: %1",_query],
			format["Result: %1",_queryResult],
			"-------------------------------------------------"
		]] call TON_fnc_logIt;
	};*/
	diag_log format["housinginit query result: %1",_queryResult];
	if(count _queryResult == 0) exitWith {};
	{
		_pos = call compile format["%1",_x select 1];
		_house = nearestBuilding _pos;
		if (typeOf _house == "Land_i_Shed_Ind_F") then {
			_query2 = format["housingInitGang:%1",_pos];
			waitUntil{!DB_Async_Active};
			_queryResult2 = [_query2,2,false] call DB_fnc_asyncCall;
			diag_log format["housinginit gang queryresult2: %1",_queryResult2];
			if(count _queryResult2 > 0) then {
				_house setVariable["house_owner",[_queryResult2 select 0,_queryResult2 select 1],true];
			} else {
				_house setVariable["house_owner",["0","Unknown"],true];
			};
			
			_house allowDamage false;
			_containers = [];
			_house setVariable["slots",[],true];
			
			_content = [];
			_trunk = _queryResult2 select 2;
			_containerData = _queryResult2 select 3;
			_house setVariable["Trunk",_trunk,true];
			_convert = false;
			if (count _containerData > 0) then {
				if (typeName (_containerData select 0 select 1) == "ARRAY") then { _convert = true; };
			};
		
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
			
			_house setVariable ["content", _content,true];
			
		} else {
			_query2 = format["housingInitCiv:%1",_pos];
			waitUntil{!DB_Async_Active};
			_queryResult2 = [_query2,2,false] call DB_fnc_asyncCall;
			diag_log format["housinginit civ queryresult2: %1",_queryResult2];
			if(count _queryResult2 > 0) then {
				_house setVariable["house_owner",[_queryResult2 select 0,_queryResult2 select 1],true];
			} else {
				_house setVariable["house_owner",[0,"Unknown"],true];
			};
		};
		_house setVariable["house_id",_x select 0,true];
		_house setVariable["locked",true,true]; //Lock up all the stuff.
		_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
		for "_i" from 1 to _numOfDoors do {
			_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
		};
	} foreach _queryResult;
};