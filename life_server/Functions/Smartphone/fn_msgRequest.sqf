/*

	file: fn_msgRequest.sqf
	Author: Silex
	
	Fills the Messagelist
*/
private["_query","_queryResult","_uid","_player"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_player = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_query = format["msgRequest:%1",_uid];

waitUntil{!DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if(count _queryResult == 0) exitWith {};
{
	[[1,_x],"life_fnc_smartphone",_player,false] spawn life_fnc_MP;
}forEach _queryResult;