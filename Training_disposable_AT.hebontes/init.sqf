// Compile mission scripts
fn_spawnVehicle = compile preprocessFile "functions\common\spawnVehicle.sqf";
fn_spawnVehiclesZone = compile preprocessFile "functions\training\spawnVehiclesZone.sqf";
fn_createMarker = compile preprocessFile "functions\common\createMarker.sqf";

//Hide spawn markers
private _tbSpMrk = allMapMarkers select {["mrk", _x, true] call BIS_fnc_inString};
{_x setMarkerAlpha 0.0} forEach _tbSpMrk;

/** Actions for Zone 1 (ACE interaction menu) **/

/* Spawn actions definitions */
_actSpawnRoot = ["SpawnRoot","Spawn","",{nil},{true}] call ace_interact_menu_fnc_createAction;
_actSpawnPreset = ["SpawnPreset","Fixe","",{nil},{true}] call ace_interact_menu_fnc_createAction;
_actSpawnRandom = ["SpawnRandom","Aléatoire","",{nil},{true}] call ace_interact_menu_fnc_createAction;
//Blufor spawn
//-preset spawn
_actSpawnBf = ["SpawnBlufor", "Blufor", "", {nil}, {true}] call ace_interact_menu_fnc_createAction;
/*Debug only
_actSpawnBfPrsVeh1 = ["SpawnBfPrsVeh1", "M1127 'stryker'", "", {["rhsusf_stryker_m1127_m2_wd", "Z1"] execVM "functions\training\spawnVehiclesZone.sqf"}, {true}] call ace_interact_menu_fnc_createAction;
_actSpawnBfPrsVeh2 = ["SpawnBfPrsVeh2", "M113A3", "", {["rhsusf_m113_usarmy_unarmed", "Z1"] execVM "functions\training\spawnVehiclesZone.sqf"}, {true}] call ace_interact_menu_fnc_createAction;
*/
_actSpawnBfPrsVeh1 = ["SpawnBfPrsVeh1", "M1127 'stryker'", "", {["rhsusf_stryker_m1127_m2_wd", "Z1"] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
_actSpawnBfPrsVeh2 = ["SpawnBfPrsVeh2", "M113A3", "", {["rhsusf_m113_usarmy_unarmed", "Z1"] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
_actSpawnBfPrsVeh3 = ["SpawnBfPrsVeh3", "M2A3 'Bradley'", "", {["RHS_M2A3_wd", "Z1"] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
_actSpawnBfPrsVeh4 = ["SpawnBfPrsVeh4", "M1A2 'Abrams'", "", {["rhsusf_m1a2sep1wd_usarmy", "Z1"]  spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
//-random spawn
_actSpawnBfRdMVeh1 = ["SpawnBfRdmVeh1", "M1127 'stryker'", "", {["rhsusf_stryker_m1127_m2_wd", "Z1", false] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
_actSpawnBfRdmVeh2 = ["SpawnBfRdmVeh2", "M113A3", "", {["rhsusf_m113_usarmy_unarmed", "Z1", false] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
_actSpawnbfRdmVeh3 = ["SpawnBfRdmVeh3", "M2A3 'Bradley'", "", {["RHS_M2A3_wd", "Z1", false] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
_actSpawnbfRdmVeh4 = ["SpawnBfRdmVeh4", "M1A2 'Abrams'", "", {["rhsusf_m1a2sep1wd_usarmy", "Z1", false] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
//Opfor spawn
_actSpawnOf = ["SpawnOpfor", "Opfor", "", {}, {true}] call ace_interact_menu_fnc_createAction;
//-preset spawn
_actSpawnOfPrsVeh1 = ["SpawnOfPrsVeh1", "BRDM", "", {["rhsgref_BRDM2_vdv", "Z1"] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
_actSpawnOfPrsVeh2 = ["SpawnOfPrsVeh2", "BTR", "", {["rhs_btr80_vdv", "Z1"] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
_actSpawnOfPrsVeh3 = ["SpawnOfPrsVeh3", "BMP", "", {["rhs_bmp2d_vdv", "Z1"] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
_actSpawnOfPrsVeh4 = ["SpawnOfPrsVeh4", "T-72B", "", {["rhs_t72bc_tv", "Z1"] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
//-random spawn
_actSpawnOfRdmVeh1 = ["SpawnOfRdmVeh1", "BRDM", "", {["rhsgref_BRDM2_vdv", "Z1", false] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
_actSpawnOfRdmVeh2 = ["SpawnOfRdmVeh2", "BTR", "", {["rhs_btr80_vdv", "Z1", false] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
_actSpawnOfRdmVeh3 = ["SpawnOfRdmVeh3", "BMP", "", {["rhs_bmp2d_vdv", "Z1", false] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;
_actSpawnOfRdmVeh4 = ["SpawnOfRdmVeh4", "T-72B", "", {["rhs_t72bc_tv", "Z1", false] spawn fn_spawnVehiclesZone}, {true}] call ace_interact_menu_fnc_createAction;

/* Clean actions definitions */
_actCleanRoot = ["CleanRoot","Clean","",{nil},{true}] call ace_interact_menu_fnc_createAction;
//Brute force cleaning :D. Must be tuned if not on a dedicated map !
_actCleanWrecks = ["CleanWrecks","Epaves","",{{ deleteVehicle _x } forEach allDead;},{true}] call ace_interact_menu_fnc_createAction;
_actCleanMarkers = ["CleanMarkers","Marqueurs d'impact","",{{deleteMarker _x} forEach (allMapMarkers select {["markerImpact_", _x, true] call BIS_fnc_inString})},{true}] call ace_interact_menu_fnc_createAction;

/*ACE action tree*/
[activator_Z1, 0, ["ACE_MainActions"], _actSpawnRoot] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot"], _actSpawnPreset] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot"], _actSpawnRandom] call ace_interact_menu_fnc_addActionToObject;

[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnPreset"], _actSpawnBf] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnPreset", "SpawnBlufor"], _actSpawnBfPrsVeh1] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnPreset", "SpawnBlufor"], _actSpawnBfPrsVeh2] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnPreset", "SpawnBlufor"], _actSpawnBfPrsVeh3] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnPreset", "SpawnBlufor"], _actSpawnBfPrsVeh4] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnRandom"], _actSpawnBf] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnRandom", "SpawnBlufor"], _actSpawnBfRdmVeh1] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnRandom", "SpawnBlufor"], _actSpawnBfRdmVeh2] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnRandom", "SpawnBlufor"], _actSpawnBfRdmVeh3] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnRandom", "SpawnBlufor"], _actSpawnBfRdmVeh4] call ace_interact_menu_fnc_addActionToObject;

[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnPreset"], _actSpawnOf] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnPreset", "SpawnOpfor"], _actSpawnOfPrsVeh1] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnPreset", "SpawnOpfor"], _actSpawnOfPrsVeh2] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnPreset", "SpawnOpfor"], _actSpawnOfPrsVeh3] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnPreset", "SpawnOpfor"], _actSpawnOfPrsVeh4] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnRandom"], _actSpawnOf] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnRandom", "SpawnOpfor"], _actSpawnOfRdmVeh1] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnRandom", "SpawnOpfor"], _actSpawnOfRdmVeh2] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnRandom", "SpawnOpfor"], _actSpawnOfRdmVeh3] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "SpawnRoot", "SpawnRandom", "SpawnOpfor"], _actSpawnOfRdmVeh4] call ace_interact_menu_fnc_addActionToObject;


[activator_Z1, 0, ["ACE_MainActions"], _actCleanRoot] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "CleanRoot"], _actCleanWrecks] call ace_interact_menu_fnc_addActionToObject;
[activator_Z1, 0, ["ACE_MainActions", "CleanRoot"], _actCleanMarkers] call ace_interact_menu_fnc_addActionToObject;