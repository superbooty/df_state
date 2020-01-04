import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/text_utils.dart';
import '../widgets/forms/size.dart';
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

  selectWaistOrLength(BuildContext ctx, Product product) {
    SizeSelector selector;
    if (product.variantSize != null) {
      selector = SizeSelector.forSizes(sizes: product.variantSize);
    } else {
      selector = SizeSelector.forWasitLength(
          waist: product.variantWaist, length: product.variantLength);
    }

    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return selector;
      },
    );
  }

  // In the constructor, require a Todo.
  ProductDetailScreen({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: Consumer<ProductDetails>(
        builder: (ctx, details, _) {
          if (details.product == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: CarouselSlider(
                      //height: mediaQuery.size.height * .5,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      aspectRatio: 3 / 4,
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
                      padding: EdgeInsets.only(bottom: 70, left: 10, right: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            details.product.name,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 20,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            details.product.price.formattedValue,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 20,
                              color: Color(0XFFc41130),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            TextUtils.removeAllHtmlTags(
                                details.product.description),
                            style: TextStyle(
                              //fontFamily: 'Quicksand',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 10),
                          Divider(
                            color: Colors.grey[700],
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: FlatButton.icon(
                                  // color: Colors.black,
                                  textColor: Colors.grey[600],
                                  padding: EdgeInsets.only(left: 0),
                                  onPressed: () {
                                    selectWaistOrLength(context, details.product);
                                  },
                                  textTheme: ButtonTextTheme.accent,
                                  label: Text(
                                      'Size',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FlatButton.icon(
                                  // color: Colors.black,
                                  textColor: Colors.grey[600],
                                  padding: EdgeInsets.only(left: 0),
                                  onPressed: () {
                                  },
                                  textTheme: ButtonTextTheme.accent,
                                  label: Text(
                                      'Qty',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
