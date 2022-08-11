import 'package:flutter/material.dart';
import 'package:library_flutter/components/ThemeSwitch/theme_switch.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('WDA Livraria'),
      actions: const [
        ThemeSwitch(),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: const [Colors.purple, Colors.deepPurple],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
        ),
      ),
      elevation: 20,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
