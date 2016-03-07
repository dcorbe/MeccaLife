#include <macro.h>
/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = [_this,0,1,[0]] call BIS_fnc_param;

switch (_state) do {
	//Death while being wanted
	/*case 0: {
		SVAR_MNS [LICENSE_VARNAME("rebel","civ"),false];
		SVAR_MNS [LICENSE_VARNAME("driver","civ"),false];
		SVAR_MNS [LICENSE_VARNAME("heroin","civ"),false];
		SVAR_MNS [LICENSE_VARNAME("marijuana","civ"),false];
		SVAR_MNS [LICENSE_VARNAME("coke","civ"),false];
	};*/
	
	//Jail licenses
	case 1: {
		SVAR_MNS [LICENSE_VARNAME("gun","civ"),false];
		SVAR_MNS [LICENSE_VARNAME("driver","civ"),false];
		//SVAR_MNS [LICENSE_VARNAME("rebel","civ"),false];
		SVAR_MNS [LICENSE_VARNAME("vigilante","civ"),false];
		SVAR_MNS [LICENSE_VARNAME("law","civ"),false];
		SVAR_MNS [LICENSE_VARNAME("news","civ"),false];
	};
	
	//Remove motor vehicle licenses
	case 2: {
		if(GVAR_MNS LICENSE_VARNAME("driver","civ") OR GVAR_MNS LICENSE_VARNAME("air","civ") OR GVAR_MNS LICENSE_VARNAME("truck","civ") OR GVAR_MNS LICENSE_VARNAME("boat","civ")) then {			
			SVAR_MNS [LICENSE_VARNAME("air","civ"),false];
			SVAR_MNS [LICENSE_VARNAME("driver","civ"),false];
			SVAR_MNS [LICENSE_VARNAME("truck","civ"),false];
			SVAR_MNS [LICENSE_VARNAME("boat","civ"),false];
			hint localize "STR_Civ_LicenseRemove_1";
		};
	};
	
	
	
	
	
	// Revoking Licenses
	
	// Drivers License
	case 10:
	{
		license_civ_driver = false;
		hint localize "STR_Civ_RevokeLicense_Driver";
	};
	// Truck License
	case 11:
	{
		license_civ_truck = false;
		hint localize "STR_Civ_RevokeLicense_Truck";
	};
	// Pilot License
	case 12:
	{
		license_civ_air = false;
		hint localize "STR_Civ_RevokeLicense_Pilot";
	};
	// Boating License
	case 13:
	{
		license_civ_boat = false;
		hint localize "STR_Civ_RevokeLicense_Boating";
	};
	// Diving License
	case 14:
	{
		license_civ_dive = false;
		hint localize "STR_Civ_RevokeLicense_Diving";
	};
	// Taxi License
	/*
	case 15:
	{
		license_civ_taxi = false;
		hint localize "STR_Civ_RevokeLicense_Taxi";
	};
	*/
	// All Motor Vehicle
	case 16:
	{
		license_civ_driver = false;
		license_civ_truck = false;
		license_civ_air = false;
		license_civ_boat = false;
		license_civ_air = false;
		license_civ_dive = false;
		//license_civ_taxi = false;
		hint localize "STR_Civ_RevokeLicense_AllMotor";
	};
	// Firearms License
	case 17:
	{
		license_civ_gun = false;
		hint localize "STR_Civ_RevokeLicense_Firearm";
	};
	
	//Killing someone while owning a gun license
	/*
	case 3: {
		if(GVAR_MNS LICENSE_VARNAME("gun","civ")) then {
			SVAR_MNS [LICENSE_VARNAME("gun","civ"),false];
			hint localize "STR_Civ_LicenseRemove_2";
		};
	};
	*/
	default {};
};