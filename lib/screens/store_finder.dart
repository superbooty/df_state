import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/store_locaions.dart';
import 'package:provider/provider.dart';

import '../widgets/maps/location.dart';
import '../widgets/popup_menu.dart';

class StoreFinderScreen extends StatelessWidget {
  static const routeName = '/store-finder';

  final zipCodeController = TextEditingController();
  final LocationFetcher fetcher = LocationFetcher();

  @override
  /**
   * Eventually this class will use data from the LocationFetcher to generate
   * a list of Markers to show on the Map.
   */
  Widget build(BuildContext context) {
    LocationFetcher fetcher = Provider.of<LocationFetcher>(context);
    print('Showing store finder screen');
    return Scaffold(
      appBar: AppBar(
        title: Text('Store Finder'),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: 'Enter Zip Code',
                prefixIcon: IconButton(
                  alignment: Alignment.centerRight,
                  icon: Icon(Icons.location_searching),
                  iconSize: 24,
                  onPressed: () {
                    fetcher.fetchStoreLocationsForZip(zipCodeController.value);
                  },
                ),
              ),
              controller: zipCodeController,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.width,
                child: ChangeNotifierProvider.value(
                  value: fetcher.storeLocations,
                  child: StaticLocation(),
                ),
              ),
            )
          ]),
    );
  }
}
