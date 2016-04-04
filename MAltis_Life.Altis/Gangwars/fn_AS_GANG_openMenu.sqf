if (isNil "AS_GANG_vCalled") then {AS_GANG_vCalled = false;AS_GANG_busy = false;};
if (AS_GANG_vCalled || AS_GANG_busy) exitWith {};
if(count life_gangData == 0) exitWith {hint "You are not part of a gang!";};
AS_GANG_vCalled = true;
[] spawn {sleep 4;AS_GANG_vCalled = false;};
[[0,player],"TON_fnc_AS_GANG_getValue",false,false] spawn life_fnc_mp;
AS_GANG_go = false;waitUntil {AS_GANG_go};
_gangZones = AS_GANG_cZones;
AS_GANG_curZoneName = "";
AS_GANG_curZoneArr  = [];
{
	_curZone = _x;
	if (((_curZone select 0) distance player <= (_curZone select 2)) AND ((_curZone select 0) distance player <= (_curZone select 3))) then
	{
		AS_GANG_curZoneName = _curZone select 1;
		AS_GANG_curZoneArr = _curZone;
	};
} forEach _gangZones;
if (AS_GANG_curZoneName isEqualTo "") exitWith {hint "You are not in a Gangzone!";};
if ((AS_GANG_curZoneArr select 8) isEqualTo (group player)) exitWith
{
	closeDialog 0;createDialog "AS_GANG_menu";
	hint "You have opened the local Rebel Market";
};
if (!((AS_GANG_curZoneArr select 8) isEqualTo (group player)) AND ((getPlayerUID player) isEqualTo (life_gangData select 1)) AND !((AS_GANG_curZoneArr select 8) isEqualTo grpNull)) then
{
	if (AS_GANG_fight) exitWith {hint "There is already a fight going on somewhere!";};
	_ans = ["Would you like to ask the gang leader to start a gang war? Refusing the war will result in territory loss 30 min cooldown.","Start Gang War","Yes","No"] call BIS_fnc_guiMessage;
	if (!_ans) exitWith {};
	{
		if ((AS_GANG_curZoneArr select 9)) then {
			[[player],"life_fnc_AS_GANG_question",_x,false] spawn life_fnc_mp;
			[] spawn {sleep 60;AS_GANG_response = false;AS_GANG_gotResponse = true;};
			AS_GANG_gotResponse = false;
		} else {AS_GANG_response = true;AS_GANG_gotResponse = true;};
	} forEach (units (AS_GANG_curZoneArr select 8));
	AS_GANG_busy = true;
	waitUntil {AS_GANG_gotResponse};
	if (AS_GANG_response) then
	{
		{[[1,"ATTENTION: Your gang just joined a gang war! Get as many kills as possible within 15 minutes to win the war! Note that only kills with you and your victim inside the zone will count!"],"life_fnc_broadcast",_x,false] spawn life_fnc_mp;} forEach (units group player);
		{[[1,"ATTENTION: Your gang just joined a gang war! Get as many kills as possible within 15 minutes to win the war! Note that only kills with you and your victim inside the zone will count!"],"life_fnc_broadcast",_x,false] spawn life_fnc_mp;} forEach (units ((AS_GANG_curZoneArr select 8)));
		[[group player,(AS_GANG_curZoneArr select 8),AS_GANG_curZoneName],"TON_fnc_AS_GANG_war",false,false] spawn life_fnc_mp;
		AS_GANG_busy = false;
	} else {
		hint "Either the gang leader didn't respond within 60 seconds or he is currently not online. The territory has been forfeited";
	};

} else
{
	if ((AS_GANG_curZoneArr select 8) isEqualTo grpNull) then {
		hint "Since the region was not taken by anyone, you have now claimed this region for your gang!";
		[[AS_GANG_curZoneName,group player],"TON_fnc_AS_GANG_takeTerr",false,false] spawn life_fnc_mp;
	};
};