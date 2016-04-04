_p1 = [_this,0,-1] call BIS_fnc_param;
_p2 = [_this,1,-1] call BIS_fnc_param;
_p3 = [_this,2,-1] call BIS_fnc_param;
//#######################################
_ret = 0;
if(_p1 == 0) then
{
	[[AS_GANG_zones],"life_fnc_AS_GANG_receive",_p2,false] spawn life_fnc_mp;
};
//#######################################