///
///
/// GetProcessedPieChartData.dart
///
///

import 'package:flutter/Material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

// models
import '../../data/models/PieData.dart';

// convert local storage data into pie chart data
processData(stats) {
  // if there is no data in local storage return null
  if (stats.isEmpty()) return null;

  // calculate the total questions answered
  int total =
      ((stats.riddlesTotalAnswered != null) ? stats.riddlesTotalAnswered : 0) +
          ((stats.generalKnowledgeTotalAnswered != null)
              ? stats.generalKnowledgeTotalAnswered
              : 0) +
          ((stats.computerScienceTotalAnswered != null)
              ? stats.computerScienceTotalAnswered
              : 0) +
          ((stats.geographyTotalAnswered != null)
              ? stats.geographyTotalAnswered
              : 0) +
          ((stats.artTotalAnswered != null) ? stats.artTotalAnswered : 0) +
          ((stats.sportTotalAnswered != null) ? stats.sportTotalAnswered : 0);

  // initialize pie chart data
  List<charts.Series<PieData, String>> _seriesPieData =
      new List<charts.Series<PieData, String>>();
  var data = new List<PieData>();

  // if the category question has been completed by the user at least once, add it to the pie chart
  if (stats.riddlesTotalAnswered != null)
    data.add(new PieData(
        category: "Tricks & Riddles",
        value: roundDouble((100 * stats.riddlesTotalAnswered) / total, 2),
        color: Color(0xff3366cc)));
  if (stats.generalKnowledgeTotalAnswered != null)
    data.add(new PieData(
        category: "General Knowledge",
        value:
            roundDouble((100 * stats.generalKnowledgeTotalAnswered) / total, 2),
        color: Color(0xff990099)));
  if (stats.computerScienceTotalAnswered != null)
    data.add(new PieData(
        category: "Computer Science",
        value:
            roundDouble((100 * stats.computerScienceTotalAnswered) / total, 2),
        color: Color(0xff109618)));
  if (stats.geographyTotalAnswered != null)
    data.add(new PieData(
        category: "Geography",
        value: roundDouble((100 * stats.geographyTotalAnswered) / total, 2),
        color: Color(0xfffdbe19)));
  if (stats.artTotalAnswered != null)
    data.add(new PieData(
        category: "Art",
        value: roundDouble((100 * stats.artTotalAnswered) / total, 2),
        color: Color(0xffff9900)));
  if (stats.sportTotalAnswered != null)
    data.add(
      new PieData(
          category: "Sport",
          value: roundDouble((100 * stats.sportTotalAnswered) / total, 2),
          color: Color(0xffdc3912)),
    );

  // populate the pie chart data
  _seriesPieData.add(charts.Series(
    data: data,
    domainFn: (PieData data, _) => data.category,
    measureFn: (PieData data, _) => data.value,
    colorFn: (PieData data, _) => charts.ColorUtil.fromDartColor(data.color),
    id: 'Category Frequency',
    labelAccessorFn: (PieData data, _) => "${data.value}",
  ));

  return _seriesPieData;
}

// round percentage to two decimal points
double roundDouble(double value, int places) {
  double mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}
