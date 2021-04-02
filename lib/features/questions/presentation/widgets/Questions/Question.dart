///
///
/// Question.dart
///
///

import 'package:flutter/material.dart';
import 'dart:math';

// widgets
import './Options.dart';

// models
import '../../../data/models/Questions.dart';

class Question extends StatefulWidget {
  final QuestionData question;
  final goToNext;
  const Question({Key key, this.question, this.goToNext}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Question(question, goToNext);
  }
}

class _Question extends State<Question> {
  final QuestionData question;
  final goToNext;

  _Question(this.question, this.goToNext);

  bool isAnswered = false;
  int selectedIndex;

  List<String> answers;
  // randomize the answer
  randomize() {
    answers = question.answers.map((e) => e).toList();
    Random random = new Random();
    int randomNumber = random.nextInt((question.answers.length + 1));
    answers.insert(randomNumber, question.correctAnswer);
  }

  // check if answer is correct
  int checkAnswer(index) {
    if (index == selectedIndex &&
        answers[selectedIndex] != question.correctAnswer) return -1;
    if (answers[index] == question.correctAnswer) return 1;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    if (answers == null) randomize();
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            question.question,
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: ListView(
              children: [
                ...List.generate(
                    (answers.length),
                    (index) => Options(
                          index: index,
                          text: answers[index],
                          status: (isAnswered) ? checkAnswer(index) : 0,
                          press: () {
                            if (!isAnswered) {
                              setState(() {
                                isAnswered = true;
                                selectedIndex = index;
                              });
                              goToNext((answers[selectedIndex] ==
                                  question.correctAnswer));
                            }
                          },
                        ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
