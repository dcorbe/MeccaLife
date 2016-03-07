/*
	File: fn_sellHostageAction.sqf
	@Foamy
	www.strainonline.com
	Description:
	Player Sale Action.
*/
#include <macro.h>
private["_unit","_noesckey"];

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; // There is no spoon
if(life_enslaved) exitWith {hint "This player has recently been enslaved, you must wait until their timer is up to enslave them again!"}; // Target already Enslaved

// Disable Esc key
//_noesckey = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];

// Send player to slave pen
player setPos (getMarkerPos "slave_trader_center"); 

// Release the player
player setVariable["restrained",false,true];
player setVariable["escorting",false,true];
player setVariable["transporting",false,true];
//player setVariable["hostage",false,true];

// Set enslaved
player setVariable["enslaved",true,true];
life_enslaved = true;

titleText["You have been sold into slavery, time to earn your way out of this! Use Windows Key to pick Tobacco and Prepare cigarettes!","PLAIN"];
hint "You have been sold into slavery, time to earn your way out of this! Use Windows Key to pick Tobacco and Prepare cigarettes!";
sleep 15;
slave_task1 = player createSimpleTask ["slave_task_1"];
slave_task1 setSimpleTaskDescription ["Roll 10 Cigarettes, Pick it, roll it and turn them in to gain your freedom.","Rolling your way to freedom",""];
slave_task1 setTaskState "Assigned";
player setCurrentTask slave_task1;

// Keep player in there
[] spawn 
{
	while {life_enslaved && alive player} do 
	{
		if(player distance (getMarkerPos "slave_trader_center") > 40) then
		{	
			player setPos (getMarkerPos "slave_trader_center");
		};
	};
};

waitUntil {!life_enslaved};
//(findDisplay 46) displayRemoveEventHandler ["KeyDown", _noesckey];