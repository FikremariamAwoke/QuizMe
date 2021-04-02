///
///
/// PieChartTab.dart
///
///

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// constants.dart
import '../../core/constants.dart';

// models
import '../../data/models/Stats.dart';

// data processor
import './GetProcessedPieChartData.dart';

class PieChartTab extends StatelessWidget {
  const PieChartTab({Key key, @required this.stats}) : super(key: key);

  final Stats stats;

  @override
  Widget build(BuildContext context) {
    // get processed data
    var _seriesPieData = processData(stats);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              PIECHART_TITLE,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            (_seriesPieData != null)
                ? Expanded(
                    child: charts.PieChart(
                    _seriesPieData,
                    animate: true,
                    animationDuration: Duration(seconds: 2),
                    behaviors: [
                      new charts.DatumLegend(
                          outsideJustification:
                              charts.OutsideJustification.endDrawArea,
                          horizontalFirst: false,
                          desiredMaxRows: 3,
                          cellPadding:
                              new EdgeInsets.only(right: 4.0, bottom: 4.0),
                          entryTextStyle: charts.TextStyleSpec(fontSize: 14))
                    ],
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 100,
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ]),
                  ))
                : Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          STATS_UNAVAILABLE_TEXT,
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          STATS_UNAVAILABLE_SUBTEXT,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 70)
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
