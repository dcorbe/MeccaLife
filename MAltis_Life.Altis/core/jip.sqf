/*
	File: jip.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	JIP functionality for JIP required things like vehicles.
*/

{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then {
		[_x,_index] spawn life_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Car");

{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then {
		[_x,_index] spawn life_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Air");

{
	if (_x != player) then {
		if (side _x == west) then {
			[_x] call life_fnc_Uniformscolor;
		};
	};
} forEach playableUnits;


if(isNil "gang_list") then {
	[[],"TON_fnc_fetchGangs",false,false] call life_fnc_MP
}