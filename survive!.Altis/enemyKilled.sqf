playSound "scoreAdded";

totalKills = totalKills + 1;

hint format ["%1 DIED. LEFT %2", totalKills, call countTotalEnemy];

if(totalKills % 50 == 0) then {[] execVM "support.sqf";};