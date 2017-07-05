replaceProjectile =   
{     
	_pos = getPosATL _this;
	_finalPos = [_pos select 0, _pos select 1, (_pos select 2) + 2];

	_nProjectile = createVehicle["B_35mm_AA", _finalPos,[], 0, "CAN_COLLIDE"];	
	_direction = _this weaponDirection currentWeapon _this;
	_velocity = _direction vectorMultiply 1500;
	_nProjectile setVelocity _velocity;  
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
*/