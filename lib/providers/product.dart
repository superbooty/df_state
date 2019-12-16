import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String name;
  final String code;
  final Map<String, dynamic> price;
  final List<dynamic> images;
  
  bool isFavorite;

  Product({
    @required this.code,
    @required this.name,
    @required this.price,
    @required this.images,
    this.isFavorite = false,
  });

  void toggleIsFavorite() {
    this.isFavorite = !isFavorite;
    notifyListeners();
  }
}
