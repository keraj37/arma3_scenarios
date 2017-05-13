playSound "c_in1_20_broadcast_SPE_0";

cutText ["SUPPORT IS COMMING!", "PLAIN",1];

support_veh setFuel 1;
support_veh setVehicleAmmo 1;

_startPosition = position support_veh;

_wp = support addWaypoint [position player, 20];
_wp setWaypointType "GUARD";

sleep 350;

_wp = support addWaypoint [_startPosition, 0];
_wp setWaypointType "MOVE";

