import 'package:flutter/material.dart';
import 'package:library_flutter/components/AppBar/custom_appbar.dart';
import '../../components/BottomBar/custom_bottom_bar.dart';

class PublishersPage extends StatelessWidget {
  const PublishersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(false),
      body: Center(
        child: Text('Editoras'),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
