import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/recommendations.dart';
import '../widgets/popup_menu.dart';
import '../widgets/search.dart';

class ProductFinderScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-finder';

  @override
  Widget build(BuildContext context) {
    Provider.of<Recommendations>(context, listen: false).getRecommendationProducts();
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
