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

showScore = {
	cutText [format ["ELIMINATED ENEMIES: %1.", totalKills], "PLAIN DOWN", 1];
};

player addAction ["Show my score", showScore];

player addEventHandler ["killed", {_this exec "playerDied.sqf";}];

totalKills = 0;

sleep 2;

playSound "Alarm_OPFOR";

[
  format ["ELIMINATE AS MUCH AS POSSIBLE!. %1 ENEMIES DETECTED.", call countTotalEnemy],
  0,
  0,
  8,
  1
] 
call BIS_fnc_DynamicText;

[] execVM "arty.sqf";