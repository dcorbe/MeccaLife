#include <macro.h>
/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type","_varName","_displayName","_sideFlag","_price"];
_type = SEL(_this,3);

if(!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {}; //Bad entry?
_varName = M_CONFIG(getText,"Licenses",_type,"variable");
_displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
_price = M_CONFIG(getNumber,"Licenses",_type,"price");
_sideFlag = M_CONFIG(getText,"Licenses",_type,"side");
_varName = LICENSE_VARNAME(_varName,_sideFlag);

if(CASH < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,localize _displayName];};
SUB(CASH,_price);

if(_type == "vigilante") then {
	if(license_civ_rebel) then {
		license_civ_rebel = false;
		hint "Your Rebel license has been revoked."; 
	};
	if(license_civ_news) then {
		license_civ_news = false;
		hint "Your News license has been revoked."; 
	};
	if(license_civ_law) then {
		license_civ_law = false;
		hint "Your News license has been revoked."; 
	};
};

if(_type == "rebel") then {
	if(license_civ_vigilante) then {
		license_civ_vigilante = false;
		hint "Your Vigilante license has been revoked."; 
	};
	if(license_civ_news) then {
		license_civ_news = false;
		hint "Your News license has been revoked."; 
	};
	if(license_civ_law) then {
		license_civ_law = false;
		hint "Your News license has been revoked."; 
	};
};
if(_type == "law") then {
	if(license_civ_rebel) then {
		license_civ_rebel = false;
		hint "Your Rebel license has been revoked."; 
	};
	if(license_civ_vigilante) then {
		license_civ_vigilante = false;
		hint "Your Vigilante license has been revoked."; 
	};
	if(license_civ_news) then {
		license_civ_news = false;
		hint "Your News license has been revoked."; 
	};
};
if(_type == "news") then {
	if(license_civ_rebel) then {
		license_civ_rebel = false;
		hint "Your Rebel license has been revoked."; 
	};
	if(license_civ_vigilante) then {
		license_civ_vigilante = false;
		hint "Your Vigilante license has been revoked."; 
	};
	if(license_civ_law) then {
		license_civ_law = false;
		hint "Your News license has been revoked."; 
	};
};
titleText[format[localize "STR_NOTF_B_1", localize _displayName,[_price] call life_fnc_numberText],"PLAIN"];
SVAR_MNS [_varName,true];
player say3D "buy";