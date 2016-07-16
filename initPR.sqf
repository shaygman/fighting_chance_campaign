//General
missionNameSpace setVariable ["MCC_syncOn",true];
missionNameSpace setVariable ["MCC_teleportToTeam",false];
missionNameSpace setVariable ["MCC_saveGear",false];
missionNameSpace setVariable ["MCC_Chat",false];
missionNameSpace setVariable ["MCC_deletePlayersBody",false];
missionNameSpace setVariable ["MCC_allowlogistics",true];
missionNameSpace setVariable ["MCC_allowRTS",true];

//Role selection
missionNameSpace setVariable ["CP_activated",true];
missionNameSpace setVariable ["MCC_allowChangingKits",true];

//Mechanics
missionNameSpace setVariable ["MCC_cover",true];
missionNameSpace setVariable ["MCC_changeRecoil",true];
missionNameSpace setVariable ["MCC_coverUI",true];
missionNameSpace setVariable ["MCC_coverVault",true];
missionNameSpace setVariable ["MCC_interaction",true];
missionNameSpace setVariable ["MCC_ingameUI",true];
missionNameSpace setVariable ["MCC_quickWeaponChange",true];
missionNameSpace setVariable ["MCC_surviveMod",false];
missionNameSpace setVariable ["MCC_showActionKey",true];
missionNamespace setVariable ["MCC_allowSQLRallyPoint",true];

//Medical
missionNameSpace setVariable ["MCC_medicXPmesseges",true];
missionNameSpace setVariable ["MCC_medicPunishTK",true];

//Radio
if ((paramsArray select 4) ==1) then {
	missionNameSpace setVariable ["MCC_VonRadio",true];
	missionNameSpace setVariable ["MCC_vonRadioDistanceGlobal",200000];
	missionNameSpace setVariable ["MCC_vonRadioDistanceSide",10000];
	missionNameSpace setVariable ["MCC_vonRadioDistanceCommander",10000];
	missionNameSpace setVariable ["MCC_vonRadioDistanceGroup",1000];
	missionNameSpace setVariable ["MCC_vonRadioKickIdle",true];
	missionNameSpace setVariable ["MCC_vonRadioKickIdleTime",15];
} else {
	missionNameSpace setVariable ["MCC_VonRadio",false];
};

//artillery
enableEngineArtillery false;
HW_arti_types = [["HE Laser-guided","Bo_GBU12_LGB",3,50],["HE 82mm","Sh_82mm_AMOS",1,75]];

//Spawn UI
_null = [1,true,true,true,true,true,true] spawn MCC_fnc_inGameUI;

if (isServer || isDedicated) then {
	0 spawn {
		waitUntil {time > 0};
		//==*******************************  Enter player UID that allowed to handle MCC **************================--------------
		missionNameSpace setVariable ["MCC_allowedPlayers", []];
		publicVariable "MCC_allowedPlayers";

		//Resources
		missionNamespace setVariable ["MCC_resWest",[1000,1000,1000,200,200]];
		publicVariable "MCC_resWest";

		//Random Weather
		private ["_weather"];
		_weather = (["Random","clear","cloudy","rain","storm","sandStorm","snow"]) select (["param_weather", 0] call BIS_fnc_getParamValue);

		if (_weather == "Random") then {
			_weather = [["clear","cloudy","rain","storm"],[0.55,0.15,0.15,0.15]] call bis_fnc_selectRandomWeighted;
		};

		switch (_weather) do {
		    case "clear": {
		    	[[(random 0.2), (random 0.2), (random 0.2), 0, 0,(random 0.1),0]] spawn MCC_fnc_setWeather;
		    };

		    case "cloudy": {
		    	[[0.4 + (random 0.2), 0.4 +(random 0.2), 0.4 +(random 0.2), 0.4 +(random 0.2), 0.4 +(random 0.2),0 +(random 0.2),0]] spawn MCC_fnc_setWeather;
		    };

		    case "rain": {
		    	[[0.6 + (random 0.2), 0.6 +(random 0.2), 0.6 +(random 0.2), 0.6 +(random 0.2), 0.6 +(random 0.2),0.1 +(random 0.2),0]] spawn MCC_fnc_setWeather;
		    };

		    case "storm": {
		    	[[0.8 + (random 0.2), 0.8 +(random 0.2), 0.8 +(random 0.2), 0.8 +(random 0.2), 0.8 +(random 0.2),0.3 +(random 0.2),0]] spawn MCC_fnc_setWeather;
		    };
		};

		//Random Time
		private ["_time"];
		_time = ([-1,6,12,18,0]) select (["param_daytime", 0] call BIS_fnc_getParamValue);

		if (_time < 0) then {
			_time = [[6,12,18,0],[0.25,0.25,0.25,0.25]] call bis_fnc_selectRandomWeighted;
		};
		_time spawn BIS_fnc_paramDaytime;


		//Time Multiplier
		setTimeMultiplier (paramsArray select 3);


		private ["_difficulty","_missionMax","_factionCiv","_factionPlayer","_sidePlayer","_factionEnemy","_sideEnemy","_sidePlayer2","_tickets","_isCiv","_isCar","_isParkedCar","_isLocked","_civSpawnDistance","_maxCivSpawn","_factionCiv","_factionCivCar","_missionRotation"];
		_sidePlayer = west;
		_factionPlayer = "BLU_F";
		_sideEnemy = east;
		_factionEnemy = "OPF_F";
		_factionCiv = "CIV_F";
		_missionMax = (paramsArray select 6);
		_difficulty = (paramsArray select 5);
		_sidePlayer2 = sideLogic;
		_tickets = 100;
		_missionRotation = 0.2;

		//Start campaign
		[_sidePlayer,_factionPlayer,_sideEnemy,_factionEnemy,_factionCiv,_missionMax,_difficulty,_sidePlayer2,_tickets,_missionRotation] spawn MCC_fnc_campaignInit;

		//Start day/night cycle
		[_sidePlayer,_sidePlayer2] spawn MCC_fnc_dayCycle;

		//Start civilians
		if ((paramsArray select 0) ==1) then {
			_isCiv =  true;
			_isCar = true;
			_isParkedCar = true;
			_isLocked  = false;
			_civSpawnDistance = 700;
			_maxCivSpawn = 10;
			_factionCiv	= "CIV_F";
			_factionCivCar = "CIV_F";

			[_isCiv,_isCar,_isParkedCar,_isLocked,_civSpawnDistance,_maxCivSpawn,_factionCiv,_factionCivCar] spawn MCC_fnc_ambientInit;

			//civ standings
			missionNamespace setvariable [format ["MCC_civRelations_%1",_sidePlayer],(paramsArray select 1)/10];
			publicVariable format ["MCC_civRelations_%1",_sidePlayer];
		};
	};
};


if (!isDedicated && hasInterface) then {
	waituntil {!(IsNull (findDisplay 46))};
	cutText ["","BLACK OUT",0.1];
	sleep 1;

	//Setup quick weapons
	if (missionNamespace getVariable ["MCC_isCBA",false]) then {
		//Switch weapon 1 - Primary/handgun
		["MCC", "switchWeapon1", ["Switch Weapons 1: Primary/handgun", ""], {if ((player getVariable ["cpReady",true]) && !(player getvariable ["MCC_medicUnconscious",false]) && (missionNamespace getvariable ["MCC_quickWeaponChange",false])) then {[2] spawn MCC_fnc_weaponSelect;true}}, {}, [2, [false,false,false]],false] call cba_fnc_addKeybind;

		//Switch weapon 2 - Launcher
		["MCC", "switchWeapon2", ["Switch Weapons 2: Launcher", ""], {if ((player getVariable ["cpReady",true]) && !(player getvariable ["MCC_medicUnconscious",false]) && (missionNamespace getvariable ["MCC_quickWeaponChange",false])) then {[3] spawn MCC_fnc_weaponSelect;true}}, {}, [3, [false,false,false]],false] call cba_fnc_addKeybind;

		//Switch weapon 3 - Grenade
		["MCC", "switchWeapon3", ["Switch Weapons 3: Grenades", ""], {if ((player getVariable ["cpReady",true]) && !(player getvariable ["MCC_medicUnconscious",false]) && (missionNamespace getvariable ["MCC_quickWeaponChange",false])) then {[4] spawn MCC_fnc_weaponSelect;true}}, {}, [4, [false,false,false]],false] call cba_fnc_addKeybind;

		//Switch weapon 4 - Primary/handgun
		["MCC", "switchWeapon4", ["Switch Weapons 4: Utility", ""], {if ((player getVariable ["cpReady",true]) && !(player getvariable ["MCC_medicUnconscious",false]) && (missionNamespace getvariable ["MCC_quickWeaponChange",false])) then {[5] spawn MCC_fnc_weaponSelect;true}}, {}, [5, [false,false,false]],false] call cba_fnc_addKeybind;
	};

	//Disable inventory
	if ((paramsArray select 2) ==0) then {
		player addEventHandler ["InventoryOpened", {true}];
	};

	//Tutorials
	waituntil {(player getVariable ["cpReady",false]) && !dialog};

	sleep 10;

	//interaction key
	0 spawn {
		private ["_key"];
		if (missionNamespace getVariable ["MCC_isCBA",false]) then {
			_key = ["MCC","interactionKey"] call CBA_fnc_getKeybind;
			while {(count _key <=0)} do {
				["Assing MCC Interaction Key !!!",0,0.2,5,1,0.0] spawn bis_fnc_dynamictext;
				sleep 5;
			 };
		} else {
			while {(isNil "MCC_keyBinds")} do {
				["Assing MCC Interaction Key !!!",0,0.2,5,1,0.0] spawn bis_fnc_dynamictext;
				sleep 5;
			};
		};
	};

	//General
	if (profileNamespace getVariable ["MCC_FCtutorialPR",true]) then {
		_answer = ["<img size='10' img image='PRmap.paa' align='center'/>
					<br/>This is Capture The Island (CTI) Where you start with almost zero resources and you have to fight your way to capture the island.
					<br/>Each time there will be a <t color='#FF6A32'>main mission</t> and the commander can assign <t color='#FF6A32'>secondary mission</t> from time to time.
					<br/>Completing this missions will award your side <t color='#FF6A32'>resources and personal valor</t> but also draw the attention of the oposite faction.
					<br/>Resources can be used by the commander to <t color='#FF6A32'>build new structures or purchase new vehicles</t>.
					<br/>Personal valor can be used to <t color='#FF6A32'>purchase vehicles from workshops</t>.
					<br/>The mission have a <t color='#FF6A32'>persistent data base</t> so your earned XP will follow you even when you leave.
					<br />Squad commanders can build FOB and other players can use the trucks utilize logistics to build the FOB or other battlefield emplacements
					<br/>You can assign yourself as a side commander or a squad leader by pressing on the <t color='#FF6A32'>Squad Dialog</t> button.
					<br/><br/>Do you want to disable this message in the future?","Mission","Yes","No"] call BIS_fnc_guiMessage;

		waituntil {!isnil "_answer" && !dialog};

		profileNamespace setVariable ["MCC_FCtutorialPR",!_answer];
	};

	//Keys layout
	if (profileNamespace getVariable ["MCC_FCtutorialPRKeys",true]) then {

		_answer = ["<img size='8.7' img image='PRkeyboardLayout.paa' />
					<br/>Press <t color='#FF6A32'>Interact</t> button to interact with objects or units (medic other, changing kits, vehicles options, logistics exc).
					<br/><br/>Press <t color='#FF6A32'>Interact Self</t> button to interact with yourself (spot enemy, medic self, construct fortifications exc).
					<br/><br/>Press <t color='#FF6A32'>Squad Dialog</t> button to open the Squad Dialog.
					<br/><br/>Do you want to disable this message in the future?","Keyboard Layout","Yes","No"] call BIS_fnc_guiMessage;

		waituntil {!isnil "_answer" && !dialog};

		profileNamespace setVariable ["MCC_FCtutorialPRKeys",!_answer];
	};

	//Commander
	0 spawn {
		waituntil {((MCC_server getVariable [format ["CP_commander%1",side player],""]) == getPlayerUID player)};
		if (profileNamespace getVariable ["MCC_FCtutorialCommander",true]) then {
			_answer = ["<img size='10' img image='commanderRTS.paa' align='center'/>
						<br/>As the commander you can order the <t color='#FF6A32'>construction of new buildings, recruit AI and even build vehicles</t>.
						<br/>Open the commander console using your <t color='#FF6A32'>self interaction keys</t> or use the shortcut buttons as defined in the settings.
						<br/>From the console you can <t color='#FF6A32'>order players and AI group</t> by selecting them and double clicking on the map.
						<br/>You can call <t color='#FF6A32'>EVAC CAS and Supply drops</t> using the <t color='#FF6A32'> F2 and F3 buttons</t>.
						<br/>Order <t color='#FF6A32'>artillery</t> using the <t color='#FF6A32'>F4</t> button.
						<br/>Open the <t color='#FF6A32'>RTS</t> to expend your base using the <t color='#FF6A32'>F5</t> button.
						<br/><br/>Do you want to disable this message in the future?","Commander Role","Yes","No"] call BIS_fnc_guiMessage;

			waituntil {!isnil "_answer" && !dialog};

			profileNamespace setVariable ["MCC_FCtutorialCommander",!_answer];
		};
	};

	//Squad Leader
	0 spawn {
		waituntil {leader player == player && count units group player > 1};
		if (profileNamespace getVariable ["MCC_FCtutorialSQL",true]) then {
			_answer = ["<img size='10' img image='sqlPic.paa' align='center'/>
						<br/>As the Squad Leader you will have more option in the <t color='#FF6A32'>self interaction menu</t>.
						<br/>You'll be able to place <t color='#FF6A32'>support markers</t> or <t color='#FF6A32'>spot enemies</t> by marking them on the map for 5 minutes.
						<br/>The <t color='#FF6A32'>Squad Leader PDA</t> can be used to constantly show friendly player on the HUD and increase battlefield awarness.
						<br/>You can also order the <t color='#FF6A32'>construction of battlefield emplacements</t> such as F.O.B which serves as spawn points.
						<br/><br/>Do you want to disable this message in the future?","Squad Leader Role","Yes","No"] call BIS_fnc_guiMessage;

			waituntil {!isnil "_answer" && !dialog};

			profileNamespace setVariable ["MCC_FCtutorialSQL",!_answer];
		};
	};

	//Logistics Trucks
	0 spawn {
		if (profileNamespace getVariable ["MCC_FCtutorialLogistics",true]) then {
			waituntil {typeof vehicle player in (missionNamespace getvariable ["MCC_supplyTracks",[]]) && !dialog};
			_answer = ["<img size='9' img image='PRlogistics.paa' align='center'/>
						<br />While inside this vehicle and within 50 meters from HQ you can load logistics crates from the HQ and delieve them to the front.
						<br/><br/><t color='#FF6A32'>Ammo crates</t> will resupply units and vehicles.
						<br/><t color='#FF6A32'>Supply crates</t> will repair damaged vehicles and will be used to build FOB and battle emplacements.
						<br/><t color='#FF6A32'>Fuel crates</t> will refuel vehicles.
						<br/><br/>Press <t color='#FF6A32'>Interact</t> button to open the logistics dialog while in the driving seat and stopping next to the HQ.
						<br/><br/>Do you want to disable this message in the future?","Logistics","Yes","No"] call BIS_fnc_guiMessage;

			waituntil {!isnil "_answer" && !dialog};

			profileNamespace setVariable ["MCC_FCtutorialLogistics",!_answer];
		};
	};

	//Logistics Helicopters
	0 spawn {
		if (profileNamespace getVariable ["MCC_FCtutorialLogisticsHeli",true]) then {
			waituntil {(vehicle player isKindOf "helicopter") && !dialog};
			_answer = ["<img size='9' img image='logisticsHeli.paa' align='center'/>
						<br />While inside this vehicle and within 50 meters from HQ and flying higher then 15 meters you can <t color='#FF6A32'>slingload logistics crates</t> from the HQ and delieve them to the front.
						<br/><br/><t color='#FF6A32'>Ammo crates</t> will resupply units and vehicles.
						<br/><t color='#FF6A32'>Supply crates</t> will repair damaged vehicles and will be used to build FOB and battle emplacements.
						<br/><t color='#FF6A32'>Fuel crates</t> will refuel vehicles.
						<br/><br/>Press <t color='#FF6A32'>Interact</t> button to open the logistics dialog while autohovering over the HQ.
						<br/><br/>Do you want to disable this message in the future?","Logistics Helicopters","Yes","No"] call BIS_fnc_guiMessage;

			waituntil {!isnil "_answer" && !dialog};

			profileNamespace setVariable ["MCC_FCtutorialLogistics",!_answer];
		};
	};

};