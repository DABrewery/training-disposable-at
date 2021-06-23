//Add a local action on player to "reload" disposable ATs
player addAction [  
 	"Reload M136",  
 	{  
		player removeWeapon (secondaryWeapon player);  
		player addMagazine "rhs_weap_M136";   
		player addWeapon "rhs_weap_M136";   
		player selectWeapon "rhs_weap_M136";   
 	}  
]; 
 
player addAction [  
 	"Reload M72A7",  
	{  
		player removeWeapon (secondaryWeapon player);  
		player addMagazine "rhs_weap_m72a7";   
		player addWeapon "rhs_weap_m72a7";   
		player selectWeapon "rhs_weap_m72a7";   
	}  
]; 
 
player addAction [  
 "Reload RPG18",  
	{  
		player removeWeapon (secondaryWeapon player);  
		player addMagazine "rhs_weap_rpg18";   
		player addWeapon "rhs_weap_rpg18";   
		player selectWeapon "rhs_weap_rpg18";   
	}  
]; 
 
player addAction [  
"Reload RPG26",  
	{  
		player removeWeapon (secondaryWeapon player);  
		player addMagazine "rhs_weap_rpg26";   
		player addWeapon "rhs_weap_rpg26";   
		player selectWeapon "rhs_weap_rpg26";   
	}  
];


//Create a marker on map on projectile impact position
player addeventhandler ["Fired",   
{ 
	_this spawn 
	{ 
 		_bullet = _this select 6; 
		_pos = getPosATL _bullet; 
		while {alive _bullet} do {_pos = getPosATL _bullet;};
		_mrkName = "markerImpact_" + str(floor(random 100000));		
		_marker = createMarkerLocal [_mrkName, _pos];
		_marker setMarkerTypeLocal "hd_destroy_noShadow";
		_marker setMarkerColorLocal "colorBlue";
	}; 
}];