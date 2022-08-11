import 'package:flutter/material.dart';
import 'package:library_flutter/components/AppBar/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/publishers');
              },
              child: const Text('Editoras'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/books');
              },
              child: const Text('Livros'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/customers');
              },
              child: const Text('Clientes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/rents');
              },
              child: const Text('Alugueis'),
            ),
          ],
        ),
      ),
    );
  }
}
