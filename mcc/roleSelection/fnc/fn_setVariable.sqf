//==================================================================MCC_fnc_setVariable======================================================================================
// Global execute a command on server only  - SERVER ONLY
// Example: [[varName,playerID,VarValue], "MCC_fnc_setVariable", false, false] spawn BIS_fnc_MP;
//==============================================================================================================================================================================

private ["_varName","_id","_value","_player","_varType"];
_varName 	= _this select 0;
_player 	= _this select 1;
_value		= _this select 2;
_varType	= toUpper (_this select 3);

if(!isServer) exitWith {};
if (isnil "_player") exitWith {};

_id = getPlayerUID _player;

[name _player, _id, _varName, "write",_value,true] call MCC_fnc_handleDB;