#include <macro.h>
/*
	File: fn_virt_updateEconomy.sqf
	Author: Worldtrade1101
	Edited by: Derek
	Base on Tonic script
	Description:
	Update and fill the Economy gui menu.
*/
private["_display","_achatliste","_gear_list","_shop_data","_name","_price","_market"];
disableSerialization;

//Setup control vars.
_display = findDisplay 39000;
_goodlist = _display displayCtrl 39001;
//_achatliste = _display displayCtrl 39003;

//Purge list
lbClear _goodlist;
//lbClear _venteliste;

_type= [_this,0,0,[0]] call BIS_fnc_param;
life_market = [_this,1,[],[[]]] call BIS_fnc_param;

if (count life_market == 0 ) exitwith {};

_goodlist lbAdd format["------------Illegal Goods------------"];
_goodlist lbSetValue [(lbSize _goodlist)-1,1.5];
_goodlist lbAdd format["--------Natural Resources--------"];
_goodlist lbSetValue [(lbSize _goodlist)-1,2.9];
_goodlist lbAdd format["-----Hunting and Gathering-----"];
_goodlist lbSetValue [(lbSize _goodlist)-1,3.5];

{
	if ((_x select 2) > 1 ) then {
		_name = ITEM_NAME(SEL(_x,0));
		_goodlist lbAdd format["%1",(localize _name)];
		_goodlist lbSetData [(lbSize _goodlist)-1,_x select 0];
		_goodlist lbSetValue [(lbSize _goodlist)-1,_x select 6];
	
	};
} foreach life_market;


lbSortByValue _goodlist;