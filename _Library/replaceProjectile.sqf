replaceProjectile =   
{     
	_pos = getPosATL _this;
	_direction = _this weaponDirection currentWeapon _this;
	_finalPos = _pos vectorAdd _direction;
	_finalPos = _finalPos vectorAdd [0, 0, 1.5];

	_nProjectile = createVehicle["Sh_125mm_APFSDS_T_Green", _finalPos,[], 0, "CAN_COLLIDE"];	
	
	_velocity = _direction vectorMultiply 2000;
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
Sh_125mm_HEAT
Sh_105mm_HEAT_MP
rhs_ammo_smaw_HEAA
rhs_ammo_m21OF_HE //!
rhs_ammo_Hydra_M229_Heli
rhs_ammo_Hydra_HE_A10
rhs_ammo_Hellfire_AT_penetrator
rhs_ammo_heat_tandem
rhs_ammo_40mmHEDP_penetrator
B_20mm
B_40mm_APFSDS
B_35mm_AA
Cluster_155mm_AMOS
G_40mm_HE
M_Mo_155mm_AT
Sh_120mm_HE
rhs_ammo_152_WP
R_230mm_HE //!
CUP_B_30x113mm_M789_HEDP_Yellow_Tracer
B_40mm_GPR
ACE_B_35mm_ABM
rhs_ammo_3WOF27
Sh_125mm_APFSDS_T_Green
"M_Titan_AT"
*/