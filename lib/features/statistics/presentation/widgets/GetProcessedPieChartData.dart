///
///
/// GetProcessedPieChartData.dart
///
///

import 'package:flutter/Material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// models
import '../../data/models/PieData.dart';

processData(stats) {
  if (stats.isEmpty()) return null;
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
  List<charts.Series<PieData, String>> _seriesPieData =
      new List<charts.Series<PieData, String>>();
  // pie
  var data = new List<PieData>();

  if (stats.riddlesTotalAnswered != null)
    data.add(new PieData(
        category: "Tricks & Riddles",
        value: (100 * stats.riddlesTotalAnswered) / total,
        color: Color(0xff3366cc)));
  if (stats.generalKnowledgeTotalAnswered != null)
    data.add(new PieData(
        category: "General Knowledge",
        value: (100 * stats.generalKnowledgeTotalAnswered) / total,
        color: Color(0xff990099)));
  if (stats.computerScienceTotalAnswered != null)
    data.add(new PieData(
        category: "Computer Science",
        value: (100 * stats.computerScienceTotalAnswered) / total,
        color: Color(0xff109618)));
  if (stats.geographyTotalAnswered != null)
    data.add(new PieData(
        category: "Geography",
        value: (100 * stats.geographyTotalAnswered) / total,
        color: Color(0xfffdbe19)));
  if (stats.artTotalAnswered != null)
    data.add(new PieData(
        category: "Art",
        value: (100 * stats.artTotalAnswered) / total,
        color: Color(0xffff9900)));
  if (stats.sportTotalAnswered != null)
    data.add(
      new PieData(
          category: "Sport",
          value: (100 * stats.sportTotalAnswered) / total,
          color: Color(0xffdc3912)),
    );
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
