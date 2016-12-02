#include <macro.h>
/*
	Author: Murali
	
	Desription:
	Blacks out players screen and forces them into a group. Also disables their comms.
*/
[player] joinSilent (createGroup civilian);
cutText ["You have been blindfolded","BLACK",1,true];
player setVariable ["BIS_noCoreConversations", true];
player setVariable ["blindfolded",true,true];