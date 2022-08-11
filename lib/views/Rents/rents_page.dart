import 'package:flutter/material.dart';
import 'package:library_flutter/components/ThemeSwitch/theme_switch.dart';

class RentsPage extends StatelessWidget {
  const RentsPage({Key? key}) : super(key: key);

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
        child: const Text('Alugueis'),
      ),
    );
  }
}
