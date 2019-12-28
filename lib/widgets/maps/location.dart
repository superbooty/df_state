import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/store_locaions.dart' as loc;

class StaticLocation extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<StaticLocation> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  // LatLng _center = const LatLng(37.7758, -122.4128);
  Completer<GoogleMapController> mapController = Completer();

  @override
  void initState() {
    super.initState();
  }

  final Marker marker =
      Marker(markerId: MarkerId('1'), position: LatLng(37.7758, -122.4128));

  @override
  Widget build(BuildContext context) {
    print('building map...');
    LatLng center = const LatLng(37.7758, -122.4128);
    return Consumer<loc.StoreLocations>(
      builder: (ctx, locations, _) {
        print('Locations :: ${locations}');
        if (locations != null && locations.markers != null) {
          center = LatLng(
            double.parse(locations.originLat),
            double.parse(locations.originLng),
          );
          for (loc.Marker dataMarker in locations.markers) {
            for (loc.Specialty specialty in dataMarker.specialties) {
              if (specialty.order == '1') {
                Marker mapMarker = Marker(
                  markerId: MarkerId(dataMarker.locationId),
                  position: LatLng(double.parse(dataMarker.lat),
                      double.parse(dataMarker.lng)),
                );
                markers[mapMarker.markerId] = mapMarker;
              }
            }
          }
        }
        mapController.future.then((controller) {
          controller.moveCamera(CameraUpdate.newLatLng(center));
        });
        return GoogleMap(
          markers: Set<Marker>.of(markers.values),
          onMapCreated: (controller) {
            mapController.complete(controller);
          },
          initialCameraPosition: CameraPosition(
            target: center,
            zoom: 12.0,
          ),
        );
      },
    );
  }
}
