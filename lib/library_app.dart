import 'package:flutter/material.dart';
import 'package:library_flutter/controllers/ThemeController/theme_controller.dart';
import 'package:library_flutter/views/Books/books_page.dart';
import 'package:library_flutter/views/Customers/customers_page.dart';

import 'package:library_flutter/views/Home/home_page.dart';
import 'package:library_flutter/views/Login/login_page.dart';
import 'package:library_flutter/views/Publishers/publishers_page.dart';
import 'package:library_flutter/views/Rents/rents_page.dart';

class LibraryApp extends StatefulWidget {
  const LibraryApp({Key? key}) : super(key: key);

  @override
  State<LibraryApp> createState() => _LibraryAppState();
}

class _LibraryAppState extends State<LibraryApp> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeController.instace,
      builder: ((context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            brightness: ThemeController.instace.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const HomePage(),
            '/login': (context) => const LoginPage(),
            '/publishers': (context) => const PublishersPage(),
            '/books': (context) => const BooksPage(),
            '/customers': (context) => const CustomersPage(),
            '/rents': (context) => const RentsPage(),
          },
        );
      }),
    );
  }
}
