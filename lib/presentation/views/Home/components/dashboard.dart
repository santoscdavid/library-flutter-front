import 'package:flutter/material.dart';
import 'package:library_flutter/presentation/views/Home/components/charts/bar_chart.dart';
import 'package:library_flutter/presentation/views/Home/components/charts/timeline_chart.dart';

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
      ],
    );
  }
}
