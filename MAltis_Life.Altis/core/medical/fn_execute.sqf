/*
	File: fn_execute.sqf
	Author: John "Paratus" VanderZwet
	Edited By: Ethan

	Description:
	Execute an unconcious player.
*/

_unit = cursorTarget;

if (isNull _unit) exitWith {};
if (!(_unit isKindOf "Man")) exitWith {};
if (alive _unit) exitWith {};
if (player distance _unit > 2.5) exitWith {};

//if (player distance (getMarkerPos "city") < 1000 || player distance (getMarkerPos "civ_spawn_3") < 500 || player distance (getMarkerPos "civ_spawn_4") < 500 || player distance (getMarkerPos "civ_spawn_2") < 500) exitWith { hint "You cannot execute someone so close to a populated area." };*/

life_action_in_use = true; //Lockout the controls.
_targetName = _unit getVariable["name","Unknown"];

//Setup our progress bar
_success = false;
_title = format["Executing %1",_targetName];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.1;

[[player,"AinvPknlMstpSnonWnonDnon_medic1"],"life_fnc_animSync",true,false] spawn BIS_fnc_MP;
while {true} do
{
	sleep 0.038;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if (isNull _unit) exitWith {};
	if (alive _unit) exitWith {};
	//if(player getVariable ["downed",false]) exitWith {};
	if(player distance _unit > 3) exitWith {};
	if(_cP >= 1) exitWith{ _success = true; };
	if (!life_action_in_use) exitWith {};
};

//Kill the UI display and check for various states
life_action_in_use = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if (!_success) exitWith {};

hint format["You EXECUTED %1!", _targetName];

_unit setVariable["executed",true,true];
[[player],"life_fnc_exannounce",_unit,false] spawn life_fnc_MP;
[[0,"STR_NOTF_Lethal",true,[_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",independent,FALSE] call life_fnc_MP;
