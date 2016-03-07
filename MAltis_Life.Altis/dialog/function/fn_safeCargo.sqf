/*	
		fn_safeOpen.sqf
*/
if(dialog) exitWith {}; //A dialog is already open.
life_cargoObj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull life_cargoObj) exitWith {};
if(playerSide != civilian) exitWith {};
if((life_cargoObj getVariable["cargo",-1]) < 1) exitWith {hint localize "STR_Civ_VaultEmpty";};
if((life_cargoObj getVariable["inUse",false])) exitWith {hint localize "STR_Civ_VaultInUse"};
if(!createDialog "Heli_Safe") exitWith {localize "STR_MISC_DialogError"};
disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[life_cargoObj] call life_fnc_safeInvCargo;
life_cargoObj setVariable["inUse",true,true];
[life_cargoObj] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["inUse",false,true];
};