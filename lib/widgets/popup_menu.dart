import 'package:flutter/material.dart';

import '../screens/product_finder_screen.dart';

class MyPopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (val) {
        print('Value :: $val');
        Navigator.of(context).pushNamedAndRemoveUntil(
            ProductFinderScreen.routeName,
            (route) => route.isCurrent &&
                    route.settings.name == ProductFinderScreen.routeName
                ? false
                : true);
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
