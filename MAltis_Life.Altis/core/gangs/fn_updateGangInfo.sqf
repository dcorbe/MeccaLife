#include <macro.h>
/*
	Author: Derek
	
	File: fn_updateGangInfo.sqf
	
	Description:
	Updates the gang for all players in the gang
	Execute on all clients. Updates database on server as necessary.
*/
private["_gang_id","_gang_owner","_gang_bank","_gang_members","_force"];
_gang_id = [_this,0,-1] call BIS_fnc_param;
_gang_owner = [_this,1,-1] call BIS_fnc_param;
_gang_bank = [_this,2,-1] call BIS_fnc_param;
_gang_members = [_this,3,[],[[]]] call BIS_fnc_param;
_force = [_this,4,false,[false]] call BIS_fnc_param;
if(_gang_id == -1) exitWith {};
if(!isServer)then {
    if(playerSide != civilian) exitWith {};
    if(life_gangid != _gang_id) exitWith {};
    if(str(_gang_owner) != str(-1)) then {
        life_gangowner = _gang_owner;
    };
    if(_gang_bank != -1) then {
        life_gangbank = _gang_bank;
    };
    if(EQUAL(_gang_members,[])) then { } else {
        life_gangmembers = _gang_members;
        {
            _uid = _x select 0;
            if (_uid == steamid) then {
                life_gangrank = _x select 2;
            };
        }foreach life_gangmembers;
    };
} else {
    if(str(_gang_owner) != str(-1)) then {
        _query = format["gangOwnerUpdate:%1:%2",_gang_owner,_gang_id];
    	waitUntil{!DB_Async_Active};
    	[_query,1] call DB_fnc_asyncCall;
    };
    if(_gang_bank != -1) then {
        _query = format["gangBankInfoUpdate:%1:%2",([_gang_bank] call DB_fnc_numberSafe),_gang_id];
    	waitUntil{!DB_Async_Active};
    	[_query,1] call DB_fnc_asyncCall;
    };
    if(EQUAL(_gang_members,[])) then { } else {
        _query = format["gangMembersUpdate:%1:%2",_gang_members,_gang_id];
    	waitUntil{!DB_Async_Active};
    	[_query,1] call DB_fnc_asyncCall;
    };
};