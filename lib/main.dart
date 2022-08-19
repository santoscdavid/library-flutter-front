import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/modules/main_module.dart';

import 'package:library_flutter/library_app.dart';

main() async {
  await dotenv.load(fileName: '.env');
  runApp(ModularApp(module: MainModule(), child: const LibraryApp()));
}
