/* Price Coefficients */
#define ins 0.9
#define chop 0.8
#define sell 0.9
#define store 0.05
/* End Price Coefficients */

/* Vehicle Prices */
#define phatchback 22500
#define pquadbike 2500
#define poffroad 35000
#define psuv 30000
#define phatchbacksport 45000
#define pkart 15000

#define poffroadmed 10000
#define pzamakmed 75000
#define pm900med 200000
#define porcamed 500000

#define pboxer 200000
#define pzamaktrans 135000
#define pzamakcov 250000
#define phemtttrans 300000
#define ptempesttrans 600000
#define ptempestcov 750000
#define phemttbox 600000
#define ptempestdev 800000
#define ftruck 300000


#define pifrit 700000
#define p50cal 950000

#define poffroadcop 35000
#define psuvcop 30000
#define phuntercop 250000
#define pmh9cop 250000
#define pghosthawkcop 500000
#define pmarid 750000

#define pmh9civ 325000
#define pm900 250000
#define porcaciv 750000
#define ptarutrans 1800000
#define ptarubench 1500000
#define ptarufuel 1300000

#define psdv 100000
#define prescueboat 5000
#define pspeedboat 20000
#define passaultboat 3000

#define huron 1500000
#define mohawk 1400000

#define pstrider 150000
/* End Vehicle Prices */

class CarShops {
	/*
		Format:
		{ Classname, rental price, license required, { varname, >= value } }

		{ varname, >= value} this is a "level" requirement mainly used by cops and rebels, do not fill this in if you are not utilizing it.
	*/
	class civ_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", pquadbike, "" }, 
			{ "C_Hatchback_01_F", phatchback, "driver" }, 
			{ "C_Offroad_01_F", poffroad, "driver" },
			{ "C_SUV_01_F", psuv, "driver" },
			{ "C_Hatchback_01_sport_F", phatchbacksport, "driver" }
		};
	};

	class kart_shop {
		side = "civ";	
		vehicles[] = {
			{ "C_Kart_01_Blu_F", pkart , "driver" },
			{ "C_Kart_01_Fuel_F", pkart, "driver" },
			{ "C_Kart_01_Red_F", pkart, "driver" },
			{ "C_Kart_01_Vrana_F", pkart, "driver" }
		};
	};

	class med_shop {
		side = "med";
		vehicles[] = {
			{ "C_Offroad_01_repair_F", poffroadmed, "" },
			{ "I_Truck_02_medical_F", pzamakmed, "" , { "life_medicLevel", 3 } },
			{ "C_Hatchback_01_sport_F", phatchbacksport, "", { "life_medicLevel", 2 } },
			{ "I_MRAP_03_F", pstrider, "" , { "life_medicLevel", 5 } }
		};
	};

	class med_air_hs {
		side = "med";
		vehicles[] = {
			{ "C_Heli_Light_01_civil_F", pm900med, "mAir" , { "life_medicLevel", 2 } },
			{ "O_Heli_Light_02_unarmed_F", porcamed, "mAir" , { "life_medicLevel", 4 } }
		};
	};

	class civ_truck {
		side = "civ";
		vehicles[] = {
			{ "C_Van_01_box_F", pboxer, "trucking" },
			{ "I_Truck_02_transport_F", pzamaktrans, "trucking" },
			{ "I_Truck_02_covered_F", pzamakcov, "trucking" },
			{ "B_Truck_01_transport_F", phemtttrans, "trucking" },
			{ "O_Truck_03_transport_F", ptempesttrans, "trucking" },
			{ "O_Truck_03_covered_F", ptempestcov, "trucking" },
			{ "B_Truck_01_box_F", phemttbox, "trucking" },
			{ "O_Truck_03_device_F", ptempestdev, "trucking" }
		};
	};

	class reb_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", pquadbike, "" },
			{ "B_G_Offroad_01_F", poffroad, "" },
			{ "O_MRAP_02_F", pifrit, "rebel" },
			{ "B_G_Offroad_01_armed_F", p50cal, "rebel" },
			{ "B_Heli_Light_01_F", pmh9civ, "rebel" },
			{ "O_Heli_Light_02_unarmed_F", porcaciv, "rebel" },
			{ "O_Heli_Transport_04_bench_F", ptarubench, "rebel" },
			{ "B_Heli_Transport_03_F", huron, "rebel" }
		};
	};

	class cop_car {
		side = "cop";
		vehicles[] = {
			{ "I_Quadbike_01_F", pquadbike, "" }, 
			{ "C_Offroad_01_F", poffroadcop, "", { "life_coplevel", 2 } },
			{ "C_SUV_01_F", psuvcop, "", { "life_coplevel", 2 } },
			{ "B_MRAP_01_F", phuntercop, "", { "life_coplevel", 5 } },
			{ "O_APC_Wheeled_02_rcws_F", pmarid, "", { "life_swatlevel", 1 } },
			{ "C_Hatchback_01_sport_F", phatchbacksport, "", { "life_coplevel", 2 } }
		};
	};

	class civ_air {
		side = "civ";
		vehicles[] = {
			{ "C_Heli_Light_01_civil_F", pm900, "pilot" },
			{ "O_Heli_Light_02_unarmed_F", porcaciv, "pilot" },
			{ "O_Heli_Transport_04_fuel_F", ptarufuel, "pilot" },
			{ "O_Heli_Transport_04_box_F", ptarutrans, "pilot" },
			{ "I_Heli_Transport_02_F", mohawk, "pilot" }
		};
	};
	class civ_jet {
		side = "civ";
		vehicles[] = {
			{ "B_Plane_CAS_01_F", ptarutrans, "pilot",{ "life_donator", 3 } }
		};
	};

	class cop_air {
		side = "cop";
		vehicles[] = {
			{ "B_Heli_Light_01_F", pmh9cop, "", { "life_coplevel", 3 } },
			{ "B_Heli_Transport_01_F", pghosthawkcop, "", { "life_coplevel", 5 } },
			{ "I_Heli_light_03_unarmed_F", pghosthawkcop, "", { "life_coplevel", 6 } },
			{ "O_Heli_Light_02_unarmed_F", pghosthawkcop, "", { "life_coplevel", 3 } }
		};
	};

	class cop_airhq {
		side = "cop";
		vehicles[] = {
			{ "B_Heli_Light_01_F", pmh9cop, "", { "life_coplevel", 2 } },
			{ "B_Heli_Transport_01_F", pghosthawkcop, "", { "life_coplevel", 4 } }
		};
	};

	class cop_ship {
		side = "cop";
		vehicles[] = {
			{ "B_Boat_Transport_01_F", passaultboat, "" },
			{ "C_Boat_Civil_01_police_F", pspeedboat, "" },
			{ "B_SDV_01_F", psdv, "" }
		};
	};

	class civ_ship {
		side = "civ";
		vehicles[] = {
			{ "C_Rubberboat", prescueboat, "boat" },
			{ "C_Boat_Civil_01_F", pspeedboat, "boat" },
			{ "B_SDV_01_F", psdv, "boat" }
		};
	};
};

/*
	Vehicle Configs (Contains textures and other stuff)

	storageFee (Getting vehicles out of garage) format:
		INDEX 0: Civilian Price
		INDEX 1: Cop Price
		INDEX 3: EMS Price
		INDEX 4: OPFOR Price (Not implemented in vanilla but still leaving support

	Textures config follows { Texture Name, side, {texture(s)path}}
	Texture(s)path follows this format:
		INDEX 0: Texture Layer 0
		INDEX 1: Texture Layer 1
		INDEX 2: Texture Layer 2
		etc etc etc
*/
class CfgVehicles {
	class Default {
		vItemSpace = -1;
		price = 1000;
		storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 0, 0, 0, 0 };
		insurance = 2500;
		chopShop = 1200;
		textures[] = {};
	};
	class I_Heli_light_03_unarmed_F : Default {
	    vItemSpace = 150;
	    price = pghosthawkcop;
	     textures[] = {
	        { "Swat", "cop", {
                "textures\msthellcat.jpg",
            } }
	    };
	};
	class B_Plane_CAS_01_F : Default {
	    vItemSpace = 150;
	    price = ptarutrans;
	};
	class O_APC_Wheeled_02_rcws_F : Default {
	    vItemSpace = 150;
	    price = pmarid;
	    textures[] = {
	        { "Swat", "cop", {
                "textures\swat apc.jpg",
                "textures\swat apc2.jpg",
                "textures\swat turret.jpg"
            } }
	    };
	};
	class C_Offroad_01_repair_F : Default {
		vItemSpace = 150;
		price = poffroadmed;
		storageFee[] = { 0, 0, 1500, 0 };
		garageSell[] = { 0, 0, 5000, 0 };
		chopShop = 3000;
		textures[] = {
		    { "EMS", "med", {
                "textures\medic_offroad.jpg"
            } }
		};
	};
	class I_Truck_02_medical_F : Default {
		vItemSpace = 150;
		price = pzamakmed;
		storageFee[] = { 0, 0, 1500, 0 };
		garageSell[] = { 0, 0, 5000, 0 };
		chopShop = 3000;
		textures[] = {
		    { "EMS", "med", {
                "textures\Zamak medical 1.jpg",
                "textures\Zamak medical 2.jpg",
                "textures\Zamak medical 3.paa"
            } }
		};
	};

	class O_Truck_03_medical_F : Default {
		vItemSpace = 200;
		storageFee[] = { 0, 0, 3000, 0 };
		garageSell[] = { 0, 0, 10000, 0 };
		chopShop = 7500;
	};

	class B_Truck_01_medical_F : Default {
		vItemSpace = 250;
		price = pzamakmed;
		storageFee[] = { 0, 0, 6500, 0 };
		garageSell[] = { 0, 0, 25000, 0 };
		chopShop = 12500;
	};

	class C_Rubberboat {
        vItemSpace = 185;
        price = prescueboat;
        storageFee[] = { 400, 300, 0, 0 };
		garageSell[] = { 950, 350, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Heli_Transport_01_F {
		vItemSpace = 200;
		price = pghosthawkcop;
		storageFee[] = { 0, 50000, 0, 0 };
		garageSell[] = { 0, 85000, 0, 0 };
		insurance = 16000;
		chopShop = 45000;
		textures[] = {};
	};

	class B_MRAP_01_hmg_F : Default {
		vItemSpace = 100;
		price = phuntercop;
	};

	class O_Boat_Armed_01_hmg_F {
        vItemSpace = 175;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 21000, 21000, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class B_Heli_Transport_03_F {
        vItemSpace = 250;
		price = huron;
        storageFee[] = { 60000, 0, 0, 0 };
		garageSell[] = { 80000, 21000, 0, 0 };
        insurance = 2500;
        chopShop = 6000;
        textures[] = { };
    };


	class B_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        storageFee[] = { 0, 16500, 0, 0 };
		garageSell[] = { 0, 21000, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class I_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_G_Boat_Transport_01_F {
        vItemSpace = 45;
        storageFee[] = { 100, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Boat_Transport_01_F {
        vItemSpace = 45;
        price = passaultboat;
        storageFee[] = { 0, 450, 0, 0 };
		garageSell[] = { 0, 850, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class O_Truck_03_transport_F {
        vItemSpace = 700;
        price = ptempesttrans;
        storageFee[] = { 100, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class O_Truck_03_device_F {
        vItemSpace = 500;
        price = ptempestdev;
        storageFee[] = { 950, 0, 0, 0 };
		garageSell[] = { 185000, 0, 0, 0 };
        insurance = 25000;
        chopShop = 125000;
        textures[] = { };
    };

	class Land_CargoBox_V1_F : Default {
        vItemSpace = 5000;
    };

	class Box_IND_Grenades_F : Default {
        vItemSpace = 100;
    };

	class B_supplyCrate_F {
        vItemSpace = 700;
    };

	class B_G_Offroad_01_F {
        vItemSpace = 145;
        price = poffroad;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 3500, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_G_Offroad_01_armed_F : B_G_Offroad_01_F {
		vItemSpace = 200;
		price = p50cal;
		storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 100000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = { };
	};

	class I_G_Van_01_transport_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class C_Boat_Civil_01_F {
        vItemSpace = 275;
        price = pspeedboat;
        storageFee[] = { 4500, 2500, 0, 0 };
		garageSell[] = { 6800, 3500, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class C_Boat_Civil_01_police_F {
        vItemSpace = 275;
        price = pspeedboat;
        storageFee[] = { 0, 3500, 0, 0 };
		garageSell[] = { 0, 4950, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class C_Boat_Civil_01_rescue_F {
        vItemSpace = 275;
        price = pspeedboat;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Truck_01_box_F {
        vItemSpace = 1000;
        price = phemttbox;
        storageFee[] = { 500, 0, 0, 0 };
		garageSell[] = { 150000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Truck_01_transport_F {
        vItemSpace = 600;
        price = phemtttrans;
        storageFee[] = { 650, 0, 0, 0 };
		garageSell[] = { 135000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class O_MRAP_02_F {
        vItemSpace = 150;
        price = pifrit;
        storageFee[] = { 450, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class I_MRAP_03_F {
        vItemSpace = 58;
        price = pstrider;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class C_Offroad_01_F {
        vItemSpace = 145;
        price = poffroad;
        storageFee[] = { 1000, 500, 650, 1000 };
		garageSell[] = { 6500, 2500, 0, 0 };
        insurance = 2500;
        chopShop = 2500;
        textures[] = {
        	{ "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
			{ "Yellow", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            } },
			{ "White", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            } },
			{ "Blue", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            } },
			{ "Dark Red", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            } },
			{ "Blue / White", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            } },
            { "Fed", "fed", {
	                "#(ai,64,64,1)Fresnel(0.3,3)"
            } },
			{ "Police", "cop", {
	                "textures\policeoffroad.jpg",
					"textures\policeoffroad.jpg"
            } },
            { "Taxi", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } }
	    };
    };

	class C_Kart_01_Blu_F {
		vItemSpace = 20;
		price = pkart;
		storageFee[] = { 1500, 0, 0, 0 };
		garageSell[] = { 3500, 0, 0, 0 };
		inusrance = 1650;
		chopShop = 3500;
		textures[] = {};
	};

	class C_Kart_01_Fuel_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Red_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Vrana_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class

	class C_Hatchback_01_sport_F {
        vItemSpace = 65;
        price = phatchbacksport;
        storageFee[] = { 2500, 1000, 0, 0 };
		garageSell[] = { 15000, 7500, 0, 0 };
        insurance = 5500;
        chopShop = 4500;
        textures[] = {
        	{ "Red", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            } },
			{ "Dark Blue", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            } },
			{ "Orange", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            } },
			{ "Black / White", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            } },
			{ "Beige", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            } },
			{ "Green", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            } },
            { "Police", "cop", {
                "textures\policehatch.jpg"
            } },
			{ "Medic", "med", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            } }
        };
    };

	class B_Quadbike_01_F {
        vItemSpace = 45;
        price = pquadbike;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Brown", "civ", {
                "\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
            } },
			{ "Digi Desert", "reb", {
	                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
	        } },
			{ "Black", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
	        } },
			{ "Blue", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
	        } },
			{ "Red", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
	        } },
			{ "White", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
	        } },
			{ "Digi Green", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
	        } },
			{ "Hunter Camo", "civ", {
	                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
	        } },
	        { "Rebel Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } },
            { "Police", "cop", {
                "textures\policequad.jpg"
            } }
        };
    };
	
	class I_Quadbike_01_F : B_Quadbike_01_F {};
	
	class I_Truck_02_covered_F {
        vItemSpace = 500;
        price = pzamakcov;
        storageFee[] = { 14500, 0, 0, 0 };
		garageSell[] = { 62000, 0, 0, 0 };
        insurance = 6500;
        chopShop = 20000;
        textures[] = {
        	{ "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Black", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

	class I_Truck_02_transport_F : I_Truck_02_covered_F {
        vItemSpace = 400;
        price = pzamaktrans;
        storageFee[] = { 12000, 0, 0, 0 };
		garageSell[] = { 49800, 3500, 0, 0 };
    };

	class O_Truck_03_covered_F {
		vItemSpace = 900;
		price = ptempestcov;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 5000;
		textures[] = {};
	};
	


	class C_Hatchback_01_F {
        vItemSpace = 65;
        price = phatchback;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 4500, 3500, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
            } },
			{ "Green", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            } },
			{ "Blue", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            } },
			{ "Dark Blue", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            } },
			{ "Yellow", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            } },
			{ "White", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            } },
			{ "Grey", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            } },
            { "Black", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            } }
        };
    };

	class C_SUV_01_F {
        vItemSpace = 115;
        price = psuv;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 15000, 7500, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Dark Red", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            } },
			{ "Black", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"
            } },
			{ "Silver", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
			{ "Orange", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
            { "Cop", "cop", {
                "textures\meccapolicesuv.jpg"
            } },
            { "Donut", "civ", {
                "textures\donut_suv_textures.paa"
            } }
	        };
    };

	class C_Van_01_transport_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 25000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };

	class C_Van_01_box_F {
        vItemSpace = 350;
        price = pboxer;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 35000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };
	class B_MRAP_01_F {
        vItemSpace = 65;
        price = phuntercop;
        storageFee[] = { 0, 7500, 0, 0 };
		garageSell[] = { 0, 10000, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Cop", "cop", {
                "textures\Hunter1.jpg",
                "textures\Hunter2.jpg"
            } },
            { "Black", "fed", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

	class B_Heli_Light_01_F {
        vItemSpace = 90;
        price = pmh9civ;
        storageFee[] = { 45000, 19500, 0, 0 };
		garageSell[] = { 57000, 35000, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Cop", "cop", {
                "textures\meccalittlebird.jpg"
            } },
			{ "Black", "fed", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"
            } },
			{ "Civ Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            } },
			{ "Civ Red", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            } },
			{ "Digi Green", "donate", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            } },
			{ "Blueline", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            } },
			{ "Elliptical", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            } },
			{ "Furious", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            } },
			{ "Jeans Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            } },
			{ "Speedy Redline", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            } },
			{ "Sunset", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            } },
			{ "Vrana", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            } },
			{ "Waves Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            } },
			{ "Rebel Digital", "reb", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
            { "MES", "med", {
                "textures\mlbird.jpg"
            } }
        };
    };

	class O_Heli_Transport_04_box_F {
        vItemSpace = 600;
        price = ptarutrans;
        storageFee[] = { 55000, 0, 22000, 0 };
		garageSell[] = { 72500, 0, 35000, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
            {  }
        };
    };
	class O_Heli_Transport_04_fuel_F {
        vItemSpace = 500;
        price = ptarufuel;
        storageFee[] = { 55000, 0, 22000, 0 };
		garageSell[] = { 72500, 0, 35000, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
            { 
             }
        };
    };
	
	class C_Van_01_fuel_F {
        vItemSpace = 800;
        price = ftruck;
        storageFee[] = { 5000, 0, 0, 0 };
		garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
            { 
             }
        };
    };
	class O_Heli_Transport_04_bench_F {
        vItemSpace = 80;
        price = ptarubench;
        storageFee[] = { 55000, 0, 22000, 0 };
		garageSell[] = { 72500, 0, 35000, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
            { 
             }
        };
    };
	

	class O_Heli_Light_02_unarmed_F {
        vItemSpace = 210;
        price = porcaciv;
        storageFee[] = { 55000, 0, 22000, 0 };
		garageSell[] = { 22500, 0, 35000, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Black", "cop", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            } },
			{ "White / Blue", "civ", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"   
            } },
			{ "Digi Green", "reb", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            } },
			{ "Desert Digi", "reb", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa" 
            } },
            { "MES Orca", "med", {
                "textures\morca.jpg"
            } }
        };
    };
	
	class I_Heli_Transport_02_F {
        vItemSpace = 375;
        storageFee[] = { 55000, 0, 0, 0 };
		garageSell[] = { 75000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5500;
        price = mohawk;
        textures[] = {
        	{ "Ion", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"
            } },
            { "Dahoman", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"
            } }
        };
    };
    
    class B_SDV_01_F : Default {
        vItemSpace = 100;
        price = psdv;
    };
    
    class C_Heli_Light_01_civil_F : Default {
        vItemSpace = 90;
        price = pm900;
        textures[] = {
            { "Civ Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            } },
			{ "Civ Red", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            } },
			{ "Digi Green", "donate", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            } },
			{ "Blueline", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            } },
			{ "Elliptical", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            } },
			{ "Furious", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            } },
			{ "Jeans Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            } },
			{ "Speedy Redline", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            } },
			{ "Sunset", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            } },
			{ "Vrana", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            } },
			{ "Waves Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            } },
            { "MES", "med", {
                "textures\mlbird.jpg"
            } }
        };
    };
};