import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/product.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  // final List<Product> products;

  // ProductsGrid(this.products) {
  // }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return products.isNotEmpty ? GridView.builder(
      padding: const EdgeInsets.all(15.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
         value: products[i],
         child: ProductItem(
          // products[i].id,
          // products[i].title,
          // products[i].price,
          // products[i].imageUrl,
          ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .61,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    ): Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Image.network(
            'http://cdn.lowgif.com/small/bf195e67400465f2-loading-animated-gif-transparent-background-11-gif-images-download.gif',
            width: 75,
            height: 75,
          ),
        )
      ]
    );
  }
}
