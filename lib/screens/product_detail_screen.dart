import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                builder: (ctx, details, _) => Column(
                  children: <Widget>[
                    Container(
                      child: CarouselSlider(
                        height: mediaQuery.size.height * .58,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                        items: details.mobileGallery.map((image) {
                          return Container(
                            width: mediaQuery.size.width,
                            margin: EdgeInsets.symmetric(horizontal: 1.0),
                            child: Image.network(image.url),
                          );
                        }).toList(),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[600],
                    ),
                    SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(),
                        child: Container(
                          height: mediaQuery.size.height * .25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      details.product.price.formattedValue,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.redAccent[700],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: mediaQuery.size.width * .7,
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      details.product.name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Text(details.product.description),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: ButtonTheme(
                                  minWidth: mediaQuery.size.width * .95,
                                  child: FlatButton(
                                    color: Colors.redAccent.shade700,
                                    textColor: Colors.white,
                                    padding: EdgeInsets.all(15.0),
                                    onPressed: () {
                                      /*...*/
                                    },
                                    child: Text(
                                      'Add to Cart',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
