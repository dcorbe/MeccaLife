if (isNil {profileNamespace getVariable "listings"}) then {profileNamespace setVariable ["listings",[]];};
_listings = profileNamespace getVariable "listings";
[[1,_listings],"TON_fnc_SAH_reciever",false,false] spawn life_fnc_mp;