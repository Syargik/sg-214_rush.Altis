if (playerSide == west) then {
	[
		player,
		"Уничтожить топливные бочки",
		"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
		"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
		"(_this distance _target < 3) && (position player inArea [[25525.102, 21297.229], 3, 3, 141, true])",
		"(_this distance _target < 3) && (position player inArea [[25525.102, 21297.229], 3, 3, 141, true])",
		{},
		{
			hint "В процессе"; 
			_caller playMove "AinvPknlMstpSnonWnonDnon_medic3";
		},
		{
			hint "Взрывчатка установлена!";
			_caller switchMove "";
			["scripts\boom_exp.sqf"] remoteExec ["execVM", 2];
			["mkk_logger_replayMessage", ["mission_message", format["%1 уничтожил ключевую цель", name player]]] call CBA_fnc_serverEvent;
		},
		{_caller switchMove "";},
		[],
		5,
		0,
		true,
		false
	] call BIS_fnc_holdActionAdd;
};