import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/BookController/book_controller.dart';
import 'package:library_flutter/app/controllers/PublisherController/publisher_controller.dart';
import 'package:library_flutter/data/repository/BooksRepository/books_repository.dart';
import 'package:library_flutter/data/repository/PublishersRepository/publishers_repository.dart';
import 'package:library_flutter/presentation/views/Books/books_page.dart';
import 'package:library_flutter/presentation/views/Books/components/form_book.dart';

class BooksModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => BookController(i())),
        Bind.singleton((i) => PublisherController(i())),
        Bind.factory((i) => BooksRepository()),
        Bind.factory((i) => PublishersRepository())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const BooksPage(),
        ),
        ChildRoute(
          '/form/:id',
          child: (context, args) => FormBook(
            id: args.params["id"],
            name: args.queryParams["name"],
            author: args.queryParams["author"],
            realeseYear: args.queryParams["realeseYear"],
            publisherId: args.queryParams['publisherId'],
            quantity: args.queryParams["quantity"],
          ),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 700),
        ),
      ];
}
