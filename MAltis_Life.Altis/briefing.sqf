waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};


player createDiarySubject ["CivRules","Civilian Rules"];
player createDiarySubject ["CopRules","Cop Rules"];
player createDiarySubject ["MedicRules","Medic Rules"];
player createDiarySubject ["controls","Controls"];
player createDiarySubject ["serverfeatures","Server Features"];
/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
		player createDiaryRecord ["CivRules",
		[
			"Civ Rules", 
				"
				Civilian rules may located on our website here. http://meccagaming.co/forums/<br/>
				"
		]
	];
	
	player createDiaryRecord["CopRules",
		[
			"Cop Rules",
				"
					Cop rules may be located on our website here. http://meccagaming.co/<br/>
				"
		]
	];
					
	
	player createDiaryRecord ["MedicRules",
		[
			"Medic Rules", 
				"
				Medic rules may be located on our website here. http://meccagaming.co/<br/>
				"
		]
	];

	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"General Controls",
				"
				1: Wanted List<br/>
				2: Smartphone<br/>
				3: Market<br/>
				Y: Open Player Menu<br/>
				U: Lock and unlock cars<br/>
				F: Cop Siren (if cop)<br/>
				T: Vehicle Trunk<br/>
				Left Windows: Interaction Menu<br/>
				H: Holster/Unholster your weapon<br/>
				Left Shift + P: Ear Plugs (Reduce Sound by 80%)<br/>
				Q/E: Vehicle Signals<br/>
				SHIFT+R: Knock players out<br/>
				User11: Redgull<br/>
				User12: Ear Plugs Hotkey<br/>
				"
		]
	];
	
	player createDiaryRecord ["controls",
		[
			"Cop Controls",
				"
				1: Wanted List<br/>
				2: Smartphone<br/>
				3: Market<br/>
				U: Lock and unlock cars<br/>
				Left Windows: Interaction Menu<br/>
				O: Gate Opener/Spikestrip for Cops<br/>
				Shift + R: Restrains mouse cursor target<br/>
				Shift + L: Turns on Cop Lights<br/>
				F: Cop Siren toggle<br/>
				Shift + F: Cop Yelp<br/>
				User11: Redgull<br/>
				User12: Ear Plugs Hotkey<br/>
				"
		]
	];
	
	player createDiaryRecord ["serverfeatures",
		[
			"Vehicle Upgrades",
				"
				You can upgrade your vehicle at any garage or air<br/>    garage on the map.<br/>
				<br/>
				Trunk Level: There are 5 levels of trunk space from 0-4.<br/>    Each additional level adds 5% to your vehicle's<br/>    trunk space.<br/>
			    <br/>     
				Insurance Level: There are 3 levels of insurance.<br/>
					1: Protection from vehicle explosions, only the vehicle<br/>    body is covered.<br/>
					2: Adds protection for modifications to the vehicle.<br/>
					3: Adds protection for when the vehicle is chopped.<br/>
					If the vehicle is covered by your insurance plan it will<br/>    be placed back into your garage.<br/>
					NOTE: Insurance will NOT cover a vehicle if it is siezed<br/>    by police<br/>
				<br/>
				GPS: This allows you to toggle a marker for your vehicle<br/>    on the map.<br/>    Simply hit windows key on your vehicle and click<br/>    toggle GPS.<br/>
				<br/>
				Security: This upgrade increases the time that it takes<br/>    someone to lockpick your vehicle. It also sends you<br/>    a delayed text message that someone accessed the<br/>    security system on your vehicle.<br/>
				"
		]
	];
	
	
	player createDiaryRecord ["serverfeatures",
		[
			"Random Fields",
				"
				The gathering fields on this server are dynamically generated every restart to help encourage new and different encounters each time.
				"
		]
	];