import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/BookController/book_controller.dart';
import 'package:library_flutter/app/controllers/CustomerController/customer_controller.dart';
import 'package:library_flutter/app/controllers/PublisherController/publisher_controller.dart';
import 'package:library_flutter/app/controllers/RentsController/rent_controller.dart';
import 'package:library_flutter/data/repository/BooksRepository/books_repository.dart';
import 'package:library_flutter/data/repository/CustomerRepository/customer_repository.dart';
import 'package:library_flutter/data/repository/PublishersRepository/publishers_repository.dart';
import 'package:library_flutter/data/repository/RentRepository/rent_repository.dart';
import 'package:library_flutter/presentation/views/Home/home_page.dart';

class DashboardModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => RentController(i())),
        Bind.singleton((i) => BookController(i())),
        Bind.singleton((i) => CustomerController(i())),
        Bind.singleton((i) => PublisherController(i())),
        Bind.factory((i) => RentRepository()),
        Bind.factory((i) => BooksRepository()),
        Bind.factory((i) => CustomerRepository()),
        Bind.factory((i) => PublishersRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
      ];
}
