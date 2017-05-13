playSound "scoreAdded";

totalKills = totalKills + 1;

hint format ["%1 DIED. LEFT %2", totalKills, call countTotalEnemy];