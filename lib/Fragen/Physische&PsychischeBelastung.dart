import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Physische_PsychischeBelastung extends StatefulWidget {
  @override
  _Physische_PsychischeBelastung createState() => _Physische_PsychischeBelastung();
}

class _Physische_PsychischeBelastung extends State<Physische_PsychischeBelastung> with SingleTickerProviderStateMixin {
  var _questionIndex = 0;
  var _totalScore = 0.0;


  String themengebiet="Physische- und Psychische Belastung";

  final _fragenPhysische_PsychischeBelastung = [
    {
      'questionText': 'Welches Verhalten kann bei der Stressbewältigung hilfreich sein?',
      'answers': [
        {'text': 'Pausen einlegen, sich ablösen lassen', 'score': 1},
        {'text': 'Aufgaben möglichst alleine durchführen', 'score': 0},
        {'text': 'Schneller arbeiten, um sich abzulenken', 'score': 0}
      ]
    }, {
      'questionText': 'Welche der folgenden Symptome sind üblicherweise anzutreffende negative Stressreaktionen?',
      'answers': [
        {'text': 'Zittern, Schwitzen', 'score': 1},
        {'text': 'Konzentrationssteigerung', 'score': 0},
        {'text': 'Euphorie', 'score': 0}
      ]
    },{
      'questionText': 'Was ist Stress?',
      'answers': [
        {'text': 'Eine Reaktion des Körpers', 'score': 1},
        {'text': 'Eine Fastenspeise', 'score': 0},
        {'text': 'Ein gefährlicher Stoff', 'score': 0}
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0.0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          themengebiet,
          minFontSize: 6.0,
          maxFontSize: 15.0,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
            icon: Icon(Icons.home,color: Colors.white, size: 40),
            onPressed:() {
              Navigator.pushNamed(context, 'AlleQuizzeAnzeigen');
            }
        ),
        actions: <Widget>[
        ],
      ),
      body: _questionIndex < _fragenPhysische_PsychischeBelastung.length
          ? Quiz(
        questions: _fragenPhysische_PsychischeBelastung,
        answerQuestions: _answerQuestions,
        questionIndex: _questionIndex,
      )
          : Result(_resetQuiz, _fragenPhysische_PsychischeBelastung.length,themengebiet,_totalScore, _fragenPhysische_PsychischeBelastung, _questionIndex,),
    );
  }
}