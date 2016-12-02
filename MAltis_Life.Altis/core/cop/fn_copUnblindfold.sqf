#include <macro.h>
/*
	Author: Murali
	
	Desription:
	Returns player to normal.
*/
cutText ["You have been unblindfolded","BLACK IN",1,true];
player setVariable ["BIS_noCoreConversations", false];
player setVariable ["blindfolded", false, true];
[] spawn life_fnc_initGang;