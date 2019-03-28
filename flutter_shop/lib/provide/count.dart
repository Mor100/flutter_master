import 'package:flutter/material.dart';

class Count with ChangeNotifier {
  int _value = 0;

  Count(this._value);

  int get value => _value;

  void increament(){
    _value++;
    notifyListeners();
  }
}