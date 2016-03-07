#include <macro.h>
/*
File: fn_retrievePrices.sqf
Author: Derek

Description:
Send a query to retrieve the price of stuff on the server
*/
private["_type","_side","_data","_unit","_ret","_tickTime","_queryResult","_market","_shoptype","_priceArray"];
_type = [_this,0,0,[0]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_data= [_this,2,"",[""]] call BIS_fnc_param;


//Error checks

diag_log format ["%1   %2    %3",_unit,_type,_data];
if( (_data == "") OR (isNull _unit)) exitWith
{

diag_log "data ou type ou unit null";

};

_unit = owner _unit;

_market = missionNamespace getVariable "MeccaMarketPrices";

_itemArray = [];
_factor = [];
_shoptype = [];
_shoptype pushBack _data;

_query = switch (_data) do {


case "market" :{
    _shoptype pushBack "civ";
};

case "rebel" :{ 
    _shoptype pushBack "market";
    _shoptype pushBack "vigilante";
    _shoptype pushBack "special";
    _shoptype pushBack "civ";
};

case "cop" :{ 
    _shoptype pushBack "market";
    _shoptype pushBack "coffee";
    _shoptype pushBack "special";
};

case "gang" :{ 
    _shoptype pushBack "rebel";
    _shoptype pushBack "market";
    _shoptype pushBack "special";
    _shoptype pushBack "civ";
};    
case "economy" :{ 
    _factor = [2,3,4];
};
case "vigilante" :{ 
    _shoptype pushBack "market";
    _shoptype pushBack "civ";
};
default {""};
};

{
    _name = SEL(_x,0);
    _fact = SEL(_x,1);
    _shop = SEL(_x,2);
    if ((_fact in _factor) or (_shop in _shoptype)) then {
        _name = format["%1MeccaMarketGoodPrice",SEL(_x,0)];
        _priceArray = missionNamespace getVariable (_name);
        _itemArray pushBack _priceArray;
    };
} forEach _market;



if (_data == "economy") exitwith {[_type,_itemArray] spawn life_fnc_virt_updateEconomy};

[_type,_itemArray] spawn life_fnc_virt_updatePrice;