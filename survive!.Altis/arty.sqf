_start_distance = 75;
_max_distance = 500;
_max_shots = 5;
_max_delay = 39;

getRandomPosition = {
	_target_position = position player;

	_xpos = _target_position select 0;
	_ypos = _target_position select 1;
	_zpos = _target_position select 2;

	_distance = _start_distance + random (_max_distance - _start_distance);
	_angle = random 360;

	_xxpos = (_distance * cos _angle);
	_yypos = (_distance * sin _angle);

	_xpos = _xpos + _xxpos;
	_ypos = _ypos + _yypos;

	_target_position set [0, _xpos];
	_target_position set [1, _ypos];
	_target_position set [2, _zpos];
	
	_target_position //return
};

while {alive player} do
{
	arty_1 setVehicleAmmo 1;
	arty_1 setVehicleAmmo 1;
	mortar_1 setVehicleAmmo 1;
	mortar_2 setVehicleAmmo 1;	

	arty_1 doArtilleryFire[call getRandomPosition, "32Rnd_155mm_Mo_shells", random(_max_shots) + 1];
	
	mortar_1 commandArtilleryFire [
			call getRandomPosition,                      
			getArtilleryAmmo [mortar_1] select 0,
			random(_max_shots) + 1                             
		];	
	
	mortar_2 commandArtilleryFire [
		call getRandomPosition,                      
		getArtilleryAmmo [mortar_2] select 0,
		random(_max_shots) + 1                             
	];
	
	sleep random(_max_delay) + 2; 
};