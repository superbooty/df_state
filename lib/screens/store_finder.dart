import 'package:flutter/material.dart';

import '../widgets/maps/location.dart';
import '../widgets/popup_menu.dart';

class StoreFinderScreen extends StatelessWidget {
  static const routeName = '/store-finder';

  @override
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
            child: StaticLocation(),
          ),
        )
      ]),
    );
  }
}
