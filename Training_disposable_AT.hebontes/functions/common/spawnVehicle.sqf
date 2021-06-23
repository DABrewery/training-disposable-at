//Spawns a vehicle with params

params [
	["_classname", "rhs_btr80a_vdv"],
	["_pos", position player],
	["_azimut", 0],
	["_createMarker", true],
	["_crew", false]
];

private _veh = createVehicle [_className, _pos, [], 0, "NONE"];
_veh setDir _azimut;

if (_createMarker) then {
	//["markerVeh_", _pos, "hd_objective_noShadow", "colorRed"] execVM "functions\common\createMarker.sqf";
	["markerVeh_", _pos, "hd_objective_noShadow", "colorRed"] call fn_createMarker;
};

//Add crew to the created vehicle
if (_crew) then {

};




