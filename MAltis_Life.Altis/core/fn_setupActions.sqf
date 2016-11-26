/*
	File: fn_setupActions.sqf
	Author: UnNamed
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		
		life_actions = life_actions + [player addAction["Suicide Bomb Initiate",life_fnc_suicideBomb,"",0,false,false,"",
        'vest player == "V_HarnessOGL_gry" && alive player && (vehicle player == player) && playerSide == civilian && !life_isDowned && !life_isSuicide && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
	    life_actions = life_actions + [player addAction["Sell Hostage",life_fnc_sellHostage,"",0,false,false,"",'  !isNull cursorTarget && isPlayer cursorTarget && (side cursorTarget != independent) && (cursorTarget getVariable ["restrained",FALSE]) && alive cursorTarget && (player distance cursorTarget < 3.5) && ((player distance (getMarkerPos "slave_trader_marker") < 10)) && !(cursorTarget getVariable ["escorting",FALSE]) ']];

	};
	
	case west:
	{
		//Cop Enter
		life_actions = life_actions + [player addAction["Cop Enter as Driver",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 5']];
		life_actions = life_actions + [player addAction["Cop Enter as Passenger",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 5 && (!(cursorTarget isKindOf "B_Heli_Attack_01_F"))']]; 
		life_actions = life_actions + [player addAction["Exit",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']]; 
		//Seize Objects
		life_actions = life_actions + [player addAction["Seize Objects",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'((count(nearestObjects [player,["WeaponHolder"],3])>0) || (count(nearestObjects [player,["GroundWeaponHolder"],3])>0) || (count(nearestObjects [player,["WeaponHolderSimulated"],3])>0))']];
		life_actions = life_actions + [player addAction["Load Taser Rounds",{player setVariable ['nonLethals',true,true];},"",0,false,false,"",'(!(player getVariable ["nonLethals",false])']];
		life_actions = life_actions + [player addAction["Load Lethal Rounds",{player setVariable ['nonLethals',false,true];},"",0,false,false,"",'((currentWeapon player != "hgun_P07_snds_F") && (currentWeapon player != "hgun_P07_F") && (player getVariable ["nonLethals",false]))']];
	};
	
	case independent:
	{
		//Medic Enter
		life_actions = life_actions + [player addAction["Medic Enter as Driver",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 5']];
		life_actions = life_actions + [player addAction["Medic Enter as Passenger",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 5 && (!(cursorTarget isKindOf "B_Heli_Attack_01_F"))']]; 
		life_actions = life_actions + [player addAction["Exit",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']]; 
		
	};
};