/*
	ARRAY FORMAT:
		0: STRING (Classname)
		1: STRING (Display Name, leave as "" for default)
		2: SCALAR (Price)
		3: ARRAY (This is for limiting items to certain things)
			0: Variable to read from
			1: Variable Value Type
			2: What to compare to v
*/
class Clothing {
	class bruce {
		title = "STR_Shops_C_Bruce";
		license = "";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_C_Poloshirt_blue", "Mecca Tshirt", 250, { "", "", -1 } },
			{ "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 275, { "", "", -1 } },
			{ "U_C_Poloshirt_redwhite", "Poloshirt Red/White", 150, { "", "", -1 } },
			{ "U_C_Poloshirt_salmon", "Poloshirt Salmon", 175, { "", "", -1 } },
			{ "U_C_Poloshirt_stripped", "Poloshirt stripped", 125, { "", "", -1 } },
			{ "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 350, { "", "", -1 } },
			{ "U_C_Poor_2", "Rag tagged clothes", 250, { "", "", -1 } },
			{ "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, { "", "", -1 } },
			{ "U_IG_Guerilla3_1", "Brown Jacket & Pants", 735, { "", "", -1 } },
			{ "U_IG_Guerilla2_3", "The Outback Rangler", 700, { "", "", -1 } },
			{ "U_C_HunterBody_grn", "The Hunters Look", 700, { "", "", -1 } },
			{ "U_OrestesBody", "Surfing On Land", 1100, { "", "", -1 } },
			{ "U_NikosBody", "Bro Suit", 5187, { "life_donator", "SCALAR", 1 } },			
			{ "U_I_CombatUniform", "Mafia suit", 5187, { "life_donator", "SCALAR", 4 } },
			{ "U_B_Protagonist_VR", "VR Suit Blue", 5187, { "life_donator", "SCALAR", 3 } },
			{ "U_O_Protagonist_VR", "VR Suit Red", 5187, { "life_donator", "SCALAR", 3 } },
			{ "U_I_Protagonist_VR", "VR Suit Green", 5187, { "life_donator", "SCALAR", 3 } }

		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Bandanna_camo", "Camo Bandanna", 120, { "", "", -1 } },
			{ "H_Bandanna_surfer", "Surfer Bandanna", 130, { "", "", -1 } },
			{ "H_Bandanna_gry", "Grey Bandanna", 150, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 165, { "", "", -1 } },
			{ "H_Bandanna_surfer", "", 135, { "", "", -1 } },
			{ "H_Bandanna_khk", "Khaki Bandanna", 145, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Sage Bandanna", 160, { "", "", -1 } },
			{ "H_StrawHat", "Straw Fedora", 225, { "", "", -1 } },
			{ "H_BandMask_blk", "Hat & Bandanna", 300, { "", "", -1 } },
			{ "H_Booniehat_tan", "", 425, { "", "", -1 } },
			{ "H_Hat_blue", "", 310, { "", "", -1 } },
			{ "H_Hat_brown", "", 276, { "", "", -1 } },
			{ "H_Hat_checker", "", 340, { "", "", -1 } },
			{ "H_Hat_grey", "", 280, { "", "", -1 } },
			{ "H_Hat_tan", "", 265, { "", "", -1 } },
			{ "H_Cap_blu", "", 150, { "", "", -1 } },
			{ "H_Cap_grn", "", 150, { "", "", -1 } },
			{ "H_Cap_grn_BI", "", 150, { "", "", -1 } },
			{ "H_Cap_oli", "", 150, { "", "", -1 } },
			{ "H_Cap_red", "", 150, { "", "", -1 } },
			{ "H_Cap_tan", "", 150, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 205, { "", "", -1 } },
			{ "G_Shades_Blue", "", 200, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 200, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 200, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 200, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 200, { "", "", -1 } },
			{ "G_Squares", "", 100, { "", "", -1 } },
			{ "G_Aviator", "", 1000, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 500, { "", "", -1 } },
			{ "G_Lady_Dark", "", 500, { "", "", -1 } },
			{ "G_Lady_Blue", "", 500, { "", "", -1 } },
			{ "G_Lowprofile", "", 300, { "", "", -1 } },
			{ "G_Combat", "", 5500, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_TacVestIR_blk", "", 60500, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "", 750, { "", "", -1 } },
			{ "B_Kitbag_mcamo", "", 950, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 1500, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "", 1700, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 2500, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 2500, { "", "", -1 } },
			{ "B_Carryall_oli", "", 4500, { "", "", -1 } },
			{ "B_Carryall_khk", "", 4500, { "", "", -1 } },
			{ "B_Carryall_oucamo", "UnNamed's Backpack", 20000, { "life_donator", "SCALAR", 3 } }
		};
	};

	class cop {
		title = "STR_Shops_C_Police";
		license = "";
		side = "cop";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_Rangemaster", "Basic Uniform", 2500, { "life_coplevel", "SCALAR", 1 } },
			{ "U_BG_Guerilla3_2", "Working Uniform", 2500, { "life_coplevel", "SCALAR", 3 } },
			{ "U_O_OfficerUniform_ocamo", "HighRanking Uniform", 2500, { "life_coplevel", "SCALAR", 5 } },
			{ "U_O_SpecopsUniform_ocamo", "Swat Uniform", 2500, { "life_swatlevel", "SCALAR", 1 } },
			{ "U_B_Wetsuit", "", 2000, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_PilotHelmetFighter_B", "Teargas Helmet", 1000, { "life_coplevel", "SCALAR", 2 } },
			{ "H_Cap_police", "", 1000, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Beret_blk_POLICE", "", 1000, { "life_coplevel", "SCALAR", 2 } },
			{ "H_Beret_02", "", 1000, { "life_coplevel", "SCALAR", 4 } },
			{ "H_Beret_Colonel", "", 1000, { "life_coplevel", "SCALAR", 7 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 25, { "", "", -1 } },
			{ "G_Shades_Blue", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 20, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 20, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 20, { "", "", -1 } },
			{ "G_Squares", "", 10, { "", "", -1 } },
			{ "G_Aviator", "", 100, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 150, { "", "", -1 } },
			{ "G_Lady_Dark", "", 150, { "", "", -1 } },
			{ "G_Lady_Blue", "", 150, { "", "", -1 } },
			{ "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } },
			{ "G_Diving", "Dive Goggles", 50, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_TacVest_blk_POLICE", "Police Vest", 5000, { "", "", -1 } },
			{ "V_PlateCarrier1_blk", "Officer Vest", 25000, { "life_coplevel", "SCALAR", 4 } },
			{ "V_PlateCarrierSpec_blk", "Leader Vest", 45000, { "life_coplevel", "SCALAR", 7 } },
			{ "V_PlateCarrierGL_blk", "Swat Vest", 500, { "life_swatlevel", "SCALAR", 1} },
			{ "V_RebreatherB", "", 5000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_Carryall_oucamo", "Cop Backpack", 1500, { "", "", -1 } }
		};
	};
	class swat {
		title = "STR_Shops_C_Swat";
		license = "";
		side = "cop";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_O_OfficerUniform_ocamo", "Swat", 25, { "life_coplevel", "SCALAR", 6 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_PilotHelmetFighter_B", "Swat Teargas Helmet", 100, { "life_swatlevel", "SCALAR", 1 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 25, { "", "", -1 } },
			{ "G_Shades_Blue", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 20, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 20, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 20, { "", "", -1 } },
			{ "G_Squares", "", 10, { "", "", -1 } },
			{ "G_Aviator", "", 100, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 150, { "", "", -1 } },
			{ "G_Lady_Dark", "", 150, { "", "", -1 } },
			{ "G_Lady_Blue", "", 150, { "", "", -1 } },
			{ "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } }
		};

		vests[] = {
			{ "V_PlateCarrier2_rgr", "", 1500, { "life_coplevel", "SCALAR", 3 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } }
		};
	};

	class dive {
		title = "STR_Shops_C_Diving";
		license = "dive";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_B_Wetsuit", "", 2000, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Diving", "Dive Goggles", 5000, { "", "", -1 } }
			
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_RebreatherB", "", 5000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } }
		};
	};

	class reb {
		title = "STR_Shops_C_Rebel";
		license = "rebel";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_NikosBody", "Bro Suit", 5187, { "life_donator", "SCALAR", 1 } },
			{ "U_I_G_Story_Protagonist_F", "", 750, { "", "", -1 } },
			{ "U_I_G_resistanceLeader_F", "", 1500, { "", "", -1 } },
			{ "U_O_SpecopsUniform_ocamo", "", 7500, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam_vest", "", 7500, { "", "", -1 } },
			{ "U_B_SpecopsUniform_sgg", "", 7500, { "", "", -1 } },
			{ "U_O_SpecopsUniform_blk", "", 7500, { "", "", -1 } },
			{ "U_B_CTRG_3", "", 7500, { "", "", -1 } },
			{ "U_I_CombatUniform_shortsleeve", "", 7500, { "", "", -1 } },
			{ "U_O_PilotCoveralls", "", 5000, { "", "", -1 } },
			{ "U_IG_leader", "Guerilla Leader", 5000, { "", "", -1 } },
			{ "U_O_GhillieSuit", "", 10000, { "", "", -1 } },
			{ "U_B_FullGhillie_lsh", "Lush NATO", 30000, { "", "", -1 } },
			{ "U_O_FullGhillie_lsh", "Lush CSAT", 30000, { "", "", -1 } },
			{ "U_I_FullGhillie_lsh", "Lush AAF", 30000, { "", "", -1 } },
			{ "U_B_FullGhillie_sard", "Semi Arid NATO", 30000, { "", "", -1 } },
			{ "U_O_FullGhillie_sard", "Semi Arid CSAT", 30000, { "", "", -1 } },
			{ "U_I_FullGhillie_sard", "Semi Arid AAF", 30000, { "", "", -1 } },
			{ "U_B_FullGhillie_ard", "Arid NATO", 30000, { "", "", -1 } },
			{ "U_O_FullGhillie_ard", "Arid CSAT", 30000, { "", "", -1 } },
			{ "U_I_FullGhillie_ard", "Arid AAF", 30000, { "", "", -1 } },
			{ "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, { "", "", -1 } },
			{ "U_IG_Guerilla3_1", "Brown Jacket & Pants", 735, { "", "", -1 } },
			{ "U_IG_Guerilla2_3", "The Outback Rangler", 700, { "", "", -1 } },
			{ "U_C_HunterBody_grn", "The Hunters Look", 700, { "", "", -1 } },
			{ "U_OrestesBody", "Surfing On Land", 1100, { "", "", -1 } },
			{ "U_IG_Guerilla1_1", "Metal", 5187, { "life_donator", "SCALAR", 3 } },
			{ "U_O_CombatUniform_oucamo", "Urban Camo", 5187, { "life_donator", "SCALAR", 4 } },
			{ "U_I_CombatUniform", "Mafia suit", 5187, { "life_donator", "SCALAR", 5 } },
			{ "U_B_GhillieSuit", "Nato", 10000, { "life_donator", "SCALAR", 4 } },
			{ "U_B_Wetsuit", "", 2000, { "", "", -1 } },
			{ "U_I_Wetsuit", "", 2000, { "", "", -1 } },
			{ "U_O_Wetsuit", "", 2000, { "", "", -1 } }
			
			
			
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_ShemagOpen_tan", "", 850, { "", "", -1 } },
			{ "H_Shemag_olive", "", 850, { "", "", -1 } },
			{ "H_ShemagOpen_khk", "", 800, { "", "", -1 } },
			{ "H_HelmetO_ocamo", "", 1500, { "", "", -1 } },
			{ "H_MilCap_oucamo", "", 700, { "", "", -1 } },
			{ "H_Bandanna_camo", "", 650, { "", "", -1 } },
			{ "H_HelmetB_plain_mcamo", "", 4000, { "", "", -1 } },
			{ "H_Booniehat_mcamo", "", 120, { "", "", -1 } },
			{ "H_MilCap_mcamo", "", 100, { "", "", -1 } },
			{ "H_Bandanna_camo", "Camo Bandanna", 120, { "", "", -1 } },
			{ "H_Bandanna_surfer", "Surfer Bandanna", 130, { "", "", -1 } },
			{ "H_Bandanna_gry", "Grey Bandanna", 150, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 165, { "", "", -1 } },
			{ "H_Bandanna_surfer", "", 135, { "", "", -1 } },
			{ "H_Bandanna_khk", "Khaki Bandanna", 145, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Sage Bandanna", 160, { "", "", -1 } },
			{ "H_StrawHat", "Straw Fedora", 225, { "", "", -1 } },
			{ "H_BandMask_blk", "Hat & Bandanna", 300, { "", "", -1 } },
			{ "H_Booniehat_tan", "", 425, { "", "", -1 } },
			{ "H_Hat_blue", "", 310, { "", "", -1 } },
			{ "H_Hat_brown", "", 276, { "", "", -1 } },
			{ "H_Hat_checker", "", 340, { "", "", -1 } },
			{ "H_Hat_grey", "", 280, { "", "", -1 } },
			{ "H_Hat_tan", "", 265, { "", "", -1 } },
			{ "H_Cap_blu", "", 150, { "", "", -1 } },
			{ "H_Cap_grn", "", 150, { "", "", -1 } },
			{ "H_Cap_grn_BI", "", 150, { "", "", -1 } },
			{ "H_Cap_oli", "", 150, { "", "", -1 } },
			{ "H_Cap_red", "", 150, { "", "", -1 } },
			{ "H_Cap_tan", "", 150, { "", "", -1 } },
			{ "H_HelmetCrew_B", "", 4500, { "", "", -1 } },
			{ "H_HelmetLeaderO_oucamo", "Cyborg", 5000, { "life_donator", "SCALAR", 5 } },
			{ "H_HelmetB_light_snakeskin", "Donor Helmet", 5000, { "life_donator", "SCALAR", 1 } },
			{ "H_HelmetSpecO_blk", "Donor Helmet", 5000, { "life_donator", "SCALAR", 2 } },
			{ "H_CrewHelmetHeli_I", "Camo", 5000, { "life_donator", "SCALAR", 3 } },
			{ "H_CrewHelmetHeli_O", "Green", 5000, { "life_donator", "SCALAR", 3 } },
			{ "H_CrewHelmetHeli_B", "Vader", 5000, { "life_donator", "SCALAR", 3 } }
			
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 25, { "", "", -1 } },
			{ "G_Shades_Blue", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 20, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 20, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 20, { "", "", -1 } },
			{ "G_Squares", "", 10, { "", "", -1 } },
			{ "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } },
			{ "G_Squares", "", 100, { "", "", -1 } },
			{ "G_Aviator", "", 100, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 100, { "", "", -1 } },
			{ "G_Lady_Dark", "", 150, { "", "", -1 } },
			{ "G_Lady_Blue", "", 150, { "", "", -1 } },
			{ "G_Lowprofile", "", 300, { "", "", -1 } },
			{ "G_Combat", "", 5500, { "", "", -1 } },
			{ "G_Balaclava_lowprofile", "Balaclava LP", 5000, { "life_donator", "SCALAR", 4 } },
			{ "G_Bandanna_beast", "Beast", 5000, { "life_donator", "SCALAR", 5 } },
			{ "G_Bandanna_aviator", "aviator", 5000, { "life_donator", "SCALAR", 3 } },
			{ "G_Bandanna_sport", "Masked Sport", 5000, { "life_donator", "SCALAR", 2 } },
			{ "G_Bandanna_shades", "Masked Shades", 5000, { "life_donator", "SCALAR", 1 } },
			{ "G_Diving", "Dive Goggles", 5000, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_TacVest_khk", "", 20000, { "", "", -1 } },
			{ "V_BandollierB_cbr", "", 4500, { "", "", -1 } },
			{ "V_HarnessO_brn", "", 7000, { "", "", -1 } },
			{ "V_Rangemaster_belt", "", 1800, { "", "", -1 } },
			{ "V_PlateCarrier2_rgr", "", 50000, { "", "", -1 } },
			{ "V_RebreatherB", "", 5000, { "", "", -1 } },
			{ "V_RebreatherIA", "", 5000, { "", "", -1 } },
			{ "V_RebreatherIR", "", 5000, { "", "", -1 } },
			{ "V_HarnessOGL_gry", "SuicideVest", 500000, { "", "", -1 } },
			{ "V_PlateCarrierSpec_mtp", "Special Carrier", 250000, { "", "", -1 } },
			{ "V_PlateCarrierSpec_rgr", "Special Carrier", 250000, { "", "", -1 } },
			{ "V_PlateCarrierGL_rgr", "Carrier GL Green", 500000, { "", "", -1 } },
			{ "V_PlateCarrierIAGL_dgtl", "Carrier Rig Donor", 350000, { "life_donator", "SCALAR", 2 } }, 
			{ "V_PlateCarrierIAGL_oli", "Carrier GL Rig DonorSkin", 350000, { "life_donator", "SCALAR", 2 } }
			
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{"B_AssaultPack_cbr", "", 450, { "", "", -1 }},
			{ "B_Kitbag_mcamo", "", 400, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 800, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "", 800, { "", "", -1 } },
			{ "B_FieldPack_blk", "", 800, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 800, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 1000, { "", "", -1 } },
			{ "B_Carryall_oli", "", 2000, { "", "", -1 } },
			{ "B_Carryall_khk", "", 2000, { "", "", -1 } }
		};
	};

	class kart {
		title = "STR_Shops_C_Kart";
		license = "";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_C_Driver_1_black", "", 1500, { "", "", -1 } },
			{ "U_C_Driver_1_blue", "", 1500, { "", "", -1 } },
			{ "U_C_Driver_1_red", "", 1500, { "", "", -1 } },
			{ "U_C_Driver_1_orange", "", 1500, { "", "", -1 } },
			{ "U_C_Driver_1_green", "", 1500, { "", "", -1 } },
			{ "U_C_Driver_1_white", "", 1500, { "", "", -1 } },
			{ "U_C_Driver_1_yellow", "", 1500, { "", "", -1 } },
			{ "U_C_Driver_2", "", 3500, { "", "", -1 } },
			{ "U_C_Driver_1", "", 3600, { "", "", -1 } },
			{ "U_C_Driver_3", "", 3700, { "", "", -1 } },
			{ "U_C_Driver_4", "", 3700, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_RacingHelmet_1_black_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_red_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_white_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_blue_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_yellow_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_green_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_F", "", 2500, { "", "", -1 } },
			{ "H_RacingHelmet_2_F", "", 2500, { "", "", -1 } },
			{ "H_RacingHelmet_3_F", "", 2500, { "", "", -1 } },
			{ "H_RacingHelmet_4_F", "", 2500, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } }
		};
	};
	class law {
		title = "STR_Shops_law";
		license = "law";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_NikosAgedBody", "", 1500, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{"G_Shades_Black", "", 25, { "", "", -1 } },
			{ "G_Shades_Blue", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 20, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 20, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 20, { "", "", -1 } },
			{ "G_Squares", "", 10, { "", "", -1 } }
			
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } }
		};
	};
	class news {
		title = "STR_Shops_News";
		license = "news";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_NikosAgedBody", "", 100, { "", "", -1 } },
			{ "U_C_Journalist", "", 500, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Cap_press", "", 1500, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{"G_Shades_Black", "", 25, { "", "", -1 } },
			{ "G_Shades_Blue", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 20, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 20, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 20, { "", "", -1 } },
			{ "G_Squares", "", 10, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_Press_F", "", 0, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } }
		};
	};
};