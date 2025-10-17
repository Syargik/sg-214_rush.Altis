_uniform = missionNamespace getVariable "OPFORuniforms";
_headgear = missionNamespace getVariable "OPFORheadgears";

// SolidGames

_unit addBackpack "B_Carryall_Base";

// Weapons with attachments:

_unit addItem "mkk_VTN_SV98_10p_AP";
_unit addWeapon "mkk_VTN_SV98";
_unit addPrimaryWeaponItem "mkk_VTN_MUZZLE_DTK_SV98";
_unit addPrimaryWeaponItem "BWA3_optic_PMII_ShortdotCC";

removeBackpack _unit;

// Uniform with items:
_unit forceAddUniform _uniform;

// Vest with items:
_unit addVest "tfa_v_jpc_marksman_belt_coy";
for '_i' from 1 to 7 do { _unit addItemToVest 'mkk_VTN_SV98_10p_AP';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_an_m8hc';};

// Backpack with items:
_unit addBackpack "mkk_AMF_rush24_01_BLK";
_unit addItemToBackpack "ACE_RangeCard";
_unit addItemToBackpack "ACE_MapTools";
_unit addItemToBackpack "ACE_Kestrel4500";
_unit addHeadgear _headgear;

_unit addGoggles "PBW_Balaclava_schwarz";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
_unit linkItem "Rangefinder";