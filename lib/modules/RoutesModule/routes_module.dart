import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/modules/PublishersModule/publishers_module.dart';
import 'package:library_flutter/views/Books/books_page.dart';
import 'package:library_flutter/views/Customers/customers_page.dart';
import 'package:library_flutter/views/Rents/rents_page.dart';

class RoutesModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/publishers',
          module: PublishersModule(),
        ),
        ChildRoute(
          '/books',
          child: (context, args) => const BooksPage(),
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
