disableSerialization;
_dialog = findDisplay 15000;
_myListbox = _dialog displayCtrl 15001;
_myAmount = _dialog displayCtrl 15002;

_tochangePriceText = ctrlText _myAmount;
_tochangePriceNumber = parseNumber _tochangePriceText;

if (_tochangePriceText=="") exitWith {hint parseText "<t color='#FF0000'>--ERROR--</t><br/><t color='#FF0000'>INVALID INPUT</t>";};
if (lbCurSel _myListbox < 0) exitWith {hint "Please select an Item";};
_classname = _myListbox lbData (lbCurSel _myListbox);
_price = floor(_tochangePriceNumber);

if (_price < 1) exitWith {hint "Invalid value"};

if (isNil {profileNamespace getVariable "listings"}) then {profileNamespace setVariable ["listings",[]];};
_currentListings = profileNamespace getVariable "listings";
_currentListings pushBack [getPlayerUID player,_classname,_price];
profileNamespace setVariable ["listings",_currentListings];

systemChat format ["%1",[getPlayerUID player,_classname,_price]];

[[[getPlayerUID player,_classname,_price]],"TON_fnc_SAH_addOffer",false,false] call life_fnc_mp;

hint parseText format
[	"Created Offer:<br/><br/>
	<t color='#FF0000'>%1</t> for<br/>
	<t color='#228B22'>%3%2</t>",
	([_classname] call VAS_fnc_fetchCfgDetails select 1),_price,"$"
];

[_classname,false] spawn life_fnc_handleItem;

closeDialog 0;