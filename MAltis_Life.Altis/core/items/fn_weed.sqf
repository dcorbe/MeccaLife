/*
	File: fn_weed.sqf
	Author: Cal
	
	Description: Color effect for weed usage, fades over time, lasts for 10ish minutes
*/
closeDialog 0;
sleep 1;

life_degradeEffect = 3.2;
if(count attachedObjects player < 3) then {
	_smoke = "SmokeShell" createVehicle position player;
	if (vehicle player != player) then {
		_smoke attachTo [vehicle player, [0,-1,0]];
	} else {
		_smoke attachTo [player, [0,0,1.2]];
	};
};

while {life_degradeEffect > 0.2} do {
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.0], [random(life_degradeEffect),random(life_degradeEffect),random(life_degradeEffect),random(1)], [random(life_degradeEffect),random(life_degradeEffect),random(life_degradeEffect), random(1)]];
	"colorCorrections" ppEffectCommit 1;
	life_degradeEffect = life_degradeEffect - 0.012;
	if(!alive player) then {
		life_degradeEffect = 0;
	};
	sleep 2.5;
};

"chromAberration" ppEffectEnable false;
"colorCorrections" ppEffectEnable false;