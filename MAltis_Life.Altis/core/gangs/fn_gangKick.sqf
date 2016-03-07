#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours...
*/
private["_unit","_unitID","_members","_unitRank","_isLeader"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint localize "STR_GNOTF_SelectKick"};
_unit = call compile format["%1",CONTROL_DATA(2621)];
//if(isNull _unit) exitWith {}; //Bad unit?

_unitID = _unit select 0;

if(_unitID == getPlayerUID player) exitWith {hint localize "STR_GNOTF_KickSelf"};
_isLeader = false;
{
	if(_x select 0 == _unitID) then {
		if(_x select 2 > 3) then {
			_isLeader = true;	
		};
	};
} forEach life_gangmembers;
if(_isLeader) exitWith {hint "You cannot kick anyone rank 4 or higher!"};
_members = life_gangmembers;
if(isNil "_members") exitWith {};
if(!(EQUAL(typeName _members,"ARRAY"))) exitWith {};

{
	_uid = _x select 0;
	if (str(_uid) == str(_unitID)) then {
		_members set [_forEachIndex, -1];
	};
} forEach _members;

SUB(_members,[-1]);

life_gangmembers = _members;

{
	if (_unitID == getPlayerUID _x) then {
		[[life_gangid],"life_fnc_updateGangHouse",_x,false] call life_fnc_MP;
		[[_x],"TON_fnc_clientGangKick",_x,false] call life_fnc_MP; //Boot that bitch!	
	};
} forEach playableUnits;

[[life_gangid,-1,-1,life_gangmembers],"life_fnc_updateGangInfo",true,false] spawn life_fnc_MP;
[] call life_fnc_gangMenu;