weapon = "arifle_SPAR_01_GL_blk_F";
weaponMagazine = "30Rnd_556x45_Stanag";
weaponGrandes = "1Rnd_HE_Grenade_shell";
weaponOptic = "optic_ACO_grn";

[] execVM "dynamicAISpawn.sqf";
[] execVM "preparePlayer.sqf";
[] execVM "prepareSupplies.sqf";

countTotalEnemy = {
	_totalEnemy = {alive _x && side _x == EAST} count allUnits;
	_totalEnemy
};

player addEventHandler ["killed", {_this exec "playerDied.sqf";}];

totalKills = 0;

sleep 2;

[
  "YOU NEED TO REACH DESTINATION. GOOD LUCK!",
  0,
  0,
  8,
  1
] 
call BIS_fnc_DynamicText;