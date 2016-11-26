#include "script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the server and required systems.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
life_server_extDB_notLoaded = "";
serv_sv_use = [];
PVAR_ALL("life_server_isReady");

/*
	Prepare extDB before starting the initialization process
	for the server.
*/
if(isNil {GVAR_UINS "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	CONSTVAR(life_sql_id);
	SVAR_UINS ["life_sql_id",life_sql_id];
	
	//Retrieve extDB version
	_result = EXTDB "9:VERSION";
	["diag_log",[format["extDB: Version: %1",_result]]] call TON_fnc_logIt;
	if(EQUAL(_result,"")) exitWith {EXTDB_FAILED("The server-side extension extDB was not loaded into the engine, report this to the server admin.")};
	if ((parseNumber _result) < 35) exitWith {EXTDB_FAILED("extDB version is not compatible with current Altis life version. Require version 35 or higher.")};
	//Lets start logging in extDB
	EXTDB "9:ADD:LOG:SPY_LOG:spyglass.log";
	//Initialize connection to Database
	_result = EXTDB format["9:DATABASE:%1",DATABASE_SELECTION];
	if(!(EQUAL(_result,"[1]"))) exitWith {EXTDB_FAILED("extDB: Error with Database Connection")};
	_result = EXTDB format["9:ADD:DB_CUSTOM_v5:%1:altis-life-rpg-4",FETCH_CONST(life_sql_id)];
	if(!(EQUAL(_result,"[1]"))) exitWith {EXTDB_FAILED("extDB: Error with Database Connection")};
	//Initialize Logging options from extDB
	if((EQUAL(EXTDB_SETTINGS("LOG"),1))) then {
		{
			EXTDB format["9:ADD:LOG:%1:%2",SEL(_x,0),SEL(_x,1)];
			["diag_log",[format["extDB: %1 is successfully added",SEL(_x,0)]]] call TON_fnc_logIt;
		} forEach EXTDB_LOGAR;
	};
	//Initialize RCON options from extDB
	if((EQUAL(EXTDB_SETTINGS("RCON"),1))) then {
		RCON_ID = round(random(9999));
		CONSTVAR(RCON_ID);
		SVAR_UINS ["RCON_ID",RCON_ID];

		EXTDB format["9:START_RCON:%1",RCON_SELECTION];
		EXTDB format["9:ADD:RCON:%1",FETCH_CONST(RCON_ID)];
		["diag_log",["extDB: RCON is enabled"]] call TON_fnc_logIt;
	};
	//Initialize VAC options from extDB
	if((EQUAL(EXTDB_SETTINGS("VAC"),1))) then {
		VAC_ID = round(random(9999));
		CONSTVAR(VAC_ID);
		SVAR_UINS ["VAC_ID",VAC_ID];

		EXTDB "9:START_VAC";
		EXTDB format["9:ADD:VAC:%1",FETCH_CONST(VAC_ID)];
		["diag_log",["extDB: VAC is enabled"]] call TON_fnc_logIt;
	};
	//Initialize MISC options from extDB
	if((EQUAL(EXTDB_SETTINGS("MISC"),1))) then {
		MISC_ID = round(random(9999));
		CONSTVAR(MISC_ID);
		SVAR_UINS ["MISC_ID",MISC_ID];

		EXTDB format["9:ADD:MISC:%1",FETCH_CONST(MISC_ID)];
		["diag_log",["extDB: MISC is enabled"]] call TON_fnc_logIt;
	};
	EXTDB "9:LOCK";
	["diag_log",["extDB: Connected to the Database"]] call TON_fnc_logIt;
} else {
	life_sql_id = GVAR_UINS "life_sql_id";
	CONSTVAR(life_sql_id);
	["diag_log",["extDB: Still Connected to the Database"]] call TON_fnc_logIt;
	if((EQUAL(EXTDB_SETTINGS("RCON"),1))) then {
		RCON_ID = GVAR_UINS "RCON_ID";
		CONSTVAR(RCON_ID);
		["diag_log",["extDB: RCON still enabled"]] call TON_fnc_logIt;
	};
	if((EQUAL(EXTDB_SETTINGS("VAC"),1))) then {
		VAC_ID = GVAR_UINS "VAC_ID";
		CONSTVAR(VAC_ID);
		["diag_log",["extDB: VAC still enabled"]] call TON_fnc_logIt;
	};
	if((EQUAL(EXTDB_SETTINGS("MISC"),1))) then {
		MISC_ID = GVAR_UINS "MISC_ID";
		CONSTVAR(MISC_ID);
		["diag_log",["extDB: MISC still enabled"]] call TON_fnc_logIt;
	};
};

if(!(EQUAL(life_server_extDB_notLoaded,""))) exitWith {}; //extDB did not fully initialize so terminate the rest of the initialization process.

/* Run stored procedures for SQL side cleanup */
["resetLifeVehicles",1] spawn DB_fnc_asyncCall;
["deleteDeadVehicles",1] spawn DB_fnc_asyncCall;
["deleteOldHouses",1] spawn DB_fnc_asyncCall;
["deleteOldGangs",1] spawn DB_fnc_asyncCall;


/* Map-based server side initialization. */
master_group attachTo[bank_obj,[0,0,0]];
onMapSingleClick "if(_alt) then {vehicle player setPos _pos};"; //Local debug for myself


{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

[8,true,12] execFSM "\life_server\FSM\timeModule.fsm";

life_adminLevel = 0;
life_medicLevel = 0;
life_copLevel = 0;
CONST(JxMxE_PublishVehicle,"false");

/* Setup radio channels for west/independent/civilian */
life_radio_west =  [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

/* Set the amount of gold in the federal reserve at mission start */
fed_bank setVariable ["safe",count playableUnits,true];
//[] spawn TON_fnc_federalUpdate;

/* Event handler for disconnecting players */
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];
[] call compile PreProcessFileLineNumbers "\life_server\functions.sqf";
[] call compile PreProcessFileLineNumbers "\life_server\eventhandlers.sqf";
[] call compile preProcessFileLineNumbers "\life_server\SHK_pos\shk_pos_init.sqf";


/* Miscellaneous mission-required stuff */
[] spawn TON_fnc_cleanup;
life_gang_list = [];
publicVariable "life_gang_list";
life_wanted_list = [];
[] execFSM "\life_server\FSM\cleanup.fsm";

//Custom Content
[] execVM "\life_server\Functions\Custom\fn_spawnIllegalArea.sqf"; //Revolving Drug Fields
[] execVM "\life_server\Functions\Custom\fn_spawnGold.sqf";
call compile preProcessFileLineNumbers "\life_server\SHK_pos\shk_pos_init.sqf";
gold_safe setVariable["gold",round(random 50),true];
[] execVM "\life_server\Functions\Custom\fn_spawnCargo.sqf";
heli_safe setVariable["cargo",round(random 50),true];
[] spawn TON_fnc_goldUpdate;

[] execVM "\life_server\Functions\airdrop\config.sqf";
[] execVM "\life_server\Functions\airdrop\fn_generateAirdropAuto.sqf";

pb_spieler = [];
pb_spielstatus = 0;
pb_maxspieler = 10;

[] execVM "\life_server\Functions\pauction\fn_SAH_looper.sqf";


[] spawn
{
	private["_logic","_queue"];
	while {true} do {
		sleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];
		
		{
			_x setVariable["sellers",[],true];
		} foreach [Dealer_1,Dealer_2,Dealer_3,Dealer_4,Dealer_5,Dealer_6];
	};
};
master_group attachTo[bank_obj,[0,0,0]];
{
	_hs = createVehicle ["Land_Hospital_main_F", [0,0,0], [], 0, "NONE"];
	_hs setDir (markerDir _x);
	_hs setPosATL (getMarkerPos _x);
	_var = createVehicle ["Land_Hospital_side1_F", [0,0,0], [], 0, "NONE"];
	_var attachTo [_hs, [4.69775,32.6045,-0.1125]];
	detach _var;
	_var = createVehicle ["Land_Hospital_side2_F", [0,0,0], [], 0, "NONE"];
	_var attachTo [_hs, [-28.0336,-10.0317,0.0889387]];
	detach _var;
} foreach ["hospital_2","hospital_3"];

[] spawn TON_fnc_initHouses;

/* Setup the federal reserve building(s) */
private["_dome","_rsb"];
_dome = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];
_rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
_rsb setVariable["bis_disabled_Door_1",1,true];
_rsb allowDamage false;
_dome allowDamage false;
/* Setup the federal Armory building(s) */
private["_dome","_rsb"];
_armdome = nearestObject [[getPosATL fed_arm select 0, getPosATL fed_arm select 1, 0],"Land_Dome_Small_F"];
_rsbarm = nearestObject [[getPosATL fed_arm select 0, getPosATL fed_arm select 1, 0],"Land_Cargo_HQ_V1_F"];
for "_i" from 1 to 3 do {_armdome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _armdome animate [format["Door_%1_rot",_i],0];};
_rsbarm setVariable["bis_disabled_Door_1",1,true];
_rsbarm setVariable["bis_disabled_Door_2",1,true];
_rsbarm allowDamage false;
_armdome allowDamage false;
setDate [2015, 6, 25, 8, 0];
/* Tell clients that the server is ready and is accepting queries */
life_server_isReady = true;
PVAR_ALL("life_server_isReady");




/* Initialize the economy */

[] spawn TON_fnc_syncPrices;

wantedList = [];
publicVariable "wantedList";
/* Initialize the wanted list */
[] spawn {
	while {true} do {
		life_wantedsync = time;
		sleep (4*60);
		[] spawn life_fnc_wantedSyncList;
	};
};
[] spawn TON_fnc_capZones;