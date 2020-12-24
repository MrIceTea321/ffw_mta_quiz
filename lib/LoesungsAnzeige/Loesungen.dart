import 'package:ffw_quiz_test/LoesungsAnzeige/answerAuswertung.dart';
import 'package:flutter/material.dart';
import '../Quiz/question.dart';

class Loesungen extends StatelessWidget {
  List<Map<String, Object>> questions;
  int questionIndex;
  Function answerQuestions;

  Loesungen(
      {@required this.questions,
      @required this.answerQuestions,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answers) {
          return answerAuswertung(
            () => answerQuestions(answers['score']),
            answers['text'],
            answers['score'],
          );
        }).toList(),
      ]),
    );
  }
}
