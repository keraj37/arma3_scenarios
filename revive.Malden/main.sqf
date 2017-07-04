PLP_fnc_revive = {
	_pos = getPosATL _this ;
	_dir = getDir _this ;
	_type = typeOf _this ;
	_name = name _this ;
	_nameSound = nameSound _this ;
	_face = face _this ;
	_speaker = speaker _this ;
	_loadout = getUnitLoadout _this ;
	_wpnCargo = getWeaponCargo (_pos nearestObject "weaponHolderSimulated") ;
	
	_vehicle = vehicle _this;
	_vehicle setDamage 0; 
	
	_group = createGroup east;
	_unit = _group createUnit [_type,_pos,[],3,"NONE"] ;
	_unit setDir _dir ;
	_unit switchMove "AmovPpneMstpSnonWnonDnon" ;
	_unit setUnitLoadout _loadout ;
	_unit addWeapon (_wpnCargo select 0 select 0) ;
	_unit setName _name ;
	_unit setNameSound _nameSound ;
	_unit setFace _face ;
	_unit setSpeaker _speaker ;
	
	_unit setUnitPos "UP";
} ;

player addAction [
	"Revive all",
	{
		{ _x call PLP_fnc_revive; } forEach allDead;		
	},
	nil,1.5,false,true,""
] ;

player addAction [
	"Reload vehicle",
	{
		_vehicle = vehicle player;
		_vehicle setVehicleAmmo 1;		
	},
	nil,1.5,false,true,""
] ;

