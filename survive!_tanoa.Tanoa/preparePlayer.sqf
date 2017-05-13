removeAllWeapons player;
removeAllAssignedItems player;

player addBackpack "B_Carryall_oli"; 
(unitBackpack player) addMagazineCargoGlobal [weaponMagazine, 25]; 
(unitBackpack player) addMagazineCargoGlobal [weaponGrandes, 25];

player addMagazines [weaponMagazine, 8];
player addMagazines [weaponGrandes, 15];
player addWeapon weapon;
player addPrimaryWeaponItem weaponOptic;
//player addPrimaryWeaponItem "acc_flashlight";
player addItem "FirstAidKit";
//player addItem "O_NVGoggles_ghex_F";
//player assignItem "O_NVGoggles_ghex_F";
player addWeapon "ItemMap";