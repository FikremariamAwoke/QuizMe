///
///
/// QuestionHeader.dart
///
///

import 'package:flutter/material.dart';

// constants
import '../../core/constants.dart';

class QuestionHeader extends StatelessWidget {
  const QuestionHeader({
    Key key,
    @required this.currentIndex,
    @required this.questionTotal,
  }) : super(key: key);

  final int currentIndex;
  final int questionTotal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text.rich(
        TextSpan(
          text: QUESTION_TEXT + " $currentIndex",
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.white),
          children: [
            TextSpan(
              text: "/$questionTotal",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
