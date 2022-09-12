import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/modules/BooksModule/books_module.dart';
import 'package:library_flutter/app/modules/PublishersModule/publishers_module.dart';
import 'package:library_flutter/presentation/views/Customers/customers_page.dart';
import 'package:library_flutter/presentation/views/Rents/rents_page.dart';

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
        ChildRoute(
          '/customers',
          child: (context, args) => const CustomersPage(),
        ),
        ChildRoute(
          '/rents',
          child: (context, args) => const RentsPage(),
        ),
      ];
}
