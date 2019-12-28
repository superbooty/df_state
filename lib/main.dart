import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/recommendations.dart';
import 'package:flutter_complete_guide/providers/store_locaions.dart';
import './screens/store_finder.dart';
import 'package:provider/provider.dart';

import './providers/cms_content.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/query_text.dart';
import './providers/products.dart';
import './screens/product_finder_screen.dart';
import './screens/home.dart';
import './providers/product_details.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: QueryText()),
        ChangeNotifierProvider.value(value: Recommendations()),
        ChangeNotifierProvider.value(value: CmsContent()),
        ChangeNotifierProvider.value(value: ProductDetails()),
        ChangeNotifierProvider.value(value: LocationFetcher()),
      ],
      child: MaterialApp(
          title: '',
          theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Colors.redAccent,
            textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              display1: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 12,
                color: Colors.grey[900],
              ),
            ),
            appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          home: Home(),
          routes: {
            Home.routeName: (ctx) => Home(),
            ProductDetailScreen.routeName: (ctx) =>
                ProductDetailScreen(product: null),
            ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
            ProductFinderScreen.routeName: (ctx) => ProductFinderScreen(),
            StoreFinderScreen.routeName: (ctx) => StoreFinderScreen(),
          }),
    );
  }
}
