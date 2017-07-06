_max_groups = 15; 
_max_group_size = 5;
_min_group_size = 2;
_markers = [marker_0, marker_1, marker_2, marker_3, marker_4, marker_5, marker_6, marker_7, marker_8, marker_9, marker_10, marker_11, marker_12];

_all_groups = [];

while {alive player} do
{
	while {_group_counter < _max_groups} do
	{
		_this_group = Creategroup EAST;	
		_all_groups = _all_groups + [_this_group];
		
		_group_size = floor(random (_max_group_size - _min_group_size)) + _min_group_size;

		for "_i" from 0 to (_group_size - 1) do
		{
			_veh = createVehicle ["rhs_bmd2", position player, _markers, 10, ""];
			createVehicleCrew _veh;				
			_vehcrew = crew _veh; //this will give you an array which has the crew members.
			_vehcrew join _this_group;			
			
			//_vehgrp = group driver _veh; //you get the convoy leader's group with this little command
			//_veh2crew join _vehgrp; //Array is needed for join command.

			//_waypoint0 = _vehgrp addWaypoint [getMarkerPos "move_marker",0];
			//_waypoint0 setWaypointType "Move"; 			
		};		

		_wp = _this_group addWaypoint [position player, 0];
		
		_wp setWaypointBehaviour "COMBAT"; 
		_wp setwaypointtype "DESTROY"; 
		_wp setWaypointFormation "LINE";
		_wp setWaypointSpeed "FULL";
		//_wp setwaypointstatements ["True", ""];		

		_group_counter = _group_counter + 1;	
	};

	_groupsToRemove = [];
	_howManyGroupsDead = 0;
	
	for "_i" from 0 to (_group_counter - 1) do
	{
		_this_group = _all_groups select _i;		
		
		if (({alive _x} count units _this_group) < 1) then
		{
			_groupsToRemove = _groupsToRemove + [_this_group];
			_howManyGroupsDead = _howManyGroupsDead + 1;
		};
	};
	
	_group_counter = _group_counter - _howManyGroupsDead;
	_all_groups = _all_groups - _groupsToRemove;

	sleep 20;
};