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
    final mediaQuery = MediaQuery.of(context);
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
            Marker mapMarker = Marker(
              markerId: MarkerId(dataMarker.locationId),
              position: LatLng(
                  double.parse(dataMarker.lat), double.parse(dataMarker.lng)),
            );
            markers[mapMarker.markerId] = mapMarker;
          }
        }
        mapController.future.then((controller) {
          controller.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(center.latitude, center.longitude),
                zoom: 12,
              ),
            ),
          );
        });
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              // height: MediaQuery.of(context).size.height * .4,
              flex: 5,
              child: GoogleMap(
                markers: Set<Marker>.of(markers.values),
                onMapCreated: (controller) {
                  mapController.complete(controller);
                },
                initialCameraPosition: CameraPosition(
                  target: center,
                  zoom: 12.0,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 3,
              child: (locations != null && locations.markers != null)
                  ? ListView.builder(
                      itemCount: locations.markers.length,
                      itemBuilder: (ctx, i) {
                        loc.Marker m = locations.markers[i];
                        return Card(
                          child: ListTile(
                            contentPadding: EdgeInsets.all(5),
                            onTap: () {
                              mapController.future.then(
                                (controller) {
                                  controller.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                      CameraPosition(
                                        target: LatLng(
                                          double.parse(m.lat),
                                          double.parse(m.lng),
                                        ),
                                        zoom: 16,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            subtitle: Text(m.infoMap['address_1']),
                            title: Text(
                              '${m.infoMap['location_name']}, ${m.infoMap['city']}',
                              maxLines: 3,
                            ),
                            leading: Icon(
                              Icons.store,
                              size: 36,
                              color: Colors.redAccent,
                            ),
                            trailing: Container(
                              width: 120,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.red[600],
                              ),
                              child: Text(
                                m.storeType,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text('No Stores To Show'),
                    ),
            ),
          ],
        );
      },
    );
  }
}
