///
///
/// QuestionsScreen.dart
///
///

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// bloc
import '../../bloc/questions_bloc.dart';

// layout
import '../Questions/QuestionsScreenLayout.dart';

class QuestionsScreen extends StatefulWidget {
  final category;
  const QuestionsScreen({Key key, this.category}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreen(category);
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  final category;
  _QuestionsScreen(this.category);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          QuestionsBloc()..add(GetQuestions(category: category)),
      child: QuestionsScreenLayout(category: category),
    );
  }
}
