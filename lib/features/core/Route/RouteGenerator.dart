///
///
///
/// RouteGenerator.dart
///
///
///

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz/features/info/presentation/pages/InfoScreen.dart';

// deps
import '../features.dart';

// routes
import 'Routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // get the args when passed while involking Navigator.pushNamed
    final args = settings.arguments;

    debugPrint("Inited route: ${settings.name}");

    switch (settings.name) {
      case Routes.INIT:
        return RouteAnimation(childWidget: MainScreen());
      case Routes.QUESTIONS:
        return RouteAnimation(
            childWidget: QuestionsScreen(
          category: args,
        ));
      case Routes.SCORE:
        return RouteAnimation(
            childWidget: ScoreScreen(
          score: args,
        ));

      case Routes.STATISTICS:
        return RouteAnimation(childWidget: StatisticsScreen());
      case Routes.About:
        return RouteAnimation(childWidget: InfoScreen());
      default:
        // if there is no such named route in the switch statement return error
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}

class RouteAnimation extends CupertinoPageRoute {
  final Widget childWidget;

  RouteAnimation({this.childWidget})
      : super(builder: (BuildContext context) => childWidget);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: this.childWidget);
  }
}
