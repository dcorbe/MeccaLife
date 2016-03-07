#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	File: fn_buyHouse.sqf

	Description:
	Buys the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;

if(playerSide != civilian) exitWith {hint "You can't shop for houses while you are on duty!";};
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if((_house GVAR ["house_owned",false])) exitWith {hint "This house is already owned even though you shouldn't be seeing this hint..."};
if(!isNil {(_house GVAR "house_sold")}) exitWith {hint localize "STR_House_Sell_Process"};
if(!license_civ_home) exitWith {hint localize "STR_House_License"};
if(count life_gangmembers < 4 && typeOf(_house) == "Land_i_Shed_Ind_F") exitWith {hint "You need at least 4 members to purchase a hideout!"};
if({_position = call compile format["%1",_x select 0]; _b = nearestBuilding _position; typeOf _b != "Land_i_Shed_Ind_F"}count life_houses >= (LIFE_SETTINGS(getNumber,"house_limit")) && typeOf(_house) != "Land_i_Shed_Ind_F") exitWith {hint format[localize "STR_House_Max_House",LIFE_SETTINGS(getNumber,"house_limit")]};

if({_position = call compile format["%1",_x select 0]; _b = nearestBuilding _position; typeOf _b == "Land_i_Shed_Ind_F"}count life_houses >= 1 && typeOf(_house) == "Land_i_Shed_Ind_F") exitWith {hint format["You cannot own more than 1 gang warehouse."]};
closeDialog 0;

_houseCfg = [M_CONFIG(getNumber,"Houses",typeOf(_house),"price"),M_CONFIG(getNumber,"Houses",typeOf(_house),"maxStorage")];
if(EQUAL(count _houseCfg,0)) exitWith {};

_action = [
	format[localize "STR_House_BuyMSG",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	hint "Contacting the Real Estate Broker...";
	diag_log "Called Buy House";
	[[_house, player],"TON_fnc_preCheckHouse",false,false] call life_fnc_MP;
};