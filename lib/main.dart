import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import './providers/buying_options.dart';
import './screens/store_finder.dart';
import './providers/cms_content.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/query_text.dart';
import './providers/products.dart';
import './screens/product_finder_screen.dart';
import './screens/home.dart';
import './providers/product_service.dart';
import './screens/cart_screen.dart';
import './providers/cart_data_provider.dart';
import './providers/recommendations.dart';
import './providers/store_locaions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => QueryText()),
        ChangeNotifierProvider(create: (_) => Recommendations()),
        ChangeNotifierProvider(create: (_) => CmsContent()),
        ChangeNotifierProvider(create: (_) =>  ProductService()),
        ChangeNotifierProvider(create: (_) =>  LocationFetcher()),
        ChangeNotifierProvider(create: (_) =>  BuyingOptions()),
        ChangeNotifierProvider(create: (_) =>  CartDataProvider()),
      ],
      child: MaterialApp(
          title: '',
          color: Colors.grey[300],
          theme: ThemeData(
            //primarySwatch: Colors.,
            primaryColor: Color(0XFFc41130),
            // scaffoldBackgroundColor: Color(0xFFf4f4f4),
            // backgroundColor: Color(0XFFF1DD33),
            accentColor: Colors.redAccent,
            textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'Interstate',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              display1: TextStyle(
                fontFamily: 'Interstate',
                fontSize: 12,
                color: Colors.grey[900],
              ),
            ),
            appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'Interstate',
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
            Cart.routeName: (ctx) => Cart(),
          }),
    );
  }
}
