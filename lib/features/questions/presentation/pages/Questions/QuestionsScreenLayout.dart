///
///
/// QuestionsScreenLayout.dart
///
///

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// bloc
import '../../bloc/questions_bloc.dart';

// widgets
import '../../widgets/Questions/Body.dart';

// constants
import '../../../../core/constants.dart';
import '../../core/constants.dart';

class QuestionsScreenLayout extends StatefulWidget {
  final category;

  const QuestionsScreenLayout({Key key, this.category}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenLayout(category);
  }
}

class _QuestionsScreenLayout extends State<QuestionsScreenLayout> {
  final category;

  _QuestionsScreenLayout(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: QUIZ.APP_COLOR,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
              onPressed: () {},
              child:
                  Text('', style: TextStyle(color: Colors.white, fontSize: 16)))
        ],
      ),
      body: BlocBuilder<QuestionsBloc, QuestionsState>(
        builder: (context, state) {
          if (state is QuestionsLoading)
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    LOADING_QUESTIONS_TEXT,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
            );
          else if (state is QuestionsLoaded)
            return Body(
              question: state.questions,
            );
          else if (state is QuestionsError)
            return Center(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    onPressed: () {
                      BlocProvider.of<QuestionsBloc>(context)
                          .add(GetQuestions(category: category));
                    },
                    child: Text(RETRY_BUTTON_TEXT),
                  )
                ],
              ),
            ));
          else
            return Center(
              child: Text(''),
            );
        },
      ),
    );
  }
}
