import 'package:design_system_library_flutter/app/components/desktop/Buttons/DropdownMenu/dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:library_flutter/presentation/components/ThemeSwitch/theme_switch.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: RichText(
        text: const TextSpan(
          children: [
            WidgetSpan(
              child: Icon(
                Icons.bookmark,
                size: 20,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: "WDA Livraria",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      actions: const [
        ThemeSwitch(),
        DropdownMenu(),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
      ),
      elevation: 20,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
