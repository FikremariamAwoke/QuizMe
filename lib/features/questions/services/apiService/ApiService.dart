///
///
/// ApiService.dart
///
///

import 'package:chopper/chopper.dart';

// constants
import '../../../core/constants.dart';

part 'ApiService.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  // get general knowledge question
  @Get(path: 'api.php?amount=10&category=9&type=multiple')
  Future<Response> generalKnowledgeQuestions();

  // get computer science question
  @Get(path: 'api.php?amount=10&category=18&type=multiple')
  Future<Response> computerScienceQuestions();

  // get geography question
  @Get(path: 'api.php?amount=10&category=22&type=multiple')
  Future<Response> geographyQuestions();

  // get art question
  @Get(path: 'api.php?amount=10&category=25&type=multiple')
  Future<Response> artQuestions();

  // get sport question
  @Get(path: 'api.php?amount=10&category=21&type=multiple')
  Future<Response> sportQuestions();

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: QUIZ.MAIN_ENDPOINT,
      services: [_$ApiService()],
      converter: JsonConverter(),
      errorConverter: JsonConverter(),
    );
    return _$ApiService(client);
  }
}
