_max_groups = 6; 
_max_group_size = 11;
_min_group_size = 4;

_markers = allMapMarkers;

_all_groups = [];
_group_counter = 0;

_soldiers_russia_names = ["CUP_O_RUS_Soldier_GL", "CUP_O_RUS_Soldier_Marksman", "CUP_O_RUS_Commander", "CUP_O_RUS_SpecOps", "CUP_O_RUS_SpecOps_Scout", "CUP_O_RUS_Soldier_TL"];

while {alive player} do
{
	while {_group_counter < _max_groups} do
	{
		_this_group = Creategroup EAST;	
		
		hint "Enemy group detected!";
		
		_all_groups = _all_groups + [_this_group];
		
		_group_size = floor(random (_max_group_size - _min_group_size)) + _min_group_size;

		_this_marker = selectRandom _markers;
		
		_spawn_position = getMarkerPos _this_marker;
		
		for "_i" from 0 to (_group_size - 1) do
		{
			_this_sold_name = selectRandom _soldiers_russia_names;		
			
			_this_sold_name createUnit [_spawn_position, _this_group, "this allowFleeing 0", 0.5, "LIEUTENANT"];						
		};
		
		{
			_x setSkill ["aimingspeed", 0.5];
			_x setSkill ["spotdistance", 0.5];
			_x setSkill ["aimingaccuracy", 0.5];
			_x setSkill ["aimingshake", 0.5];
			_x setSkill ["spottime", 0.5];
			_x setSkill ["spotdistance", 0.5];
			_x setSkill ["commanding", 0.5];
			_x setSkill ["general", 0.5];
			
		} forEach units _this_group;		

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