import 'package:flutter/material.dart';
import 'package:library_flutter/presentation/components/AppBar/custom_appbar.dart';
import 'package:library_flutter/presentation/components/BottomBar/custom_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            Center(
              child: Text('Home'),
            ),
          ]),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
