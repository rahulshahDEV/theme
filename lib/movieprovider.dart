import 'package:flutter/material.dart';

class MovieProvider with ChangeNotifier {
  bool boolIsSwitched = false;
  List favList = [];

  void toggleButton() {
    boolIsSwitched = !boolIsSwitched;
    notifyListeners();
  }

  void addIndex(int index) {
    favList.add(index);
    notifyListeners();
  }

  void deleteIndex(int index) {
    favList.remove(index);
    notifyListeners();
  }
}
