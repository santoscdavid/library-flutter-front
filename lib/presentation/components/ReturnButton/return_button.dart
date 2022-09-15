import 'package:design_system_library_flutter/app/components/commom/Texts/StrokeText/stroke_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/ThemeController/theme_controller.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({Key? key, required this.backRoute, required this.title})
      : super(key: key);

  final String title;
  final String backRoute;

  @override
  Widget build(BuildContext context) {
    final themeStore = Modular.get<ThemeController>();

    return Observer(
      builder: (_) => Container(
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: InkWell(
          onTap: (() => {Modular.to.navigate(backRoute)}),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                const WidgetSpan(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 26,
                    color: Colors.deepPurple,
                  ),
                ),
                WidgetSpan(
                  child: StrokeText(
                    text: title,
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color:
                        themeStore.isDarkMode ? Colors.grey : Colors.deepPurple,
                    strokeColor: Colors.black,
                    strokeWidth: 0.1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
