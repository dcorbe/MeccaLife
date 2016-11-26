

if(animationState player != "AinvPknlMstpSnonWnonDnon_medic1") then {
	[[player,"AinvPknlMstpSnonWnonDnon_medic1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
	player switchMove "AinvPknlMstpSnonWnonDnon_medic1";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic1";
};

sleep .1;

if(animationState player != "AinvPknlMstpSnonWnonDnon_medic4") then {
	[[player,"AinvPknlMstpSnonWnonDnon_medic4",true],"life_fnc_animSync",true,false] call life_fnc_MP;
	player switchMove "AinvPknlMstpSnonWnonDnon_medic4";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic4";
};

sleep .5;

player playActionNow "stop";
player setdamage 0;