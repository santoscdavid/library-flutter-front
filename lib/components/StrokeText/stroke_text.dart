import 'package:flutter/widgets.dart';

class StrokeText extends StatelessWidget {
  const StrokeText({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.strokeColor,
    required this.strokeWidth,
    Key? key,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final Color strokeColor;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground: Paint()..color = color,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground: Paint()
              ..strokeWidth = strokeWidth
              ..color = strokeColor
              ..style = PaintingStyle.stroke,
          ),
        ),
      ],
    );
  }
}
