[] execVM "dynamicAISpawn.sqf";

removeAllWeapons player;
removeAllAssignedItems player;

player addBackpack "B_Carryall_oli"; 
(unitBackpack player) addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 25]; 
(unitBackpack player) addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 25];

player addMagazines ["30Rnd_556x45_Stanag", 8];
player addMagazines ["1Rnd_HE_Grenade_shell", 15];
player addWeapon "arifle_SPAR_01_GL_blk_F";
player addPrimaryWeaponItem "optic_ACO_grn";
//player addPrimaryWeaponItem "acc_flashlight";
player addItem "FirstAidKit";
//player addItem "O_NVGoggles_ghex_F";
//player assignItem "O_NVGoggles_ghex_F";
player addWeapon "ItemMap";

countTotalEnemy = {
	_totalEnemy = {alive _x && side _x == EAST} count allUnits;
	_totalEnemy
};

player addEventHandler ["killed", {_this exec "playerDied.sqf";}];

totalKills = 0;

sleep 2;

[
  "YOU ARE CHASED BY ALARMED ENEMY GROUPS!",
  0,
  0,
  8,
  1
] 
call BIS_fnc_DynamicText;