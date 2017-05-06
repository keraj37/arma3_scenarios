[] execVM "dynamicAISpawn.sqf";

removeAllWeapons player;
removeAllAssignedItems player;

player addMagazines ["20Rnd_762x51_Mag", 11];
player addWeapon "srifle_EBR_F";
player addPrimaryWeaponItem "optic_ACO_grn";
player addItem "FirstAidKit";
player addMagazines ["handGrenade", 5];
player addWeapon "ItemMap";

totalKills = 0;

sleep 2;

_totalEnemy = {alive _x && side _x == EAST} count allUnits;
cutText [format ["YOUR MISSION IS TO SURVIVE.\n %1 ENEMIES DETECTED.", _totalEnemy], "PLAIN",1];	
[] execVM "arty.sqf";