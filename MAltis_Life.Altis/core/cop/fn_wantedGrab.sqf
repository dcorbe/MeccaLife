#include <macro.h>
/*
	File: fn_wantedGrab.sqf
	Author: ColinM
	
	Description:
	Prepare the array to query the crimes.
*/
private["_display","_criminal","_tab","_queryResult","_result","_ret","_crimesDb","_crimesArr","_type","_uid","_list"];
disableSerialization;
_display = findDisplay 2400;
_tab = _display displayCtrl 2402;
_criminal = lbData[2401,(lbCurSel 2401)];
_criminal = call compile format["%1", _criminal];

_list = wantedList;
_uid = _criminal select 0;
{
	if (EQUAL(_uid, SEL(_x,0))) then {
		_queryResult = [SEL(_x,2),SEL(_x,3)];
	};
} forEach _list;

_crimesArr = [];

_type = _queryResult select 0;
{
	switch(_x) do
	{
		case "187V": {_x = "STR_Crime_187V"};
		case "187": {_x = "STR_Crime_187"};
		case "901": {_x = "STR_Crime_901"};
		case "215": {_x = "STR_Crime_215"};
		case "213": {_x = "STR_Crime_213"};
		case "211": {_x = "STR_Crime_211"};
		case "207": {_x = "STR_Crime_207"};
		case "207A": {_x = "STR_Crime_207A"};
		case "390": {_x = "STR_Crime_390"};
		case "487": {_x = "STR_Crime_487"};
		case "488": {_x = "STR_Crime_488"};
		case "480": {_x = "STR_Crime_480"};
		case "481": {_x = "STR_Crime_481"};
		case "482": {_x = "STR_Crime_482"};
		case "483": {_x = "STR_Crime_483"};
		case "459": {_x = "STR_Crime_459"};
		case "666": {_x = "STR_Crime_666"};
		case "667": {_x = "STR_Crime_667"};
		case "668": {_x = "STR_Crime_668"};
		case "919": {_x = "STR_Crime_919"};
		case "919A": {_x = "STR_Crime_919A"};
		case "5447": {_x = "STR_Crime_5447"};
		case "5489": {_x = "STR_Crime_5489"};
		case "1412": {_x = "STR_Crime_1412"};
		case "1337": {_x = "STR_Crime_1337"};
		case "13371": {_x = "STR_Crime_13371"};
		case "4389": {_x = "STR_Crime_4389"};
		case "4532": {_x = "STR_Crime_4532"};
		case "5217": {_x = "STR_Crime_5217"};
		case "1018": {_x = "STR_Crime_1018"};
		case "5894": {_x = "STR_Crime_5894"};
		
		
		case "1": {_x = "STR_Crime_1"};
		case "2": {_x = "STR_Crime_2"};
		case "3": {_x = "STR_Crime_3"};
		case "4": {_x = "STR_Crime_4"};
		case "5": {_x = "STR_Crime_5"};
		case "6": {_x = "STR_Crime_6"};
		case "7": {_x = "STR_Crime_7"};
		case "8": {_x = "STR_Crime_8"};
		case "9": {_x = "STR_Crime_9"};
		case "10": {_x = "STR_Crime_10"};
		case "11": {_x = "STR_Crime_11"};
		case "12": {_x = "STR_Crime_12"};
		case "13": {_x = "STR_Crime_13"};
		case "13A": {_x = "STR_Crime_13A"};
		case "14": {_x = "STR_Crime_14"};
		case "14A": {_x = "STR_Crime_14A"};
		case "236": {_x = "STR_Crime_236"};
	};
	_crimesArr pushBack _x;
}forEach _type;
_queryResult set[0,_crimesArr];

[_queryResult] spawn life_fnc_wantedInfo;