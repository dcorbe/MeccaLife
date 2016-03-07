/*
	fn_breakoutTimer.sqf
*/
private["_uiDisp","_time","_timer"];
//if(!(playerSide == west || life_is_arrested || player == (_this select 1))) exitWith {}; //If you do not need to display this then dont! (Check order: Cop || Prisoner || Player Robbing)
disableSerialization;
0 cutRsc ["life_breakouttimer","PLAIN"];
_uiDisp = uiNamespace getVariable "life_breakouttimer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (12 * 60);
while {true} do {
	if(isNull _uiDisp) then {
		0 cutRsc ["life_breakouttimer","PLAIN"];
		_uiDisp = uiNamespace getVariable "life_breakouttimer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if(round(_time - time) < 1) exitWith {};
	if(!((_this select 0) getVariable["inbreakout",false])) exitWith {}; //End the timer, something has happened.
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};
0 cutText["","PLAIN"];