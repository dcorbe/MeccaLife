/*
	Author: Bryan "Tonic" Boardwine
	
	File: fn_updateGang.sqf
	
	Description:
	Updates the gang information?
*/
private["_mode","_group","_groupID","_bank","_maxMembers","_members","_query","_owner"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_group = [_this,1,grpNull,[grpNull]] call BIS_fnc_param;

if(isNull _group) exitWith {}; //FAIL

_groupID = _group getVariable["gang_id",-1];
if(_groupID == -1) exitWith {};

switch (_mode) do {
	case 0: {
		_bank = [(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe;
		_maxMembers = _group getVariable ["gang_maxMembers",8];
		_members = _group getVariable "gang_members";
		_owner = _group getVariable ["gang_owner",""];
		if(_owner == "") exitWith {};

		_query = format["gangInfoUpdate:%1:%2:%3:%4",_bank,_maxMembers,_owner,_groupID];
	};

	case 1: {
		_query = format["gangBankInfoUpdate:%1:%2",([(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe),_groupID];
	};

	case 2: {
		_query = format["gangMaxMembersUpdate:%1:%2",(_group getVariable ["gang_maxMembers",8]),_groupID];
	};

	case 3: {
		_owner = _group getVariable["gang_owner",""];
		if(_owner == "") exitWith {};
		_query = format["gangOwnerUpdate:%1:%2",_owner,_groupID];
	};

	case 4: {
		_membersFinal = _group getVariable "gang_members";
		_query = format["gangMembersUpdate:%1:%2",_membersFinal,_groupID];
	};
	case 5: {
		_gang = [_this,2,"",[""]] call BIS_fnc_param;
		_toAdd = [_this,3,0,[0]] call BIS_fnc_param;
		_query =  format["gangBankInfoUpdate:%1:%2"_bank,_groupID];
		_group = grpNull;
		{if(_gang == (_x getVariable["gang_name",""])) exitWith {_group = _x}} forEach allGroups;
		if(!isNull _group) then { _group setVariable["gang_bank",((_group getVariable["gang_bank",0]) + _toAdd),true]; };
	};
};

if(!isNil "_query") then {
	waitUntil{!DB_Async_Active};
	[_query,1] call DB_fnc_asyncCall;
};