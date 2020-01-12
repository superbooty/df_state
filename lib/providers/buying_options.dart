import 'package:flutter/foundation.dart';

class BuyingOptions with ChangeNotifier{

  String sizeLabel = 'Size';
  int qty = 1;
  int selectedSizeIndex = 0;
  int selectedWaistIndex = 0;
  int selectedLengthIndex = 0;

  void setCode(code) {
    notifyListeners();
  }

  void setQty(qty) {
    this.qty = qty;
    notifyListeners();
  }

  void setSizeLabel(label) {
    if (label == null) {
      this.sizeLabel = 'Size';
    } else {
      this.sizeLabel = label;
    }
    notifyListeners();
  }

  void setSelectedSizeIndex(int index) {
    this.selectedSizeIndex = index;
    notifyListeners();
  }

  void setSelectedLengthIndex(int index) {
    this.selectedLengthIndex = index;
    notifyListeners();
  }

  void setSelectedWaistIndex(int index) {
    this.selectedWaistIndex = index;
    notifyListeners();
  }

  void resetSelections() {
    this.selectedLengthIndex = 0;
    this.selectedSizeIndex = 0;
    this.selectedWaistIndex = 0;
    notifyListeners();
  }
}
