private["_msg"];
_msg = "The player with the above name has been automatically jailed for reaching 4 counts of VDM - They need removed from the server (Kick First, Ban Second)";
mecca_vdm_watcher_count = mecca_vdm_watcher_count + 1;
switch(mecca_vdm_watcher_count) do
{
	case 1:
	{
		titleText["Refrain from VDMing! This is a highly bannable offense! Just FYI","PLAIN"];
	};
	case 2:
	{
		titleText["Refrain from VDMing! If you VDM again, action will be taken.","PLAIN"];
	};
	case 3:
	{
		titleText["Refrain from VDMing! Last Warning.","PLAIN"];
	};
	case 4:
	{
		titleText["You have been frozen for 60 seconds due to repetitive VDM","PLAIN"];
		disableUserInput true;
		uiSleep 60;
		disableUserInput false;
		titleText["You have been un-frozen. VDM again will result","PLAIN"];
	};
	case 5:
	{
		[3,-1,_msg] call life_fnc_newMsg;
		deleteVehicle vehicle player;
		[player,true] spawn life_fnc_jail;
		titleText["You have been sent to jail and admins have been notified to remove you from the server! Have a nice day!","PLAIN"];
	};
	default
	{
		[3,-1,_msg] call life_fnc_newMsg;
		deleteVehicle vehicle player;
		[player,true] spawn life_fnc_jail;
		titleText["You have been sent to jail and admins have been notified to remove you from the server! Have a nice day!","PLAIN"];
	};
}