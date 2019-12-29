import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/recommended_items.dart';
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
    print('Showing product finder screen');
    Provider.of<Recommendations>(context, listen: false)
        .getRecommendationProducts();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Product Finder'),
          actions: <Widget>[
            MyPopupMenu(),
          ],
        ),
        body: Column(children: <Widget>[
          // commenting out following call as to not make too many prod calls
          Search(),
          SizedBox(
            height: 30,
          ),
          Text(
            'RECOMMENDED FOR YOU',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          RecommendedItems(),
        ]));
  }
}
