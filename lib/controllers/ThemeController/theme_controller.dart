import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme_controller.g.dart';

class ThemeController = ThemeBase with _$ThemeController;

abstract class ThemeBase with Store {
  @observable
  bool isDarkMode = false;

  @observable
  var themeIcon = Icons.dark_mode;

  @action
  void changeTheme() {
    if (isDarkMode) {
      themeIcon = Icons.dark_mode;
      isDarkMode = !isDarkMode;
    } else {
      themeIcon = Icons.wb_sunny;
      isDarkMode = !isDarkMode;
    }
  }
}
