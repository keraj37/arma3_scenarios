playSound "scoreAdded";

totalKills = totalKills + 1;

_totalEnemy = {alive _x && side _x == EAST} count allUnits;
if (_totalEnemy > 0) then {hint format ["%1 DIED. LEFT %2", totalKills, _totalEnemy];};

if(totalKills % 20 == 0) then {[] execVM "support.sqf";};