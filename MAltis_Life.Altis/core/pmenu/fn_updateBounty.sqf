#include <macro.h>
/*
        File: fn_updateBounty.sqf

*/
private["_val","_total","_list","_uid","_updateBounty"];

_uid = getPlayerUID player;
_list = wantedList;

{
	if (EQUAL(_uid, SEL(_x,0))) then {
		_updateBounty = SEL(_x,3);
	};
} forEach _list;


if(isNil "_updateBounty") then {_updateBounty = 0};

mecca_wanted_status = _updateBounty;