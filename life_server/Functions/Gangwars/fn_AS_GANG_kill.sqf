	_toAdd = _this select 0;
	_dead = _this select 1;
	_killer = _this select 2;
	_player = _this select 3;
	if (isNil "AS_GANG_fight") then {AS_GANG_fight = false;publicVariable "AS_GANG_fight";};
	if (!AS_GANG_fight) exitWith {};
	if (_toAdd in (units AS_GANG_faction1) AND _dead in (units AS_GANG_faction2) AND (_killer distance AS_GANG_region_pos <= AS_GANG_region_x) AND (_killer distance AS_GANG_region_pos <= AS_GANG_region_y) AND (_player distance AS_GANG_region_pos <= AS_GANG_region_x) AND (_player distance AS_GANG_region_pos <= AS_GANG_region_y)) then {AS_GANG_killsTeam1 = AS_GANG_killsTeam1 + 1;};
	if (_toAdd in (units AS_GANG_faction2) AND _dead in (units AS_GANG_faction1) AND (_killer distance AS_GANG_region_pos <= AS_GANG_region_x) AND (_killer distance AS_GANG_region_pos <= AS_GANG_region_y) AND (_player distance AS_GANG_region_pos <= AS_GANG_region_x) AND (_player distance AS_GANG_region_pos <= AS_GANG_region_y)) then {AS_GANG_killsTeam2 = AS_GANG_killsTeam2 + 1;};