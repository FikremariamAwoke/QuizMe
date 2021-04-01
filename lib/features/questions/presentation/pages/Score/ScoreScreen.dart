///
///
/// ScoreScreen.dart
///
///

import 'package:flutter/material.dart';

// SaveScore
import '../../widgets/Score/SaveScore.dart';

// layout
import './ScoreScreenLayout.dart';

class ScoreScreen extends StatelessWidget {
  final score;
  const ScoreScreen({Key key, @required this.score}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // save result to localstorage
    saveScore(score);

    return ScoreScreenLayout(
      score: score,
    );
  }
}
