import 'package:flutter/material.dart';

class RoutesController extends ChangeNotifier {
  int index = 0;

  changeIndex(int newIndex) {
    index = newIndex;

    notifyListeners();
  }
}
