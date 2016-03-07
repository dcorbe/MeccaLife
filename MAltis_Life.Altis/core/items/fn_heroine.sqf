/*
		fn_heroine.sqf
		Author: Cal
*/
//Little hint then wait a litle before starting drugs effects
hint "Wheres my lighter?! Obama Health Care #1!";
sleep 3;
private["_force"];
for "_i" from 0 to 200 do
{
	_force = random 15;
	"chromAberration" ppEffectEnable true;
	"chromAberration" ppEffectAdjust [_force / 24, _force / 24, false];
	"chromAberration" ppEffectCommit (0.3 + random 0.1);
	waituntil {ppEffectCommitted "chromAberration"};
	sleep 0.02;
};

"chromAberration" ppEffectEnable false;