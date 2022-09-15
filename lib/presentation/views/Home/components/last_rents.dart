import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:library_flutter/app/controllers/RentsController/rent_controller.dart';
import 'package:library_flutter/domain/models/Rent/rent.dart';

class LastRents extends StatelessWidget {
  const LastRents({Key? key}) : super(key: key);

  static Future<List<Rent>> createData() async {
    await Future.delayed(const Duration(seconds: 3));
    final storeRent = Modular.get<RentController>();

    List<Rent> item = storeRent.lastRents;

    return item;
  }

  @override
  Widget build(BuildContext context) {
    String formatDate(date) {
      return DateFormat("dd/MM/yyyy").format(
        DateTime.parse(date),
      );
    }

    return FutureBuilder<List<Rent>>(
      future: createData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Rent> data = [];

          for (var item in snapshot.data!) {
            data.add(item);
          }

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: MediaQuery.of(context).size.width / 1.7,
            height: MediaQuery.of(context).size.height / 3,
            child: Center(
              child: Card(
                child: SingleChildScrollView(
                  child: Column(
                    children: data
                        .map(
                          (rent) => Container(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                Modular.to.navigate('/rents/');
                              },
                              child: ListTile(
                                tileColor: Colors.deepPurple,
                                leading: const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.handshake,
                                      color: Colors.black,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                                title: Text(
                                  'Livro: ${rent.book!.name}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                subtitle: Text(
                                  'Previsão de entrega: ${formatDate(rent.rentEnd)}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
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
    );
  }
}
