import 'package:flutter/material.dart';
import 'package:library_flutter/controllers/ThemeController/theme_controller.dart';
import 'package:library_flutter/pages/Home/home_page.dart';

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
            home: HomePage(),
          );
        }));
  }
}
