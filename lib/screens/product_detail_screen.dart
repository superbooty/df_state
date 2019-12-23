import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product/product.dart';
import '../providers/product_details.dart';
import '../providers/product.dart' as providerProduct;
import '../widgets/popup_menu.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  final providerProduct.Product product;

  // In the constructor, require a Todo.
  ProductDetailScreen({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      body: FutureBuilder(
          future: Provider.of<ProductDetails>(context, listen: false)
              .fetchProduct(product.code),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Consumer<ProductDetails>(
                builder: (ctx, details, _) => CarouselSlider(
                  height: mediaQuery.size.height * .58,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  viewportFraction: 1.0,
                  items: details.mobileGallery.map((image) {
                    return Container(
                      width: mediaQuery.size.width,
                      margin: EdgeInsets.symmetric(horizontal: 1.0),
                      child: Image.network(image.url),
                    );
                  }).toList(),
                ),
              );
            }
          }),
    );
  }
}
