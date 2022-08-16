import 'package:flutter/material.dart';
import 'package:library_flutter/components/DropdownMenu/dropdown_menu.dart';
import 'package:library_flutter/components/ThemeSwitch/theme_switch.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar(this.isReturn, {Key? key}) : super(key: key);

  final bool isReturn;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: RichText(
        text: const TextSpan(
          children: [
            WidgetSpan(
              child: Icon(Icons.bookmark, size: 20),
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
      automaticallyImplyLeading: isReturn,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
