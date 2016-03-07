#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	File: fn_gangMenu.sqf
	
	Description:
	31 hours of no sleep screw your description.
*/
private["_ownerID","_gangBank","_gangMax","_gangName","_members","_allUnits","_ctrl","_members","_gangMembers","_unit","_good"];
disableSerialization;
if(isNull (findDisplay 2620)) then {
	if(!(createDialog "Life_My_Gang_Diag")) exitWith {}; //NOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOOO00000000000000oooooo
};


if(!life_in_gang) exitWith {closeDialog 0;}; //Bad juju

if(typeName life_gangowner != "SCALAR") then {
	life_gangowner = parseNumber(life_gangowner);	
};

_ownerID = life_gangowner;
_gangName = life_gangname;
_gangBank = life_gangbank;
_gangMembers = life_gangmembers;

switch(life_gangrank) do {
	case 3: {
		(CONTROL(2620,2624)) ctrlEnable false; //Kick
		(CONTROL(2620,2431)) ctrlEnable false; //Disband Gang
	};
	case 4: {
		(CONTROL(2620,2431)) ctrlEnable false; //Disband Gang
	};
	case 5: {
		(CONTROL(2620,2403)) ctrlEnable false; //Leave Button
		
	};
	default {
		(CONTROL(2620,2624)) ctrlEnable false; //Kick
		(CONTROL(2620,2625)) ctrlEnable false; //Promote
		(CONTROL(2620,2401)) ctrlEnable false; //Demote
		(CONTROL(2620,2630)) ctrlEnable false; //Invite Player
		(CONTROL(2620,2431)) ctrlEnable false; //Disband Gang
	};
};

(CONTROL(2620,1003)) ctrlSetText format["Your Gang: %1 - $%2",_gangName,[_gangBank] call life_fnc_numberText];

//Loop through the players.
_members = CONTROL(2620,2621);
lbClear _members;
if (typeName (_gangMembers select 0) == "ARRAY") then {
	{
		if((_x select 2)==5) then {
			_members lbAdd format["%1 (%2) " +(localize "STR_GNOTF_GangLeader"),(_x select 1),(_x select 2)];
			_members lbSetData [(lbSize _members)-1,str(_x)];
			_members lbSetValue [(lbSize _members)-1,6-(_x select 2)];
		} else {
			_members lbAdd format["%1 (%2) ",(_x select 1),(_x select 2)];
			_members lbSetData [(lbSize _members)-1,str(_x)];
			_members lbSetValue [(lbSize _members)-1,6-(_x select 2)];
		};
	} foreach _gangMembers;
} else {
	if((_gangMembers select 0) == _ownerID) then {
		_members lbAdd format["%1 (%2) " +(localize "STR_GNOTF_GangLeader"),(_gangMembers select 1),(_gangMembers select 2)];
		_members lbSetData [(lbSize _members)-1,str(_gangMembers)];
		_members lbSetValue [(lbSize _members)-1,6-(_x select 2)];
	} else {
		_members lbAdd format["%1 (%2) ",(_gangMembers select 1),(_gangMembers select 2)];
		_members lbSetData [(lbSize _members)-1,str(_gangMembers)];
		_members lbSetValue [(lbSize _members)-1,6-(_x select 2)];
	};
};

lbSortByValue _members;

_allUnits = playableUnits;
//Clear out the list..
{
	_unit = _x;
	_good = false;
	if (typeName (_gangMembers select 0) == "ARRAY") then {
		{
			if (getPlayerUID _unit == _x select 0) then {
				_good = true;
			};
		}foreach _gangMembers;
	} else {
		if (getPlayerUID _unit == _gangMembers select 0) then {
			_good = true;
		};
	};
	
	if(_good || (side _x != civilian && isNil {(group _x) getVariable "gang_id"})) then {
		_allUnits set[_forEachIndex,-1];
	};
} foreach _allUnits;
SUB(_allUnits,[-1]);

_ctrl = CONTROL(2620,2632);
lbClear _ctrl; //Purge the list
{
	_ctrl lbAdd format["%1",_x GVAR ["realname",name _x]];
	_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} foreach _allUnits;