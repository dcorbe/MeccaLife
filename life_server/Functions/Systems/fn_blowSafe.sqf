#include "\life_server\script_macros.hpp"
/*
    Author: Derek
    
    File: fn_blowSafe.sqf

    Description: Handles the explosion of a blasting charge
    
*/
private["_safe","_delay","_numbars","_bomb","_units","_marker"];
_safe=[_this,0,"",[""]] call BIS_fnc_param;
_delay=[_this,1,0,[0]] call BIS_fnc_param;

switch (_safe) do {
    case "fed" : 
    {
         _marker = createMarker ["fed_dot", [16086.5,17000,0]];
        "fed_dot" setMarkerColor "ColorRed";
        "fed_dot" setMarkerText "The Federal Reserve is being robbed!";
        "fed_dot" setMarkerType "mil_dot";
        
        _marker = createMarker ["fed_redZone", [16086.5,17000,0]];
        "fed_redZone" setMarkerColor "ColorRed";
        "fed_redZone" setMarkerShape "ELLIPSE";
        "fed_redZone" setMarkerSize [350, 350];
        "fed_redZone" setMarkerBrush "DiagGrid";
        
        [] spawn {
            while {true} do {
                sleep 5;
                if (!(fed_bank getVariable["chargeplaced",false]) && (!(fed_bank getVariable["safe_open",false]))) then {
                    deleteMarker "fed_redZone";
                    deleteMarker "fed_dot";
                };
            };
        };
        sleep(_delay*60+1);
        if(!(fed_bank getVariable["chargeplaced",false])) exitWith {};
        _bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
        fed_bank setVariable["chargeplaced",false,true];
        fed_bank setVariable["safe_open",true,true];
        _units = count playableUnits;
        _numbars = round(_units + random(3*_units));
        if (_numbars < 20) then {
        	_numbars = 20;
        };
        fed_bank setVariable["safe",_numbars,true];
        fed_bank setVariable["lastrobbery",time,true];
    };
};