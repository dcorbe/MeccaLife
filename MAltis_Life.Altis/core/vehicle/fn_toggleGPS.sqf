/*
fn_toggleGPS.sqf

Author: Derek

Description: Allows car owner to toggle the GPS of the car on or off.

*/

_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

if (not (_vehicle getVariable["gpsoff",true])) exitWith {_vehicle setVariable ["gpsoff",true]};

_markerName = format["%1_gpstracker",_vehicle];
_marker = createMarkerLocal [_markerName, visiblePosition _vehicle];
_marker setMarkerColorLocal "ColorYellow";
_marker setMarkerTypeLocal "Mil_dot";
_marker setMarkerTextLocal "GPS Tracker "+getText(configFile >> "CfgVehicles" >> typeof _vehicle >> "displayName");
_marker setMarkerPosLocal getPos _vehicle;
_vehicle setVariable["gpsoff", false];
while {true} do {
    if((not (alive _vehicle)) || (_vehicle getVariable ["gpsoff",true]) ) exitWith {deleteMarkerLocal _markerName;};
    _marker setMarkerPosLocal getPos _vehicle;
    sleep 0.5;
};