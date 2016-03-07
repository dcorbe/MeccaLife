/*
	File: fn_seizePlayerWeaponAction.sqf
	
	Description:
	Removes the players weapons client side
*/
removeAllWeapons player;
if (uniform player in life_hidden_clothing) then {removeUniform player;};
if (vest player in life_hidden_clothing or vest player == "V_HarnessOGL_gry") then {removeVest player;};
if (headgear player in life_hidden_clothing) then {removeHeadgear player;};
//if (backpack player in ["B_Bergen_blk","B_Kitbag_mcamo_Eng"]) then {removeBackpack player;};

license_civ_gun = false;
license_civ_vigilante = false;
/*
if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
if(life_inv_lockpick > 0) then {[false,"lockpick",life_inv_lockpick] call life_fnc_handleInv;};
if(life_inv_ziptie > 0) then {[false,"ziptie",life_inv_ziptie] call life_fnc_handleInv;};
*/


[] call life_fnc_civFetchGear;
[] call SOCK_fnc_updateRequest;
[] call life_fnc_civLoadGear;
life_last_sync = time;
titleText["The Illegal issued gear on your personnel has been seized.","PLAIN"];
