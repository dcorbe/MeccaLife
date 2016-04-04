sleep 5;
[[0,player],"TON_fnc_AS_GANG_getValue",false,false] spawn life_fnc_mp;
AS_GANG_go = false;waitUntil {AS_GANG_go};
_gangZones = AS_GANG_cZones;
_as_gang_curZone = [0,0,0,0,0,0,0,0,0.01];
{
	if ((_x select 8) == (group player)) then {_as_gang_curZone = _x;};
} forEach _gangZones;
AS_GANG_process = _as_gang_curZone select 5;
AS_GANG_question =
{
	_player = _this select 0;
	_ans = [format ["%1 has asked you to start a gang war"],"Start Gang War","Yes, start a gang war","No"] call BIS_fnc_guiMessage;
	[[_ans],"life_AS_GANG_answer",_player,false] spawn life_fnc_mp;
};