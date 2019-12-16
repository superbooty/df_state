import 'package:flutter/material.dart';

import '../providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
  ]; // private property hence _items

  List<Product> get items {
    return [..._items];
  }

  void setItems(List<Product> items) {
    _items = items;
    print('Setting items');
    notifyListeners();
  }

  Product findById(String id) {
    print('here');
    var found = _items.firstWhere((product) => product.code == id);
    print('found :: $found');
    return found;
  }

  // void addProduct() {
  //   // _items.add(value);
  //   notifyListeners();
  // }
}