import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class MyPopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (int val) {
        print('Value :: $val');
        Navigator.of(context).pushNamedAndRemoveUntil(
          ProductDetailScreen.routeName,
          (route) => route.isCurrent && route.settings.name == ProductDetailScreen.routeName
              ? false
              : true,
          arguments: 'p4',
        );
      },
      icon: Icon(
        Icons.more_vert,
      ),
      itemBuilder: (_) => [
        PopupMenuItem(
          value: 0,
          child: Text('one'),
        ),
        PopupMenuItem(
          value: 1,
          child: Text('two'),
        ),
      ],
    );
  }
}
