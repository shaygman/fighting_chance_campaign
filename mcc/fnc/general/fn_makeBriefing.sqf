//===================================================================MCC_fnc_makeBriefing=================================================================================
//Server Only - create a Logic based briefing
//Example:[[_string, _type ,_missionTittle],"MCC_fnc_makeBriefing",false,false] call BIS_fnc_MP;
// Params:
// 	_string: string, the briefing string
//	_type: interger or string, Integer - pre defined mission type or a string for custom one
//	_missionTittle:  string,  the mission tittle can get complex string as it will turn it to array such as HTML
//=========================================================================================
private ["_type","_string","_tittle","_dummyGroup","_dummy","_missionTittle","_missionInfo","_sidePlayer"];
_string 		= _this select 0;
_type 			= _this select 1;
_missionTittle 	= if (count _this > 2) then {toArray (_this select 2)} else {[]};
_missionInfo	= if (count _this > 3) then {_this select 3} else {[]};
_sidePlayer =  param [4, sideLogic,[sideLogic]];

if !(isServer) exitWith {};

MCC_activeObjectives = [];
if (count _missionInfo > 0) then
{
	{
		if (count _x > 8) then
		{
			MCC_activeObjectives set [count MCC_activeObjectives, _x select 8]
		};
	} foreach (_missionInfo select 1);
};

if (typeName _type == "STRING") then
{
	_tittle = _type;
}
else
{
	_tittle = switch (_type) do
				{
				   case 0: {"Situation"};
				   case 1: {"Enemy Forces"};
				   case 2: {"Friendly Forces"};
				   case 3: {"Mission"};
				   case 4: {"Special Tasks"};
				   case 5: {"Fire Support"};
				};
};


waituntil {!isnil "MCC_server"};
_briefings = MCC_server getVariable ["briefings",[]];
_briefings pushBack [_tittle,_string];
MCC_server setVariable ["briefings",_briefings, true];

_dummyGroup = creategroup sidelogic;
_dummy = _dummyGroup createunit ["Logic", [0, 90, 90],[],0.5,"NONE"];	//Logic - placeHolder
waituntil {!isnull _dummy};

//Are we dealing with mission wizard's missions?
if (count _missionInfo > 0) then {
	_dummy setVariable ["missions",time,true];
	_dummy setVariable ["missionsInfo",_missionInfo,true];
	_dummy setVariable ["briefings",[_tittle, _string ,_missionTittle],true];
	_dummy setVariable ["objectives",MCC_activeObjectives ,true]; //---- Do we need that?!

	//Broadcast brifings to all side
	missionNamespace setVariable [format ["MCC_missionsInfo_%1", _sidePlayer],_missionInfo];
	publicVariable format ["MCC_missionsInfo_%1", _sidePlayer];
};

_init = format ["0 = _this spawn {if (!isDedicated && playerSide == %4) then {waituntil {alive player};player createDiaryRecord ['diary', ['%1',(toString %3) + '%2']];(_this getVariable 'missionsInfo') spawn MCC_fnc_MWopenBriefing;}};",_tittle, _string ,_missionTittle, _sidePlayer];

[[[netid _dummy,_dummy], _init], "MCC_fnc_setVehicleInit", true, false] spawn BIS_fnc_MP;

//MCC_curator addCuratorEditableObjects [[_dummy],false];
/*
[
	_this,		//object action is attached to
	"Mission Briefings",	//action title text shown in action menu
	"\a3\Data_f\clear_empty.paa",		//idle icon
	"\a3\Data_f\clear_empty.paa",		//progress icon
	"(alive _target) && (_target distance _this < 5)",	//condition for the action to be shown
	"(alive _target) && (_target distance _this < 5)",	//condition for action to progress
	{},	//code executed on start;
	{},	//code executed on every progress
	{
		(missionNamespace getVariable [format ["MCC_missionsInfo_%1", (_this select 1)],[]]) spawn MCC_fnc_MWopenBriefing;
	},	//code executed on completion
	{},	//code executed on interrupted
	[player],	//arguments passed to the scripts
	3,	//action duration;
	0,	//priority;
	false,	//remove on completion
	false	//how in unconscious state
] call bis_fnc_holdActionAdd;

[
	this,
	"Mission Briefings",
	"\a3\Data_f\clear_empty.paa",
	"\a3\Data_f\clear_empty.paa",
	"(alive _target) && (_target distance _this < 5)",
	"(alive _target) && (_target distance _this < 5)",
	{},
	{},
	{
		0 = (missionNamespace getVariable [format ["MCC_missionsInfo_%1",side player],[]]) spawn MCC_fnc_MWopenBriefing;
	},
	{},
	[],
	3,
	10,
	false,
	false
] call bis_fnc_holdActionAdd;