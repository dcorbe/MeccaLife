_caller = [_this,0,objNull] call BIS_FNC_PARAM;
_offer = [_this,2,[]] call BIS_FNC_PARAM;
_sellerObj = [_this,1,objNull] call BIS_FNC_PARAM;
if (!(_offer in SAH_offers)) exitWith {[[3],"life_fnc_CAH_reciever",_caller,false] spawn life_fnc_mp;};
_offer spawn TON_fnc_SAH_removeOffer;
[[0,[_offer select 1,_offer select 2,_sellerObj]],"life_fnc_CAH_reciever",_caller,false] spawn life_fnc_mp;
[[1,[_caller,_offer select 2,_offer]],"life_fnc_CAH_reciever",_sellerObj,false] spawn life_fnc_mp;