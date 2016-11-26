#define true 1
#define false 0

class DefaultEventhandlers;
class CfgPatches 
{
	class life_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "life_server.pbo";
		author[]= {"Tonic"}; 
	};
	
};

/*Server Settings*/

class CfgServerSettings
{
	class extDB
	{
		/*Database Selection*/
		Database = "AltisLife"; //Database config name
		/*RCON Settings*/
		RCON = false; //Enabled?
		RCON_Selection = "RCON"; //Selection of what RCON config to pull from the extDB Configuration file eg. [RCON]
		/*VAC Settings*/
		VAC = false; //Enabled? If you want to ban VAC'd players, edit it in the extDB Configuration file.
		/*MISC settings*/
		MISC = false; //Enabled? Allows you to use certain features that are not really related to the database for extDB
		/*Logging Settings*/
		LOG = false; //Custom Logging Enabled?
		LOG_Settings[] = {{"HACKER","hacker.log"},{"LOG2","debug.log"}}; //First Selection = ID | Second Selection = Log File
		/*Debug*/
		MySQL_Query = false; //Log queries? Only set this to true if you are developing.
	};
};

/*Functions*/

class CfgFunctions
{
	
	class Jail_Sys
	{
	file = "\life_server\Functions\Jail";
	class jailSys {};
	class jailTimer {};
	class jailPlayer {};
	};
	class BIS_Overwrite
	{
		tag = "BIS";
		class MP
		{
			file = "\life_server\Functions\MP";
			class initMultiplayer{};
			class call{};
			class spawn{};
			class execFSM{};
			class execVM{};
			class execRemote{};
			class addScore{};
			class setRespawnDelay{};
			class onPlayerConnected{};
			class initPlayable{};
			class missionTimeLeft{};
		};
	};
	
	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\life_server\Functions\MySQL";
			class numberSafe {};
			class mresArray {};
			class queryRequest{};
			class asyncCall{};
			class insertRequest{};
			class updateRequest{};
			class mresString{};
			class insertVehicle {};
			class bool{};
			class updatePartial {};
		};
	};
	
	class Life_System
	{
		tag = "life";
		class Custom
		{
			file = "\life_server\Functions\Custom";
			class spawnIllegalArea {};
		};
		class Wanted_Sys
		{
			file = "\life_server\Functions\WantedSystem";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedCrimes {};
			class wantedProfUpdate {};
			class wantedFetchForCivilian {};
			class wantedSyncList {};
		};
		
		class Jail_Sys
		{
			file = "\life_server\Functions\Jail";
			class jailSys {};
		};
		
		class Client_Code
		{
			file = "\life_server\Functions\Client";
		};
	};
	
	class TON_System
	{
		
		
		tag = "TON";
		class Systems
		{
			file = "\life_server\Functions\Systems";
			class managesc {};
			class cleanup {};
			class huntingZone {};
			class getID {};
			class vehicleCreate {};
			class vehicleDead {};
			class spawnVehicle {};
			class getVehicles {};
			class vehicleStore {};
			class vehicleDelete {};
			class spikeStrip {};
			class logIt {};
			class federalUpdate {};
			class chopShopSell {};
			class clientDisconnect {};
			class cleanupRequest {};
			class setObjVar {};
			class keyManagement {};
			class vehicleisdead {};
            class getPrices {};
            class ajustprices {};
            class loadPrices {};
            class syncPrices {};
            class blowSafe {};
		};

        class Airdrop
		{
			file = "\life_server\Functions\airdrop";
			class generateAirdrop {};
		};
		class cargoUpdate {};
		class goldUpdate {};
		class Housing
		{
			file = "\life_server\Functions\Housing";
			class addHouse {};
			class fetchPlayerHouses {};
			class initHouses {};
			class sellHouse {};
			class updateHouseContainers {};
			class updateHouseTrunk {};
			class houseCleanup {};
			class preCheckHouse {};
		};
		
		class Gangs
		{
			file = "\life_server\Functions\Gangs";
			class insertGang {};
			class queryPlayerGang {};
			class removeGang {};
			class updateGang {};
			class capZones {};
		};
		
		class Actions
		{
			file = "\life_server\Functions\Actions";
			class pickupAction {};
		};
		
		class Smartphone
		{
			file = "\life_server\Functions\Smartphone";
			class handleMessages {};
			class msgRequest {};
			class cleanupMessages {};
		};
		class pauction
		{
			file = "\life_server\Functions\pauction";
			class SAH_addOffer {};
			class SAH_removeOffer {};
			class SAH_checkPID {};
			class SAH_reciever {};
			class SAH_Transaction {};
			class SAH_looper {};
		};
		class Taxi
		{
			file = "\life_server\Functions\Taxi";
			class callTaxiDrivers {};
			class acceptedTaxiCall {};
			class goOnDuty {};
		};
		class VehicleUpgrades
		{
			file = "\life_server\Functions\VehicleUpgrades";
			class updateUpgrades {};
			class changeSlingLoad {};
		};
		class Admin
		{
			file = "\life_server\Functions\Admin";
			class toggleInvisible {};
			class restorePlayers {};
		};
	};
};

class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};
	
	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\fix_headgear.sqf""";
		};
	};
};