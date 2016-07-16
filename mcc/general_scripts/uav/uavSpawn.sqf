private ["_size","_zoneY","_activate","_cond","_angle","_shape","_text","_pos","_nul","_triggerSelected"];

if (MCC_ACConsoleUp) exitWith {
	[[2,{["MCCNotifications",["AC-130 Left the scene",format ["%1data\AC130_icon.paa",MCC_path],""]] call bis_fnc_showNotification;}], "MCC_fnc_globalExecute", side player, false] spawn BIS_fnc_MP;
	MCC_ACConsoleUp = false;
	publicVariable "MCC_ACConsoleUp";
};

hint "click on the map to spawn AC-130";
MCC_consoleUAVposClicked = false;

//register AC-130
missionNameSpace setVariable ["MCC_ConsoleACTimeStart",time];
publicVariable "MCC_ConsoleACTimeStart";

[[[],{
		while {true} do
		{
			if ((time - (missionNameSpace getVariable ["MCC_ConsoleACTimeStart",0])) > MCC_ConsoleACTime) exitWith
			{
				[[2,{["MCCNotifications",["AC-130 Left the scene",format ["%1data\AC130_icon.paa",MCC_path],""]] call bis_fnc_showNotification;}], "MCC_fnc_globalExecute", side player, false] spawn BIS_fnc_MP;
				MCC_ACConsoleUp = false;
				publicVariable "MCC_ACConsoleUp";
			};
			sleep 1;
		};
	}], "BIS_fnc_spawn", false, false] spawn BIS_fnc_MP;

onMapSingleClick " 	MCC_consoleACpos = _pos;
					MCC_consoleUAVposClicked = true;
					onMapSingleClick """";";
waituntil {MCC_consoleUAVposClicked};

if (MCC_capture_state) then	{
	MCC_capture_var = MCC_capture_var + FORMAT ['
			MCC_consoleACpos = %1;
			MCC_ACConsoleUp = true;
			publicVariable "MCC_ACConsoleUp";
			publicVariable "MCC_consoleACpos";
			[[2,{["MCCNotifications",["AC-130 Entered the scene","%2data\AC130_icon.paa",""]] call bis_fnc_showNotification;}], "MCC_fnc_globalExecute", side player, false] spawn BIS_fnc_MP;
			'
			,MCC_consoleACpos
			,MCC_path
			];
	hint "AC-130 Captured";
	} else {
		[[2,compile format ['["MCCNotifications",["AC-130 Entered the scene","%1data\AC130_icon.paa",""]] call bis_fnc_showNotification;',MCC_path]], "MCC_fnc_globalExecute", side player, false] spawn BIS_fnc_MP;

		hint "AC-130 Spooky is airborn";
		MCC_ACConsoleUp = true;
		publicVariable "MCC_ACConsoleUp";
		publicVariable "MCC_consoleACpos";
	};
