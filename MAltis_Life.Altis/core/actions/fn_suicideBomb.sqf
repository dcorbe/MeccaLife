/*
	fn_suicideBomb.sqf

*/
private["_boom", "_list"];
if(vest player != "V_HarnessOGL_gry") exitWith {};

life_isSuiciding = true;

sleep 3;

if(vest player != "V_HarnessOGL_gry") exitWith {life_isSuicide = false;};
	
removeVest player;
_boom = "Bo_Mk82" createVehicle [0,0,9999];
_boom setPos (getPos player);
_boom setVelocity [100,0,0];

life_norevive = true;

if(alive player) then {player setDamage 1;};

life_isSuicide = false;

[[0,format["%1 went Kablooey.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;