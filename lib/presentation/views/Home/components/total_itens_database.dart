import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/BookController/book_controller.dart';
import 'package:library_flutter/app/controllers/CustomerController/customer_controller.dart';
import 'package:library_flutter/app/controllers/PublisherController/publisher_controller.dart';
import 'package:library_flutter/app/controllers/RentsController/rent_controller.dart';
import 'package:library_flutter/presentation/components/DashboardCard/dashboard_card.dart';

class TotalItensDatabase extends StatefulWidget {
  const TotalItensDatabase({Key? key}) : super(key: key);

  @override
  State<TotalItensDatabase> createState() => _TotalItensDatabaseState();
}

class _TotalItensDatabaseState extends State<TotalItensDatabase> {
  static Future<List<Items>> createData() async {
    await Future.delayed(const Duration(seconds: 5));

    final storePublisher = Modular.get<PublisherController>();
    final storeCustomer = Modular.get<CustomerController>();
    final storeBook = Modular.get<BookController>();
    final storeRent = Modular.get<RentController>();

    final totalPublishers = storePublisher.publishers.length;
    final totalBooks = storeBook.books.length;
    final totalCustomers = storeCustomer.customers.length;
    final totalRents = storeRent.rents.length;

    return [
      Items(
          title: 'Editoras',
          total: totalPublishers,
          icon: Icons.apartment,
          redirect: "/publishers/"),
      Items(
          title: 'Livros',
          total: totalBooks,
          icon: Icons.book,
          redirect: "/books/"),
      Items(
          title: 'Clientes',
          total: totalCustomers,
          icon: Icons.person,
          redirect: "/customers/"),
      Items(
          title: 'Alugueis',
          total: totalRents,
          icon: Icons.handshake,
          redirect: "/rents/"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: MediaQuery.of(context).size.width / 1.7,
      height: MediaQuery.of(context).size.height / 4.5,
      child: Row(
        children: [
          FutureBuilder<List<Items>>(
            future: createData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Items> data = [];

                for (var item in snapshot.data!) {
                  data.add(item);
                }

                return Row(
                  children: data
                      .map(
                        (item) => DashboardCard(
                          title: item.title,
                          value: item.total.toString(),
                          icon: item.icon,
                          redirect: item.redirect,
                        ),
                      )
                      .toList(),
                );
              }
              return Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.7,
                  height: MediaQuery.of(context).size.height / 3,
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Items {
  dynamic title;
  dynamic total;
  dynamic icon;
  dynamic redirect;

  Items({
    required this.title,
    required this.total,
    required this.icon,
    required this.redirect,
  });
}
