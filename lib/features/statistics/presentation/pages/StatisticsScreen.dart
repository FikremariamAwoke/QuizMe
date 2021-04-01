///
///
/// StatisticsScreen.dart
///
///

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//bloc
import '../bloc/statistics_bloc.dart';

// layout
import './StatisticsScreenLayout.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatisticsScreen();
  }
}

class _StatisticsScreen extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsBloc()..add(LoadStatisticsData()),
      child: StatisticsScreenLayout(),
    );
  }
}
