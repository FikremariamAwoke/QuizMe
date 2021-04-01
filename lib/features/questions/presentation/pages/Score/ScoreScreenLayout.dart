///
///
/// ScoreScreenLayout.dart
///
///

import 'package:flutter/material.dart';

// constants
import '../../core/constants.dart';

// widgets
import '../../widgets/Score/Body.dart';

class ScoreScreenLayout extends StatelessWidget {
  final score;

  const ScoreScreenLayout({Key key, @required this.score}) : super(key: key);
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
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(SCORE_APPBAR_TITLE, style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Body(score: score),
    );
  }
}
