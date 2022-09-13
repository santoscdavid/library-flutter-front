import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/modules/BooksModule/books_module.dart';
import 'package:library_flutter/app/modules/CustomersModule/customers_module.dart';
import 'package:library_flutter/app/modules/PublishersModule/publishers_module.dart';
import 'package:library_flutter/app/modules/RentsModule/rents_module.dart';

class RoutesModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/publishers',
          module: PublishersModule(),
        ),
        ModuleRoute(
          '/books',
          module: BooksModule(),
        ),
        ModuleRoute(
          '/customers',
          module: CustomersModule(),
        ),
        ModuleRoute(
          '/rents',
          module: RentsModule(),
        ),
      ];
}
