import 'package:flutter/foundation.dart';

class CartProduct with ChangeNotifier{

  final String code;
  String size;
  int qty;

  CartProduct({
    @required this.code,
  });

  void setSize(size) {
    this.size = size;
    notifyListeners();
  }
}
