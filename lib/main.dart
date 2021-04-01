///
///
/// main.dart
///
///

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// route
import 'features/core/Route/RouteGenerator.dart';

// routes
import 'features/core/Route/Routes.dart';

// constants
import 'features/core/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// set the device orientations
    /// 1) Portrait Up
    /// 2) Portrait Down
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      title: QUIZ.APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.INIT,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
