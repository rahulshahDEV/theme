import 'package:flutter/material.dart';
import 'package:providertest/themes.dart';

class ThemeProvider with ChangeNotifier {
  bool isSwitched = false;
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = DarkMode;
    } else {
      _themeData = lightMode;
    }
    isSwitched = !isSwitched;
    notifyListeners();
  }
}
