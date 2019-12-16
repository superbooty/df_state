import 'package:flutter/foundation.dart';

class QueryText with ChangeNotifier{
  String _text;

  String get text {
    return this._text;
  }

  void changeQuery(newText) {
    this._text = newText;
    notifyListeners();
  }

  void setText(text) {
    this._text = text;
  }
}
