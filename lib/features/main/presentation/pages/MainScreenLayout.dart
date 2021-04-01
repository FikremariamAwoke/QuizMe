///
///
/// MainScreenLayout.dart
///
///

import 'package:flutter/material.dart';

// widgets
import '../widgets/DrawerScreen.dart';
import '../widgets/HomeScreen.dart';

class MainScreenLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenLayout();
  }
}

class _MainScreenLayout extends State<MainScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [DrawerScreen(), HomeScreen()],
        ),
      ),
    );
  }
}
