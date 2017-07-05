player addAction [
	"Reset vehicle",
	{
		_vehicle = vehicle player;
		_vehicle setVehicleAmmo 1;
		_vehicle setDamage [0, false]; 		
	},
	nil,1.5,false,true,""
] ;

while {alive player} do {
        waitUntil {inputAction "User1" > 0};
		_vehicle = vehicle player;
		_vehicle setVehicleAmmo 1;
		_vehicle setDamage [0, false]; 	
    }; 