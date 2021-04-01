part of 'questions_bloc.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();
}

class GetQuestions extends QuestionsEvent {
  final category;
  GetQuestions({this.category});
  @override
  List<Object> get props => [category];
}
