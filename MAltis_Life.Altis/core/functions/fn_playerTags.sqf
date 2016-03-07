#include <macro.h>
/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_ui","_units","_goggles","_rp","_img","_name"];
#define iconID 78000
#define scale 0.8


if(visibleMap OR {!alive player} OR {dialog}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = GVAR_UINS ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = GVAR_UINS ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F"],50];

SUB(_units,[player]);

{
	private "_text";
	_idc = _ui displayCtrl (iconID + _forEachIndex);
	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {!isNil {_x GVAR "realname"}}) then {
		_pos = switch(typeOf _x) do {
			case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
		};
		_sPos = worldToScreen _pos;
		_distance = _pos distance player;
		if(count _sPos > 1 && {_distance < 15}) then {
			_text = switch (true) do {
				case (isPlayer _x && {(uniform _x in life_noname_clothing)}): {"";};
				case (isPlayer _x && {(headgear _x in life_hidden_clothing) || (goggles _x in life_hidden_clothing)}): {"<t size='1.2'>[Masked Person]</t>";};
				case (_x in (units grpPlayer) && playerSide == civilian): {format["<t color='#00FF00'>%1</t>",(_x GVAR ["realname",name _x])];};
				case (!isNil {(_x GVAR "rank")}): {format["<img image='%1' size='1.5'></img> <t size='1.35'>%2</t><br/><t size='0.8'>[%3]</t>",switch ((_x GVAR "rank")) do {
					case 1: {"icons\cop\r.paa"};
					case 2: {"icons\cop\p.paa"};
					case 3: {"icons\cop\c.paa"};
					case 4: {"icons\cop\s.paa"};
					case 5: {"icons\cop\l.paa"};
					case 6: {"icons\cop\l.paa"};
					case 7: {"icons\cop\ca.paa"};

					default {"icons\cop\1.paa"};
					},

					_x GVAR ["realname",name _x],
					
					switch ((_x GVAR "rank")) do {
						case 1: {"Cadet"};
						case 2: {"Trooper"};
						case 3: {"Senior Trooper"};
						case 4: {"Corporal"};
						case 5: {"Sergeant"};
						case 6: {"Lieutenant"};
						case 7: {"Captain"};
						default {"Cop In Training"};
					}]};
				//NHS
				case (!isNil {(_x GVAR "medrank")}): {format["<img image='%3' size='1.5'></img> <t size='1.35'>%2</t><br/><t size='0.8'>[%1]</t>",switch ((_x GVAR "medrank")) do {
					case 1: {"Responder"};
					case 2: {"First Responder"}; 
					case 3: {"Advanced Responder"};
					case 4: {"Paramedic"};
					case 5: {"MES Co-Director"};
					case 6: {"MES Director"};
					default {"Medic In Training"};
					},_x GVAR ["realname",name _x],
					switch ((_x GVAR "medrank")) do {
					case 1: {"icons\medic\medic3.paa"};
					case 2: {"icons\medic\medic3.paa"}; 
					case 3: {"icons\medic\medic3.paa"};
					case 4: {"icons\medic\medic1.paa"};
					case 5: {"icons\medic\medic1.paa"};
					case 6: {"icons\medic\medic1.paa"};
					default {"icons\medic\medic3.paa"};
					}
					]};
				default {
					if(!isNil {(group _x) GVAR "gang_name"}) then {
						format["%1<br/><t size='0.8' color='#B6B6B6'>%2</t>",_x GVAR ["realname",name _x],(group _x) GVAR ["gang_name",""]];
					} else {
						_x GVAR ["realname",name _x];
					};
					
				};
			};
			
			if(_text != "") then {
				if(_x GVAR ["speaking",false]) then {_text = "[SPEAKING] " + _text};
				
				if (side _x == civilian) then {
					_img = switch ((_x GVAR "rprank")) do {
		                case 1: {"icons\rp\rp1.paa"};
		                case 2: {"icons\rp\rp2.paa"};
		                case 3: {"icons\rp\rp3.paa"};
		                default {""};
		           	};
		           	if (_img != "") then {
						_text = format["<img image='%1' size='1.5'></img> ",_img] + _text;
		           	};
					_name = _x GVAR ["realname",name _x];
					if (_name find "[MGS]" >= 0) then {
						_text = format["<img image='icons\MeccaLogo.paa' size='1.5'></img> ",_img] + _text;
					};
				};
			};
			_idc ctrlSetStructuredText parseText _text;
			_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
			_idc ctrlSetScale scale;
			_idc ctrlSetFade 0;
			_idc ctrlCommit 0;
			_idc ctrlShow true;
		} else {
			_idc ctrlShow false;
		};
	} else {
		_idc ctrlShow false;
	};
} foreach _units;