/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear","_lowestdistance"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);
_lowestdistance = 999999;
_distance = 0;
_pos = getPosATL player;

waitUntil {
	{
		if (side _x == independent) then {
			_distance = _pos distance _x;
			if (_distance < _lowestdistance) then {
				_lowestdistance = round(_distance);	
			};
		};
	} foreach playableUnits;
	_nearby = if(([independent,getPosATL player,120] call life_fnc_nearUnits)) then {"Yes"} else {"No"};
	_medicsOnline ctrlSetText format[localize "STR_Medic_Online",[independent] call life_fnc_playerCount];
	if (_lowestdistance == 999999) then {
		_medicsNear ctrlSetText format["No Medic is Online"];
	} else {
		_medicsNear ctrlSetText format[localize "STR_Medic_Near",_lowestdistance];
	};
	sleep 5;
	(isNull (findDisplay 7300))
};