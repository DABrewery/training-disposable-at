params [
	["_prefix", "marker_"],
	"_pos",
	["_markerType", "hd_dot"],
	["_color", "colorBlack"]
];

_mrkName = _prefix + str(floor(random 100000));		
_marker = createMarkerLocal [_mrkName, _pos];
_marker setMarkerTypeLocal _markerType;
_marker setMarkerColorLocal _color;