/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies members that the gang has been disbanded.
*/
private["_groupID"];
_groupID = [_this,0,-1] call BIS_fnc_param;
if(_groupID == -1 or _groupID != life_gangid) exitWith {}; //Fail horn please.
if(!isNull (findDisplay 2620)) then {closedialog 2620};
hint localize "STR_GNOTF_DisbandWarn_2";
[player] joinSilent (createGroup civilian);
life_gangid = -1;
life_gangowner = -1;
life_gangname = "";
life_gangbank = 0;
life_gangrank = 0;
life_in_gang = false;
