import 'package:flutter/material.dart';

class MovieProvider with ChangeNotifier {
  List favList = [];
  void addIndex(int index) {
    favList.add(index);
    notifyListeners();
  }

  void deleteIndex(int index) {
    favList.remove(index);
    notifyListeners();
  }
}
