/*
	File: fn_sellHostage.sqf
	@Foamy
	www.strainonline.com
	Description:
	Sells the targeted person into Slavery. 
*/

#include <macro.h>

private["_unit","_rate"];
_rate = 100000; // change this to change payout.
_unit = cursorTarget;
if(isNull _unit) exitWith {hint "null Target"};
if(!(_unit getVariable ["restrained",false])) exitWith {hint "Target is not restrained!"};
//if(!(_unit getVariable ["hostage",false])) exitWith {hint "Target is not a Hostage!"};
if((_unit getVariable ["enslaved",false])) exitWith { hint "Your target has recently been enslaved, you must wait for their timer to expire to enslave them again"};
if((player getVariable ["slaver",false])) exitWith { hint "You have recently enslaved someone and must wait for your timer to expire before enslaving someone else"};
if(playerSide == west) exitWith {hint "Cops can't sell hostages!"};
if(side _unit == west) exitWith {hint "Cops can't be sold into Slavery"};
if(side _unit == independent) exitWith {hint "Medics can't be sold into Slavery"};
if(player == _unit) exitWith {hint "You can't sell yourself!"};
if(!isPlayer _unit) exitWith {hint "This is not a player!"};
if(life_slaver) exitWith {hint "You have already enslaved someone, you must wait until your timer runs out!"}; 
if((player distance (getMarkerPos "slave_trader_marker") > 20)) exitWith {hint "You are not close enough to the Slave Trader"};
if((player distance (getMarkerPos "slave_trader_marker") < 20)) then
{
	[[getPlayerUID player,player getVariable["realname",name player],"236"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	detach _unit;
	[[_unit,false],"life_fnc_sellHostageAction",_unit,false] spawn life_fnc_MP;
};
life_cash = life_cash + _rate;
hint "You made $100000 selling that poor soul.";
life_slaver = true;
player setVariable["slaver",true,true];
sleep (30 * 60);
life_slaver = false;
player setVariable["slaver",false,true];
hint "You can go enslave the world again...";