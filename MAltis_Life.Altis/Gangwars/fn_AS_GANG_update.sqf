[[0,player],"TON_fnc_AS_GANG_getValue",false,false] spawn life_fnc_mp;
AS_GANG_go = false;waitUntil {AS_GANG_go};
_gangZones = AS_GANG_cZones;
_as_gang_curZone = [0,0,0,0,0,0,0,0,0.01];
{
	if ((_x select 8) == (group player)) then {_as_gang_curZone = _x;};
} forEach _gangZones;
AS_GANG_process = _as_gang_curZone select 5;