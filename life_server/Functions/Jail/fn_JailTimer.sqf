/*
	file: fn_JailTimer.sqf
*/

private["_player", "_playeruid", "_query", "_injail", "_queryResult"];

_player = _this select 0;
_playeruid = _this select 1;

_player = owner _player;

_query = format["updateJailTime:%1", _playeruid];
waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;

_query = format["freedPlayers:%1", _playeruid];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;