import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/popup_menu.dart';

import '../widgets/products_grid.dart';

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      body: new ProductsGrid(),
    );
  }
}
