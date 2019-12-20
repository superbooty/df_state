import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
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
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product,
          );
        },
        child: Stack(
          children: <Widget>[
            Image.network(product.images[1]['url'], fit: BoxFit.scaleDown),
            Align(
              alignment: Alignment(1, .53),
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
      ),
      footer: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              product.name,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            Text(
              '${product.price['formattedValue']}',
              style: TextStyle(
                color: Colors.red[600],
                fontSize: 12,
              ),
              //maxLines: 2,
            ),
          ]),
    );
  }
}
