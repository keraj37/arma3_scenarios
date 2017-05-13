playSound "scoreAdded";

totalKills = totalKills + 1;

_totalEnemy = call countTotalEnemy;
if (_totalEnemy > 0) then {hint format ["%1 DIED. LEFT %2", totalKills, _totalEnemy];};

if(totalKills % 50 == 0) then {[] execVM "support.sqf";};