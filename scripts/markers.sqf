private _markers = allMapMarkers;

{
	if ((getMarkerColor _x) == "colorRed" && zoneScore == 2) then {
		deleteMarker _x;
	};
} forEach _markers;