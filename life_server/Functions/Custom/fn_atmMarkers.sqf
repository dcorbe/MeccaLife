/*
    File: atmMarkers.sqf
    
    Author: Derek
    
    Description: Marks all of the ATMs on the map with an ATM icon
    
    nearestObjects[[12700,14100,0],["Land_Atm_01_F","Land_Atm_02_F","Atm_01_F","Atm_02_F"],25000];
*/

_atms = [];
{
    if(["atm_",str(_x)] call BIS_fnc_inString) then {
      _atms pushBack _x;  
    };
}foreach allMissionObjects "";
diag_log format["%1", _atms];
atmlist = [];
{   
    if (typeof _x in ["Land_Atm_01_F","Land_Atm_02_F"]) then {
        _marker = createMarker [format["%1_marker",_x],visiblePosition _x];
        _marker setMarkerColor "ColorRed";
        _marker setMarkerType "loc_Tourism";
        atmlist pushBack [_marker,_x];
    };
} foreach _atms;

[] spawn { 
    sleep 10;
    {deleteMarker (_x select 0);} foreach atmlist;
};