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
	_oldPrice = _price;
	_tax = false;
	_toSelect = ((life_capture_list) select 0);	
	switch (_type) do {
    case "cocaine_processed": {_toSelect = ((life_capture_list) select 1);_tax = true;_price = round (_price * 0.95);
		if(_tax) then {
			_taxed = round (_oldPrice - _price);
			if(_taxed < 1) exitWith {};
			systemChat format["A tax of %1 was taken by the owners of %2",_taxed,(_toSelect select 0)];
			life_tax = life_tax + _taxed;
			if(life_tax == _taxed) then {
				[_toSelect select 0] spawn {
					waitUntil{!dialog};
					[[5,nil,(_this select 0),life_tax],"TON_fnc_updateGang",(false),false] spawn life_fnc_MP;
					life_tax = 0;
				};
			};
		};   
	};
	 case "heroin_processed": {	_toSelect = ((life_capture_list) select 3);	_tax = true;_price = round (_price * 0.95);
		if(_tax) then {
			_taxed = round (_oldPrice - _price);
			if(_taxed < 1) exitWith {};
			systemChat format["A tax of %1 was taken by the owners of %2",_taxed,(_toSelect select 0)];
			life_tax = life_tax + _taxed;
			if(life_tax == _taxed) then {
				[_toSelect select 0] spawn {
					waitUntil{!dialog};
					[[5,nil,(_this select 0),life_tax],"TON_fnc_updateGang",(false),false] spawn life_fnc_MP;
					life_tax = 0;
				};
			};
		}; 
	};
    
	
	
	
	
	default { hint "Failure" };
	
};
	
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