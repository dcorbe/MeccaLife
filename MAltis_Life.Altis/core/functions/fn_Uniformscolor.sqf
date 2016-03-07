#include <macro.h>
/*
		fn_Uniformscolor.sqf
		
		Descriptions: Colors Uniforms
*/
#define FETCH_CONST(var) (call var)

if(playerSide == independent) then {
	if ((uniform player) == "U_I_CombatUniform_tshirt") then {
		player setObjectTextureGlobal [0, "textures\medic_uniform.jpg"];
	};
};


if(playerSide == WEST) then {
	// Cop Level 1 & 2
	if (backpack player == "B_Carryall_oucamo") then {
    	(unitbackpack player) setObjectTextureGlobal [0, ""]; 
	};
	
	if (uniform player == "U_Rangemaster") then {
		player setObjectTextureGlobal [0, "textures\cadettroop.jpg"]; 
	};
	// Cop Level 3 & 4
	if (uniform player == "U_BG_Guerilla3_2") then {
		player setObjectTextureGlobal [0, "textures\corptroop.jpg"]; 
	};
	// Cop Level 5 & 6 & 7
	if (uniform player == "U_O_OfficerUniform_ocamo") then {
		player setObjectTextureGlobal [0, "textures\capttroop.jpg"]; 
	};
	
	if (uniform player == "U_O_SpecopsUniform_ocamo") then {
		player setObjectTextureGlobal [0, "textures\swat.jpg"]; 
	};
};

if(playerSide == civilian) then {
	if((uniform player == "U_I_CombatUniform") && ( (FETCH_CONST(life_donator)) == 5)) then {
	player setObjectTextureGlobal [0, "textures\mafia.paa"];
	};
	
	if (backpack player == "B_Carryall_oucamo") then {
    	(unitbackpack player) setObjectTextureGlobal [0, ""]; 
	};
	
	if(uniform player == "U_C_Poloshirt_blue") then {
	player setObjectTextureGlobal [0, "textures\meccashirt.jpg"];
	};
	
	if (uniform player == "U_BG_Guerilla2_2") then {
		player setObjectTextureGlobal [0, "textures\cadettroop.jpg"]; 
	};
	// Cop Level 3 & 4
	if (uniform player == "U_BG_Guerilla3_2") then {
		player setObjectTextureGlobal [0, "textures\corptroop.jpg"]; 
	};
	// Cop Level 5 & 6 & 7
	if (uniform player == "U_O_OfficerUniform_ocamo") then {
		player setObjectTextureGlobal [0, "textures\capttroop.jpg"]; 
	};
};