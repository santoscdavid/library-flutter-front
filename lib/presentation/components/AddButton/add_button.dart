import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.function,
  }) : super(key: key);

  final Function() function;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 2.0,
      onPressed: function,
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Colors.purpleAccent,
              Colors.purple,
              Colors.deepPurple,
            ],
          ),
        ),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
