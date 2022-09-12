import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/ThemeController/theme_controller.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final storeTheme = Modular.get<ThemeController>();

    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 0, 10),
      decoration: const BoxDecoration(
          border: Border(left: BorderSide(color: Colors.deepPurple, width: 2))),
      child: Observer(builder: (_) {
        return RichText(
          text: TextSpan(
            children: [
              const WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.only(left: 5),
                ),
              ),
              WidgetSpan(
                child: Icon(
                  Icons.apartment,
                  size: 28,
                  color:
                      storeTheme.isDarkMode ? Colors.grey : Colors.deepPurple,
                ),
              ),
              const WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                ),
              ),
              TextSpan(
                text: title,
                style: TextStyle(
                  fontSize: 24,
                  color: storeTheme.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
