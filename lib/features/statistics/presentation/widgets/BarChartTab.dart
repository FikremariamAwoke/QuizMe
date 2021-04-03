///
///
/// BarChartTab.dart
///
///

import 'package:flutter/material.dart';

// constants
import '../../core/constants.dart';

// models
import '../../data/models/Stats.dart';

// widgets
import './ChartStat.dart';
import './BarChartColorIndicator.dart';

// data processor
import './GetProcessedBarChartData.dart';

class BarChartTab extends StatelessWidget {
  BarChartTab({
    Key key,
    @required this.stats,
  }) : super(key: key);

  final Stats stats;

  @override
  Widget build(BuildContext context) {
    // get processed data
    var result = processData(stats);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            // title
            Text(
              BARCHART_TITLE,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),

            // chart info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: [
                  BarChartColorIndicator(color: Colors.red),
                  Text(INCORRECT_ANSWERS_TEXT)
                ]),
                Row(children: [
                  BarChartColorIndicator(color: Colors.green),
                  Text(CORRECT_ANSWERS_TEXT)
                ]),
                Row(children: [
                  BarChartColorIndicator(color: Colors.blue),
                  Text(TOTAL_TEXT)
                ])
              ],
            ),
            SizedBox(height: 30),

            // chart
            ChartStat(seriesChartData: result[0]),
            ChartStat(seriesChartData: result[1]),
          ],
        ),
      ),
    );
  }
}
