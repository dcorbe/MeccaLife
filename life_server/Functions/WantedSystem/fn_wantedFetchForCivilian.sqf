#include "\life_server\script_macros.hpp"
/*
       fn_wantedFetchForCivilian.sqf
*/
private["_updateBounty","_uid","_result","_queryResult"];

_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

/*_result = format["wantedFetchForCivilian:%1",(getPlayerUID _player)];
waitUntil{!DB_Async_Active};
_queryResult = [_result,2] call DB_fnc_asyncCall;

_updateBounty = _queryResult select 0;
*/
_uid = getPlayerUID _player;
_list = missionNamespace getVariable "wantedList";

{
	if (EQUAL(_uid, SEL(_x,0))) then {
		_updateBounty = SEL(_x,3);
	};
} forEach _list;


if(isNil "_updateBounty") then {_updateBounty = 0};

[[_updateBounty],"life_fnc_updateBounty",owner _player,false] spawn life_fnc_MP;