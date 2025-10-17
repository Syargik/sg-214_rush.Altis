_targets = allMissionObjects "CargoNet_01_barrels_F";
_time = (mkk_platform_missionTime + 10);
_done = false;

while {!_done} do {
	sleep 5;
	if (mkk_platform_missionTime > _time) then {
		{
			("rhs_ammo_maaws_HE" createVehicle getPos _x);
			_x setDamage 1;
			hideObjectGlobal _x;
		} forEach _targets;
		missionGoal = missionGoal + 1;
		_done = true;
	};
};