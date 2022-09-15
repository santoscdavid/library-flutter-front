import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/RoutesController/routes_controller.dart';
import 'package:library_flutter/app/controllers/ThemeController/theme_controller.dart';
import 'package:library_flutter/app/modules/RoutesModule/routes_module.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => ThemeController()),
        Bind.singleton((i) => RoutesController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: RoutesModule(),
        )
      ];
}
