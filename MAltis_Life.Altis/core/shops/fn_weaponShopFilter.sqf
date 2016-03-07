#include <macro.h>
/*
	File: fn_weaponShopFilter.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Applies the filter selected and changes the list.
*/
private["_bool","_list","_index","_config","_priceTag","_var","_varValue","_control","_selection","_list","_filter","_pic","_details"];
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_shop = uiNamespace getVariable ["Weapon_Shop",""];
if(_index == -1 OR _shop == "") exitWith {systemChat "Bad Data Filter"; closeDialog 0;}; //Bad data passing.

uiNamespace setVariable["Weapon_Shop_Filter",_index];
//Setup List Control & Purge it.

_priceTag = ((findDisplay 38400) displayCtrl 38404);
_priceTag ctrlSetStructuredText parseText "";
_list = ((findDisplay 38400) displayCtrl 38403);
lbClear _list;

switch (_index) do
{
	case 0:
	{
		_config = M_CONFIG(getArray,"WeaponShops",_shop,"items");
		{
			_className = SEL(_x,0);
			_displayName = SEL(_x,1);
			_price = SEL(_x,2);
			_dataPoint = SEL(_x,3);
			_varName = SEL(_dataPoint,0);
			_varType = SEL(_dataPoint,1);
			_varValue = SEL(_dataPoint,2);
			_details = [_className] call life_fnc_fetchCfgDetails;
			_pic = SEL(_details,2);
			if(!(EQUAL(_varName,""))) then {
				_var = GVAR_MNS _varName;
				if(typeName _var == typeName {}) then {_var = FETCH_CONST(_var);};
				_bool = switch(_varType) do {
					case (typeName 0): {_var >= _varValue};
					case (typeName true): {_var};
					default {EQUAL(_var,_varValue)};
				};
			} else {
				_bool = true;
			};
			if(_bool && {!isNil "_details"}) then {
				if(EQUAL(_displayName,"")) then {
					_list lbAdd format ["%1",(SEL(_details,1))];
				} else {
					_list lbAdd format ["%1",_displayName];
				};
				
				_list lbSetData [(lbSize _list)-1,_className];
				_list lbSetValue [(lbSize _list)-1,_price];
				_list lbSetPicture [(lbSize _list)-1,_pic];
			};
		} foreach (_config);
		
		((findDisplay 38400) displayCtrl 38405) ctrlSetText localize "STR_Global_Buy";
	};
	
	case 1:
	{
		private["_listedItems"];
		_config = [];
		_listedItems = [];
		//Go through weapons
		if(primaryWeapon player != "") then {_config pushBack primaryWeapon player;};
		if(secondaryWeapon player != "") then {_config pushBack secondaryWeapon player;};
		if(handgunWeapon player != "") then {_config pushBack handgunWeapon player;};
		
		//Go through items
		_config = _config + primaryWeaponItems player;
		_config = _config + (assignedItems player);
		_config = _config + (uniformItems player);
		_config = _config + (vestItems player);
		_config = _config + (backPackItems player);
		
		((findDisplay 38400) displayCtrl 38405) ctrlSetText localize "STR_Global_Sell";
		{
			if(!(_x in _listedItems) && _x != "") then
			{
				_itemInfo = [_x] call life_fnc_fetchCfgDetails;
				_listedItems pushBack _x;
				
				_itemCount = {_x == (_itemInfo select 0)} count _config;
				if(_itemCount > 1) then
				{
					_list lbAdd format["[%2] %1",_itemInfo select 1,_itemCount];
				}
					else
				{
					_list lbAdd format["%1",_itemInfo select 1];
				};
				_list lbSetData[(lbSize _list)-1,_itemInfo select 0];
				_list lbSetPicture[(lbSize _list)-1,_itemInfo select 2];
			};
		} foreach _config;
	};
};

if(isNil {_this select 0}) then {_list lbSetCurSel 0;};