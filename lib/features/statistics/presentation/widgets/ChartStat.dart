///
///
/// ChartStat.dart
///
///

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// models
import '../../data/models/ChartData.dart';

// bar chart
class ChartStat extends StatelessWidget {
  const ChartStat({
    Key key,
    @required List<charts.Series<ChartData, String>> seriesChartData,
  })  : _seriesChartData = seriesChartData,
        super(key: key);

  final List<charts.Series<ChartData, String>> _seriesChartData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: charts.BarChart(
      _seriesChartData,
      animate: true,
      barGroupingType: charts.BarGroupingType.grouped,
      animationDuration: Duration(seconds: 1),
    ));
  }
}
