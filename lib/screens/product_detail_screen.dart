import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_details.dart';
import '../models/product/product.dart';
import '../providers/product.dart' as providerProduct;
import '../widgets/popup_menu.dart';

enum Dimension { 
   Waist,
   Length,
   Size,
}

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  final providerProduct.Product product;

  selectWaistOrLength(BuildContext ctx, Product product, Dimension dim ) {
    String selector = 'Size';
    switch (dim) {
      case Dimension.Waist:
      selector = 'Waist';
        break;
      case Dimension.Length:
        selector = 'Length';
        break;
      case Dimension.Size:
        break;
    }
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            height: 200,
            width: double.infinity,
            child: Text('Select :: $selector'),
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  // In the constructor, require a Todo.
  ProductDetailScreen({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final waist = '';
    final length = '';
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
                      height: mediaQuery.size.height * .78,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: CarouselSlider(
                                height: mediaQuery.size.height * .55,
                                enlargeCenterPage: true,
                                viewportFraction: .8,
                                items: details.mobileGallery.map((image) {
                                  return Container(
                                    width: mediaQuery.size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: .5),
                                    child: Image.network(image.url),
                                  );
                                }).toList(),
                              ),
                            ),
                            Divider(
                              color: Colors.grey[600],
                            ),
                            Container(
                               width: mediaQuery.size.width * .95,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      details.product.name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      details.product.price.formattedValue,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.redAccent[700],
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        child: ButtonTheme(
                                          minWidth: mediaQuery.size.width * .45,
                                          child: OutlineButton(
                                            //color: Colors.grey[300],
                                            textColor: Colors.black45,
                                            padding: EdgeInsets.all(15.0),
                                            onPressed: () {
                                              selectWaistOrLength(context, details.product, Dimension.Waist);
                                            },
                                            child: Text('Waist - $waist',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: ButtonTheme(
                                          minWidth: mediaQuery.size.width * .45,
                                          child: OutlineButton(
                                            color: Colors.grey[300],
                                            textColor: Colors.black45,
                                            padding: EdgeInsets.all(15.0),
                                            onPressed: () {
                                             selectWaistOrLength(context, details.product, Dimension.Length);
                                            },
                                            child: Text('Length - $length',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      // height: mediaQuery.size.height * .08,
                      width: mediaQuery.size.width * .95,
                      child: DecoratedBox(
                        decoration:
                          ShapeDecoration(
                            color: Colors.red[700], 
                            shape: Border.all(width: .3),
                          ),
                        child: OutlineButton.icon(
                          textColor: Colors.white,
                          padding: EdgeInsets.all(15.0),
                          onPressed: () {
                            /*...*/
                          },
                          icon: Icon(
                            Icons.add_shopping_cart,
                          ),
                          label: Text(
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
              );
            }
          }),
    );
  }
}
