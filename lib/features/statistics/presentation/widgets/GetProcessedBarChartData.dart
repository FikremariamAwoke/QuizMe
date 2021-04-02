///
///
/// GetProcessedBarChartData.dart
///
///

import 'package:flutter/Material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// models
import '../../data/models/ChartData.dart';

// convert data from local storage into bar chart data
processData(stats) {
  List<charts.Series<ChartData, String>> _seriesChartData =
      new List<charts.Series<ChartData, String>>();
  List<charts.Series<ChartData, String>> _seriesChartData1 =
      new List<charts.Series<ChartData, String>>();

  // incorrect answer data for bar chart 1
  var inCorrect = [
    new ChartData(
        category: 'Riddles',
        answerCount: (stats.riddlesCorrectlyAnswered != null)
            ? (stats.riddlesTotalAnswered - stats.riddlesCorrectlyAnswered)
            : 0,
        index: 5),
    new ChartData(
        category: 'General Knowledge',
        answerCount: (stats.generalKnowledgeCorrectlyAnswered != null)
            ? (stats.generalKnowledgeTotalAnswered -
                stats.generalKnowledgeCorrectlyAnswered)
            : 0,
        index: 5),
    new ChartData(
        category: 'Science: Computer',
        answerCount: (stats.computerScienceCorrectlyAnswered != null)
            ? (stats.computerScienceTotalAnswered -
                stats.computerScienceCorrectlyAnswered)
            : 0,
        index: 5),
  ];

  // incorrect answer data for bar chart 2
  var inCorrect1 = [
    new ChartData(
        category: 'Geography',
        answerCount: (stats.geographyCorrectlyAnswered != null)
            ? (stats.geographyTotalAnswered - stats.geographyCorrectlyAnswered)
            : 0,
        index: 5),
    new ChartData(
        category: 'Art',
        answerCount: (stats.artCorrectlyAnswered != null)
            ? (stats.artTotalAnswered - stats.artCorrectlyAnswered)
            : 0,
        index: 5),
    new ChartData(
        category: 'Sport',
        answerCount: (stats.sportCorrectlyAnswered != null)
            ? (stats.sportTotalAnswered - stats.sportCorrectlyAnswered)
            : 0,
        index: 5),
  ];

  // correct answer data for bar chart 1
  var correct = [
    new ChartData(
        category: 'Riddles',
        answerCount: (stats.riddlesCorrectlyAnswered != null)
            ? stats.riddlesCorrectlyAnswered
            : 0,
        index: 10),
    new ChartData(
        category: 'General Knowledge',
        answerCount: (stats.generalKnowledgeCorrectlyAnswered != null)
            ? stats.generalKnowledgeCorrectlyAnswered
            : 0,
        index: 10),
    new ChartData(
        category: 'Science: Computer',
        answerCount: (stats.computerScienceCorrectlyAnswered != null)
            ? stats.computerScienceCorrectlyAnswered
            : 0,
        index: 10),
  ];

  // correct answer data for bar chart 2
  var correct1 = [
    new ChartData(
        category: 'Geography',
        answerCount: (stats.geographyCorrectlyAnswered != null)
            ? stats.geographyCorrectlyAnswered
            : 0,
        index: 10),
    new ChartData(
        category: 'Art',
        answerCount: (stats.artCorrectlyAnswered != null)
            ? stats.artCorrectlyAnswered
            : 0,
        index: 10),
    new ChartData(
        category: 'Sport',
        answerCount: (stats.sportCorrectlyAnswered != null)
            ? stats.sportCorrectlyAnswered
            : 0,
        index: 10),
  ];

  // total answer data for bar chart 1
  var total = [
    new ChartData(
        category: 'Riddles',
        answerCount: (stats.riddlesTotalAnswered != null)
            ? stats.riddlesTotalAnswered
            : 0,
        index: 15),
    new ChartData(
        category: 'General Knowledge',
        answerCount: (stats.generalKnowledgeTotalAnswered != null)
            ? stats.generalKnowledgeTotalAnswered
            : 0,
        index: 15),
    new ChartData(
        category: 'Science: Computer',
        answerCount: (stats.computerScienceTotalAnswered != null)
            ? stats.computerScienceTotalAnswered
            : 0,
        index: 15),
  ];

  // total answer data for bar chart 2
  var total1 = [
    new ChartData(
        category: 'Geography',
        answerCount: (stats.geographyTotalAnswered != null)
            ? stats.geographyTotalAnswered
            : 0,
        index: 15),
    new ChartData(
        category: 'Art',
        answerCount:
            (stats.artTotalAnswered != null) ? stats.artTotalAnswered : 0,
        index: 15),
    new ChartData(
        category: 'Sport',
        answerCount:
            (stats.sportTotalAnswered != null) ? stats.sportTotalAnswered : 0,
        index: 15),
  ];

  // fill bar chart 1 data
  _seriesChartData.add(charts.Series(
    data: inCorrect,
    domainFn: (ChartData data, _) => data.category,
    measureFn: (ChartData data, _) => data.answerCount,
    id: '5',
    fillPatternFn: (_, __) => charts.FillPatternType.solid,
    fillColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
  ));
  _seriesChartData.add(charts.Series(
    data: correct,
    domainFn: (ChartData data, _) => data.category,
    measureFn: (ChartData data, _) => data.answerCount,
    id: '10',
    fillPatternFn: (_, __) => charts.FillPatternType.solid,
    fillColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.green),
  ));
  _seriesChartData.add(charts.Series(
    data: total,
    domainFn: (ChartData data, _) => data.category,
    measureFn: (ChartData data, _) => data.answerCount,
    id: '15',
    fillPatternFn: (_, __) => charts.FillPatternType.solid,
    fillColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blue),
  ));

  // fill bar chart 2 data
  _seriesChartData1.add(charts.Series(
    data: inCorrect1,
    domainFn: (ChartData data, _) => data.category,
    measureFn: (ChartData data, _) => data.answerCount,
    id: '5',
    fillPatternFn: (_, __) => charts.FillPatternType.solid,
    fillColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
  ));
  _seriesChartData1.add(charts.Series(
    data: correct1,
    domainFn: (ChartData data, _) => data.category,
    measureFn: (ChartData data, _) => data.answerCount,
    id: '10',
    fillPatternFn: (_, __) => charts.FillPatternType.solid,
    fillColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.green),
  ));
  _seriesChartData1.add(charts.Series(
    data: total1,
    domainFn: (ChartData data, _) => data.category,
    measureFn: (ChartData data, _) => data.answerCount,
    id: '15',
    fillPatternFn: (_, __) => charts.FillPatternType.solid,
    fillColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blue),
  ));

  // add both chart datas to list
  List<List<charts.Series<ChartData, String>>> result =
      new List<List<charts.Series<ChartData, String>>>();
  result.add(_seriesChartData);
  result.add(_seriesChartData1);

  return result;
}
