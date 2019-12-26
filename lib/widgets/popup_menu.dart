import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/products_overview_screen.dart';
import '../screens/store_finder.dart';
import '../screens/product_finder_screen.dart';


class MyPopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (val) {
        print('Value :: $val');
        if (val == 0) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              ProductFinderScreen.routeName,
              (route) => route.isCurrent &&
                      route.settings.name == ProductFinderScreen.routeName
                  ? false
                  : true,
               arguments: '',
            );
        }  
        if (val == 1) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              ProductsOverviewScreen.routeName,
              (route) => route.isCurrent &&
                      route.settings.name == ProductsOverviewScreen.routeName
                  ? false
                  : true,
              arguments: '',
            );
        }
        if (val == 2) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            StoreFinderScreen.routeName,
            (route) => route.isCurrent &&
                    route.settings.name == StoreFinderScreen.routeName
                ? false
                : true,
            arguments: '',
          );
        }
      },
      icon: Icon(
        Icons.more_vert,
      ),
      itemBuilder: (_) => [
        PopupMenuItem(
          value: 0,
          child: Text('search'),
        ),
        PopupMenuItem(
          value: 1,
          child: Text('browse'),
        ),
        PopupMenuItem(
          value: 2,
          child: Text('Store finder'),
        ),
      ],
    );
  }
}
