private["_heli","_wreck"];

//Create gold vehicle wreck 
_heli = "Land_ClutterCutter_small_F" createVehicle (["mrkGreen",2,["mrkRed","mrkRed_1","mrkRed_1_1","mrkRed_1_3"]] call SHK_pos);
_heli setPosASLW [(position _heli) select 0, (position _heli) select 1, -5.5];
_heli enableSimulation false;

_wreck = "Land_UWreck_FishingBoat_F" createVehicle (getPos _heli);
_wreck SetPosATL [(getPos _heli select 0)-900*sin(round(random 359)),(getPos _heli select 1)-900*cos(round(random 359)), 0];
_wreck enableSimulation false;

gold_safe attachTo [_wreck,[3,4,-0.4]];
gold_safe setVectorDirAndUp [[90,0,80],[-90,0,0]];
gold_safe enableSimulation false;
gold_safe allowDamage false;

_minTime = (30*60);
_maxTime = (120*60);
_finalTime = (random (_maxTime - _minTime)) + _minTime;
sleep _finalTime;
_Pos = position _heli;
 _marker = createMarker ["Marker201", _Pos];
"Marker201" setMarkerColor "ColorOrange";
"Marker201" setMarkerType "Empty";
"Marker201" setMarkerShape "ELLIPSE";
"Marker201" setMarkerSize [1500,1500];
 _markerText = createMarker ["MarkerText201", _Pos];
"MarkerText201" setMarkerColor "ColorBlack";
"MarkerText201" setMarkerText "Shipwreck";
"MarkerText201" setMarkerType "mil_warning";
[[3,"<t size='3'><t color='#00FF00'>SHIPWRECK</t></t> <br/><t size='1.5'>A ship wreck site has been spotted, check the area for <t color='#FFFF00'>underwater crates of gold</t>. Check your map</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;