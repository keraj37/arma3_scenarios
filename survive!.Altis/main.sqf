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

countTotalEnemy = {
	_totalEnemy = {alive _x && side _x == EAST} count allUnits;
	_totalEnemy
};

player addAction ["Show my score", {cutText [format ["ELIMINATED ENEMIES: %1.", totalKills], "PLAIN DOWN", 1];}];

totalKills = 0;

sleep 2;

cutText [format ["ELIMINATE AS MUCH AS POSSIBLE!.\n %1 ENEMIES DETECTED.", call countTotalEnemy], "PLAIN DOWN", 1];	
[] execVM "arty.sqf";