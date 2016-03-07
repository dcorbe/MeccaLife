#include <macro.h>
/* 
    File: fn_adminRevive.sqf
    Author: Derek
    
    Description:
    Revives every dead player on the server.
*/

{
    _x SVAR ["Revive",TRUE,TRUE];
    [[profileName],"life_fnc_revived",_x,FALSE] call life_fnc_MP;
} foreach allDeadMen;