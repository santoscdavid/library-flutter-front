import 'package:flutter/material.dart';
import 'package:library_flutter/components/AppBar/custom_appbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(false),
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}
