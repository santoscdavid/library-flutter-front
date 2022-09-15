import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/BookController/book_controller.dart';
import 'package:library_flutter/app/controllers/CustomerController/customer_controller.dart';
import 'package:library_flutter/app/controllers/PublisherController/publisher_controller.dart';
import 'package:library_flutter/app/controllers/RentsController/rent_controller.dart';
import 'package:library_flutter/domain/models/Charts/bar.dart';

class SimpleBarChart extends StatefulWidget {
  const SimpleBarChart({Key? key}) : super(key: key);

  @override
  State<SimpleBarChart> createState() => _SimpleBarChartState();
}

class _SimpleBarChartState extends State<SimpleBarChart> {
  @override
  void initState() {
    createData();
    super.initState();
  }

  static Future<List<charts.Series<Bar, String>>> createData() async {
    await Future.delayed(const Duration(seconds: 2));

    final storePublisher = Modular.get<PublisherController>();
    final storeCustomer = Modular.get<CustomerController>();
    final storeBook = Modular.get<BookController>();
    final storeRent = Modular.get<RentController>();

    final totalPublishers = storePublisher.publishers;
    final totalBooks = storeBook.books;
    final totalCustomers = storeCustomer.customers;
    final totalRents = storeRent.rents;

    var data = [
      Bar(title: 'Editoras', total: totalPublishers.length),
      Bar(title: 'Livros', total: totalBooks.length),
      Bar(title: 'Clientes', total: totalCustomers.length),
      Bar(title: 'Alugueis', total: totalRents.length),
    ];

    return [
      charts.Series<Bar, String>(
        id: 'barChart',
        data: data,
        domainFn: (Bar bar, _) => bar.title,
        measureFn: (Bar bar, _) => bar.total,
        colorFn: (Bar bar, _) {
          switch (bar.title) {
            case "Editoras":
              {
                return charts.MaterialPalette.red.shadeDefault;
              }
            case "Livros":
              {
                return charts.MaterialPalette.yellow.shadeDefault;
              }
            case "Clientes":
              {
                return charts.MaterialPalette.blue.shadeDefault;
              }
            case "Alugueis":
              {
                return charts.MaterialPalette.green.shadeDefault;
              }
            default:
              {
                return charts.MaterialPalette.purple.shadeDefault;
              }
          }
        },
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 3,
      child: FutureBuilder<List<charts.Series<dynamic, String>>>(
          future: createData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<charts.Series<dynamic, String>> list = [];

              for (var item in snapshot.data!) {
                list.add(item);
              }

              return charts.BarChart(
                list,
                animate: true,
                behaviors: [
                  charts.ChartTitle(
                    'Banco de dados',
                    subTitle: 'Quantidade de itens no banco de dados',
                    behaviorPosition: charts.BehaviorPosition.top,
                    titleOutsideJustification:
                        charts.OutsideJustification.start,
                    innerPadding: 18,
                  ),
                ],
              );
            }
            return const Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            );
          }),
    );
  }
}
