_array = _this;

_index = -1;
_handled = false;
{
	_index = _index + 1;
	if (_x isEqualTo  _array AND !_handled) then {SAH_offers deleteAt _index;_handled=true;};
} forEach SAH_offers;