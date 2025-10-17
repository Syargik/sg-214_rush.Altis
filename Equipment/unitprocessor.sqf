_unit = _this select 0;
_faction = _this select 1;
_loadout = _this select 2;

_item_processor = {
	removeAllItems _this;
	removeAllWeapons _this;
	removeAllItemsWithMagazines _this;
	removeAllAssignedItems _this;
	removeUniform _this;
	removeBackpack _this;
	removeHeadgear _this;
	removeVest _this;
	removeGoggles _this;
};

if (!isServer) exitWith {};

_unit call _item_processor;

_svn = format ["SerP_equipment_codes_%1_%2",_faction, _loadout];
if (isNil _svn) then
{
	missionNamespace setVariable [_svn, 
		compile preprocessFileLineNumbers format ["Equipment\%1\%2.sqf", _faction, _loadout]];
};

[_unit] call (missionNamespace getVariable [_svn, {}]);

missionNamespace setVariable ["BLUFORuniforms", [
    "Gen3_aor1",
    "rhs_uniform_FROG01_d",
	"AGE_CryeG3_AOR1",
	"tfa_aor1_mix2_g3",
	"Gen3_mcarid",
	"LOP_U_ISTS_Fatigue_10",
	"LOP_U_ISTS_Fatigue_14"
] call BIS_fnc_selectRandom];

missionNamespace setVariable ["BLUFORheadgears", [
    "rhsusf_mich_helmet_marpatd_norotos_arc_headset",
	"rhsusf_mich_helmet_marpatd_headset",
	"rhsusf_mich_helmet_marpatd_alt_headset",
	"rhsusf_mich_helmet_marpatd",
	"rhsusf_mich_bare_norotos_arc_alt_tan_headset",
	"rhsusf_opscore_aor1_pelt_nsw"
] call BIS_fnc_selectRandom];

missionNamespace setVariable ["BLUFORgoogles", [
    "rhsusf_shemagh2_gogg_white",
	"rhsusf_shemagh2_gogg_tan"
] call BIS_fnc_selectRandom];

missionNamespace setVariable ["OPFORuniforms", [
    "LOP_U_UVF_Fatigue_BL_OSW",
	"LOP_U_UVF_Fatigue_BL",
	"LOP_U_IRA_Fatigue_GRK_OLV",
	"Spec_Gorka_p_Green_nkl_nlk_EAST_Uniform",
	"rhs_uniform_gorka_r_g_gloves"
] call BIS_fnc_selectRandom];

missionNamespace setVariable ["OPFORheadgears", [
    "mkk_AMF_OPSCORE_OD1_2",
	"mkk_AMF_OPSCORE2_OD1_2",
	"mkk_AMF_OPSCORE3_OD1_2",
	"rhsusf_opscore_bk_pelt",
	"acp_Solid_Ranger_Green_modern_west_H_HelmetFASTMT_Headset_Solid_Ranger_Green_F"
] call BIS_fnc_selectRandom];