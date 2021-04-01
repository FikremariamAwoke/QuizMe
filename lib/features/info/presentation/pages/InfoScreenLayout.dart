///
///
/// InfoScreenLayout.dart
///
///

import 'package:flutter/material.dart';

// widgets
import '../widgets/Body.dart';

// constants
import '../../core/constants.dart';

class InfoScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(APPBAR_TITLE, style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Body(),
    );
  }
}
