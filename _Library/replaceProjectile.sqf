replaceProjectile =   
{     
	_pos = getPosATL _this;
	_finalPos = [_pos select 0, _pos select 1, (_pos select 2) + 2];

	_nProjectile = createVehicle["rhs_ammo_3WOF27", _finalPos,[], 0, "CAN_COLLIDE"];	
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