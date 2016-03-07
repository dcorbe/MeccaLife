_mode = _this select 0;
disableSerialization;
_display = findDisplay 6000;
_houseListbox    = _display displayCtrl 6003;
_ownInvListbox   = _display displayCtrl 6013;
_hausClassname   = _display displayCtrl 6011;
_hausAmount      = _display displayCtrl 6012;
_ownInvClassname = _display displayCtrl 6001;
_ownInvAmount    = _display displayCtrl 6002;

_index1 = lbCurSel _houseListbox;
_index2 = lbCurSel _ownInvListbox;
_selClassname1 = _houseListbox lbData _index1;
_selClassname2 = _ownInvListbox lbData _index2;
_content = cursorTarget getVariable "content";

switch (_mode) do {
	case 0:
	{
		{
			if (_x select 0 == _selClassname1) then {
				_item = [_selClassname1] call VAS_fnc_fetchCfgDetails;
				_itemDN = _item select 1;
				_ownInvClassname ctrlSetText _itemDN;
				_ownInvAmount ctrlSetText format ["%1",_x select 1];
			};
		} forEach _content;
		housing_lastIndexHouse = _index1;
	};
	case 1:
	{
		{
			if (_x select 0 == _selClassname2) then {
				_item = [_selClassname2] call VAS_fnc_fetchCfgDetails;
				_itemDN = _item select 1;
				_hausClassname ctrlSetText _itemDN;
				_hausAmount ctrlSetText format ["%1",(_x select 1)];
			};
		} forEach playerInventoryArray;
		housing_lastIndexOwnInv = _index2;
	};
	case 2:
	{
		[] spawn {
			sleep 0.1;
			if (isNull (findDisplay 6000)) then {
				[] call SOCK_fnc_updateRequest;
				[[curHouse],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
				curHouse setVariable ["inUse",[false,""],true];
				life_houseInUse = false;
			};
		};
	};
};