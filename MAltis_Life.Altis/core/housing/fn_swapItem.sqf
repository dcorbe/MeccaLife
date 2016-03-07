disableSerialization;
if(life_isSwapping) exitWith {};
life_isSwapping = true;

_mode = _this select 0;

_display = findDisplay 6000;
_houseListbox    = _display displayCtrl 6003;
_ownInvListbox   = _display displayCtrl 6013;
_hausClassname   = _display displayCtrl 6001;
_hausAmount      = _display displayCtrl 6002;
_ownInvClassname = _display displayCtrl 6011;
_ownInvAmount    = _display displayCtrl 6012;
_swapToBackpackBtn = _display displayCtrl 2401;
_swapToHouseBtn    = _display displayCtrl 2400;
_closeBtn    = _display displayCtrl 2402;

_swapToBackpackBtn ctrlEnable false;
_swapToHouseBtn ctrlEnable false;
_closeBtn ctrlEnable false;

_index1 = lbCurSel _houseListbox;
_index2 = lbCurSel _ownInvListbox;

curHouse = cursorTarget;

_pid = (curHouse getVariable "inUse") select 1;

if (_pid!=getplayerUID player) exitWith { hint parseText "<t color='#FF0000' size='1'>The house inventory was closed by the anti dupe police!";curHouse setVariable ["inUse",[false,""],true];closeDialog 0; };

_selClassname1 = _houseListbox lbData _index1;
_selClassname2 = _ownInvListbox lbData _index2;

if (_pid==getplayerUID player) then {
	switch (_mode) do {
		case 0 : {
			if (_selClassname1 == "") exitWith {};
			_house = cursorTarget;
			_content = _house getVariable "content";
			_index = -1;
			{
				_index = _index + 1;
				if (_x select 0 == _selClassname1 AND _selClassname1 != "B_supplyCrate_F" AND _selClassname1 != "Box_IND_AmmoVeh_F" AND _selClassname1 != "Box_IND_WpsSpecial_F" AND _selClassname1 != "Box_IND_Grenades_F") then {

					_wasHandled = false;
					_uniformWasMoved = false;
					_canBeRemoved = true;

					/*if (_selClassname1 in arma3_weapons) then { player addWeapon _selClassname1;_wasHandled = true; };
					if (_selClassname1 in arma3_magazines) then { player addMagazine _selClassname1;_wasHandled = true; };
					if (_selClassname1 in arma3_items) then { player addItem _selClassname1;_wasHandled = true; _uniformWasMoved = true; };
					if (_selClassname1 in arma3_backpacks) then { player addBackpack _selClassname1;_wasHandled = true; };
					if (!_wasHandled) then { player addVest _selClassname1;player addUniform _selClassname1; };
					//if !(_selClassname1 in items player AND play AND  AND !_wasHandled) then { player addVest _selClassname1;player addUniform _selClassname1; };
					if (_uniformWasMoved && !(_selClassname1 in items player)) then {
						_finallyHandled = false;
						if (uniform player != _selClassname1 OR (uniform player == "")) then { player addUniform _selClassname1; _finallyHandled = true; };
						if (vest player != _selClassname1 OR (vest player == "")) then { player addVest _selClassname1; _finallyHandled = true; };
						if (!_finallyHandled) then { player addHeadgear _selClassname1;player addGoggles _selClassname1; };
					};*/

					/*if (_selClassname1 in arma3_weapons) then { player addWeapon _selClassname1;_wasHandled = true; };
					if (_selClassname1 in arma3_backpacks) then { player addBackpack _selClassname1;_wasHandled = true; };
					if (_selClassname1 in arma3_magazines) then {
						if (!_wasHandled) then {
							if (player canAdd _selClassname1) then {
								player addMagazine _selClassname1;
								_wasHandled = true;
							} else { _canBeRemoved = false; };
						};
					};

					if !(_wasHandled) then {
						if (player canAdd _selClassname1) then {
							player addItem _selClassname1;
						} else { _canBeRemoved = false; };
					};*/
					
					[_selClassname1,true] spawn life_fnc_handleItem;

					if (_canBeRemoved) then {
						if (((_content select _index select 1)-1)==0) then {
							_content deleteAt _index;
							cursorTarget setVariable ["content",_content,true];
						} else {
							_content set [_index,[_selClassname1,((_content select _index select 1)-1)]];
							cursorTarget setVariable ["content",_content,true];
						};
					} else {
						_item = [_selClassname1] call VAS_fnc_fetchCfgDetails;
						hint format ["You have no room in your inventory for: %1",_item select 1];
					};
				};
			} forEach _content;
		};
		case 1 : {
			if (_selClassname2 == "") exitWith {};
			_house = cursorTarget;
			_content = _house getVariable "content";

			_boxslotsused = 0;
				{
					if (_x select 0 in ["B_supplyCrate_F","Box_IND_AmmoVeh_F","Box_IND_WpsSpecial_F","Box_IND_Grenades_F"]) then {} else {
								_boxslotsused = _boxslotsused + (_x select 1);
						};
				} forEach _content;

			if ((_boxslotsused+1) <= curHouseSpace) then {

					/*_wasHandled = false;
					if (_selClassname2 in arma3_weapons AND (currentWeapon player != _selClassname2) AND (uniform player != _selClassname2) AND (vest player != _selClassname2) AND !(_selClassname1 in (assignedItems player))) then { player removeItem _selClassname2; _wasHandled = true;};
					if (_selClassname2 in arma3_magazines) then { player removeMagazine _selClassname2; _wasHandled = true;};
					if (_selClassname2 in arma3_items && (_selClassname2 != vest player) && (_selClassname2 != uniform player)) then { player removeItem _selClassname2; _wasHandled = true;};
					if (_selClassname2 in arma3_backpacks) then { removeBackpack player; _wasHandled = true;};
					if (!_wasHandled) then
					{
						if (_selClassname2==currentWeapon player) then { player removeWeapon _selClassname2; };
						if (_selClassname2==vest player) then { removeVest player; };
						if (_selClassname2==uniform player) then { removeUniform player; }
					};*/
				
				[_selClassname2,false] spawn life_fnc_handleItem;

				_wasInArray = false;
				_index = -1;
				{
					_index = _index + 1;
					if (_x select 0 == _selClassname2) then {
						_wasInArray = true;
						_content set [_index,[_selClassname2,((_content select _index select 1)+1)]];
						cursorTarget setVariable ["content",_content,true];
					};
				} forEach _content;
				if (!_wasInArray) then {_content pushBack [_selClassname2,1];cursorTarget setVariable ["content",_content,true];};
			} else {
				if (true) exitWith {hint "This house is full!"};
			};
		};
	};

	//closeDialog 0;
	if (true) then {[] spawn life_fnc_openHouseVInv;};
};

[] spawn {
	sleep 0.1;
	if (isNull (findDisplay 6000)) then {
		[] call SOCK_fnc_updateRequest;
		[[curHouse],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
		curHouse setVariable ["inUse",[false,""],true];
		life_houseInUse = false;
	} else {
		sleep 0.1;
		if (isNull (findDisplay 6000)) then {
			[] call SOCK_fnc_updateRequest;
			[[curHouse],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
			curHouse setVariable ["inUse",[false,""],true];
			life_houseInUse = false;
		} else {};
	};
};

