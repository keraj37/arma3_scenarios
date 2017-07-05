player addAction [
	"Add vehicle 1",
	{
		_ins = lineIntersectsSurfaces [
			AGLToASL positionCameraToWorld [0,0,0], 
			AGLToASL positionCameraToWorld [0,0,4900], 
			player
		];
		
		_veh = "rhs_bmd2" createVehicle (_ins select 0 select 0);		
		createVehicleCrew _veh;	
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
		
		_veh = "rhs_bmd4m_vdv" createVehicle (_ins select 0 select 0);		
		createVehicleCrew _veh;   		
	},
	nil,1.5,false,true,""
] ;

player addAction [
	"Add vehicle 3",
	{
		_ins = lineIntersectsSurfaces [
			AGLToASL positionCameraToWorld [0,0,0], 
			AGLToASL positionCameraToWorld [0,0,4900], 
			player
		];
		
		_veh = "CUP_O_BRDM2_RUS" createVehicle (_ins select 0 select 0);		
		createVehicleCrew _veh;   		
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
CUP_O_BRDM2_RUS
rhs_bmd2
rhs_bmd4m_vdv
*/