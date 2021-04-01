part of 'questions_bloc.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();
}

class QuestionsInitial extends QuestionsState {
  @override
  List<Object> get props => [];
}

class QuestionsLoading extends QuestionsState {
  @override
  List<Object> get props => [];
}

class QuestionsLoaded extends QuestionsState {
  final List<QuestionData> questions;
  QuestionsLoaded({this.questions});
  @override
  List<Object> get props => [questions];
}

class QuestionsError extends QuestionsState {
  final String errorMessage;
  QuestionsError({this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
