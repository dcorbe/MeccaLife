arma3_weapons = [];

		_cfgweapons = configFile >> "CfgWeapons";
		_weapons = [];

		for "_i" from 0 to (count _cfgWeapons)-1 do
		{
			_cur_wep = _cfgweapons select _i;

			if(isClass _cur_wep) then
			{
				_classname = configName _cur_wep;
				_wep_type = getNumber(_cur_wep >> "type");
				_scope = getNumber(_cur_wep >> "scope");
				_picture = getText(_cur_wep >> "picture");
				if(_scope >= 2 && _wep_type in [1,2,4,4096] && _picture != "" && !(_classname in _weapons) && _classname != "NVGoggles") then
				{
					//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
					arma3_weapons set[count arma3_weapons, _classname];
				};
			};
		};

arma3_magazines = [];

		_cfgweapons = configFile >> "CfgMagazines";
		_magazines = [];

		for "_i" from 0 to (count _cfgWeapons)-1 do
		{
			_cur_wep = _cfgweapons select _i;

			if(isClass _cur_wep) then
			{
				_classname = configName _cur_wep;
				//_wep_type = getNumber(_cur_wep >> "type");
				_scope = getNumber(_cur_wep >> "scope");
				_picture = getText(_cur_wep >> "picture");
				if(_scope >= 2 && _picture != "" && !(_classname in _magazines)) then
				{
					arma3_magazines set[count arma3_magazines, _classname];
				};
			};
		};

arma3_items = [];

		_cfgweapons = configFile >> "CfgWeapons";
		_items = [];

		for "_i" from 0 to (count _cfgWeapons)-1 do
		{
			_cur_wep = _cfgweapons select _i;

			if(isClass _cur_wep) then
			{
				_classname = configName _cur_wep;
				_wep_type = getNumber(_cur_wep >> "type");
				_scope = getNumber(_cur_wep >> "scope");
				_picture = getText(_cur_wep >> "picture");
				//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
				if(_scope >= 2 && _wep_type in [131072,4096] && _picture != "" && !(_classname in _items) && _classname != "Binocular") then
				{
					//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
					arma3_items set[count arma3_items, _classname];
				};
			};
		};

arma3_backpacks = [];

		_cfgweapons = configFile >> "CfgVehicles";
		_backpacks = [];

		for "_i" from 0 to (count _cfgWeapons)-1 do
		{
			_cur_wep = _cfgweapons select _i;

			if(isClass _cur_wep) then
			{
				_classname = configName _cur_wep;
				_wep_type = getText(_cur_wep >> "vehicleClass");
				_scope = getNumber(_cur_wep >> "scope");
				_picture = getText(_cur_wep >> "picture");
				if(_scope >= 2 && _wep_type == "Backpacks" && _picture != "" && !(_classname in _backpacks)) then
				{
					//diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
					arma3_backpacks set[count arma3_backpacks, _classname];
				};
			};
		};

arma3_vests = [];

                _cfgweapons = configFile >> "CfgVehicles";
                _vests = [];

                for "_i" from 0 to (count _cfgWeapons)-1 do
                {
                        _cur_wep = _cfgweapons select _i;

                        if(isClass _cur_wep) then
                        {
                                _classname = configName _cur_wep;
                                _wep_type = getText(_cur_wep >> "vehicleClass");
                                _scope = getNumber(_cur_wep >> "scope");
                                _picture = getText(_cur_wep >> "picture");
                                if(_scope >= 2 && _wep_type == "Vests" && _picture != "" && !(_classname in _vests)) then
                                {
                                        //diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
                                        arma3_vests set[count arma3_vests, _classname];
                                };
                        };
                };

arma3_uniforms = [];

                _cfgweapons = configFile >> "CfgVehicles";
                _uniforms = [];

                for "_i" from 0 to (count _cfgWeapons)-1 do
                {
                        _cur_wep = _cfgweapons select _i;

                        if(isClass _cur_wep) then
                        {
                                _classname = configName _cur_wep;
                                _wep_type = getText(_cur_wep >> "vehicleClass");
                                _scope = getNumber(_cur_wep >> "scope");
                                _picture = getText(_cur_wep >> "picture");
                                if(_scope >= 2 && _wep_type == "Uniforms" && _picture != "" && !(_classname in _uniforms)) then
                                {
                                        //diag_log format["Class: %1 - Type: %2 - Scope: %3 - Pic: %4 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
                                        arma3_uniforms set[count arma3_uniforms, _classname];
                                };
                        };
                };