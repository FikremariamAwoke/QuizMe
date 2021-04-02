///
///
/// Body.dart
///
///

import 'package:flutter/material.dart';
import 'package:quiz/features/questions/data/models/Score.dart';

// routes
import '../../../../core/Route/Routes.dart';

// widgets
import './Timer.dart';
import './Question.dart';
import './QuestionHeader.dart';

// models
import '../../../data/models/Questions.dart';

class Body extends StatefulWidget {
  final List<QuestionData> question;

  const Body({Key key, this.question}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Body(question);
  }
}

class _Body extends State<Body> with SingleTickerProviderStateMixin {
  final List<QuestionData> question;

  final PageController pageController = new PageController();
  Animation<double> animation;
  AnimationController controller;
  int currentIndex = 1;
  int isCorrect = 0;

  _Body(this.question);
  @override
  void initState() {
    // initalize animation controller with 60 seconds
    controller = AnimationController(
        duration: const Duration(
          seconds: 60,
        ),
        vsync: this);

    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});

        // if time for current question has ended go to next
        if (animation.value == 1.0) {
          goToNextPage();
        }
      });

    // set animation
    controller.forward();

    return super.initState();
  }

  // go to next page
  void goToNextPage() {
    // check if there are unanswered questions
    if (currentIndex < (question.length)) {
      pageController.nextPage(
          duration: Duration(seconds: 1), curve: Curves.ease);
      controller.value = 0;
      controller.forward();
      currentIndex++;
    } else {
      // if all questions are answered show score
      Navigator.of(context).pushReplacementNamed(Routes.SCORE,
          arguments:
              new Score(isCorrect, question.length, question[0].category));
    }
  }

  @override
  void dispose() {
    // dispose the animation controller
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Timer(animation: animation),
          QuestionHeader(
              currentIndex: currentIndex, questionTotal: question.length),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 1,
              color: Colors.grey[300],
            ),
          ),
          Expanded(
              child: PageView.builder(
                  itemCount: question.length,
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Question(
                        question: question[index],
                        goToNext: (bool isCorrect) async {
                          if (isCorrect) this.isCorrect++;
                          controller.stop();
                          await Future.delayed(Duration(seconds: 2), () {
                            goToNextPage();
                          });
                        },
                      )))
        ],
      ),
    );
  }
}
