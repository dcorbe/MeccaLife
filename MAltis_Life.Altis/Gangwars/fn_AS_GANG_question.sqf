	_player = _this select 0;
	_ans = [format ["%1 has asked you to start a gang war",name _player],"Start Gang War","Yes","No"] call BIS_fnc_guiMessage;
	[[_ans],"life_fnc_AS_GANG_answer",_player,false] spawn life_fnc_mp;