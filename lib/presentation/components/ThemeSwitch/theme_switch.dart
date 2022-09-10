import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/ThemeController/theme_controller.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Modular.get<ThemeController>();

    return IconButton(
      icon: Observer(
        builder: (_) => Icon(
          store.themeIcon,
        ),
      ),
      iconSize: 20,
      color: Colors.white,
      onPressed: () => store.changeTheme(),
    );
  }
}
