import 'package:flutter/material.dart';

import '../providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: '505™ Regular Fit Men\'s Jeans',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://lsco.scene7.com/is/image/lsco/levis/clothing/005054891-front-pdp.jpg?\$grid_desktop_bottoms\$',
    ),
    Product(
      id: 'p2',
      title: '511™ Slim Fit Men\'s Jeans',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://lsco.scene7.com/is/image/lsco/Levis/clothing/045112369-front-pdp.jpg?\$grid_desktop_bottoms\$',
    ),
    Product(
      id: 'p3',
      title: '512™ Slim Taper Fit Advanced Stretch Men\'s Jeans',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://lsco.scene7.com/is/image/lsco/levis/clothing/005140403-front-pdp.jpg?\$grid_desktop_bottoms\$',
    ),
    Product(
      id: 'p4',
      title: '510™ Skinny Fit Advanced Stretch Men\'s Jeans',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://lsco.scene7.com/is/image/lsco/Levis/clothing/055100840-front-pdp.jpg?\$grid_desktop_bottoms\$',
    ),
    Product(
      id: 'p5',
      title: '511™ Slim Fit Selvedge Men\'s Jeans',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 95.98,
      imageUrl:
          'https://lsco.scene7.com/is/image/lsco/Levis/clothing/045113401-front-pdp.jpg?\$grid_desktop_bottoms\$',
    ),
    Product(
      id: 'p6',
      title: '511™ Slim Fit Men\'s Jeans',
      description: 'Prepare any meal you want.',
      price: 128.98,
      imageUrl:
          'https://lsco.scene7.com/is/image/lsco/Levis/clothing/564970004-front-pdp.jpg?\$grid_desktop_bottoms\$',
    ),
  ]; // private property hence _items

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}