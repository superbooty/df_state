import 'package:flutter/foundation.dart';

class CartProduct with ChangeNotifier{

  final String code;
  String size = 'Size';
  int qty = 1;

  CartProduct({
    @required this.code,
  });

  void setQty(qty) {
    this.qty = qty;
    notifyListeners();
  }

  void setSize(size) {
    this.size = size;
    notifyListeners();
  }
}
