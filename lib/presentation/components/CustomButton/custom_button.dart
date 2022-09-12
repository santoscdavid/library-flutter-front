import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.margin,
    required this.function,
    required this.child,
  }) : super(key: key);

  final double margin;
  final Function function;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      height: 40,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple, Colors.deepPurple])),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent, shadowColor: Colors.transparent),
        onPressed: function(),
        child: child,
      ),
    );
  }
}
