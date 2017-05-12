[] execVM "dynamicAISpawn.sqf";

removeAllWeapons player;
removeAllAssignedItems player;

player addMagazines ["30Rnd_65x39_caseless_mag", 5];
player addMagazines ["3Rnd_HE_Grenade_shell", 5];
player addWeapon "arifle_MX_GL_F";
player addPrimaryWeaponItem "optic_ACO_grn";
player addItem "FirstAidKit";
player addMagazines ["handGrenade", 2];
player addWeapon "ItemMap";

totalKills = 0;

sleep 2;

_totalEnemy = {alive _x && side _x == EAST} count allUnits;
cutText [format ["YOUR MISSION IS TO SURVIVE.\n %1 ENEMIES DETECTED.", _totalEnemy], "PLAIN",1];	
[] execVM "arty.sqf";