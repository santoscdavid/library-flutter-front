import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/BookController/book_controller.dart';
import 'package:library_flutter/app/controllers/CustomerController/customer_controller.dart';
import 'package:library_flutter/app/controllers/RentsController/rent_controller.dart';
import 'package:library_flutter/data/repository/BooksRepository/books_repository.dart';
import 'package:library_flutter/data/repository/CustomerRepository/customer_repository.dart';
import 'package:library_flutter/data/repository/RentRepository/rent_repository.dart';
import 'package:library_flutter/presentation/views/Rents/components/form_rent.dart';
import 'package:library_flutter/presentation/views/Rents/rents_page.dart';

class RentsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => RentController(i())),
        Bind.singleton((i) => BookController(i())),
        Bind.singleton((i) => CustomerController(i())),
        Bind.factory((i) => RentRepository()),
        Bind.factory((i) => BooksRepository()),
        Bind.factory((i) => CustomerRepository())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const RentsPage(),
        ),
        ChildRoute(
          '/form/:id',
          child: (context, args) => const FormRent(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 700),
        ),
      ];
}
