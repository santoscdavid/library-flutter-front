import 'package:flutter/material.dart';
import 'package:library_flutter/presentation/views/Home/components/charts/bar_chart.dart';
import 'package:library_flutter/presentation/views/Home/components/charts/timeline_chart.dart';
import 'package:library_flutter/presentation/views/Home/components/last_rents.dart';
import 'package:library_flutter/presentation/views/Home/components/total_itens_database.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: const [
            SimpleTimeSeriesChart(),
            SimpleBarChart(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Text(
                'Ultimos alugueis:',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            TotalItensDatabase(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Ultimos alugueis:',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            LastRents(),
          ],
        ),
      ],
    );
  }
}
