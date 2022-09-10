import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

deleteDialog(
        {required BuildContext context,
        required Function() onConfirm,
        required String title,
        required String text}) =>
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(text),
        actions: [
          TextButton(
              child: const Text(
                "Cancelar",
                style: TextStyle(color: Color(0xff123142)),
              ),
              onPressed: () {
                Modular.to.pop();
              }),
          TextButton(
            onPressed: onConfirm,
            child: const Text(
              "Confirmar",
            ),
          ),
        ],
      ),
    );
