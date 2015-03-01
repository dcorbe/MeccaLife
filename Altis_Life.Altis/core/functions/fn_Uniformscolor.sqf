#include <macro.h>
/*
		fn_Uniformscolor.sqf
*/
#define FETCH_CONST(var) (call var)

if(side player == independent) then {
	if ((uniform player) == "U_Rangemaster") then {
		player setObjectTextureGlobal [0, "textures\medic_uniform.jpg"];
	};
};


if(side player == WEST) then {
	// Cop Level 1 & 2
	if (uniform player == "U_BG_Guerilla2_2" && FETCH_CONST(life_coplevel) == 1) OR FETCH_CONST(life_coplevel) == 2)) then {
		player setObjectTextureGlobal [0, "textures\cadettroop.jpg"]; 
	};
	// Cop Level 3 & 4
	if (uniform player == "U_I_CombatUniform" && (FETCH_CONST(life_coplevel) == 3 OR FETCH_CONST(life_coplevel) == 4)) then {
		player setObjectTextureGlobal [0, "textures\corptroop.jpg"]; 
	};
	// Cop Level 5 & 6 & 7
	if (uniform player == "U_O_OfficerUniform_ocamo" && (FETCH_CONST(life_coplevel) == 5 OR FETCH_CONST(life_coplevel) == 6 OR FETCH_CONST(life_coplevel) == 7)) then {
		player setObjectTextureGlobal [0, "textures\capttroop.jpg"]; 
	};
};


if(side player == civilian) then {
	// Prisoner 
	if(side player == civilian && uniform player == "U_I_CombatUniform" && FETCH_CONST(life_donator) == 1 && FETCH_CONST(life_donator) == 2 && FETCH_CONST(life_donator) == 3 && FETCH_CONST(life_donator) == 4 && FETCH_CONST(life_donator) == 5 && FETCH_CONST(life_donator) == 6)) then {
	player setObjectTextureGlobal [0, "textures\mafia.paa"];
	};
};