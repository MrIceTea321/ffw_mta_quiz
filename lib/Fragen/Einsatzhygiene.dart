import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Einsatzhygiene extends StatefulWidget {
  @override
  _Einsatzhygiene createState() => _Einsatzhygiene();
}

class _Einsatzhygiene extends State<Einsatzhygiene> with SingleTickerProviderStateMixin {
  var _questionIndex = 0;
  var _totalScore = 0.0;


  String themengebiet="Einsatzhygiene";

  final _fragenEinsatzhygiene = [
    {
      'questionText': 'Welche Einsatzgrundsätze gelten u. a. an der Einsatzstelle bezüglich der Einsatzhygiene?',
      'answers': [
        {'text': 'Wird erst durch den Einheitsführer bestimmt', 'score': 0},
        {'text': 'Im Gefahrenbereich nicht essen, trinken und rauchen', 'score': 1},
        {'text': 'Die Einsatzhygiene ist erst im Feuerwehrhaus durchzuführen', 'score': 0}
      ]
    },  {
      'questionText': 'Welche Hygienemaßnahme ist beim Umgang mit Verletzten zu beachten?',
      'answers': [
        {'text': 'Es ist ausreichend, nach dem Einsatz sich gründlich die Hände zu waschen', 'score': 0},
        {'text': 'Beim Umgang mit Verletzten sind Infektionsschutzhandschuhe zu tragen', 'score': 1},
        {'text': 'Die Feuerwehrhandschuhe stellen einen genügenden Schutz dar', 'score': 0}
      ]
    }, {
      'questionText': 'Ein Feuerwehrangehöriger nimmt unter Medikamenteneinfluss an einem Einsatz teil. Welche Folgen kann dies haben?',
      'answers': [
        {'text': 'Da die Krankheitssymptome ausgeschaltet sind, ist mit keinerlei Folgen zu rechnen', 'score': 0},
        {'text': 'Hohe körperliche Anforderungen können zu einer Überlastung führen', 'score': 1},
        {'text': 'Der Einsatzleiter ist zu informieren, damit er sich um einen eventuelle ärztliche Versorgung vor Ort kümmert', 'score': 0}
      ]
    }, {
      'questionText': 'Nach einem Feuerwehreinsatz ist Ihre Einsatzkleidung stark verschmutzt. Wie verhalten Sie sich vor dem Abrücken?',
      'answers': [
        {'text': 'Es ist nichts besonderes zu beachten, lediglich die Fenster der Mannschaftskabine öffnen', 'score': 0},
        {'text': 'Stark verschmutzte Einsatzkleidung nicht in der Mannschaftskabine transportieren; gesondert in einem Behälter/Sack transportieren', 'score': 1},
        {'text': 'Es ist ausreichend, die Einsatzkleidung am Gerätehaus zu reinigen', 'score': 0}
      ]
    }, {
      'questionText': 'Sie rücken nach einem Feuerwehreinsatz im Gerätehaus ein, wie verhalten Sie sich richtig?',
      'answers': [
        {'text': 'Nach dem Einrücken ist die Verpflegung zu organisieren', 'score': 0},
        {'text': 'Im Gerätehaus Aufenthalts- und Sozialräume nicht mit verschmutzter Einsatzkleidung betreten; Schwarz/Weiß-Trennung beachten', 'score': 1},
        {'text': 'Getränke verteilen, verschmutzte Einsatzkleidung im Spind verstauen', 'score': 0}
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
      body: _questionIndex < _fragenEinsatzhygiene.length
          ? Quiz(
        questions: _fragenEinsatzhygiene,
        answerQuestions: _answerQuestions,
        questionIndex: _questionIndex,
      )
          : Result(_resetQuiz, _fragenEinsatzhygiene.length,themengebiet,_totalScore, _fragenEinsatzhygiene, _questionIndex,),
    );
  }
}