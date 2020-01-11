import 'package:flutter/foundation.dart';

class BuyingOptions with ChangeNotifier{

  String _code;
  String _size;
  String sizeLabel = 'Size';
  Map<String, int> _sizeFactor;
  int qty = 1;

  void setCode(code) {
    this._code = code;
    notifyListeners();
  }

  void setQty(qty) {
    this.qty = qty;
    notifyListeners();
  }

  String get size {
    if (_sizeFactor != null) {
      return 'Sweet Size';
    } else {
      return 'Sour Size';
    }
  }

  Map<String, int> get sizeFactor {
    return this._sizeFactor;
  }

  void setSizeLabel(label) {
    if (label == null) {
      this.sizeLabel = 'Size';
    } else {
      this.sizeLabel = label;
    }
    notifyListeners();
  }

  void setSize(size) {
    this._sizeFactor = null;
    this._size = size;
    notifyListeners();
  }

  void setSizeFactor(Map<String, int> sizeFactor) {
    this._size = '';
    this._sizeFactor = sizeFactor;
    notifyListeners();
  }
}
