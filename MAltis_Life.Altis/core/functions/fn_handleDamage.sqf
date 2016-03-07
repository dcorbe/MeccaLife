#include <macro.h>
/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = SEL(_this,0);
_part = SEL(_this,1);
_damage = SEL(_this,2);
_source = SEL(_this,3);
_projectile = SEL(_this,4);
_curWep = "";
_curMag = "";


if(vehicle _source isKindOf "LandVehicle" && driver (vehicle _source) == _source) then {
	if(_source != _unit AND alive _unit AND isPlayer _source) then {
		_damage = 0;
	};
};




if(isPlayer _source && _source isKindOf "Man") then {
	_curWep = currentWeapon _source;
	_curMag = currentMagazine _source;
};

if((_curWep in ["srifle_DMR_06_olive_F,srifle_DMR_03_F","arifle_MXM_Black_F","arifle_MX_Black_F","arifle_MXC_Black_F","srifle_DMR_02_F"]) && (_source getVariable ["nonLethals",true]) && (_projectile != "")) then {
	if(((getDammage _unit) >= 0.9) || (_damage >= 0.9)) then {
		_damage = 0.001;
		[_source] spawn life_fnc_handleDowned;
	};
}else{
	if((_curWep in ["SMG_02_F","hgun_P07_F","hgun_P07_snds_F"]) && (_projectile != "")) then {
		if(((getDammage _unit) >= 0.9) || (_damage >= 0.9)) then {
			_damage = 0.001;
			[_source] spawn life_fnc_handleDowned;
		};
	};
};


/*//rubber bullets
if (((_curMag == "30Rnd_65x39_caseless_mag_Tracer") || (_curWep in ["SMG_02_F","hgun_P07_F","hgun_P07_snds_F"]))&&(_projectile in ["B_65x39_Caseless","B_9x21_Ball"])) then {
	if ((((getDammage _unit) + _damage) >= 0.9) || (_damage >= 0.9)) then {
		_damage = 0;
		[_source] spawn life_fnc_handleDowned;
	};
};
*/
//if ((((getDammage _unit) + _damage) >= 0.99) || (_damage >= 0.99)) then {
//		[_unit] call life_fnc_fetchDeadGear;
//};


[] call life_fnc_hudUpdate;
_damage;