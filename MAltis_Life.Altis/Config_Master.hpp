#define VITEMMACRO(NAME,DISPLAYNAME,VARNAME,WEIGHT,BUYPRICE,SELLPRICE,ILLEGAL,EDIBLE,ICON) class NAME { \
		variable = VARNAME; \
		weight = WEIGHT; \
		displayName = DISPLAYNAME; \
		buyPrice = BUYPRICE; \
		sellPrice = SELLPRICE; \
		illegal = ILLEGAL; \
		edible = EDIBLE; \
		icon = ICON; \
	};
	
#define LICENSEMACRO(NAME,DISPLAYNAME,VARNAME,PRICE,ILLEGAL,SIDE) class NAME { \
		variable = VARNAME; \
		displayName = DISPLAYNAME; \
		price = PRICE; \
		illegal = ILLEGAL; \
		side = SIDE; \
	};

#define true 1
#define false 0
#include "Config_Clothing.hpp"
#include "Config_Shops.hpp"

/*
	Master settings for various features and functionality	
*/
class Life_Settings {
	/* Persistent Settings */
	save_civ_weapons = true; //Allow civilians to save weapons on them?
	save_virtualItems = true; //Save Virtual items (all sides)?

	/* Revive system settings */
	revive_cops = false; //true to enable cops the ability to revive everyone or false for only medics/ems.
	revive_fee = 15000; //Revive fee that players have to pay and medics / EMS are rewarded
	
	/* House related settings */
	house_limit = 5; //Maximum amount of houses a player can own.

	/* Gang related settings */
	gang_price = 15000; //Price for creating a gang, remember they are persistent so keep it reasonable to avoid millions of gangs.
	life_gangPrice = gang_price;
	gang_upgradeBase = 10000; //The base cost for upgrading slots in a gang
	gang_upgradeMultiplier = 2; //Not sure if in use?

	/* Player-related systems */
	enable_fatigue = true; //Set to false to disable the ARMA 3 false system.
	total_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
	total_maxWeightT = 24;  //Static variable for the maximum weight allowed without having a backpack
	paycheck_period = 5; //Scaled in minutes
	
	/* Impound Variables */
	impound_car = 350; //Price for impounding cars
	impound_boat = 250; //Price for impounding boats
	impound_air = 850; //Price for impounding helicopters / planes

	/* Car-shop Settings */
	vehicleShop_rentalOnly[] = { "B_MRAP_01_hmg_F"};

	/* Job-related stuff */
	delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };

	crimes[] = { 
		{"STR_Crime_1","2000","1"}, 
		{"STR_Crime_2","1500","2"}, 
		{"STR_Crime_3","2500","3"}, 
		{"STR_Crime_4","5000","4"}, 
		{"STR_Crime_5","10000","5"}, 
		{"STR_Crime_6","5000","6"}, 
		{"STR_Crime_7","10000","7"},
		{"STR_Crime_8","20000","8"},
		{"STR_Crime_9","30000","9"},
		{"STR_Crime_10","30000","10"},
		{"STR_Crime_11","2000","11"},
		{"STR_Crime_12","5000","12"},
		{"STR_Crime_13","8000","13"},
		{"STR_Crime_13A","4000","13A"},
		{"STR_Crime_14","120000","14"},
		{"STR_Crime_14A","20000","14A"},
		{"STR_Crime_459","15000","459"},
		{"STR_Crime_213","35000","213"},
		{"STR_Crime_390","45000","390"},
		{"STR_Crime_207A","50000","207A"},
		{"STR_Crime_667","55000","667"},
		{"STR_Crime_668","5000","668"},
		{"STR_Crime_5447","25000","5447"},
		{"STR_Crime_5489","25000","5489"},
		{"STR_Crime_1412","50000","1412"},
		{"STR_Crime_1337","50000","1337"},
		{"STR_Crime_13371","100000","13371"},
		{"STR_Crime_1018","5000","1018"},
		{"STR_Crime_4389","20000","4389"},
		{"STR_Crime_5894","25000","5894"},
		{"STR_Crime_4532","10000","4532"},
		{"STR_Crime_5217","10000","5217"},
		{"STR_Crime_5894","2000","5894"},
		{"STR_Crime_236","50000","236"}
	};
		
	sellArray[] = {
	};
	allowedSavedVirtualItems[] = { "pickaxe", "fuelEmpty", "fuelFull", "spikeStrip", "lockpick", "defuseKit", "storageSmall", 
									"storageBig", "redgull", "coffee", "waterBottle", "apple", "peach", "tbacon", "donut",
									"rabbitGrilled", "salemaGrilled", "ornateGrilled", "mackerelGrilled", "tunaGrilled",
									"mulletGrilled", "catsharkGrilled", "turtleSoup", "henGrilled", "roosterGrilled",
									"sheepGrilled", "goatGrilled","frog","marijuana","cannabis","froglsd","mushroom","magicm",
									"heroinUnprocessed","cocaineUnprocessed","heroinProcessed","cocaineProcessed","underwatercharge",
									"goldbarp","heliblastcharge","lostcargo","goldBar","blastingCharge","boltCutter","oilUnprocessed",
									"oilProcessed","copperUnrefined","copperRefined","ironUnrefined","ironRefined","saltUnrefined",
									"saltRefined","sand","glass","diamondUncut","diamondCut","rock","cement","mushroom","largesoda",
									"ziptie","gpstracker","speedbomb","bottledwhiskey","bottledshine","bottledbeer","rabbit_raw","salema_raw","ornate_raw",
									"mackerel_raw","tuna_raw","mullet_raw","catshark_raw","turtle_raw","hen_raw","rooster_raw","sheep_raw",
									"goat_raw"
									};
};


//Virtual Items
class VirtualItems {
	//Misc
	VITEMMACRO(pickaxe, "STR_Item_Pickaxe", "pickaxe", 2, 750, 350, false, -1, "")
	VITEMMACRO(fuelEmpty, "STR_Item_FuelEmpty", "fuelEmpty", 2, -1, -1, false, -1, "icons\ico_fuelempty.paa")
	VITEMMACRO(fuelFull, "STR_Item_FuelFull", "fuelFull", 5, 850, 500, false, -1, "icons\ico_fuel.paa")
	VITEMMACRO(spikeStrip, "STR_Item_SpikeStrip", "spikeStrip", 15, 2500, 1200, false, -1, "")
	VITEMMACRO(lockpick, "STR_Item_Lockpick", "lockpick", 1, 150, 75, true, -1, "")
	VITEMMACRO(goldbar, "STR_Item_GoldBar", "goldBar", 12, -1, 95000, false, -1, "")
	VITEMMACRO(blastingcharge, "STR_Item_BCharge", "blastingCharge", 15, 35000, -1, true, -1, "icons\ico_blastingCharge.paa")
	VITEMMACRO(boltcutter, "STR_Item_BCutter", "boltCutter", 5, 7500, -1, true, -1, "icons\ico_boltcutters.paa")
	VITEMMACRO(defusekit, "STR_Item_DefuseKit", "defuseKit", 2, 2500, -1, false, -1, "")
	VITEMMACRO(storagesmall, "STR_Item_StorageBS", "storageSmall", 5, 75000, -1, false, -1, "icons\ico_storageSmall.paa")
	VITEMMACRO(storagebig, "STR_Item_StorageBL", "storageBig", 10, 250000, -1, false, -1, "icons\ico_storageBig.paa")


	//Mined Items
	VITEMMACRO(oil_unprocessed, "STR_Item_OilU", "oilUnprocessed", 3, -1, -1, false, -1, "")
	VITEMMACRO(oil_processed, "STR_Item_OilP", "oilProcessed", 2, -1, 3200, false, -1, "")
	VITEMMACRO(copper_unrefined, "STR_Item_CopperOre", "copperUnrefined", 3, -1, -1, false, -1, "")
	VITEMMACRO(copper_refined, "STR_Item_CopperIngot", "copperRefined", 2, -1, 2500, false, -1, "")
	VITEMMACRO(iron_unrefined, "STR_Item_IronOre", "ironUnrefined", 3, -1, -1, false, -1, "")
	VITEMMACRO(iron_refined, "STR_Item_IronIngot", "ironRefined", 2, -1, 3200, false, -1, "")
	VITEMMACRO(salt_unrefined, "STR_Item_Salt", "saltUnrefined", 2, -1, -1, false, -1, "")
	VITEMMACRO(salt_refined, "STR_Item_SaltR", "saltRefined", 1, -1, 1450, false, -1, "")
	VITEMMACRO(sand, "STR_Item_Sand", "sand", 2, -1, -1, false, -1, "")
	VITEMMACRO(glass, "STR_Item_Glass", "glass", 1, -1, 1450, false, -1, "")
	VITEMMACRO(diamond_uncut, "STR_Item_DiamondU", "diamondUncut", 3, -1, 750, false, -1, "")
	VITEMMACRO(diamond_cut, "STR_Item_DiamondC", "diamondCut", 2, -1, 2000, false, -1, "")
	VITEMMACRO(rock, "STR_Item_Rock", "rock", 3, -1, -1, false, -1, "icons\rock.paa")
	VITEMMACRO(cement, "STR_Item_CementBag", "cement", 2, -1, 2000, false, -1, "")
	VITEMMACRO(mushroom, "STR_Item_Mushroom", "mushroom", 2, -1, 1950, false, -1, "icons\mushroom.paa")

	//Drugs
	VITEMMACRO(heroin_unprocessed, "STR_Item_HeroinU", "heroinUnprocessed", 2, -1, 3000, true, -1, "")
	VITEMMACRO(heroin_processed, "STR_Item_HeroinP", "heroinProcessed", 1, -1, 3000, true, -1, "icons\heroine.paa")
	VITEMMACRO(cannabis, "STR_Item_Cannabis", "cannabis", 2, -1, 1000, true, -1, "")
	VITEMMACRO(marijuana, "STR_Item_Marijuana", "marijuana", 1, 2500, 2350, true, -1, "icons\ico_marijuana.paa")
	VITEMMACRO(cocaine_unprocessed, "STR_Item_CocaineU", "cocaineUnprocessed", 2, -1, 1000, true, -1, "")
	VITEMMACRO(cocaine_processed, "STR_Item_CocaineP", "cocaineProcessed", 1, -1, 3000, true, -1, "icons\cocaine.paa")
	VITEMMACRO(froglsd, "STR_Item_Froglsd", "froglsd", 1, -1, 2500, true, -1, "")
	VITEMMACRO(frog, "STR_Item_Frog", "frog", 2, -1, 2500, true, -1, "icons\frog.paa")
	VITEMMACRO(Magicm, "STR_Item_Magicm", "magicm", 1, -1, 1200, true, -1, "icons\magicm.paa")
	VITEMMACRO(tobacco, "STR_Item_Tobacco", "tobacco", 1, -1, 1200, true, -1, "")
	VITEMMACRO(cigarette, "STR_Item_Cigarette", "cigarette", 1, -1, 1200, true, -1, "")


	//DrinkC
	VITEMMACRO(redgull, "STR_Item_RedGull", "redgull", 1, 1500, 200, false, 100, "icons\ico_redgull.paa")
	VITEMMACRO(coffee, "STR_Item_Coffee", "coffee", 1, 10, 5, false, 100, "icons\coffee.paa")
	VITEMMACRO(waterBottle, "STR_Item_WaterBottle", "waterBottle", 1, 10, 5, false, 100, "icons\ico_waterBottle.paa")
	VITEMMACRO(largesoda, "STR_Item_largesoda", "largesoda", 1, 10, 5, false, 100, "icons\lsoda.paa")


	//Food
	VITEMMACRO(apple, "STR_Item_Apple", "apple", 1, 65, 50, false, 10, "icons\food.paa")
	VITEMMACRO(peach, "STR_Item_Peach", "peach", 1, 68, 55, false, 10, "icons\food.paa")
	VITEMMACRO(tbacon, "STR_Item_TBacon", "tbacon", 1, 75, 25, false, 40, "icons\ico_tbacon.paa")
	VITEMMACRO(donut, "STR_Item_Donuts", "donut", 1, 120, 60, false, 30, "icons\food.paa")
	VITEMMACRO(rabbit_raw, "STR_Item_Rabbit", "rabbitRaw", 2, -1, 65, false, -1, "icons\food.paa")
	VITEMMACRO(rabbit_grilled, "STR_Item_RabbitGrilled", "rabbitGrilled", 1, 150, 115, false, 20, "icons\ico_cookedMeat.paa")
	VITEMMACRO(salema_raw, "STR_Item_SalemaMeat", "salemaRaw", 2, -1, 45, false, -1, "icons\food.paa")
	VITEMMACRO(salema_grilled, "STR_Item_SalemaGrilled", "salemaGrilled", 1, 75, 55, false, 30, "icons\ico_cookedMeat.paa")
	VITEMMACRO(ornate_raw, "STR_Item_OrnateMeat", "ornateRaw", 2, -1, 40, false, -1, "icons\food.paa")
	VITEMMACRO(ornate_grilled, "STR_Item_OrnateGrilled", "ornateGrilled", 1, 175, 150, false, 25, "icons\ico_cookedMeat.paa")
	VITEMMACRO(mackerel_raw, "STR_Item_MackerelMeat", "mackerelRaw", 4, -1, 175, false, -1, "icons\food.paa")
	VITEMMACRO(mackerel_grilled, "STR_Item_MackerelGrilled", "mackerelGrilled", 2, 250, 200, false, 30, "icons\ico_cookedMeat.paa")
	VITEMMACRO(tuna_raw, "STR_Item_TunaMeat", "tunaRaw", 6, -1, 700, false, -1, "icons\food.paa")
	VITEMMACRO(tuna_grilled, "STR_Item_TunaGrilled", "tunaGrilled", 3, 1250, 1000, false, 100, "icons\ico_cookedMeat.paa")
	VITEMMACRO(mullet_raw, "STR_Item_MulletMeat", "mulletRaw", 4, -1, 250, false, -1, "icons\food.paa")
	VITEMMACRO(mullet_fried, "STR_Item_MulletFried", "mulletFried", 2, 600, 400, false, 80, "icons\ico_cookedMeat.paa")
	VITEMMACRO(catshark_raw, "STR_Item_CatSharkMeat", "catsharkRaw", 6, -1, 300, false, -1, "icons\food.paa")
	VITEMMACRO(catshark_fried, "STR_Item_CatSharkFried", "catsharkFried", 3, 750, 500, false, 100, "icons\ico_cookedMeat.paa")
	VITEMMACRO(turtle_raw, "STR_Item_TurtleMeat", "turtleRaw", 6, 4000, 3000, true, -1, "icons\food.paa")
	VITEMMACRO(turtle_soup, "STR_Item_TurtleSoup", "turtleSoup", 2, 2500, 1000, false, 100, "icons\ico_cookedMeat.paa")
	VITEMMACRO(hen_raw, "STR_Item_HenRaw", "henRaw", 1, -1, 35, false, -1, "icons\food.paa")
	VITEMMACRO(hen_fried, "STR_Item_HenFried", "henFried", 1, 115, 85, false, 65, "icons\ico_cookedMeat.paa")
	VITEMMACRO(rooster_raw, "STR_Item_RoosterRaw", "roosterRaw", 1, -1, 35, false, -1, "icons\food.paa")
	VITEMMACRO(rooster_grilled, "STR_Item_RoosterGrilled", "roosterGrilled", 115, 85, false, 45, "icons\ico_cookedMeat.paa")
	VITEMMACRO(sheep_raw, "STR_Item_SheepRaw", "sheepRaw", 2, -1, 50, false, -1, "icons\food.paa")
	VITEMMACRO(sheep_grilled, "STR_Item_SheepGrilled", "sheepGrilled", 2, 155, 115, false, 100, "icons\ico_cookedMeat.paa")
	VITEMMACRO(goat_raw, "STR_Item_GoatRaw", "goatRaw", 2, -1, 75, false, -1, "icons\food.paa")
	VITEMMACRO(goat_grilled, "STR_Item_GoatGrilled", "goatGrilled", 2, 175, 135, false, 100, "icons\ico_cookedMeat.paa")

	//Vigilante
	VITEMMACRO(ziptie, "STR_Item_Ziptie", "ziptie", 1, 500, 500, true, -1, "")
	
	//Custom Shit by LIONS rawr
	VITEMMACRO(underwatercharge, "STR_Item_Underwatercharge", "underwatercharge", 2, 35000, 10000, false, -1, "")
	VITEMMACRO(goldbarp, "STR_Item_GoldScrap", "goldbarp", 12, -1, 95000, false, -1, "")
	
	VITEMMACRO(heliblastcharge, "STR_Item_heliblastcharge", "heliblastcharge", 2, 35000, 10000, false, -1, "")
	VITEMMACRO(lostcargo, "STR_Item_lostcargo", "lostcargo", 12, -1, 95000, false, -1, "")
	
	VITEMMACRO(gpstracker, "STR_Item_gpstracker", "gpstracker", 2, 15000, 500, false, -1, "")
	VITEMMACRO(speedbomb, "STR_Item_speedbomb", "speedbomb", 2, 15000, 500, false, -1, "")
	
	VITEMMACRO(bottledwhiskey, "STR_Item_bottledwhiskey", "bottledwhiskey", 2, 2000, 500, false, -1, "")
	VITEMMACRO(bottledshine, "STR_Item_bottledshine", "bottledshine", 2, 2000, 500, false, -1, "")
	VITEMMACRO(bottledbeer, "STR_Item_bottledbeer", "bottledbeer", 2, 2000, 500, false, -1, "")

};


/*
	Licenses
	
	Params:
	CLASS ENTRY,DisplayName,VariableName,price,illegal,side indicator
*/
class Licenses {
	LICENSEMACRO(driver,"STR_License_Driver","driver",500,false,"civ")
	LICENSEMACRO(boat,"STR_License_Boat","boat",1000,false,"civ")
	LICENSEMACRO(pilot,"STR_License_Pilot","pilot",25000,false,"civ")
	LICENSEMACRO(gun,"STR_License_Firearm","gun",10000,false,"civ")
	LICENSEMACRO(dive,"STR_License_Diving","dive",2000,false,"civ")
	LICENSEMACRO(oil,"STR_License_Oil","oil",10000,false,"civ")
	LICENSEMACRO(cAir,"STR_License_Pilot","cAir",15000,false,"cop")
	LICENSEMACRO(cg,"STR_License_CG","cg",8000,false,"cop")
	LICENSEMACRO(heroin,"STR_License_Heroin","heroin",25000,true,"civ")
	LICENSEMACRO(marijuana,"STR_License_Marijuana","marijuana",19500,true,"civ")
	LICENSEMACRO(medmarijuana,"STR_License_Medmarijuana","medmarijuana",25000,false,"civ")
	LICENSEMACRO(rebel,"STR_License_Rebel","rebel",100000,true,"civ")
	LICENSEMACRO(trucking,"STR_License_Truck","trucking",20000,false,"civ")
	LICENSEMACRO(diamond,"STR_License_Diamond","diamond",35000,false,"civ")
	LICENSEMACRO(salt,"STR_License_Salt","salt",12000,false,"civ")
	LICENSEMACRO(cocaine,"STR_License_Cocaine","cocaine",30000,false,"civ")
	LICENSEMACRO(sand,"STR_License_Sand","sand",14500,false,"civ")
	LICENSEMACRO(iron,"STR_License_Iron","iron",9500,false,"civ")
	LICENSEMACRO(copper,"STR_License_Copper","copper",8000,false,"civ")
	LICENSEMACRO(cement,"STR_License_Cement","cement",6500,false,"civ")
	LICENSEMACRO(mAir,"STR_License_Pilot","mAir",15000,false,"med")
	LICENSEMACRO(home,"STR_License_Home","home",75000,false,"civ")
	LICENSEMACRO(vigilante,"STR_License_Vigilante","vigilante",60000,false,"civ")
	LICENSEMACRO(news,"STR_License_News","news",250000,false,"civ")
	LICENSEMACRO(law,"STR_License_Law","law",250000,false,"civ")
	LICENSEMACRO(taxi,"STR_License_Taxi","taxi",250000,false,"civ")
	LICENSEMACRO(frog,"STR_License_Frog","frog",30000,false,"civ")
	LICENSEMACRO(magicm,"STR_License_Magicm","magicm",15000,false,"civ")
	LICENSEMACRO(cigarette,"STR_License_Cigarette","cigarette",5,false,"civ")
};


class VirtualShops {
	class pub {
		name = "Papa's Pub";
		items[] = { "waterBottle", "rabbit_grilled", "apple", "redgull", "tbacon", "pickaxe", "fuelFull", "peach", "bottledbeer", "bottledwhiskey" };
	};
	class market {
		name = "STR_Shops_Market";
		items[] = { "waterBottle", "rabbit_grilled", "apple", "redgull", "tbacon", "pickaxe", "fuelFull", "peach", "storagesmall", "storagebig" };
	};
	class burger {
		name = "STR_Shops_burger";
		items[] = { "waterBottle", "rburger","largesoda"};
	};
	class rebel {
		name = "STR_Shops_Rebel";
		items[] = { "waterBottle", "rabbit_grilled", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge", "ziptie" };
	};

	class gang {
		name = "STR_Shops_Gang";
		items[] = { "waterBottle", "rabbit_grilled", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge", "ziptie" };
	};

	class wongs {
		name = "STR_Shops_Wongs";
		items[] = { "turtle_soup"};
	};

	class coffee {
		name = "STR_Shops_Coffee";
		items[] = { "coffee", "donut" };
	};
	class medicalw {
		name = "STR_Shops_MedicalW";
		items[] = { "marijuana" };
	};
	class drugdealer {
		name = "STR_Shops_DrugDealer";
		items[] = { "cocaine_processed", "heroin_processed", "marijuana","froglsd","magicm" };
	};
	class oil {
		name = "STR_Shops_Oil";
		items[] = { "oil_processed", "pickaxe", "fuelFull" };
	};

	class fish {
		name = "STR_Shops_FishMarket";
		items[] = { "salema_raw", "salema_grilled", "ornate_raw", "ornate_grilled", "mackerel_raw", "mackerel_grilled", "tuna_raw", "tuna_grilled", "mullet_raw", "mullet_fried", "catshark_raw", "catshark_fried" };
	};

	class glass {
		name = "STR_Shops_Glass";
		items[] = { "glass" };
	};

	class iron  {
		name = "STR_Shops_Minerals";
		items[] = { "iron_refined", "copper_refined" };
	};

	class diamond {
		name = "STR_Shops_Diamond";
		items[] = { "diamond_uncut", "diamond_cut" };
	};

	class salt {
		name = "STR_Shops_Salt";
		items[] = { "salt_refined" };
	};

	class cop {
		name = "STR_Shops_Cop";
		items[] = { "donuts", "coffee", "spikeStrip", "waterBottle", "rabbit_grilled", "apple", "redgull", "fuelFull", "defusekit" };
	};

	class cement {
		name = "STR_Shops_Cement";
		items[] = { "cement" };
	};

	class gold {
		name = "STR_Shops_Gold";
		items[] = { "goldbar" };
	};
	
	class vigilante {
		name = "STR_Shops_Vigilante";
		items[] = { "waterBottle", "apple", "peach", "redgull", "tbacon", "ziptie" };
	};
	
	class turtle {
		name = "Wong's Turtle Cart";
		items[] = {"Nothing"};
	};
	
	class hunting {
		name = "Honest Abe's Butcher";
		items[] = {"Nothing"};
	};
};

#include "Config_Vehicles.hpp"
#include "Config_Houses.hpp"