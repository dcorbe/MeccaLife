#include <macro.h>
/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id","_time","_amount"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_time = [_this,1,15] call BIS_fnc_param;
_vigi = [_this,2,false,[false]] call BIS_fnc_param;

if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(!((side _unit) in [civilian,independent])) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid
if(_time < 1) exitwith {}; //Not Valid


_uid = getPlayerUID _unit;
_list = wantedList;

{
	if (EQUAL(_uid, SEL(_x,0))) then {
		_amount = SEL(_x,3);
	};
} forEach _list;


diag_log format["amount :%1 vigilante: %2",_amount,_vigi];
if (_vigi && ((_amount < 75000) || !finite _amount)) exitWith {hint "You can only arrest players with a bounty larger than $75,000! Please let this player go."; [_unit] call life_fnc_unrestrain;};

[[getPlayerUID _unit,_unit,player,false],"life_fnc_wantedBounty",false,false] call life_fnc_MP;



if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[[_unit,false,_time],"life_fnc_jail",_unit,false] spawn life_fnc_MP;
[[0,format[(localize "STR_NOTF_Arrested_1"), _unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;