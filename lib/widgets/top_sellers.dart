import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class TopSellerList extends StatelessWidget {
  const TopSellerList({
    Key key,
  }) : super(key: key);

  static const List<Product> _items = [];

  static List<Product> _products = [
    Product(
      name: '721 High Rise Skinny Women\'s Jeans',
      code: '188820023',
      price: {"formattedValue": "\$59.50", "value": 59.50},
      images: [
        {
          "format": "Grid_Mobile",
          "imageType": "PRIMARY",
          "url":
              'https://lsco.scene7.com/is/image/lsco/levis/clothing/527970009-front-pdp.jpg?\$grid_desktop_bottoms\$'
        }
      ],
      isFavorite: false,
    ),
    Product(
      name: '721 High Rise Skinny Women\'s Jeans',
      code: '188820135',
      price: {"formattedValue": "\$59.50", "value": 59.50},
      images: [
        {
          "format": "Grid_Mobile",
          "imageType": "PRIMARY",
          "url":
              "https://lsco.scene7.com/is/image/lsco/Levis/clothing/188820135-front-pdp-27.jpg?\$grid_desktop_bottoms\$"
        }
      ],
      isFavorite: false,
    ),
    Product(
      name: '720 High Rise Super Skinny Womens Jeans',
      code: '527970008',
      price: {"formattedValue": "\$98.00", "value": 98.00},
      images: [
        {
          "format": "Grid_Mobile",
          "imageType": "PRIMARY",
          "url":
              "https://lsco.scene7.com/is/image/lsco/levis/clothing/527970018-front-pdp.jpg?\$grid_desktop_bottoms\$"
        }
      ],
      isFavorite: false,
    ),
    Product(
      name: '721 High Rise Skinny Ankle Women\'s Jeans',
      code: '560410039',
      price: {"formattedValue": "\$228.00", "value": 228.00},
      images: [
        {
          "format": "Grid_Mobile",
          "imageType": "PRIMARY",
          "url":
              "https://lsco.scene7.com/is/image/lsco/levis/clothing/839570000-front-pdp.jpg?\$grid_desktop_bottoms\$"
        }
      ],
      isFavorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final products = _products;
    return Container(
      height: 255,
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: _products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: Card(
            child: Container(
              width: 135,
              //padding: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                children: <Widget>[
                  Image.network(
                    _products[i].images[0]['url'],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      products[i].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    products[i].price['formattedValue'],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
