import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CrossOff extends ChangeNotifier {
  var crossOff = false;
  bool get striker => crossOff;

  strikeThough() {
    crossOff = !crossOff;
    notifyListeners();
  }
}
