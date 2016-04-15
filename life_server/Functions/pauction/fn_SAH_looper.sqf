sleep 1;
SAH_offers = [];
while {true} do
{
	sleep 1;
	_players = [];
	{
		if (isPlayer _x) then {
			_players pushBack [_x,getPlayerUID _x];
		};
	} forEach playableUnits;
	{
		_isOn = false;
		_curOffer = _x;
		{
			if ((_x select 1) == (_curOffer select 0)) then {_isOn = true;};
		} forEach _players;
		if (!_isOn) then {
			_index = -1;
			_handled = false;
			{
				_index = _index + 1;
				if (_x isEqualTo _curOffer AND !_handled) then {SAH_offers deleteAt _index;_handled = true;};
			} forEach SAH_offers;
		};
	} forEach SAH_offers;
};