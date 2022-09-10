import 'package:flutter/material.dart';
import 'package:library_flutter/presentation/components/AppBar/custom_appbar.dart';
import 'package:library_flutter/presentation/components/BottomBar/custom_bottom_bar.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Livros'),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
