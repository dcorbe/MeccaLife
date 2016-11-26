if (isNil {profileNamespace getVariable "playersales"}) then {profileNamespace setVariable ["playersales",[]];};
_listings = profileNamespace getVariable "playersales";
[[1,_listings],"TON_fnc_SAH_reciever",false,false] spawn life_fnc_mp;