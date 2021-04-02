///
///
/// StatisticsScreenLayout.dart
///
///

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// constants
import '../../../core/constants.dart';
import '../../core/constants.dart';

// bloc
import '../bloc/statistics_bloc.dart';

// widgets
import '../widgets/BarChartTab.dart';
import '../widgets/PieChartTab.dart';

class StatisticsScreenLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatisticsScreenLayout();
  }
}

class _StatisticsScreenLayout extends State<StatisticsScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            APPBAR_TITLE,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: QUIZ.APP_COLOR,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.bar_chart_rounded),
              ),
              Tab(
                icon: Icon(Icons.pie_chart),
              )
            ],
          ),
        ),
        body: BlocBuilder<StatisticsBloc, StatisticsState>(
          builder: (context, state) {
            // show charts if data is loaded
            if (state is StatisticsDataLoaded)
              return TabBarView(
                children: [
                  BarChartTab(
                    stats: state.stats,
                  ),
                  PieChartTab(
                    stats: state.stats,
                  ),
                ],
              );

            // show loading while data is loading
            return Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(QUIZ.APP_COLOR),
              ),
            );
          },
        ),
      ),
    );
  }
}
