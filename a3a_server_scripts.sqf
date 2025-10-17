CrititalLosesWest = 9; // потери для синих
CrititalLosesEast = 7; // потери для красных

missionNamespace setVariable ["a3a_endMissionTime", 6000, true]; // 6000 - время в секундах
missionNamespace setVariable ["zoneScore", 0, true];
missionNamespace setVariable ["missionGoal", 0, true];

[] spawn {
	waitUntil {sleep 10; a3a_var_started};
	while {isNil "srv_triggerFinished"} do {
	sleep 10;
		
		if ((east countside playableUnits) < CrititalLosesEast) then {
			srv_triggerFinished = true;
			["Pax Armata понесли большие потери!", west] call a3a_fnc_endMission; // Победа WEST по потерям
		};
		
		if ((west countside playableUnits) < CrititalLosesWest) then {
			srv_triggerFinished = true;
			["NATO понесли большие потери!", east] call a3a_fnc_endMission; // Победа EAST по потерям
		};

		if (missionGoal == 1 && zoneScore == 2) then {
			srv_triggerFinished = true;
			["NATO уничтожили ОМП!", west] call a3a_fnc_endMission; // Победа WEST по целям
		};
		
		if (mkk_platform_missionTime >= a3a_endMissionTime) then { 
			srv_triggerFinished = true;
			["Pax Armata перебросили подкрепление!", east] call a3a_fnc_endMission; // Победа по окончанию таймера
		};
    };
};