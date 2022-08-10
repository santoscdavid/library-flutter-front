import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  static ThemeController instace = ThemeController();

  bool isDarkTheme = false;
  var themeIcon = Icons.dark_mode;

  changeTheme() {
    if (isDarkTheme) {
      themeIcon = Icons.dark_mode;
      isDarkTheme = !isDarkTheme;

      notifyListeners();
    } else {
      themeIcon = Icons.wb_sunny;
      isDarkTheme = !isDarkTheme;

      notifyListeners();
    }
  }
}
