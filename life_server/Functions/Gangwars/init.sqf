/* INIT GANG WAR SYSTEM BY ARMA-SERVICES.DE */
// CONFIGURATION

_zones =
[ /* POSITION OF THE GANG ZONE, DISPLAYNAME, X, Y, CAPTURE REWARD, CAPTURE PROC. SPEED, CAPTURE TIME IN MIN*/
	[[11537.467,7052.0,0.04],"Weapon Cache",450,450,300000,0.05,15,-1,grpNull,false],
	[[08906.83,7485.0,0.04],"Tactics Division",450,450,200000,0.05,15,-1,grpNull,false],
	[[12297.96,8883.0,0.04],"Logistics",450,450,170000,0.05,15,-1,grpNull,false],
	[[10417,8741.0,0.04],"High Command",450,450,250000,0.05,15,-1,grpNull,false]
];

// DO NOT TOUCH THE CODE BELOW
{
	createMarker [_x select 1, _x select 0];
	(_x select 1) setMarkerColor "ColorRed";
	(_x select 1) setMarkerType "Empty";
	(_x select 1) setMarkerShape "ELLIPSE";
	(_x select 1) setMarkerSize [_x select 2,_x select 3];
	(_x select 1) setMarkerAlpha 0.5;
} forEach _zones;

AS_GANG_zones = _zones;
AS_GANG_fight = false;
publicVariable "AS_GANG_fight";