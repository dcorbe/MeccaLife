#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	File: fn_gangDemote.sqf
	
	Description:
	Something about being a quitter.
*/
private["_unit","_unitID","_members","_action","_index","_unitRank"];
disableSerialization;

if(EQUAL((lbCurSel 2621),-1)) exitWith {hint localize "STR_GNOTF_TransferSelect"};
_unit = call compile format["%1",CONTROL_DATA(2621)];
_unitID = _unit select 0;
_unitRank = _unit select 2;

if (life_gangrank < 3) exitWith {};
if (_unitRank < 2) exitWith {hint "You cannot demote someone who is at the lowest rank!";};
if(_unitID == getPlayerUID player) exitWith {hint localize "STR_GNOTF_TransferSelf"};

if (life_gangrank > _unitRank) then {
	{
		if (SEL(_x,0) == _unitID) then {
			_x set [2,_unitRank - 1];
			life_gangmembers set [_foreachindex, _x];
		};
	} foreach life_gangmembers;
	[[life_gangid,-1,-1,life_gangmembers],"life_fnc_updateGangInfo",true,false] spawn life_fnc_MP;
	hint format["You have demoted %1 to rank %2.",_unit select 1, _unitRank - 1];
} else {
    hint "You cannot demote someone that is your rank or a rank higher than your own!";  
};
[] call life_fnc_gangMenu;