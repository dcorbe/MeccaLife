#include <macro.h>
/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the vehicle for illegal items.
*/
private["_vehicle","_vehicleInfo","_value","_list"];
_vehicle = cursorTarget;
_list = ["Air","Ship","LandVehicle"];
if(isNull _vehicle OR {!(KINDOF_ARRAY(_vehicle,_list))}) exitWith {};

_vehicleInfo = _vehicle GVAR ["Trunk",[]];
if(EQUAL(count _vehicleInfo,0)) exitWith {hint localize "STR_Cop_VehEmpty"};

_value = 0;
{
	_var = SEL(_x,0);
	_val = SEL(_x,1);
	diag_log format["Item Status: %1", (ITEM_ILLEGAL(_var))];

	if(EQUAL(ITEM_ILLEGAL(_var),1)) then {
		diag_log format["%1", _var];
		if(!(EQUAL(ITEM_SELLPRICE(_var),-1))) then {
			ADD(_value,(round(_val * ITEM_SELLPRICE(_var) / 2)));
			diag_log format["Rounded: %1", (round(_val * ITEM_SELLPRICE(_var) / 2))];
		};
	};
	diag_log format ["%1, %2", _val, _var];
} foreach (SEL(_vehicleInfo,0));

diag_log format ["%1, %2, %3, %4", _vehicle, _vehicleInfo, _value,_list ];

if(_value > 0) then {
	[[0,"STR_NOTF_VehContraband",true,[[_value] call life_fnc_numberText]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	ADD(BANK,_value);
	_vehicle SVAR ["Trunk",[],true];
} else {
	hint localize "STR_Cop_NoIllegalVeh";
};

