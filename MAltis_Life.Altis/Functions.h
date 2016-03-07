class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
	};
};

class Life_Client_Core
{
	tag = "life";
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		class welcomeNotification {};
		class survival {};
	};
	
	class tempGangs
	{
		file = "core\tempGangs";
		class createGroup {};
		class gangBrowser {};
		class gangManagement {};
		class groupMenu {};
		class joinGang {};
		class kickGang {};
		class leaveGang {};
		class setGangLeader {};
		class lockGang {};
		class unlockGang {};
	};	
	
	
	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};
		class adminSpectate {};
		class adminTeleport {};
		class adminTpHere {};
		class adminDebugCon {};
		class adminCompensate {};
		class adminGodMode {};
		class adminFreeze {};
		class adminMarkers {};
		class adminInvisibility {};
		class adminRevive {};
	};
	
	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
		class newLifeRule {};
		class pulloutDead {};
	};
	
	class Actions
	{
		file = "core\actions";
		class surrender {}; //Surrender action
		class buyLicense {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class packupSpikes {};
		class storeVehicle {};
		class robAction {};
		class captureHideout {};
		class captureRebelHideout {};
		class gather {};
		class gutAnimal {};
		class copPullOutAction {};
		class robShops {};
		class skyDiving {};
		class jailBreakout {}; 
		class jailBreakoutCompleted {};
		class suicideBomb {};
		class douevenlift {};
		class douevenliftjail {};
	};
	
	class Paintball
	{
		file = "core\paintball";
		class pb_response {};
	};
	
	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class lockHouse {};
		class garageRefund {};
		class boughtHouse{};
		class boughtHouseFail{};
		class openHouseVInv {};
		class displayStats {};
		class swapItem {};
	};
	
	class Config
	{
		file = "core\config";
		class itemWeight {};
		class taxRate {};
		class vehicleAnimate {};
		class vehicleWeightCfg {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class wantedAddP {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class s_onChar {};
		class s_onCheckedChange {};
		class smartphone {};
		class newMsg {};
		class showMsg {};
		class AAN {};
		class revokeLicense {};
		class updateBounty {};
		class vUseItem {};
		class p_prisionbreak {};
	};
	
	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class saveGear {};
		class loadGear {};
		class stripDownPlayer {};
		class nearATM {};
		class earplugs {};
		class handleDowned {};
		class emptyFuel {};
		class CarAlarmSound {};
		class Info {};
		class speaking {};
		class Uniformscolor {};
		class prisionbreak {};
		class progressBaren {};
		class ryn_message {};
		class collectArmaItems {};
	};
	class pauction
	{
   	file = "core\pauction";
   	class CAH_Sell {};
   	class CAH_Buy {};
   	class CAH_reciever {};
   	class CAH_getPlayerObj {};
   	class CAH_loadOffers {};
   	class CAH_loadInventory {};
   	class CAH_fetchDetails {};
   	class CAH_loggedIn {};
	};
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class demoChargeTimer {};
		class civLoadout {};
		class civInteractionMenu {}; //civ interaction menu
		class freezePlayer {};
		class breakoutTimer {};
		class waterChargeTimer {};
		class heliChargeTimer {};
		
	};
	
	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};
		class civVinteractionMenu {};
		class medVinteractionMenu {};
		class blinkerinit {};
		class blinkerleft {};
		class blinkerright {};
		class warnblinker {};
		class upgradeMenu {};
		class upgradeMenuChange {};
		class upgradeVehicle {};
		class toggleGPS {};
		class lowerCenter {};
	};
	
	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copLoadout {};
		class ticketPaid {};
		class wantedGrab {};
		class copOpener {};
		class seizeAction {};
		class seizePlayerWeaponAction {};
		class seizePlayerWeapon {};
		class seizeObjects {};
		class copEnter {};
		class copSiren2 {};
		class showArrestDialog {}; 
		class arrestDialog_Arrest {};
		class breathalyzer {};
		class copHorn {};
		
	};
	
	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewLeader {};
		class gangUpgrade {};
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
		class gangMarkers {};
		class updateGangInfo {};
		class gangDemote {};
		class updateGangHouse {};
	};
	
	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		
	};
	
	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class heroine {};
		class cocaine {};
		class weed {};
		class bankalarmsound {};
		class underwaterCharge {};
		class heliblastCharge {};
		class gpsTracker {};
		class speedbomb {};
		class drinkbeer {};
		class drinkmoonshine {};
		class drinkwhiskey {};
	};
	
	class Scripts
	{
		file = "scripts";
		class vdmWatcher {};
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		class wireTransfer {};
		class calldialog {};
		class sendChannel {};		
		class safeInvGold {};
		class safeGold {};
		class goldTake {};
		class safeInvCargo {};
		class safeCargo {};
		class cargoTake {};
	};
	
	class Cam
	{
	   file ="core";
	   class IntroCam {};
	};
	class Foamy_Slavery
	{
		file = "core\slavery";
		class getoutofSlavery {};
		class sellHostage {};
		class sellHostageAction {};
	};

	
	class economy
	{
		file = "core\economy";
		class virt_updatePrice {};
		class addsubstract {};
		class openEconomy {};
		class virt_updateEconomy {};
		class marketGrab {};
		class retrievePrices {};
	};
};