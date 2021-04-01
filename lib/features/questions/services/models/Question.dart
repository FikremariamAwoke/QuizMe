///
///
/// Question.dart
///
///

import 'package:json_annotation/json_annotation.dart';

part 'Question.g.dart';

@JsonSerializable(nullable: false)
class Question {
  String category;
  String type;
  String difficulty;
  String question;
  String correct_answer;
  List<String> incorrect_answers;

  Question(this.category, this.type, this.difficulty, this.question,
      this.correct_answer, this.incorrect_answers);

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
