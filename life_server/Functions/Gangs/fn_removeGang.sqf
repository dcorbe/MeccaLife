/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Blah
*/
private["_group","_groupID"];
_groupID = [_this,0,-1] call BIS_fnc_param;
if(_groupID == -1) exitWith {};

waitUntil{!DB_Async_Active};
[format["gangRemove:%1",_groupID],2] call DB_fnc_asyncCall;
[[_groupID],"life_fnc_updateGangHouse",true,false] call life_fnc_MP;
[[_groupID],"life_fnc_gangDisbanded",true,false] call life_fnc_MP;