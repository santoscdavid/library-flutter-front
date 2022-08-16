import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:library_flutter/controllers/RoutesController/routes_controller.dart';

import 'package:library_flutter/library_app.dart';

main() => runApp(
      ChangeNotifierProvider(
          create: (context) => RoutesController(), child: const LibraryApp()),
    );
