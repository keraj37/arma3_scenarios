player addAction [
	"Add vehicle",
	{
		_ins = lineIntersectsSurfaces [
			AGLToASL positionCameraToWorld [0,0,0], 
			AGLToASL positionCameraToWorld [0,0,4500], 
			player
		];
		
		"C_Offroad_01_F" createVehicle (_ins select 0 select 0);		
	},
	nil,1.5,false,true,""
] ;