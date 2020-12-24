import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  List<Map<String, Object>> questions;
  int questionIndex;
  Function answerQuestions;


  Quiz(
      { @required this.questions,
        @required this.answerQuestions,
        @required this.questionIndex
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answers)
        {
          return Answer(()=>answerQuestions(answers['score']), answers['text'], answers ['score'],);
        }
        ).toList(),
      ]
    );
  }

}
