#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Deposits money into the players gang bank.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > life_gangbank) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};
if(life_gangrank <5)exitWith {hint localize "STR_NOTF_Notrank"};
SUB(life_gangbank,_value);
ADD(BANK,_value);


hint format[localize "STR_ATM_WithdrawGang",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync

[[life_gangid,-1,life_gangbank,[]],"life_fnc_updateGangInfo",true,false] spawn life_fnc_MP;
