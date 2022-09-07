import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/components/StrokeText/stroke_text.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton(this.title, {Key? key, required this.backRoute})
      : super(key: key);

  final String title;
  final String backRoute;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  size: 20,
                  color: Colors.deepPurple,
                ),
              ),
              WidgetSpan(
                child: StrokeText(
                    text: title,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.deepPurple,
                    strokeColor: Colors.black,
                    strokeWidth: 0.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
