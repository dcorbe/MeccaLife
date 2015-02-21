#include <macro.h>
/*
	File: fn_ticketPrompt
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player that he is being ticketed.
*/
private["_cop","_val"];
if(!isNull (findDisplay 2600)) exitwith {}; //Already at the ticket menu, block for abuse?
_cop = SEL(_this,0);
if(isNull _cop) exitWith {};
_val = SEL(_this,1);

createDialog "life_ticket_pay";
disableSerialization;
waitUntil {!isnull (findDisplay 2600)};

life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_cop = _cop;
CONTROL(2600,2601) ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>" +(localize "STR_Cop_Ticket_GUI_Given"),_cop getVariable["realname",name _cop],_val];
player say3D "ticket";

[] spawn {
	disableSerialization;
	waitUntil {life_ticket_paid OR (isNull (findDisplay 2600))};
	if(isNull (findDisplay 2600) && !life_ticket_paid) then {
		[[0,"STR_Cop_Ticket_Refuse",true,[profileName]],"life_fnc_broadcast",west,false] call life_fnc_MP;
		[[1,"STR_Cop_Ticket_Refuse",true,[profileName]],"life_fnc_broadcast",life_ticket_cop,false] call life_fnc_MP;
	}
	else 
	{
		[[1,format["You have a collected $%1 from that ticket.",life_ticket_val * 0.5]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
	};
};