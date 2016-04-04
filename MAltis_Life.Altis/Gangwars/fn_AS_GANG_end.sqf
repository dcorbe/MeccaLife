_reward = _this select 0;
if ({side _x == civilian} count playableUnits < 8) exitWith {hint "No reward, Not enough players online."};  
life_cash = life_cash + _reward;
systemChat format ["You have got $%1 for winning a gang war",_reward];