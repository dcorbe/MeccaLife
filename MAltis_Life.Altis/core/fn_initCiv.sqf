#include <macro.h>
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_spawnPos","_playerPosition"];
_playerPosition = last_known_position;
diag_log format ["fn_initCiv(_playerPosition): %1",_playerPosition];
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
waitUntil {!(isNull (findDisplay 46))};

_playerPosition set [2,0];

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
else
{
        if (life_is_alive) then
        {
                cutText ["","BLACK IN"];
                player setPos _playerPosition;
                hint format["You are still alive.  You've been spawned at your last known position."];
                [] call life_fnc_hudSetup;
        }
        else
        {
                [] call life_fnc_spawnMenu;
                waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
                waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
                life_is_alive = true;
        };
};
life_is_alive = true;
player addRating 9999999;

if((str(player) in ["civ_9999","civ_99999"])) then {
	if!(FETCH_CONST(life_adminlevel) == 2) then {
				["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

player setVariable["rprank",(FETCH_CONST(life_rpLevel)),true];

//[[],"life_fnc_wantedSyncList",false, false] spawn life_fnc_MP;

[] spawn {
        while {true} do {
                //[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
                [] spawn life_fnc_updateBounty;
                sleep 10;
        };
};

life_norevive = false;