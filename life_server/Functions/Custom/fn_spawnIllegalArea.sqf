/*
spawnIllegalArea.sqf
*/
 
private["_heli"];

//Create Frog area
_heli = "Land_ClutterCutter_small_F" createVehicle (["mrkfrogGreen",0,["mrkfrogRed","mrkfrogRed_1","mrkfrogRed_2","mrkfrogRed_3","mrkfrogRed_4"]] call SHK_pos);
_heli setPosASLW [(position _heli) select 0, (position _heli) select 1, -5.5];
_heli enableSimulation false;
 
_Pos = position _heli;
 _marker = createMarker ["frog_1", _Pos];
"frog_1" setMarkerColor "ColorRed";
"frog_1" setMarkerText "Frog Swamp";
"frog_1" setMarkerType "mil_dot";

_marker = createMarker ["frog_redZone", _Pos];
"frog_redZone" setMarkerColor "ColorRed";
"frog_redZone" setMarkerShape "ELLIPSE";
"frog_redZone" setMarkerSize [150, 150];
"frog_redZone" setMarkerBrush "DiagGrid";


//Create cocaine area
_heli = "Land_ClutterCutter_small_F" createVehicle (["mrkcocaineGreen",0,["mrkcocaineRed","mrkcocaineRed_1","mrkcocaineRed_2","mrkcocaineRed_3","mrkcocaineRed_4"]] call SHK_pos);
_heli setPosASLW [(position _heli) select 0, (position _heli) select 1, -5.5];
_heli enableSimulation false;
 
_Pos = position _heli;
 _marker = createMarker ["cocaine_1", _Pos];
"cocaine_1" setMarkerColor "ColorRed";
"cocaine_1" setMarkerText "Cocaine Field";
"cocaine_1" setMarkerType "mil_dot";

_marker = createMarker ["cocaine_redZone", _Pos];
"cocaine_redZone" setMarkerColor "ColorRed";
"cocaine_redZone" setMarkerShape "ELLIPSE";
"cocaine_redZone" setMarkerSize [200, 200];
"cocaine_redZone" setMarkerBrush "DiagGrid";
 
//Create heroine area
_heli = "Land_ClutterCutter_small_F" createVehicle (["mrkheroinGreen",0,["mrkheroinRed","mrkheroinRed_1","mrkcocaineRed_2","mrkcocaineRed_3","mrkcocaineRed_4"]] call SHK_pos);
_heli setPosASLW [(position _heli) select 0, (position _heli) select 1, -5.5];
_heli enableSimulation false;
 
_Pos = position _heli;
 _marker = createMarker ["heroin_1", _Pos];
"heroin_1" setMarkerColor "ColorRed";
"heroin_1" setMarkerText "Heroin Field";
"heroin_1" setMarkerType "mil_dot";

_marker = createMarker ["heroine_redZone", _Pos];
"heroine_redZone" setMarkerColor "ColorRed";
"heroine_redZone" setMarkerShape "ELLIPSE";
"heroine_redZone" setMarkerSize [200, 200];
"heroine_redZone" setMarkerBrush "DiagGrid";

 
//Create cannabis area
_heli = "Land_ClutterCutter_small_F" createVehicle (["mrkweedGreen",0,["mrkweedRed","mrkweedRed_1","mrkweedRed_2","mrkweedRed_3","mrkweedRed_4"]] call SHK_pos);
_heli setPosASLW [(position _heli) select 0, (position _heli) select 1, -5.5];
_heli enableSimulation false;
 
_Pos = position _heli;
 _marker = createMarker ["weed_1", _Pos];
"weed_1" setMarkerColor "ColorRed";
"weed_1" setMarkerText "Weed Field";
"weed_1" setMarkerType "mil_dot";

_marker = createMarker ["weed_redZone", _Pos];
"weed_redZone" setMarkerColor "ColorRed";
"weed_redZone" setMarkerShape "ELLIPSE";
"weed_redZone" setMarkerSize [200, 200];
"weed_redZone" setMarkerBrush "DiagGrid";

_heli = "Land_ClutterCutter_small_F" createVehicle (["mrkmushroomGreen",0,["mrkmushroomRed"]] call SHK_pos);
_heli setPosASLW [(position _heli) select 0, (position _heli) select 1, -5.5];
_heli enableSimulation false;
 
_Pos = position _heli;
 _marker = createMarker ["mushroom_1", _Pos];
"mushroom_1" setMarkerColor "ColorYellow";
"mushroom_1" setMarkerText "Cow Pasture";
"mushroom_1" setMarkerType "mil_dot";


 