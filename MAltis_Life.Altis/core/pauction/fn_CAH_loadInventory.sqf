waitUntil {createDialog "AH_sell";};

disableSerialization;
_dialog = findDisplay 15000;
_myInvListbox = _dialog displayCtrl 15001;

lbClear _myInvListbox;
playerInventoryArray = [];
_magazines = magazines player;
_items = items player;
_weapons = currentWeapon player;
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;

{
	_index = -1;
	_curItemName = _x;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _curItemName) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_curItemName,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_curItemName,1]];
	};
} forEach _magazines;

{
	_index = -1;
	_curItemName = _x;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _curItemName) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_curItemName,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_curItemName,1]];
	};
} forEach _items;

if (_weapons!="") then {
	_index = -1;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _weapons) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_weapons,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_weapons,1]];
	};
};

if (_backpack!="") then {
	playerInventoryArray pushBack [_backpack,1];
};

if (_vest!="") then {
	_index = -1;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _vest) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_vest,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_vest,1]];
	};
};

if (_uniform!="") then {
	_index = -1;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _uniform) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_uniform,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_uniform,1]];
	};
};

_index = -1;
{
	_item = [_x select 0] call VAS_fnc_fetchCfgDetails;
	_itemAnzahl = _x select 1;
	_itemPic = _item select 2;
	_itemDisplayName = _item select 1;
	_index = _index + 1;
	_myInvListbox lbAdd format ["(%2) %1",_itemDisplayName,_itemAnzahl];
	_myInvListbox lbSetPicture [_index, _itemPic];
	_myInvListbox lbSetPictureColor [_index, [1, 1, 1, 1]];
	_myInvListbox lbSetData [(lbSize _myInvListbox)-1,_x select 0];
} forEach playerInventoryArray;