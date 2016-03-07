/*	
		File: fn_createGang.sqf	
*/
private["_value","_len","_group"];

_value = ctrlText 2522;
_len = [_value] call KRON_StrLen;

if(_len > 25) exitWith {hint "The maximum character limit for a group name is 25."};
if(isNil {life_gang_list}) exitWith {hint "Server not authorized for feature."};
if(([_value,life_gang_list] call TON_fnc_index) != -1) exitWith {hint "That group name is already taken!"};

_group = createGroup civilian;

_group setVariable ["gang_name",_value,true];
/*Set Array*/
life_gang_list set[count life_gang_list,[_value,_group,false,str(player),getPlayerUID player]];
publicVariable "life_gang_list";
[player] joinSilent _group;
player setRank "COLONEL";
life_my_gang = _group;
if(!isNull life_my_gang) then
{	
	closeDialog 0;	
	createDialog "Life_My_Group_Diag";	
	publicVariable "life_gang_list";
};