import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products.dart';
import '../widgets/popup_menu.dart';
import '../providers/query_text.dart';
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
    final args = ModalRoute.of(context).settings.arguments;
    
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
