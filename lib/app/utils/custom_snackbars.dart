import 'package:flutter/material.dart';

class CustomSnackBar {
  SnackBar success(String text) {
    return SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.green,
    );
  }

  SnackBar error(String text) {
    return SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.red,
    );
  }

  SnackBar warning(String text) {
    return SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.orange,
    );
  }
}
