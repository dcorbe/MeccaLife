/*
		fn_federalUpdate.sqf
*/
private["_goldB"];
while {true} do
{
	sleep (30 * 60);
	_goldB = gold_safe getVariable["gold",0];
	gold_safe setVariable["gold",round(_goldB+round(random 100)),true]; //Adds a random number of gold ever hour or 2 hours.
};