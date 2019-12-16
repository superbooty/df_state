import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/recommendations.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/query_text.dart';
import './providers/products.dart';
import './screens/product_finder_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: QueryText()),
         ChangeNotifierProvider.value(value: Recommendations()),
      ],
      child: MaterialApp(
          title: '',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          
          home: ProductFinderScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
            ProductFinderScreen.routeName: (ctx) => ProductFinderScreen(),
          }),
    );
  }
}
