import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/text_utils.dart';
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

  selectWaistOrLength(BuildContext ctx, Product product, Dimension dim) {
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Add to Cart'),
        icon: Icon(Icons.add_shopping_cart),
        backgroundColor: Color(0XFFc41130),
        shape: RoundedRectangleBorder(),
      ),
      body: FutureBuilder(
        future: Provider.of<ProductDetails>(context, listen: false)
            .fetchProduct(product.code),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Consumer<ProductDetails>(
              builder: (ctx, details, _) => Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: CarouselSlider(
                        //height: mediaQuery.size.height * .5,
                        enlargeCenterPage: true,
                        viewportFraction: .88,
                        aspectRatio: 5 / 4,
                        items: details.mobileGallery.map(
                          (image) {
                            return Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(10),
                              child: GestureDetector(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    image.url,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onTap: () {
                                  print('Tapped');
                                },
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[600],
                    ),
                    Expanded(
                      flex: 4,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: 70),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              details.product.price.formattedValue,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0XFFc41130),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(TextUtils.removeAllHtmlTags(
                                details.product.description)),
                            SizedBox(height: 10),
                            SizedBox(
                                // height: 100,
                                width: 100,
                                child: OutlineButton(
                                  //color: Colors.grey[300],
                                  textColor: Colors.black45,
                                  padding: EdgeInsets.all(15.0),
                                  onPressed: () {
                                    selectWaistOrLength(context,
                                        details.product, Dimension.Waist);
                                  },
                                  child: Text(
                                    'Waist - $waist',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
