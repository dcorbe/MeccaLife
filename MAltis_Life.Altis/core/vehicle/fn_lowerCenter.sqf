/*
    File fn_lowerCenter.sqf
    
    Author: Derek
    
    Description: Lowers the center of mass on the SUV to account for shitty Arma
    
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

diag_log format["Lowering center of mass: %1", _vehicle];
_mass = [0.010813,-0.506166,-0.65];
_vehicle setCenterOfMass _mass;
diag_log "Lowered center of mass";