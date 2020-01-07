import 'package:flutter/foundation.dart';

class BuyingOptions with ChangeNotifier{

  String code;
  String size = 'Size';
  int qty = 1;

  void setCode(code) {
    this.code = code;
    notifyListeners();
  }

  void setQty(qty) {
    this.qty = qty;
    notifyListeners();
  }

  void setSize(size) {
    this.size = size;
    notifyListeners();
  }
}
