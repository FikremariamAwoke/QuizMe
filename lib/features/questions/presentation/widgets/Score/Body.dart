///
///
/// Body.dart
///
///

import 'package:flutter/material.dart';

// constants
import '../../core/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.score,
  }) : super(key: key);

  final score;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // category
          Text(
            score.category,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 50),

          // score header
          Text(SCORE_HEADER_TEXT,
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
              )),

          // result
          Text.rich(
            TextSpan(
              text: "${score.isCorrect}",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.black),
              children: [
                TextSpan(
                  text: "/${score.total}",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
