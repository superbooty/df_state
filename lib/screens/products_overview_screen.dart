
import 'package:flutter/material.dart';

import '../widgets/popup_menu.dart';
import '../widgets/products_grid.dart';

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/product-overview';
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  
  @override
  Widget build(BuildContext context) {
    // final queryText = Provider.of<QueryText>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Levi\'s Products'),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
