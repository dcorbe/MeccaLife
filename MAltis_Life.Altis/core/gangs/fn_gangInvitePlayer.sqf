#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the invite process?
*/
private ["_unit","_gang_house"];
disableSerialization;

if((lbCurSel 2632) == -1) exitWith {hint localize "STR_GNOTF_SelectPerson"};
_unit = call compile format["%1",CONTROL_DATA(2632)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint localize "STR_GNOTF_InviteSelf"};

_action = [
	format[localize "STR_GNOTF_InvitePlayerMSG",_unit GVAR ["realname",name _unit]],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

_gang_house = objNull;

{
    _position = call compile format["%1",_x select 0];
    _b = nearestBuilding _position;
    if (typeOf _b == "Land_i_Shed_Ind_F") then {
        _gang_house = _b;
    };
}foreach life_houses;

if(_action) then {
	[[profileName,[life_gangid,life_gangowner,life_gangbank,life_gangmembers,life_gangname,_gang_house]],"life_fnc_gangInvite",_unit,false] call life_fnc_MP;
	hint format[localize "STR_GNOTF_InviteSent",_unit GVAR ["realname",name _unit]];
} else {
	hint localize "STR_GNOTF_InviteCancel";
};