#include <macro.h>
/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
//Reset our weight and other stuff
life_use_atm = TRUE;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
CASH = 0; //Make sure we don't get our cash back.
life_respawned = false;
player playMove "amovpercmstpsnonwnondnon";

life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["Reviving",nil,TRUE];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

diag_log "Called respawned";

//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {
		If(BANK > 15000) then {BANK = BANK - 15000;};
		_handle = [] spawn life_fnc_loadgear;
		 
	};
	case civilian: {
		_handle = [] spawn life_fnc_civLoadout;
		 If(BANK > 1000000) then {BANK = BANK - 3000;};
	};
	case independent: {
		diag_log "Calling medic loadout from respawned";
		_handle = [] spawn life_fnc_medicLoadout;
		
	};
	waitUntil {scriptDone _handle};
};
[] call life_fnc_Uniformscolor;

//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	private "_containers";
	life_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	hideBody life_corpse;
};

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bad boy
if(life_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	life_is_arrested = false;
	[player,TRUE] spawn life_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
/*
if(!isNil "life_copRecieve") then {
	[[getPlayerUID player,player,life_copRecieve,true],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
	life_copRecieve = nil;
};
cops no longer recieve bounties for lethals 4/23/2015 Derek
*/
//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(life_removeWanted) then {
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	//[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
};

[] call SOCK_fnc_updateRequest;
life_last_sync = time;
[] call life_fnc_hudUpdate; //Request update of hud.
[] spawn {
    waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	life_is_alive = true;
};