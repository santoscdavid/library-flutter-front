import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/repository/PublishersRepository/publishers_repository.dart';
import 'package:library_flutter/store/PublisherStore/publisher_store.dart';
import 'package:library_flutter/views/Publishers/publishers_page.dart';

class PublishersModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => PublisherStore(i())),
        Bind.factory((i) => PublishersRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/publishers',
          child: (context, args) => const PublishersPage(),
        ),
      ];
}
