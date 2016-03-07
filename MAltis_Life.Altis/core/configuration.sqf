#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 1; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_vdFoot = viewDistance;
life_vdCar = viewDistance;
life_vdAir = viewDistance;
tawvd_addon_disable = true;
life_earplugs = false;
life_is_alive = false;
life_siren2_active = false;
life_fake_weapons = ["Binocular","Laserdesignator","Rangefinder"];
mecca_vdm_watcher_count = 0;
mecca_wanted_status = 0;
life_hudStarted = false;
life_isSuicide = false;
life_redgull_effect = time;
life_TankLaster = 1; //able to load anything?
last_known_position = [];
diag_log format ["configuration.sqf: last_known_position currently unknown"];
life_drink = 0;
life_my_gang = ObjNull;
life_enslaved = false;


life_noname_clothing = [
	"U_I_GhillieSuit",
	"U_O_GhillieSuit",
	"U_B_GhillieSuit",
	"U_B_FullGhillie_lsh",
	"U_O_FullGhillie_lsh",
	"U_I_FullGhillie_lsh",
	"U_B_FullGhillie_sard",
	"U_O_FullGhillie_sard",
	"U_I_FullGhillie_sard",
	"U_B_FullGhillie_ard",
	"U_O_FullGhillie_ard",
	"U_I_FullGhillie_ard"
];

life_hidden_clothing = [
	"H_Shemag_khk",
	"H_Shemag_tan",
	"H_Shemag_olive",
	"H_Shemag_olive_hs",
	"H_ShemagOpen_khk",
	"H_ShemagOpen_tan",
	"G_Balaclava_lowprofile",
	"G_Balaclava_combat",
	"G_Bandanna_beast",
	"U_O_GhillieSuit",
	"U_I_GhillieSuit",
	"U_B_GhillieSuit",
	"U_B_FullGhillie_lsh",
	"U_O_FullGhillie_lsh",
	"U_I_FullGhillie_lsh",
	"U_B_FullGhillie_sard",
	"U_O_FullGhillie_sard",
	"U_I_FullGhillie_sard",
	"U_B_FullGhillie_ard",
	"U_O_FullGhillie_ard",
	"U_I_FullGhillie_ard"
	
];

life_god = false; 
life_frozen = false; 
life_markers = false;
life_channel_send = true; //Channel 7


//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
life_maxWeightT = LIFE_SETTINGS(getNumber,"total_maxWeightT");
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_thirst = 100;
life_hunger = 100;
CASH = 0;
life_nlrtimer_running = false;
life_nlrtimer_stop = false;

life_isDowned = false;
life_vehicles = [];
life_smartphoneTarget = ObjNull;

switch (playerSide) do {
	case west: {
		BANK = 35000; //Starting Bank Money
		life_paycheck = 1200; //Paycheck Amount
	};
	
	case civilian: {
		BANK = 35000; //Starting Bank Money
		life_paycheck = 1200; //Paycheck Amount
	};
	
	case independent: {
		BANK = 35000;
		life_paycheck = 1200;
	};
};

/*
	Master Array of items?
*/
//Setup variable inv vars.
{
	SVAR_MNS [ITEM_VARNAME(configName _x),0];
} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));

/* Setup the BLAH! */
{
	_varName = getText(_x >> "variable");
	_sideFlag = getText(_x >> "side");
	
	SVAR_MNS [LICENSE_VARNAME(_varName,_sideFlag),false];
} foreach ("true" configClasses (missionConfigFile >> "Licenses"));

/* Safe Zones
["markername", safe_radius] */
life_safe_points =
	[
		["safezone1", 250],
		["safezone2", 250]
	];
__CONST__(life_safe_points,life_safe_points);