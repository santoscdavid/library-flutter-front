import 'package:flutter/material.dart';
import 'package:library_flutter/controllers/ThemeController/theme_controller.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        ThemeController.instace.themeIcon,
      ),
      iconSize: 20,
      onPressed: () {
        ThemeController.instace.changeTheme();
      },
    );
  }
}
