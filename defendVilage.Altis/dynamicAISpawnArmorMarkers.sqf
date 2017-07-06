_max_groups = 10; 
_max_group_size = 5;
_min_group_size = 2;

_markers = allMapMarkers;

_all_groups = [];
_group_counter = 0;

_vehicles_russia_names = ["rhs_bmd2", "CUP_O_BMP2_RU", "CUP_O_BMP3_RU", "CUP_O_GAZ_Vodnik_BPPU_RU", "CUP_O_BTR90_RU", "CUP_O_UAZ_MG_RU", "CUP_O_T90_RU", "CUP_O_T72_RU", "CUP_O_2S6M_RU", "rhs_t90a_tv", "rhs_t80uk", "rhs_prp3_tv", "rhs_t72ba_tv", "rhs_btr60_msv", "rhs_bmp3m_msv", "rhs_tigr_sts_3camo_msv"];

while {alive player} do
{
	while {_group_counter < _max_groups} do
	{
		_this_group = Creategroup EAST;	
		_all_groups = _all_groups + [_this_group];
		
		_group_size = floor(random (_max_group_size - _min_group_size)) + _min_group_size;

		for "_i" from 0 to (_group_size - 1) do
		{
			_this_veh_name = selectRandom _vehicles_russia_names;
		
			_veh = createVehicle [_this_veh_name, position player, _markers, 10, ""];
			createVehicleCrew _veh;				
			_vehcrew = crew _veh; //this will give you an array which has the crew members.
			_vehcrew join _this_group;			
			
			{
				_x setSkill ["aimingspeed", 0.6];
				_x setSkill ["spotdistance", 0.6];
				_x setSkill ["aimingaccuracy", 0.6];
				_x setSkill ["aimingshake", 0.6];
				_x setSkill ["spottime", 0.6];
				_x setSkill ["spotdistance", 0.6];
				_x setSkill ["commanding", 0.6];
				_x setSkill ["general", 0.6];
			} forEach _vehcrew;						
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