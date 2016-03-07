/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data"];
if(dialog) exitWith {};
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle OR !(_vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR _vehicle isKindOf "House_F")) exitWith {}; //Either a null or invalid vehicle type.
if((typeof _vehicle == "Land_i_Shed_Ind_F") && (life_gangrank < 2)) exitWith {hint "You cannot access your gang's warehouse inventory unless you are rank 2 or higher."};
if((_vehicle getVariable ["trunk_in_use",false])) exitWith {hint localize "STR_MISC_VehInvUse";};
if(!createDialog "TrunkMenu") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?
disableSerialization;

_vehicle spawn {
	sleep (2 * 60);
	_this setVariable["trunk_in_use",false,true];
};

if(_vehicle isKindOf "House_F") then {
	ctrlSetText[3501,format[(localize "STR_MISC_HouseStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
} else {
	ctrlSetText[3501,format[(localize "STR_MISC_VehStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
};

if(_vehicle isKindOf "House_F") then {
	private "_mWeight";
	_mWeight = 0;
	_content = _vehicle getVariable ["content",[]];
	if (count _content > 0) then {
		{
			if((_x select 0) in ["B_supplyCrate_F","Box_IND_Grenades_F","Box_IND_WpsSpecial_F","Box_IND_AmmoVeh_F"]) then {
				_mWeight = _mWeight + ([(_x select 0)] call life_fnc_vehicleWeightCfg);
			};
		} forEach _content;
	} else {
		_mWeight = -1;
	};
	_veh_data = [_mWeight,(_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_veh_data = [_vehicle] call life_fnc_vehicleWeight;
};

if(_vehicle isKindOf "House_F" && (_veh_data select 0) == -1) exitWith {hint localize "STR_MISC_NoStorageWarn"; closeDialog 0; sleep(1.5); _vehicle setVariable["trunk_in_use",false,true];};
if(_veh_data select 0 == -1 && {!(_vehicle isKindOf "House_F")}) exitWith {hint localize "STR_MISC_NoStorageVeh"; closeDialog 0; sleep(1.5); _vehicle setVariable["trunk_in_use",false,true]; };

ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

_handle = [_vehicle] spawn {
	_vehicle = _this select 0;
	sleep random(1);
	if((_vehicle getVariable ["trunk_in_use",false])) exitWith {closeDialog 0; hint localize "STR_MISC_VehInvUse";};
	if (!isNull (findDisplay 3500)) then {_vehicle setVariable["trunk_in_use",true,true];};
};

waitUntil {scriptDone _handle};

if (isNull (findDisplay 3500)) exitWith {};

_vehicle spawn
{
	waitUntil {isNull (findDisplay 3500)};
	_this setVariable["trunk_in_use",false,true];
	if(_this isKindOf "House_F") then {
		[[_this],"TON_fnc_updateHouseTrunk",false,false] call life_fnc_MP;
	};
};