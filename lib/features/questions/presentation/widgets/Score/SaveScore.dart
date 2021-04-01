///
///
/// SaveScore.dart
///
///

import 'package:localstorage/localstorage.dart';

// models
import '../../../data/models/Score.dart';

saveScore(Score score) {
  if (score.category == 'Tricky & Brain Riddles') {
    _save(score, 'riddles');
  } else if (score.category == 'General Knowledge') {
    _save(score, 'generalKnowledge');
  } else if (score.category == 'Science: Computers') {
    _save(score, 'computerScience');
  } else if (score.category == 'Geography') {
    _save(score, 'geography');
  } else if (score.category == 'Art') {
    _save(score, 'art');
  } else if (score.category == 'Sports') {
    _save(score, 'sport');
  }
}

_save(Score score, categoryName) async {
  final LocalStorage storage = new LocalStorage('Quiz');
  int prevCorrect = 0;
  int prevTotal = 0;
  prevCorrect = await storage.getItem(categoryName + "CorrectlyAnswered");
  prevTotal = await storage.getItem(categoryName + "TotalAnswered");
  await storage.setItem(categoryName + "CorrectlyAnswered",
      ((prevCorrect != null) ? prevCorrect : 0) + score.isCorrect);
  await storage.setItem(categoryName + "TotalAnswered",
      ((prevTotal != null) ? prevTotal : 0) + score.total);
}
