#include <macro.h>
/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir","_incar","_ploc"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_incar = [_this,1,false,[false]] call BIS_fnc_param;
_ploc = [_this,2,[],[[]]] call BIS_fnc_param;
_uid = getPlayerUID life_corpse;
_name = format["%1gear",_uid];
if (life_is_alive) exitWith {};
//_oldGear = missionNamespace getVariable _name;
[life_deadGear] spawn life_fnc_loadDeadGear;
life_deadGear = [];
life_corpse SVAR ["realname",nil,true]; //Should correct the double name sinking into the ground.
life_corpse setVariable ["requestMedic",false,true];
[[life_corpse],"life_fnc_corpse",nil,FALSE] call life_fnc_MP;
_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[LIFE_SETTINGS(getNumber,"revive_fee")] call life_fnc_numberText];

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
if(BANK > (LIFE_SETTINGS(getNumber,"revive_fee"))) then {
	SUB(BANK,(LIFE_SETTINGS(getNumber,"revive_fee")));
} else {
	BANK = 0;
};

/* Life tracking */
life_is_alive = true;

//Retexturing of units clothing, vanilla files only retexture the EMS unit.
[] call life_fnc_Uniformscolor;

//Bring me back to life.
player setDir _dir;
if (_incar) then {
	player setPos _ploc;
} else {
	player setPosASL (visiblePositionASL life_corpse);
};
life_corpse SVAR ["Revive",nil,TRUE];
life_corpse SVAR ["name",nil,TRUE];
[[life_corpse],"life_fnc_corpse",true,false] call life_fnc_MP;
hideBody life_corpse;

player SVAR ["Revive",nil,TRUE];
player SVAR ["name",nil,TRUE];
player SVAR ["Reviving",nil,TRUE];
player setVariable ["requestMedic",false,true];

life_removeWanted = false;

if(life_nlrtimer_running) then {life_nlrtimer_stop = true};

[] call life_fnc_hudUpdate; //Request update of hud.