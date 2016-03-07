#include <macro.h>
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_Truck","_FuelTrucks","_FuelStuff"];
disableSerialization;

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};

if(life_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	_content = cursorTarget getVariable ["content",[]];
	if (count _content > 0) then {
		{
			if((_x select 0) in ["B_supplyCrate_F","Box_IND_Grenades_F","Box_IND_WpsSpecial_F","Box_IND_AmmoVeh_F"]) then {
				_mWeight = _mWeight + ([(_x select 0)] call life_fnc_vehicleWeightCfg);
			};
		} forEach _content;
	} else {
		_mWeight = -1;
	};
	_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if(_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "Ship" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "You cannot store that in anything but a land vehicle!"};

_Truck = TypeOf life_trunk_vehicle;
_FuelStuff = ["oil_unprocessed","oil_processed"];
_FuelTrucks = ["C_Van_01_fuel_F","O_Heli_Transport_04_fuel_F"]; 


switch (true) do
{
case ((_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {life_TankLaster = 1}; //Fuel in FuelTruck -> Allowed
case (!(_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {life_TankLaster = 2}; //NonFuel in NonFuelTruck -> Allowed
case (!(_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {life_TankLaster = 3}; //NonFuel in FuelTruck -> Nope
case ((_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {life_TankLaster = 4}; //Fuel in NonFuelTruck -> Nope!
};

if (life_TankLaster == 3) exitWith {hint "Ey boy!! That won't pass through the nozzle! (Fuel Trucks and the Taru Fuel can only store fuel!)"};
if (life_TankLaster == 4) exitWith {hint "Are you crazy? What about the mess you would create? (You can only put fuel inside of a Fuel Truck or Taru Fuel.)";};


//if(_ctrl == "oil_processed" && {!(EQUAL(life_trunk_vehicle, "O_Heli_Transport_04_fuel_F"))}) exitWith {hint "You cannot store that in anything but a Taru Fuel!"};

//if(_ctrl == "oil_unprocessed" && {!(EQUAL(life_trunk_vehicle, "O_Heli_Transport_04_fuel_F"))}) exitWith {hint "You cannot store that in anything but a Taru Fuel!"};


if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(CASH < _num) exitWith {hint "You don't have that much cash on you to store in the vehicle!"};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	CASH = CASH - _num;
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "The vehicle is either full or cannot hold that much."};

	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Couldn't remove the items from your inventory to put in the vehicle.";};
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
};
