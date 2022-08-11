import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_flutter/components/ThemeSwitch/theme_switch.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WDA Livraria'),
        actions: const [
          ThemeSwitch(),
        ],
      ),
      body: Center(
        child: const Text('Livros'),
      ),
    );
  }
}
