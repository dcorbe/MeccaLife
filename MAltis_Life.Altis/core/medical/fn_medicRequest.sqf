/*
	File: fn_medicRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies the medics that someone has requested emergency and prompts them
	if they want to take the request or not.
*/
private["_caller","_callerName","_pos"];
_caller = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_callerName = [_this,1,"Unknown Player",[""]] call BIS_fnc_param;
_pos = [_this,2,[0],[[0]]] call BIS_fnc_param;

if(isNull _caller) exitWith {}; //Bad data

_marker = format["%1_medic_request",_callerName];
deleteMarkerLocal _marker;
createMarkerLocal [_marker, _pos];
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTypeLocal "loc_Hospital";
_marker setMarkerTextLocal format["%1 is requesting a revive!",(_callerName)];

["MedicalRequestEmerg",[format[localize "STR_Medic_Request",_callerName]]] call BIS_fnc_showNotification;

sleep (5*60);
deleteMarkerLocal _marker;