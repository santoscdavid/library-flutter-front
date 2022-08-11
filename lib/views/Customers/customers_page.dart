import 'package:flutter/material.dart';

import '../../components/ThemeSwitch/theme_switch.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({Key? key}) : super(key: key);

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
        child: const Text('Clientes'),
      ),
    );
  }
}
