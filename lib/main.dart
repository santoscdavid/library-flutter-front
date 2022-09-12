import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/modules/main_module.dart';
import 'package:library_flutter/library_app.dart';

main() {
  runApp(ModularApp(module: MainModule(), child: const LibraryApp()));
}
