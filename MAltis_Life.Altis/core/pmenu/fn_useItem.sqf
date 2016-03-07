#include <macro.h>
/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if(EQUAL(lbCurSel 2005,-1)) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = CONTROL_DATA(2005);

switch (true) do {
	case (_item in ["waterBottle","coffee"]): {
		if(([false,_item,1] call life_fnc_handleInv)) then 
		{
			life_thirst = 100;
			if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 0;};
		};
	};
	
	case (EQUAL(_item,"redgull")): 
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			life_redgull_effect = time;
			titleText["You can now run farther for 3 minutes","PLAIN"];
			player enableFatigue false;
			[] spawn
			{
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	case (EQUAL(_item,"boltcutter")): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (EQUAL(_item,"blastingcharge")): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
	
	case (EQUAL(_item,"defusekit")): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};
	
	case (EQUAL(_item,"storagebig")): {
		if(FETCH_CONST(life_donator) > 0) then
		{
			[_item] call life_fnc_storageBox;
		} else {
			hint "You must be a donator to use storage crates.";
		};	
	};
	
	case (EQUAL(_item,"storagesmall")): {
		[_item] call life_fnc_storageBox;
	};
	
	case (EQUAL(_item,"spikeStrip")): {
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_spikeStrip;
		};
	};
/*
	case (EQUAL(_item,"fuelFull")): {
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (EQUAL(_item,"lockpick")): {
		[] spawn life_fnc_lockpick;
	};
*/
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]): {
		if(!(EQUAL(M_CONFIG(getNumber,"VirtualItems",_item,"edible"),-1))) then {
			if([false,_item,1] call life_fnc_handleInv) then {
				_val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
				_sum = life_hunger + _val;
				switch (true) do {
					case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_sum > 100): {life_hunger = 100;};
					default {life_hunger = _sum;};
				};
			};
		};
	};

	case (EQUAL(_item,"pickaxe")): {
		[] spawn life_fnc_pickAxeUse;
	};
	
	case (EQUAL(_item,"heroin_processed")): {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_heroine;
		};
	};
	
	case (EQUAL(_item,"cocaine_processed")): {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_cocainep;
		};
	};

	case (EQUAL(_item,"marijuana")): {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_weed;
		};
	};
	
	case (EQUAL(_item,"underwatercharge")): {
		player reveal gold_safe;
		(group player) reveal gold_safe;
		[cursorTarget] spawn life_fnc_underwaterCharge;
	};	
	
	case (EQUAL(_item,"heliblastcharge")): {
		player reveal heli_safe;
		(group player) reveal heli_safe;
		[cursorTarget] spawn life_fnc_heliblastCharge;
	};	
	
	case (_item =="bottledwhiskey"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.06;
			if (life_drink < 0.07) exitWith {};
			[] spawn life_fnc_drinkwhiskey;
		};
	};
	
	case (_item =="bottledshine"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.08;
			if (life_drink < 0.09) exitWith {};
			[] spawn life_fnc_drinkmoonshine;
		};
	};
	
	case (_item =="bottledbeer"):
	{
		
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.06) exitWith {};
			[] spawn life_fnc_drinkbeer;
		};
	};	
	
	
	
	
	
	default {
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;