import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/popup_menu.dart';
import '../providers/products.dart';
import '../widgets/search.dart';

class ProductFinderScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-finder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Finder'),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      body: Search(),
    );
  }
}
