import 'package:flutter/material.dart';
import 'package:library_flutter/components/AppBar/custom_appbar.dart';

import '../../components/BottomBar/custom_bottom_bar.dart';

class RentsPage extends StatelessWidget {
  const RentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Alugueis'),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
