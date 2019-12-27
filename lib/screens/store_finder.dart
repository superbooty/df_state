import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/store_locaions.dart';
import 'package:provider/provider.dart';

import '../widgets/maps/location.dart';
import '../widgets/popup_menu.dart';

class StoreFinderScreen extends StatelessWidget {
  static const routeName = '/store-finder';

  @override
  /**
   * Eventually this class will use data from the LocationFetcher to generate
   * a list of Markers to show on the Map.
   */
  Widget build(BuildContext context) {
    print('Showing store finder screen');
    return Scaffold(
      appBar: AppBar(
        title: Text('Store Finder'),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
              child: Container(
                height: 600,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                    future: Provider.of<LocationFetcher>(context, listen: false)
                        .fetchStoreLocationsForZip('94103'),
                    builder: (ctx, dataSnapshot) {
                      if (dataSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return StaticLocation();
                      }
                    }),
              ),
            )
          ]),
    );
  }
}
