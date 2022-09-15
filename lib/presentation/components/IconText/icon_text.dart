import 'package:design_system_library_flutter/app/components/commom/Texts/StrokeText/stroke_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/ThemeController/theme_controller.dart';

class IconText extends StatelessWidget {
  const IconText({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final themeStore = Modular.get<ThemeController>();
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              icon,
              size: 34,
              color: Colors.white,
            ),
          ),
          WidgetSpan(
            child: StrokeText(
              text: text,
              fontSize: 30,
              fontWeight: FontWeight.normal,
              color: themeStore.isDarkMode ? Colors.grey : Colors.white,
              strokeColor: Colors.black,
              strokeWidth: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
