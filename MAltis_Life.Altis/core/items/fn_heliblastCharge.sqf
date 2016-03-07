/*
		fn_heliblastCharge.sqf
*/
private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_Cargo20_grey_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if(_vault getVariable["hchargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if(_vault getVariable["heli_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
if(!([false,"heliblastcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable["hchargeplaced",true,true];
hint localize "STR_ISTR_Blast_KeepOff";
_handle = [] spawn life_fnc_heliChargeTimer;

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(heli_safe getVariable["hchargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL heli_safe select 0, getPosATL heli_safe select 1, (getPosATL heli_safe select 2)+0.5];
heli_safe setVariable["hchargeplaced",false,true];
heli_safe setVariable["heli_open",true,true];

_numbars = round(0.2*_units+random(0.8*_units));
if (_numbars < 10) then {
	_numbars = 10;
};
heli_safe setVariable["safe",_numbars,true];

hint localize "STR_ISTR_Blast_Opened";