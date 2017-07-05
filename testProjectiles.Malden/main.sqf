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

replaceProjectile =   
{     
	_pos = getPosATL _this;
	_finalPos = [_pos select 0, _pos select 1, (_pos select 2) + 2];

	_nProjectile = createVehicle["Sh_125mm_APFSDS_T_Green", _finalPos,[], 0, "CAN_COLLIDE"];	
	_direction = _this weaponDirection currentWeapon _this;
	_velocity = _direction vectorMultiply 2500;
	_nProjectile setVelocity _velocity;
	_this setVehicleAmmo 1;
};  
   
player addEventHandler   
[
"fired",   
	{   
		(_this select 0) call replaceProjectile; 
	}
];

/*
B_20mm
B_40mm_APFSDS
B_35mm_AA
Cluster_155mm_AMOS
G_40mm_HE
M_Mo_155mm_AT
Sh_120mm_HE
rhs_ammo_152_WP
R_230mm_HE
CUP_B_30x113mm_M789_HEDP_Yellow_Tracer
B_40mm_GPR
ACE_B_35mm_ABM
rhs_ammo_3WOF27
Sh_125mm_APFSDS_T_Green
*/