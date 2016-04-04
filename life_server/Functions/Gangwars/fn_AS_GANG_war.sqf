AS_GANG_faction1 = _this select 0;
AS_GANG_faction2 = _this select 1;
AS_GANG_region   = _this select 2;
AS_GANG_fight = true;publicVariable "AS_GANG_fight";
{
	 if ((_x select 1) == AS_GANG_region) then {AS_GANG_region_pos = _x select 0;AS_GANG_region_x = _x select 2;AS_GANG_region_y = _x select 3;AS_GANG_region_time = _x select 6;};
} forEach AS_GANG_zones;
AS_GANG_killsTeam1 = 0;
AS_GANG_killsTeam2 = 0;
_time = 0;
while {_time < (AS_GANG_region_time*60)} do {_time = _time + 4;AS_GANG_region setMarkerColor "ColorRed";sleep 2;AS_GANG_region setMarkerColor "ColorGrey";sleep 2};
AS_GANG_region setMarkerColor "ColorRed";
// Game End

_winner = objNull;
_loser = objNull;
if (AS_GANG_killsTeam1 > AS_GANG_killsTeam2) then {_winner = (units AS_GANG_faction1) select 0;_loser = (units AS_GANG_faction2) select 0;};
if (AS_GANG_killsTeam2 > AS_GANG_killsTeam1) then {_winner = (units AS_GANG_faction2) select 0;_loser = (units AS_GANG_faction1) select 0;};
if (AS_GANG_killsTeam2 == AS_GANG_killsTeam1) then {_winner = (units AS_GANG_faction2) select 0;_loser = (units AS_GANG_faction1) select 0;};

[[1,format ["A gang war has just ended! The region %1 has been captured by the gang of %2",AS_GANG_region,name _winner]],"life_fnc_broadcast",true,false] spawn life_fnc_mp;
[AS_GANG_region,group _winner] spawn TON_fnc_AS_GANG_takeTerr;
sleep 0.1;
AS_GANG_fight = false;publicVariable "AS_GANG_fight";
sleep 1800;
_name = AS_GANG_region;
_toSelect = [];
_index = -1;
{
	_index = _index + 1;
	if ((_x select 1) isEqualTo _name) exitWith {_toSelect = _x;};
} forEach AS_GANG_zones;
AS_GANG_zones set [_index,[_toSelect select 0,_toSelect select 1,_toSelect select 2,_toSelect select 3,_toSelect select 4,_toSelect select 5,_toSelect select 6,_toSelect select 7, _toSelect select 8,false]];
AS_GANG_fight = false;publicVariable "AS_GANG_fight";

diag_log "A gangwar has ended";

{ [[_toSelect select 4],"life_fnc_AS_GANG_end"] spawn life_fnc_mp;[[],"life_fnc_AS_GANG_update"] spawn life_fnc_mp; } forEach (units (group _winner));
{ [[],"life_fnc_AS_GANG_update"] spawn life_fnc_mp; } forEach (units (group _loser));