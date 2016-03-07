/*
	File: fn_getoutofSlavery.sqf
	@Foamy
	www.strainonline.com	
	Description:
	Gets the player out of Slavery.
*/
#include <macro.h>

if(life_inv_cigarette <= 21) exitWith {hint "you need at least 23 Packs of Cigarettes"};
if(life_inv_cigarette >= 22) then 
{
	[false,"cigarette",10] call life_fnc_handleInv;
	player setPos (getMarkerPos "civ_spawn_1");
	slave_task1 setTaskState "You have won your freedom!";
	player removeSimpleTask slave_task1;
};
life_enslaved = false;
player setVariable["enslaved",true,true];
sleep (30 * 60);
player setVariable["enslaved",false,true];
hint "Watch out! You can be enslaved again!"; 