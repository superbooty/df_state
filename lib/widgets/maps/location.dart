import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StaticLocation extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<StaticLocation> {
  final FocusNode _addressInputFocusNode = FocusNode();
  GoogleMapController mapController;

  @override
  void initState() {
    _addressInputFocusNode.addListener(_updateLoc);
    super.initState();
  }

  @override
  void dispose() {
    _addressInputFocusNode.removeListener(_updateLoc);
    super.dispose();
  }

  void _updateLoc() {}

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final Marker marker = Marker(
      markerId: MarkerId('1'),
      position: LatLng(45.521563, -122.677433),
      infoWindow: InfoWindow(title: '1', snippet: '*'),
    );

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  Widget build(BuildContext context) {
    markers[marker.markerId] = marker;
    return GoogleMap(
      markers: Set<Marker>.of(markers.values),
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );
  }
}
