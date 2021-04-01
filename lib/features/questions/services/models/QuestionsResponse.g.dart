// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuestionsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsResponse _$QuestionsResponseFromJson(Map<String, dynamic> json) {
  return QuestionsResponse(
    json['response_code'] as int,
    (json['results'] as List)
        .map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuestionsResponseToJson(QuestionsResponse instance) =>
    <String, dynamic>{
      'response_code': instance.response_code,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
