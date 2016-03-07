AH_loaded = false;
[[0,player],"TON_fnc_SAH_reciever",false,false] spawn life_fnc_mp;
waitUntil {AH_loaded};
waitUntil {createDialog "AH_buy";};
disableSerialization;
_dialog = findDisplay 15100;

/* THIS FUNCTION HAS BEEN CREATED BY KILLZONEKID */
KK_fnc_intToString = {
    _s = "";
    while {_this >= 10} do {
        _this = _this / 10;
        _s = format ["%1%2", round ((_this % floor _this) * 10), _s];
        _this = floor _this;
    };
    format ["%1%2", _this, _s];
};
/* THIS FUNCTION HAS BEEN CREATED BY KILLZONEKID */

_myListbox = _dialog displayCtrl 15101;
{
	_curOffer = _x;
	_pid = _curOffer select 0;
	_item = _curOffer select 1;
	_price = _curOffer select 2;
	_seller = [_pid] call life_fnc_CAH_getPlayerObj;
	_myListbox lbAdd format ["%3 for %2 by %1",name _seller,_price call KK_fnc_intToString,([_item] call VAS_fnc_fetchCfgDetails) select 1];
	_myListbox lbSetPicture [(lbSize _myListbox)-1, ([_item] call VAS_fnc_fetchCfgDetails select 2)];
	_myListbox lbSetPictureColor [(lbSize _myListbox)-1, [1, 1, 1, 1]];
	_myListbox lbSetData [(lbSize _myListbox)-1,format ["%1",[_pid,_item,_price call KK_fnc_intToString]]];
} forEach AH_offers;
hint "Successfully loaded offers";