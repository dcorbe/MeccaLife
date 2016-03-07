/*
	File: fn_earplugs.sqf
	Auhtor: UnNamed
	
	Description:Roleplays mechanic to lower sound using "ear plugs"
*/
life_earplugs = !life_earplugs;

if (life_earplugs) then 
{
	1 fadeSound 0.2; // Faded to 20%
	titleText ["You have inserted earplugs.", "PLAIN"];
}
else
{
	1 fadeSound 1; // Returned to 100%
	titleText ["You have removed your earplugs.", "PLAIN"];
};