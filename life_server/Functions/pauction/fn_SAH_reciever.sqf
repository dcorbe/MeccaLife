_mode = [_this,0,-1] call BIS_FNC_PARAM;
_info = [_this,1,-1] call BIS_FNC_PARAM;

if (isNil "SAH_offers") then {SAH_offers=[];};

switch (_mode) do
{
	case 0:
	{
		[[2,SAH_offers],"life_fnc_CAH_reciever",_info,false] spawn life_fnc_mp;
	};
	case 1:
	{
		{ SAH_offers pushBack _x; } forEach _info;
	};
};