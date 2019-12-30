import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class Item extends StatelessWidget {
  const Item({
    Key key,
  }) : super(key: key);
  //final Product product;
  //ProductItem(this.product) {}

  // final String id;
  // final String title;
  // final double price;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.price, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    // print('Product Tile :: $product');
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(product.images[1]['url'], fit: BoxFit.fill),
                Positioned(
                  // alignment: Alignment.bottomRight,
                  right: -10,
                  bottom: -10,
                  child: Consumer<Product>(
                    builder: (ctx, product, _) => IconButton(
                      // _ for last param child since we dont need it
                      icon: product.isFavorite
                          ? Icon(
                              Icons.favorite,
                              color: Colors.deepOrange,
                              size: 24.0,
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ),
                      onPressed: () {
                        product.toggleIsFavorite();
                      },
                    ),
                  ),
                ),
              ],
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      product.name,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    '${product.price['formattedValue']}',
                    style: TextStyle(
                      color: Colors.red[600],
                      fontSize: 16,
                    ),
                    //maxLines: 2,
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
