#include "\life_server\script_macros.hpp"
/*
    Author: Derek,UnNamed,Murali
    
    File: fn_blowSafe.sqf

    Description: Handles the explosion of a blasting charge
    
*/
private["_safe","_delay","_numbars","_bomb","_units","_marker"];
_safe=[_this,0,"",[""]] call BIS_fnc_param;
_delay=[_this,1,0,[0]] call BIS_fnc_param;

life_armbox = createVehicle ["CargoNet_01_box_F", getMarkerPos "fed_arm", [], 0, "CAN_COLLIDE"];
life_armbox allowDamage false;
life_armbox hideObjectGlobal true;
_box=life_armbox;
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["hgun_ACPC2_F", 1];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addMagazineCargoGlobal ["9Rnd_45ACP_Mag", 1];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["hgun_Pistol_heavy_02_F", 2];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addMagazineCargoGlobal ["6Rnd_45ACP_Cylinder", 2];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_Katiba_F", 2];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_65x39_caseless_green", 2];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_SDAR_F", 2];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 2];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addMagazineCargoGlobal ["20Rnd_556x45_UW_mag", 2];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["hgun_PDW2000_F", 2];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["30Rnd_9x21_Mag", 2];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["SMG_01_F", 2];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_45ACP_Mag_SMG_01", 2];};
sleep 0.1;
_var=floor(random 100);
if (_var==1) then {_box addMagazineCargoGlobal ["Titan_AA", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["launch_Titan_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["launch_RPG32_F", 1];};
sleep 0.1;
_var=floor(random 100);
if (_var==1) then {_box addMagazineCargoGlobal ["RPG32_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["srifle_GM6_F", 1];};
sleep 0.1;
<<<<<<< HEAD
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["5Rnd_127x108_Mag", 1];};
=======
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["5Rnd_127x108_Mag", 1];};
>>>>>>> origin/master
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_Mk20C_F", 1];};
sleep 0.1;
<<<<<<< HEAD
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 1];};
=======
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["30Rnd_556x45_Stanag", 1];};
>>>>>>> origin/master
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["srifle_GM6_camo_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["srifle_LRR_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["srifle_LRR_camo_F", 1];};
sleep 0.1;
<<<<<<< HEAD
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["7Rnd_408_Mag", 1];};
=======
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["7Rnd_408_Mag", 1];};
>>>>>>> origin/master
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["srifle_DMR_02_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["srifle_DMR_02_camo_F", 1];};
sleep 0.1;
<<<<<<< HEAD
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["10Rnd_338_Mag", 1];};
=======
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["10Rnd_338_Mag", 1];};
>>>>>>> origin/master
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["srifle_DMR_04_F", 1];};
sleep 0.1;
<<<<<<< HEAD
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["10Rnd_127x54_Mag", 1];};
=======
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["10Rnd_127x54_Mag", 1];};
>>>>>>> origin/master
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["srifle_DMR_05_blk_F", 1];};
sleep 0.1;
<<<<<<< HEAD
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["10Rnd_93x64_DMR_05_Mag", 1];};
=======
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["10Rnd_93x64_DMR_05_Mag", 1];};
>>>>>>> origin/master
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["MMG_01_hex_F", 1];};
sleep 0.1;
<<<<<<< HEAD
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["150Rnd_93x64_Mag", 1];};
=======
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["150Rnd_93x64_Mag", 1];};
>>>>>>> origin/master
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["MMG_02_black_F", 1];};
sleep 0.1;
<<<<<<< HEAD
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["130Rnd_338_Mag", 1];};
=======
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["130Rnd_338_Mag", 1];};
>>>>>>> origin/master
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["LMG_Zafir_F", 1];};
sleep 0.1;
<<<<<<< HEAD
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["150Rnd_762x54_Box", 1];};
=======
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["150Rnd_762x54_Box", 1];};
>>>>>>> origin/master
sleep 0.1;
_var=floor(random 5);
if (_var==1) then {_box addItemCargoGlobal ["muzzle_snds_H", 1];};
sleep 0.1;
_var=floor(random 5);
if (_var==1) then {_box addItemCargoGlobal ["muzzle_snds_L", 1];};
sleep 0.1;
_var=floor(random 5);
if (_var==1) then {_box addItemCargoGlobal ["muzzle_snds_B", 1];};
sleep 0.1;
_var=floor(random 5);
if (_var==1) then {_box addItemCargoGlobal ["muzzle_snds_acp", 1];};
sleep 0.1;
_var=floor(random 5);
if (_var==1) then {_box addItemCargoGlobal ["muzzle_snds_93mmg", 1];};
sleep 0.1;
_var=floor(random 10000);
if (_var==1) then {_box addItemCargoGlobal ["optic_Nightstalker", 1];};
sleep 0.1;
_var=floor(random 100);
if (_var==1) then {_box addItemCargoGlobal ["optic_LRPS", 1];};
sleep 0.1;
_var=floor(random 10000);
if (_var==1) then {_box addItemCargoGlobal ["optic_NVS", 1];};
sleep 0.1;
_var=floor(random 10000);
if (_var==1) then {_box addItemCargoGlobal ["optic_tws", 1];};
sleep 0.1;
_var=floor(random 10000);
if (_var==1) then {_box addItemCargoGlobal ["optic_tws_mg", 1];};
sleep 0.1;
_var=floor(random 100);
if (_var==1) then {_box addItemCargoGlobal ["optic_SOS", 1];};
sleep 0.1;
_var=floor(random 5);
if (_var==1) then {_box addItemCargoGlobal ["optic_DMS", 1];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 1];};
sleep 0.1;
_var=floor(random 300);
if (_var==1) then {_box addWeaponCargoGlobal ["SatchelCharge_Remote_Mag", 1];};
sleep 0.1;
_var=floor(random 35);
if (_var==1) then {_box addWeaponCargoGlobal ["H_PilotHelmetFighter_B", 1];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["V_PlateCarrierGL_blk", 1];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["V_PlateCarrierSpec_blk", 1];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["DemoCharge_Remote_Mag", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_SPAR_02_khk_F", 1];};
sleep 0.1;
<<<<<<< HEAD
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["150Rnd_556x45_Drum_Mag_F", 1];};
=======
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["150Rnd_556x45_Drum_Mag_F", 1];};
>>>>>>> origin/master
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_SPAR_03_khk_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["20Rnd_762x51_Mag", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_CTARS_hex_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["100Rnd_580x42_Mag_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_ARX_Viper_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_65x39_caseless_green", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_AKS_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_545x39_Mag_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_AKM_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_762x39_Mag_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_AK12_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_762x39_Mag_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["hgun_Pistol_01_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["10Rnd_9x21_Mag", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["LMG_03_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["200Rnd_556x45_Box_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addWeaponCargoGlobal ["launch_RPG7_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["RPG7_F", 1];};
sleep 0.1;
_var=floor(random 10);
if (_var==1) then {_box addMagazineCargoGlobal ["RPG32_F", 1];};
sleep 0.1;

switch (_safe) do {
    case "fed" : 
    {
         _marker = createMarker ["fed_dot", [16086.5,17000,0]];
        "fed_dot" setMarkerColor "ColorRed";
        "fed_dot" setMarkerText "The Federal Reserve is being robbed!";
        "fed_dot" setMarkerType "mil_dot";
        
        _marker = createMarker ["fed_redZone", [16086.5,17000,0]];
        "fed_redZone" setMarkerColor "ColorRed";
        "fed_redZone" setMarkerShape "ELLIPSE";
        "fed_redZone" setMarkerSize [350, 350];
        "fed_redZone" setMarkerBrush "DiagGrid";
        
        [] spawn {
            while {true} do {
                sleep 5;
                if (!(fed_bank getVariable["chargeplaced",false]) && (!(fed_bank getVariable["safe_open",false]))) then {
                    deleteMarker "fed_redZone";
                    deleteMarker "fed_dot";
                };
            };
        };
        sleep(_delay*60+1);
        if(!(fed_bank getVariable["chargeplaced",false])) exitWith {};
        _bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
        fed_bank setVariable["chargeplaced",false,true];
        fed_bank setVariable["safe_open",true,true];
        _units = count playableUnits;
        _numbars = round(_units + random(3*_units));
        if (_numbars < 20) then {
        	_numbars = 20;
        };
        fed_bank setVariable["safe",_numbars,true];
        fed_bank setVariable["lastrobbery",time,true];
    };
	case "arm" : 
    {
         _marker = createMarker ["arm_dot", [getPosATL fed_arm select 0, getPosATL fed_arm select 1, 0]];
        "arm_dot" setMarkerColor "ColorRed";
        "arm_dot" setMarkerText "The Federal Armory is being robbed!";
        "arm_dot" setMarkerType "mil_dot";
        
        _marker = createMarker ["arm_redZone", [getPosATL fed_arm select 0, getPosATL fed_arm select 1, 0]];
        "arm_redZone" setMarkerColor "ColorRed";
        "arm_redZone" setMarkerShape "ELLIPSE";
        "arm_redZone" setMarkerSize [350, 350];
        "arm_redZone" setMarkerBrush "DiagGrid";
        
        [] spawn {
            while {true} do {
                sleep 5;
                if (!(fed_arm getVariable["chargeplaced",false]) && (!(fed_arm getVariable["safe_open",false]))) then {
                    deleteMarker "arm_redZone";
                    deleteMarker "arm_dot";
                };
            };
        };
        sleep(_delay*60);
        if(!(fed_arm getVariable["chargeplaced",false])) exitWith {};
        _bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_arm select 0, getPosATL fed_arm select 1, (getPosATL fed_arm select 2)+0.5];
        fed_arm setVariable["chargeplaced",false,true];
        fed_arm setVariable["safe_open",true,true];
        _units = count playableUnits;
        _numbars=0;
		_armbox=life_armbox;
		_armbox hideObjectGlobal false;		
        fed_arm setVariable["safe",_numbars,true];
        fed_arm setVariable["lastrobbery",time,true];
		
    };
		case "pharm" : 
    {
         _marker = createMarker ["pharm_dot", [getPosATL fed_pharm select 0, getPosATL fed_pharm select 1, 0]];
        "pharm_dot" setMarkerColor "ColorRed";
        "pharm_dot" setMarkerText "The Mecca Pharmaceutical is being robbed!";
        "pharm_dot" setMarkerType "mil_dot";
        
        _marker = createMarker ["pharm_redZone", [getPosATL fed_pharm select 0, getPosATL fed_pharm select 1, 0]];
        "pharm_redZone" setMarkerColor "ColorRed";
        "pharm_redZone" setMarkerShape "ELLIPSE";
        "pharm_redZone" setMarkerSize [350, 350];
        "pharm_redZone" setMarkerBrush "DiagGrid";
        
        [] spawn {
            while {true} do {
                sleep 5;
                if (!(fed_pharm getVariable["chargeplaced",false]) && (!(fed_pharm getVariable["safe_open",false]))) then {
                    deleteMarker "pharm_redZone";
                    deleteMarker "pharm_dot";
                };
            };
        };
        sleep(_delay*60+1);
        if(!(fed_pharm getVariable["chargeplaced",false])) exitWith {};
		_meth = createMarker ["meth", [getPosATL fed_pharm select 0, getPosATL fed_pharm select 1, getPosATL fed_pharm select 2]];  
		"meth" setMarkerShape "ICON";  
		"meth" setMarkerType "mil_dot";  
		"meth" setMarkerColor "ColorRed";  
		"meth" setMarkerText "Grab The Chemicals!";       

	   _bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_pharm select 0, getPosATL fed_pharm select 1, (getPosATL fed_pharm select 2)+0.5];
        fed_pharm setVariable["chargeplaced",false,true];
        fed_pharm setVariable["safe_open",true,true];
        _units = count playableUnits;
        _numbars=0;
	
        	
        fed_pharm setVariable["safe",_numbars,true];
        fed_pharm setVariable["lastrobbery",time,true];
		
    };
};