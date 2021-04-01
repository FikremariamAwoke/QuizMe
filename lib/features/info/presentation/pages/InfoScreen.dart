///
///
/// InfoScreen.dart
///
///

import 'package:flutter/material.dart';

// layout
import './InfoScreenLayout.dart';

class InfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InfoScreen();
  }
}

class _InfoScreen extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return InfoScreenLayout();
  }
}
