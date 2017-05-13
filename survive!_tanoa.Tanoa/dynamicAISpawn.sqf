private ["_this_speed","_this_formation"];

_min_groups = 15;		// The mimimum number of groups that will be created
_max_groups = 15;		// The maximum number of groups that will be created. This number CANNOT exceed 8

_min_group_size = 2;	// The minimum number of people a group can contain
_max_group_size = 7;	// The maximum number of people a group can contain.

_start_distance = 350;		// This is the minimum spawn distance for a group from the trigger point
_max_distance = 700;	// This is the maximum spawn distance for a group from the trigger point

_skillBase = 0.14;

_max_enemy_distance = 250;	// This is the maximum distance a group can be from the player as the group follows the player around
_min_enemy_distance = 50;

_man_type=["O_Soldier_F","O_officer_F","O_Soldier_GL_F","O_Soldier_AR_F","O_Soldier_AT_F"];

_speed_type=["LIMITED","NORMAL","FULL"];

_speed_odds = [100,60,30];

_formation_type=["NO CHANGE","COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE","FILE","DIAMOND"];
 
_formation_odds = [100,90,80,70,60,50,40,30,20,10];

_number_groups = floor(random (_max_groups - _min_groups)) + _min_groups;

_man_number = count _man_type;

_formation_count = count _formation_type;

private ["_i", "_j", "_k",  "_odds", "_table_odds", "_this_man", "_skill_level"];

_group_counter = 0;	

_all_groups = [];

_firstSpawn = true;

while {alive player} do
{
	while {_group_counter < _number_groups} do
	{
		_this_group = Creategroup EAST;
		
		_all_groups = _all_groups + [_this_group];
		
		_this_man_odds = [100,90,60,20,10];

		_group_size = floor(random (_max_group_size - _min_group_size)) + _min_group_size;

		_spawn_position = position player;

		_xpos = _spawn_position select 0;
		_ypos = _spawn_position select 1;
		_zpos = _spawn_position select 2;

		_distance = _start_distance + random (_max_distance - _start_distance);
		_angle = random 360;

		_xxpos = (_distance * cos _angle);
		_yypos = (_distance * sin _angle);

		_xpos = _xpos + _xxpos;
		_ypos = _ypos + _yypos;

		_spawn_position set [0, _xpos];
		_spawn_position set [1, _ypos];
		_spawn_position set [2, _zpos];

		_odds = random (100);
		_skill_level = _skillBase + (random 1);		

		for "_i" from 0 to (_group_size - 1) do
		{
			_odds = random (100);

			for "_j" from 0 to (_man_number - 1) do
			{
				_table_odds = _this_man_odds select _j;
				if (_odds < _table_odds) then
				{
					_this_man = _j;
				};
			};

			_man = _man_type select _this_man;
			_man createUnit [_spawn_position, _this_group, "this allowFleeing 0", _skill_level, "Private"];			
		};

		_formation = _formation_type select floor random count _formation_type;

		_wp1 = _this_group addWaypoint [position player, _max_enemy_distance];
		_wp2 = _this_group addWaypoint [position player, _max_enemy_distance];
		_wp3 = _this_group addWaypoint [position player, _max_enemy_distance]; 

		_wp1 setWaypointBehaviour "AWARE"; 
		_wp1 setwaypointtype "MOVE"; 
		_wp1 setWaypointFormation _formation;
		_wp1 setWaypointSpeed "Normal";
		_wp1 setwaypointstatements ["True", ""];

		_wp2 setwaypointtype "MOVE"; 

		_wp3 setWaypointType "Cycle";

		_group_counter = _group_counter + 1;
		
		{_x addEventHandler ["killed", {_this exec "enemyKilled.sqf";}];} forEach units _this_group;
		{_x addEventHandler ["hit", {_this select 0 setDamage 1}];} forEach units _this_group;
						
		if(!_firstSpawn) then
		{		
			cutText [format ["NEW ENEMY GROUP OF %1 MAN IS CHASING YOU!", _group_size], "PLAIN DOWN", 1];			
		};
	};

	_groupsToRemove = [];
	_howManyGroupsDead = 0;
	
	for "_i" from 0 to (_group_counter - 1) do
	{
		_this_group = _all_groups select _i;		

		_odds = random (100);

		for "_j" from 0 to ((count _speed_odds) - 1) do
		{
			_table_odds = _speed_odds select _j;

			if (_odds < _table_odds) then
			{
				_this_speed = _j;
			};
		};

		_odds = random (100);

		for [ {_j=0}, { _j <  _formation_count}, { _j =_j+1 } ] do
		{
			_table_odds = _formation_odds select _j;

			if (_odds < _table_odds) then
			{
				_this_formation = _j;
			};
		};

		_speed = _speed_type select _this_speed;
		_formation = _formation_type select _this_formation;

		[_this_group, 1] setWaypointSpeed _speed;
		[_this_group, 1] setWaypointFormation _formation;

		[_this_group, 1] setWaypointPosition [ getPosATL player, random (_max_enemy_distance) + _min_enemy_distance];
		[_this_group, 2] setWaypointPosition [ getPosATL player, random (_max_enemy_distance) + _min_enemy_distance];
		
		if (({alive _x} count units _this_group) < 1) then
		{
			_groupsToRemove = _groupsToRemove + [_this_group];
			_howManyGroupsDead = _howManyGroupsDead + 1;
		};
	};
	
	_group_counter = _group_counter - _howManyGroupsDead;
	_all_groups = _all_groups - _groupsToRemove;

	_firstSpawn = false;
	
	sleep 15;
};