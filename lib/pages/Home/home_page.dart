import 'package:flutter/material.dart';
import 'package:library_flutter/components/ThemeSwitch/theme_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WDA Livraria'),
        actions: [
          ThemeSwitch(),
        ],
      ),
      body: Center(
        child: Column(
          children: const [
            Text("Contador"),
          ],
        ),
      ),
    );
  }
}
