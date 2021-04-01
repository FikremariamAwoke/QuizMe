///
///
/// QuestionsResponse.dart
///
///

import 'package:json_annotation/json_annotation.dart';

import 'Question.dart';

part 'QuestionsResponse.g.dart';

@JsonSerializable(nullable: false, explicitToJson: true)
class QuestionsResponse {
  int response_code;
  List<Question> results;
  QuestionsResponse(this.response_code, this.results);

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}
