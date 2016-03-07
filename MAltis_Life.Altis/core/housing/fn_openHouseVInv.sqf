#include <macro.h>

life_houseInUse = true;

[] spawn life_fnc_collectArmaItems;
cursorTarget setVariable ["inUse",true,true];
sleep 0.1;

VAS_fnc_fetchCfgDetails = {

		/*@version: 1.3
		@file_name: fn_fetchCfgDetails.sqf
		@file_author: TAW_Tonic
		@file_edit: 6/22/2013
		@file_description: Fetch information about the entities config

		USAGE:
		[Classname,Cfg* (Optional)] call VAS_fnc_fetchCfgDetails;

		Return:
		0: classname
		1: displayname
		2: picture
		3: scope
		4: type
		5: itemInfo Type (if any)
		6: Cfg Location i.e CfgWeapons
		7: Magazines
		8: Muzzles
		9: Short Description
		10: acc_Pointers
		11: acc_Optics
		12: acc_Muzzles*/

	private["_entity","_cfg","_ret","_type","_acc_p","_acc_o","_acc_m","_scope","_displayName","_picture","_config","_itemInfo","_muzzles","_magazines","_desc"];
	_entity = _this select 0;
	_acc_p = [];
	_acc_m = [];
	_acc_o = [];
	_magazines = [];
	_muzzles = [];
	_type = "";
	_itemInfo = "";
	_scope = 0;
	if(_entity == "") exitWith {[]};
	_cfg = if(isNil {_this select 1}) then
	{
		switch (true) do
		{
			case (isClass (configFile >> "CfgMagazines" >> _entity)) : {"CfgMagazines";};
			case (isClass (configFile >> "CfgWeapons" >> _entity)) : {"CfgWeapons";};
			case (isClass (configFile >> "CfgVehicles" >> _entity)) : {"CfgVehicles";};
			case (isClass (configFile >> "CfgGlasses" >> _entity)) : {"CfgGlasses";};
		};
	}
		else
	{
		_this select 1
	};

	//Final Check

	_ret = [];
	if(typeName _cfg != "STRING") exitWith {[]}; //Not a config
	if(!isClass (configFile >> _cfg >> _entity)) exitWith {[]};
	if(_cfg == "") exitWith {[]}; //Not a config, who is passing bad data?

	_config = configFile >> _cfg >> _entity;
	_displayName = getText(_config >> "displayName");
	_picture = getText(_config >> "picture");
	_desc = getText(_config >> "descriptionshort");

	switch (_cfg) do
	{
		case "CfgVehicles":
		{
			_type = getText(_config >> "vehicleClass");
			_scope = getNumber(_config >> "scope");
		};

		case "CfgWeapons":
		{
			_scope = getNumber(_config >> "scope");
			_type = getNumber(_config >> "type");
			_desc = getText(_config >> "descriptionshort");

			//Compatible attachments
			if(isClass (_config >> "WeaponSlotsInfo")) then
			{
				if(isClass (_config >> "WeaponSlotsInfo")) then
				{
					_acc_p = getArray(_config >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
					_acc_o = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
					_acc_m = getArray(_config >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
				};
			};

			if(isClass (_config >> "ItemInfo")) then
			{
				_itemInfo = getNumber(_config >> "ItemInfo" >> "Type");
			};
			_muzzles = getArray(_config >> "muzzles");
			_magazines = getArray(_config >> "magazines");
			if(!isNil {_muzzles}) then
			{
				private["_tmp","_base"];
				_base = inheritsFrom (configFile >> "CfgWeapons" >> _entity);
				{
					if(_x != "this") then
					{
						_tmp = getArray(_base >> _x >> "magazines");
						{
							_magazines set[count _magazines, _x];
						} foreach (_tmp);
					};
				} foreach _muzzles;
			};
		};

		case "CfgMagazines":
		{
			_scope = getNumber(_config >> "scope");
		};
	};

	_ret = [_entity,_displayName,_picture,_scope,_type,_itemInfo,_cfg,_magazines,_muzzles,_desc,_acc_p,_acc_o,_acc_m];
	_ret;
};

//##################

_house = cursorTarget;
disableSerialization;

_house setVariable ["inUse",[true,getPlayerUID player],true];
curHouse = _house;

if (!dialog) then {createDialog "life_virtInv_house";};

_display = findDisplay 6000;
_houseListbox    = _display displayCtrl 6003;
_ownInvListbox   = _display displayCtrl 6013;
_titleText       = _display displayCtrl 6005;
_swapToBackpackBtn = _display displayCtrl 2401;
_swapToHouseBtn    = _display displayCtrl 2400;
_closeBtn    = _display displayCtrl 2402;
_swapToBackpackBtn ctrlEnable false;
_swapToHouseBtn ctrlEnable false;
_closeBtn ctrlEnable false;
_content         = _house getVariable "content";
lbClear _houseListbox;
lbClear _ownInvListbox;

if (isNil "housing_lastIndexHouse") then { housing_lastIndexHouse = 0 };
if (isNil "housing_lastIndexOwnInv") then { housing_lastIndexOwnInv = 0 };

// Hausliste laden

_boxslots = 0;
_index = -1;
{
	if (_x select 0 != "B_supplyCrate_F" AND _x select 0 != "Box_IND_AmmoVeh_F" AND _x select 0 != "Box_IND_WpsSpecial_F" AND _x select 0 != "Box_IND_Grenades_F" AND _x select 0 != "_className") then {
		_item = [_x select 0] call VAS_fnc_fetchCfgDetails;
		_itemAnzahl = _x select 1;
		_itemPic = _item select 2;
		_itemDisplayName = _item select 1;
		_index = _index + 1;
		_houseListbox lbAdd format ["(%2) %1",_itemDisplayName,_itemAnzahl];
		_houseListbox lbSetPicture [_index, _itemPic];
		_houseListbox lbSetPictureColor [_index, [1, 1, 1, 1]];
		_houseListbox lbSetData [(lbSize _houseListbox)-1,_x select 0];
	} else {
		if (_x select 0 == "B_supplyCrate_F") then {_boxslots = _boxslots + 200;};
		if (_x select 0 == "Box_IND_AmmoVeh_F") then {_boxslots = _boxslots + 75;};
		if (_x select 0 == "Box_IND_WpsSpecial_F") then {_boxslots = _boxslots + 75;};
		if (_x select 0 == "Box_IND_Grenades_F") then {_boxslots = _boxslots + 75;};
	};
} forEach _content;

curHouseSpace = _boxslots;

_itemAmount = -1;
{
	_itemAmount = _itemAmount + (_x select 1);
} forEach _content;
if(_itemAmount != -1) then {_itemAmount = _itemAmount + 1;};
_titleText ctrlSetText format ["House Virtual Inventory [%1/%2]",_itemAmount,curHouseSpace];

// Spielerliste laden

_magazines = [];
_items = backpackItems player + vestItems player + uniformItems player + assignedItems player;
_primary = primaryWeapon player;
_launcher = secondaryWeapon player;
_handgun = handGunWeapon player;
_uniform = uniform player;
_headgear = headgear player;
_goggles = goggles player;
_vest = vest player;
_backpack = backpack player;


if(count (primaryWeaponMagazine player) > 0) then {
    _magazines pushback SEL((primaryWeaponMagazine player),0);
};
if(count (handgunMagazine player) > 0) then {
    _magazines pushback SEL((handgunMagazine player),0);
};
if(count (secondaryWeaponMagazine player) > 0) then {
    _magazines pushback SEL((secondaryWeaponMagazine player),0);
};

if(count (RIFLE_ITEMS) > 0) then {
    {
    	if(_x != "") then {
			_items pushback _x;
    	};
    } forEach (primaryWeaponItems player);
};

if(count (PISTOL_ITEMS) > 0) then {
    {
		if(_x != "") then {
			_items pushback _x;
    	};
    } forEach (handGunItems player);
};

playerInventoryArray = [];

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

if (_primary!="") then {
	_index = -1;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _primary) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_primary,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_primary,1]];
	};
};

if (_launcher!="") then {
	_index = -1;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _launcher) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_launcher,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_launcher,1]];
	};
};

if (_handgun!="") then {
	_index = -1;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _handgun) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_handgun,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_handgun,1]];
	};
};

if (_headgear!="") then {
	_index = -1;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _headgear) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_headgear,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_headgear,1]];
	};
};

if (_goggles!="") then {
	_index = -1;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _goggles) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_goggles,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_goggles,1]];
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
	_ownInvListbox lbAdd format ["(%2) %1",_itemDisplayName,_itemAnzahl];
	_ownInvListbox lbSetPicture [_index, _itemPic];
	_ownInvListbox lbSetPictureColor [_index, [1, 1, 1, 1]];
	_ownInvListbox lbSetData [(lbSize _ownInvListbox)-1,_x select 0];
} forEach playerInventoryArray;

_houseListbox lbSetCurSel housing_lastIndexHouse;
_ownInvListbox lbSetCurSel housing_lastIndexOwnInv;

life_isSwapping = false;

_swapToBackpackBtn ctrlEnable true;
_swapToHouseBtn ctrlEnable true;
_closeBtn ctrlEnable true;

[] spawn {
	waitUntil {isNull (findDisplay 6000)};
	sleep 0.1;
	if (isNull (findDisplay 6000)) then {
		life_houseInUse = false;
		[] call SOCK_fnc_updateRequest;
		[[curHouse],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
		curHouse setVariable ["inUse",[false,""],true];
	};
};

if (!life_houseInUse) then {
	life_houseInUse = true;
	waitUntil {!life_houseInUse};
	[] call SOCK_fnc_updateRequest;
	[[curHouse],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
	curHouse setVariable ["inUse",[false,""],true];
	life_houseInUse = false;
};