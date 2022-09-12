import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/CustomerController/customer_controller.dart';
import 'package:library_flutter/data/repository/CustomerRepository/customer_repository.dart';
import 'package:library_flutter/presentation/views/Customers/components/form_customer.dart';
import 'package:library_flutter/presentation/views/Customers/customers_page.dart';

class CustomersModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => CustomerController(i())),
        Bind.factory((i) => CustomerRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const CustomersPage(),
        ),
        ChildRoute(
          '/form/:id',
          child: (context, args) => FormCustomer(
            id: args.params["id"],
            name: args.queryParams["name"],
            email: args.queryParams["email"],
            address: args.queryParams["address"],
            city: args.queryParams["city"],
          ),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 700),
        ),
      ];
}
