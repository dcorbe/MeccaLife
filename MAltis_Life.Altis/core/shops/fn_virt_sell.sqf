#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by worldtrade1101
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_price = lbValue[2402,(lbCurSel 2402)];


_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (ITEM_VALUE(_type))) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

_price = (_price * _amount);
_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");

if(([false,_type,_amount] call life_fnc_handleInv)) then
{
	hint format[localize "STR_Shop_Virt_SellItem",_amount,(localize _name),[_price] call life_fnc_numberText];
	life_cash = life_cash + _price;
	[] call life_fnc_virt_update;
	
};
[[0,player,life_shop_type,_amount,_price,_type],"TON_fnc_Ajustprices",false,false] spawn life_fnc_MP;

if(EQUAL(life_shop_type,"drugdealer")) then {
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TON_fnc_index;
	if(!(EQUAL(_ind,-1))) then {
		_val = SEL(SEL(_array,_ind),2);
		ADD(_val,_price);
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	} else {
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
	};
};
/* commented out for performance
[0] call SOCK_fnc_updatePartial;
if (playerSide != west) then {
	[3] call SOCK_fnc_updatePartial;
};
*/