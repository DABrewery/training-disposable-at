params [
	"_vehClsName",
	"_zone",
	["_preset", true]
];

//List spawn markers
private _mrk = "mrkSp" + _zone;
private _mrkZn = "mrk" + _zone;
private _tbMrk = allMapMarkers select {[_mrk, _x, true] call BIS_fnc_inString};

//Clean non destroyed vehicles
{
	if (position _x inArea _mrkZn) then {
		deleteVehicle _x; 
	};
} foreach vehicles;

//Clean destroyed vehicles
{ deleteVehicle _x } forEach allDead;

//Clean vehicle markers
{deleteMarker _x} forEach (allMapMarkers select {["markerVeh_", _x, true] call BIS_fnc_inString});

//Spawn vehicles in the defined zone
if (_preset) then {
	//On preset positions (markers)
	{
		
		private _pos = getMarkerPos _x;
		private _dir = markerDir _x;
		//DBG: [_vehClsName, _pos, _dir] execVM "functions\common\spawnVehicle.sqf";
		[_vehClsName, _pos, _dir] spawn fn_spawnVehicle;
	} forEach _tbMrk;
} else {
	//On random positions
	for "_i" from 1 to 8 do {
		private _pos = [[_mrkZn], [], {true}] call BIS_fnc_randomPos;
		private _dir = floor (random 360);
		//DBG: [_vehClsName, _pos, _dir] execVM "functions\common\spawnVehicle.sqf";
		[_vehClsName, _pos, _dir] spawn fn_spawnVehicle;
	}
};