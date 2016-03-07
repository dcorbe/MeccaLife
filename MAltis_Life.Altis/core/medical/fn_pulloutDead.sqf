/*
    File: fn_pulloutDead.sqf
    Author: Derek

    Description:
    Pulls dead bodies out of vehicles for medics to revive them.

*/
private["_veh"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;


//_veh = cursorTarget;
if (isNull(_veh)) exitWith {};

{
    if !(alive _x) then
    {
        life_action_inUse = true;
        [_x, true, position player] call life_fnc_revivePlayer;
        waitUntil{!life_action_inUse};
        _x setPos (getPos player);
    };
} forEach (crew _veh);

hint "You have rescued the dead players in this vehicle";