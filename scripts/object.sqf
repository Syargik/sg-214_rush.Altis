params ["_object"];

[
	_object,
	"Деактивировать M-COM",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
	"(_this distance _target < 3) && (playerSide == west)",
	"(_this distance _target < 3) && (playerSide == west)",
	{
		params ["_target"];
		[_target] spawn {
			params ["_t"];

			private _duration = 5;
			private _steps = 100;
			private _sleep = _duration / _steps;

			for "_i" from 0 to 1 step (1 / _steps) do {
				[_t, ['Terminal_source','Terminal_source_sound'], _i * 100, true] call BIS_fnc_LinkTerminal_Animations;
				sleep _sleep;
			};
		};
	},
	{},
	{
		missionNamespace setVariable ["zoneScore", zoneScore + 1, true];
		["scripts\markers.sqf"] remoteExec ["execVM", 2];
		("rhs_ammo_m18_red" createVehicle getpos _target);
		["mkk_logger_replayMessage", ["mission_message", format["%1 деактивировал M-COM", name player]]] call CBA_fnc_serverEvent;
	},
	{
		params ["_target"];
		[_target] spawn {
			params ["_t"];

			for "_i" from 1 to 0 step -0.01 do {
				[_t, ['Terminal_source','Terminal_source_sound'], _i * 100, true] call BIS_fnc_LinkTerminal_Animations;
				sleep 0.05;
			};
		};
	},
	[],
	5,
	0,
	true,
	false
] call BIS_fnc_holdActionAdd;