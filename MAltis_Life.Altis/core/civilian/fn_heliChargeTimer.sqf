/*
		fn_waterChargeTimer.sqf
*/
private["_uiDisp","_time","_timer"];
disableSerialization;
6 cutRsc ["life_timer","PLAIN"];
_uiDisp = uiNamespace getVariable "life_timer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (1 * 30);
while {true} do {
	if(isNull _uiDisp) then {
		6 cutRsc ["life_timer","PLAIN"];
		_uiDisp = uiNamespace getVariable "life_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if(round(_time - time) < 1) exitWith {};
	if(!(heli_safe getVariable["hchargeplaced",false])) exitWith {};
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};
6 cutText["","PLAIN"];