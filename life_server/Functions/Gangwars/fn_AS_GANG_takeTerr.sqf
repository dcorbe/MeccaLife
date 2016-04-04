_name = _this select 0;
_group = _this select 1;
_toSelect = [];
_index = -1;
{
	_index = _index + 1;
	if ((_x select 1) isEqualTo _name) exitWith {_toSelect = _x;};
} forEach AS_GANG_zones;
AS_GANG_zones set [_index,[_toSelect select 0,_toSelect select 1,_toSelect select 2,_toSelect select 3,_toSelect select 4,_toSelect select 5,_toSelect select 6,_toSelect select 7, _group,true]];
diag_log format ["%1 claimed region %2",_group,_name];