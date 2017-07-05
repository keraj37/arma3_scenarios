player addAction [
	"Add vehicle 1",
	{
		_ins = lineIntersectsSurfaces [
			AGLToASL positionCameraToWorld [0,0,0], 
			AGLToASL positionCameraToWorld [0,0,4900], 
			player
		];
		
		"CUP_O_T90_RU" createVehicle (_ins select 0 select 0);		
	},
	nil,1.5,false,true,""
] ;

player addAction [
	"Add vehicle 2",
	{
		_ins = lineIntersectsSurfaces [
			AGLToASL positionCameraToWorld [0,0,0], 
			AGLToASL positionCameraToWorld [0,0,4900], 
			player
		];
		
		"C_Offroad_01_F" createVehicle (_ins select 0 select 0);		
	},
	nil,1.5,false,true,""
] ;

player addAction [
	"Add soldier 1",
	{
		_ins = lineIntersectsSurfaces [
			AGLToASL positionCameraToWorld [0,0,0], 
			AGLToASL positionCameraToWorld [0,0,4900], 
			player
		];
		
		_this_group = Creategroup EAST;
			
		_spawn_position = (_ins select 0 select 0);

		_skill_level = _group_skill select _skill_index;
		_skill_level_name = _group_skill_level select _skill_index;

		_num = random 12 + 3;
		
		for "_i" from 0 to (_num) do
		{			
			"rhs_vdv_rifleman" createUnit [_spawn_position, _this_group, "this allowFleeing 0", 0.5, "Private"];			
		};		
	},
	nil,1.5,false,true,""
] ;

/*
C_Offroad_01_F
CUP_O_T90_RU
*/