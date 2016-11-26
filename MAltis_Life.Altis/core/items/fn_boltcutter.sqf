/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui","_owneruid","_owner","_fed","_arm"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "You are not looking at a house door."};
if(typeOf _building == "Land_i_Shed_Ind_F") exitWith {hint "The metal door is reinforced, your boltcutter is not strong enough."};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};
if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then {
	_fed = true;}; 
if((nearestObject [[25376.8,20345.8,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[25368.6,20344,0],"Land_Cargo_HQ_V2_F"]) == _building) then {
	_arm = true;};
if(!(_fed)&&!(_arm))then {
	[[_building],"life_fnc_bankalarmsound",true,true] call life_fnc_MP;
	[[0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	_fed=false;
	_arm=false;
};


if(_fed && ({side _x == west} count playableUnits < 5)) exitWith {hint localize "STR_Civ_NotEnoughCops"};
if(_arm && ({side _x == west} count playableUnits < 3)) exitWith {hint localize "STR_Civ_NotEnoughCops"};

if(_fed) then {
	[[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]],"life_fnc_broadcast",true,false] call life_fnc_MP;
};
if(_arm) then {
	[[[1,2],"STR_ISTR_Bolt_AlertArm",true,[]],"life_fnc_broadcast",true,false] call life_fnc_MP;
};

_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
	case "Land_Dome_Big_F": {_cpRate = 0.003;};
	case "Land_Research_house_V1_F": {_cpRate = 0.0015;};
	case "Land_Cargo_HQ_V2_F": {_cpRate = 0.0010;};
	default {
		_cpRate = 0.0010;
		diag_log format["Building: %1", _building];
		diag_log format["Type: %1", typeOf _building];
		_owneruid = (_building getVariable "house_owner") select 0;
//		if (_owneruid == -1) exitWith {};
		_owner =
		{
			if ((getPlayerUID _x) == _owneruid) exitWith {_x;};
		} forEach allUnits;
		_position = position player;
		_a = floor ((_position select 0)/100);
		_b = floor ((_position select 1)/100);
		if (_a < 100) then {
			_a = format["0%1",_a];
		};
		if (_b < 100) then {
			_b = format["0%1",_b];
		};
		_msg = format["The security system on your house (grid %1%2) was activated",_a,_b];
		[[_owner,_msg,player,6],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
	}
};

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_isDowned) exitWith {}; //Downed
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_isDowned) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;
if(life_boltcutter_uses >= 5) then {
	[false,"boltcutter",1] call life_fnc_handleInv;
	life_boltcutter_uses = 0;
};

_building setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
if((_building getVariable["locked",false])) then {
	_building setVariable["locked",false,true];
};
[[getPlayerUID player,profileName,"459"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;