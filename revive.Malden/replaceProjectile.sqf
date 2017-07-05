replaceProjectile =   
{     
	_pos = getPosATL _this;
	_finalPos = [_pos select 0, _pos select 1, (_pos select 2) + 3];

	_nProjectile = createVehicle["B_40mm_APFSDS", _finalPos,[], 0, "CAN_COLLIDE"];	
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
B_127x33_Ball
B_20mm
"B_40mm_APFSDS"
*/