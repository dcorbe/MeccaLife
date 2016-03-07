_pid = _this select 0;

_players = [];
{
	if (isPlayer _x) then {
		_players pushBack [_x,getPlayerUID _x];
	};
} forEach playableUnits;
_obj = objNull;
{
	if ((_x select 1) == _pid) then {_obj = _x select 0;};
} forEach _players;

_obj;