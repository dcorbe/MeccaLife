#include <macro.h>
/*
	Author: Derek
	File: fn_boughtHouse.sqf
	Description: Buys the house for the player
*/
private["_house","_uid","_houseCfg","_gangid"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if ((typeOf _house == "Land_i_Shed_Ind_F") && (life_gangrank != 5)) exitWith {"You can't buy houses for your gang unless you are the leader!"};
if ((typeOf _house == "Land_i_Shed_Ind_F") && (life_gangrank == 5)) then {
	_uid = str(life_gangid);
} else {
	_uid = getPlayerUID player;
};
diag_log format["called boughthouse with uid: %1",_uid];
diag_log format["Player UID %1 called boughthouse",getPlayerUID player];

_houseCfg = [M_CONFIG(getNumber,"Houses",typeOf(_house),"price"),M_CONFIG(getNumber,"Houses",typeOf(_house),"maxStorage")];
if(EQUAL(count _houseCfg,0)) exitWith {};

if(BANK < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};

_gangid = life_gangid;
diag_log format["Gang ID: %1",_gangid];
diag_log "Bought a house";

if ((typeOf _house == "Land_i_Shed_Ind_F") && (life_gangid != -1)) then {
	[[life_gangid,_house],"TON_fnc_addHouse",false,false] call life_fnc_MP;
	[[life_gangid,_house],"life_fnc_updateGangHouse",true,false] call life_fnc_MP;
} else {
	[[getPlayerUID player,_house],"TON_fnc_addHouse",false,false] call life_fnc_MP;
};

_house SVAR ["house_owner",[_uid,profileName],true];
_house SVAR ["locked",true,true];
_house SVAR ["Trunk",[[],0],true];
_house setVariable["content",[],true];
_house SVAR ["containers",[],true];
_house SVAR ["uid",floor(random 99999),true];
SUB(BANK,(SEL(_houseCfg,0)));

life_vehicles pushBack _house;
life_houses pushBack [str(getPosATL _house),[]];
_marker = createMarkerLocal [format["house_%1",(_house GVAR "uid")],getPosATL _house];
_houseName = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _house), "displayName");
_marker setMarkerTextLocal _houseName;
_marker setMarkerColorLocal "ColorBlue";
_marker setMarkerTypeLocal "loc_Lighthouse";
_numOfDoors = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,(typeOf _house),"numberOfDoors");
for "_i" from 1 to _numOfDoors do {
	_house SVAR [format["bis_disabled_Door_%1",_i],1,true];
};
hint "Congratulations on your new purchase!";