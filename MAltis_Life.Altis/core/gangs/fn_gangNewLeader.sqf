#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	File: fn_gangNewLeader.sqf
	
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
//if(isNull _unit) exitWith {}; //Bad unit?
if(_unitID == getPlayerUID player) exitWith {hint localize "STR_GNOTF_TransferSelf"};

if (life_gangrank == 5 && _unitRank == 4) then {
	_action = [
		format[localize "STR_GNOTF_TransferMSG",_unit select 1],
		localize "STR_Gang_Transfer",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;
	
	if(_action) then {
		if(EQUAL(_unitID,"")) exitWith {hint "Bad UID?"}; //Unlikely?
		life_gangowner = _unitID;
		{
			if (SEL(_x,0) == _unitID) then {
				_x set [2,_unitRank + 1];
				life_gangmembers set [_foreachindex, _x];
			};
			if (SEL(_x,0) == steamid) then {
				_x set [2,4];
				life_gangmembers set [_foreachindex, _x];
			};
		} foreach life_gangmembers;
		[[life_gangid,life_gangowner,-1,life_gangmembers],"life_fnc_updateGangInfo",true,false] spawn life_fnc_MP;
	} else {
		hint localize "STR_GNOTF_TransferCancel";
	};
} else {
	if (life_gangrank > (_unitRank + 1)) then {
		{
			if (SEL(_x,0) == _unitID) then {
				_x set [2,_unitRank + 1];
				life_gangmembers set [_foreachindex, _x];
			};
		} foreach life_gangmembers;
    		
    	[[life_gangid,-1,-1,life_gangmembers],"life_fnc_updateGangInfo",true,false] spawn life_fnc_MP;
    	hint format["You have promoted %1 to rank %2.",_unit select 1, _unitRank + 1];
	} else {
	    hint "You cannot promote someone to your rank or a rank higher than your own.";  
	};
};
[] call life_fnc_gangMenu;