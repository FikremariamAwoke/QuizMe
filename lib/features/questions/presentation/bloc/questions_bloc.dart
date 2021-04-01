import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity/connectivity.dart';

// models
import '../../data/models/Questions.dart';
import '../../services/models/QuestionsResponse.dart';

// api
import '../../services/apiService/ApiService.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  // getquestions api
  ApiService _apiService = ApiService.create();

  QuestionsBloc() : super(QuestionsInitial());
  @override
  Stream<QuestionsState> mapEventToState(
    QuestionsEvent event,
  ) async* {
    if (event is GetQuestions) yield* getQuestions(event.category);
  }

  Stream<QuestionsState> getQuestions(category) async* {
    // check if the device is connection to the internet
    if (await _isConnectionAvailable()) {
      // yield loading state
      yield QuestionsLoading();

      if (category == "Tricky & Brain Riddles") {
        List<QuestionData> questions;
        questions = riddles
            .map((question) => QuestionData(
                  id: question['id'],
                  question: question['question'],
                  category: question['category'],
                  correctAnswer: question['correct_answer'],
                  answers: question['incorrect_answers'],
                ))
            .toList();
        questions.shuffle();
        // yield Question from local
        yield QuestionsLoaded(questions: questions.sublist(0, 10));
      } else {
        try {
          var resp;
          if (category == "General Knowledge")
            resp = await _apiService.generalKnowledgeQuestions();
          else if (category == "Science: Computers")
            resp = await _apiService.computerScienceQuestions();
          else if (category == "Geography")
            resp = await _apiService.geographyQuestions();
          else if (category == "Art")
            resp = await _apiService.artQuestions();
          else if (category == "Sport")
            resp = await _apiService.sportQuestions();

          if (resp.statusCode >= 400)

            // yield error getting data
            yield QuestionsError(
                errorMessage: "Error while fetching questions");
          else if (resp.statusCode == 200) {
            final questionsResponse = QuestionsResponse.fromJson(resp.body);
            questionsResponse.results.map((e) => print(e.question));
            List<QuestionData> questions = new List<QuestionData>();
            for (int i = 0; i < questionsResponse.results.length; i++) {
              questions.add(QuestionData(
                id: i,
                question: questionsResponse.results[i].question,
                category: questionsResponse.results[i].category,
                correctAnswer: questionsResponse.results[i].correct_answer,
                answers: questionsResponse.results[i].incorrect_answers,
              ));
            }
            // yield Question from api
            yield QuestionsLoaded(questions: questions);
          }
        } catch (exp) {
          // yield api error
          QuestionsError(errorMessage: 'An error occured');
        }
      }
    } else

      // yield not connected to network error
      yield QuestionsError(errorMessage: 'Not connected to a network');
  }

  Future<bool> _isConnectionAvailable() async {
    // check if mobile or wifi network is available

    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile)
      return true;
    else if (connectivityResult == ConnectivityResult.wifi) return true;

    return false;
  }
}
