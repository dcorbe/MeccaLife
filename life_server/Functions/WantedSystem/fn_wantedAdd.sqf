/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name","_pastCrimes","_query","_queryResult","_nosync"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

_nosync = ["211","490","207","901","211","483","459","390","487","215","187","187V","14"];

_sync = !(_type in _nosync);

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["187V",6500]};
	case "187": {_type = ["187",40000]};
	case "901": {_type = ["901",45000]};
	case "215": {_type = ["215",8000]};
	case "213": {_type = ["213",100000]};
	case "211": {_type = ["211",5000]};
	case "207": {_type = ["207",50000]};
	case "207A": {_type = ["207A",50000]};
	case "390": {_type = ["390",15000]};
	case "487": {_type = ["487",4000]};
	case "488": {_type = ["488",700]};
	case "480": {_type = ["480",1300]};
	case "481": {_type = ["481",1000]};
	case "482": {_type = ["482",5000]};
	case "483": {_type = ["483",9500]};
	case "459": {_type = ["459",15000]};
	case "666": {_type = ["666",2000]};
	case "667": {_type = ["667",45000]};
	case "668": {_type = ["668",15000]};
	
	case "5447": {_type = ["5447",25000]};
	case "5489": {_type = ["5489",25000]};
	case "1412": {_type = ["1412",50000]};
	case "1337": {_type = ["1337",50000]};
	case "13371": {_type = ["13371",150000]};
	case "1018": {_type = ["1018",5000]};
	case "4389": {_type = ["4389",20000]};
	case "5894": {_type = ["5894",2000]};
	case "4532": {_type = ["4532",10000]};
	case "5217": {_type = ["5217",10000]};
	
	case "1": {_type = ["1",2000]};
    case "2": {_type = ["2",1500]};
    case "3": {_type = ["3",2500]};
    case "4": {_type = ["4",5000]};
    case "5": {_type = ["5",8000]};
    case "6": {_type = ["6",5000]};
	case "7": {_type = ["7",10000]};
	case "8": {_type = ["8",20000]};
	case "9": {_type = ["9",30000]};
	case "10": {_type = ["10",30000]};
	case "11": {_type = ["11",2000]};
	case "12": {_type = ["12",5000]};
	case "13": {_type = ["13",8000]};
	case "13A": {_type = ["13A",4000]};
	case "14": {_type = ["14",120000]};
	case "14A": {_type = ["14A",20000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_result = format["wantedGetCrimes:%1",_uid];
waitUntil{!DB_Async_Active};
_queryResult = [_result,2] call DB_fnc_asyncCall;

_val = [(_type select 1)] call DB_fnc_numberSafe;

if(count _queryResult != 0) then
{
	_pastCrimes = _queryResult select 1;
	_pastCrimes pushBack (_type select 0);
	_query = format["wantedUpdateCrimes:%1:%2:%3",_pastCrimes,_val,_uid];
} else {
	_crimes = [(_type select 0)];
	_query = format["wantedInsertCrimes:%1:%2:%3:%4:1",_uid,_name,_crimes,_val];
};

["diag_log",[
			"------------- updateCrimes Request -------------",
			format["QUERY: %1",_query],
			"-------------------------------------------------"
		]] call TON_fnc_logIt;



if(!isNil "_query") then {
	waitUntil{!DB_Async_Active};
	[_query,2] call DB_fnc_asyncCall;
	if (_sync) then {
		[] spawn life_fnc_wantedSyncList;
	};
};