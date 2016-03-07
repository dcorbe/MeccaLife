/*
    File: fn_adminInvisibility.sqf
    Author: Derek
    
    Description:
    Toggles the player's invisiblity.

*/

[[player,life_invisible],"TON_fnc_toggleInvisible",false,false] call life_fnc_MP; 
life_invisible = !life_invisible;