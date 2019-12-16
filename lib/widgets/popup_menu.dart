import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/products_overview_screen.dart';

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
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
              ProductsOverviewScreen.routeName,
              (route) => route.isCurrent &&
                      route.settings.name == ProductsOverviewScreen.routeName
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
      ],
    );
  }
}
