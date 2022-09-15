import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/controllers/RentsController/rent_controller.dart';
import 'package:library_flutter/domain/models/Charts/timeline.dart';

class SimpleTimeSeriesChart extends StatefulWidget {
  const SimpleTimeSeriesChart({
    Key? key,
  }) : super(key: key);

  @override
  State<SimpleTimeSeriesChart> createState() => _SimpleTimeSeriesChartState();
}

class _SimpleTimeSeriesChartState extends State<SimpleTimeSeriesChart> {
  static Future<List<charts.Series<Timeline, DateTime>>> createData() async {
    await Future.delayed(const Duration(seconds: 3));

    final storeRent = Modular.get<RentController>();

    return [
      charts.Series<Timeline, DateTime>(
        id: 'timeline',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (Timeline timeline, _) => timeline.date,
        measureFn: (Timeline timeline, _) => timeline.total,
        data: storeRent.timeline,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 3,
      child: FutureBuilder<List<charts.Series<Timeline, DateTime>>>(
        future: createData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<charts.Series<Timeline, DateTime>> list = [];

            for (var item in snapshot.data!) {
              {
                list.add(item);
              }
            }

            return charts.TimeSeriesChart(
              list,
              animate: true,
              dateTimeFactory: const charts.LocalDateTimeFactory(),
              behaviors: [
                charts.ChartTitle(
                  'Alugueis por dia',
                  subTitle: 'Quantidade de alugueis feitos por dia',
                  behaviorPosition: charts.BehaviorPosition.top,
                  titleOutsideJustification: charts.OutsideJustification.start,
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
        },
      ),
    );
  }
}
