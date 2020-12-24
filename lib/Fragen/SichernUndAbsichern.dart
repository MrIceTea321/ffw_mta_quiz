import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SichernUndAbsichern extends StatefulWidget {
  @override
  _SichernUndAbsichern createState() => _SichernUndAbsichern();
}

class _SichernUndAbsichern extends State<SichernUndAbsichern> with SingleTickerProviderStateMixin {
  var _questionIndex = 0;
  var _totalScore = 0.0;


  String themengebiet="Sichern und Absichern";

  final _fragenSichernUndAbsichern = [
    {
      'questionText': 'Welche Verwendung hat der Feuerwehr-Haltegurt?',
      'answers': [
        {'text': 'Sichern der Gefahr des Stürzens durch Halten/Rückhalten', 'score': 1},
        {'text': 'Sichern der Einsatzkleidung gegen Abrutschen', 'score': 0},
        {'text': 'Sichern gegen Absturz an der Absturzkante', 'score': 0}
      ]
    },  {
      'questionText': 'Welche Sicherungsmethoden kennen Sie?',
      'answers': [
        {'text': 'Halten/Rückhalten', 'score': 1},
        {'text': 'Sichern/Rücksichern', 'score': 0},
        {'text': 'Anleinen/Abseilen', 'score': 0}
      ]
    }, {
      'questionText': 'Welchen Zweck hat die Feuerwehrleine?',
      'answers': [
        {'text': 'Rettung; Selbstrettung; Sicherung/Aufziehen von Geräten', 'score': 1},
        {'text': 'Verwendung als Halte- und Ventilleine', 'score': 0},
        {'text': 'Absperren der Einsatzstelle', 'score': 0}
      ]
    },  {
      'questionText': 'Nennen Sie den Mindestabstand zur Absturzkante beim Rückhalten:',
      'answers': [
        {'text': 'Zwei Meter', 'score': 1},
        {'text': 'Fünf Meter', 'score': 0},
        {'text': 'Einen halben Meter', 'score': 0}
      ]
    }, {
      'questionText': 'Was ist beim Sichern einer Person zu beachten?',
      'answers': [
        {'text': 'Der Anschlagpunkt ist oberhalb der zu sichernden Person anzubringen', 'score': 1},
        {'text': 'Es ist genügend Schlaffseil vorzuhalten, damit der Gesicherte in seiner Bewegungsfreiheit nicht eingeschränkt wird', 'score': 0},
        {'text': 'Das Seil über scharfe Kanten führen', 'score': 0}
      ]
    }, {
      'questionText': 'Wie weit darf man beim Rückhalten an die Absturzkante heran treten?',
      'answers': [
        {'text': 'Ein Abstand von zwei Metern zur Absturzkante ist einzuhalten', 'score': 1},
        {'text': 'Es darf unmittelbar bis an die Absturzkante herangetreten werden', 'score': 0},
        {'text': 'Kurzzeitige Arbeiten an der Absturzkante sind erlaubt', 'score': 0}
      ]
    }, {
      'questionText': 'Wann darf eine Feuerwehrleine nicht eingesetzt werden?',
      'answers': [
        {'text': 'Wenn ein Absturz nicht ausgeschlossen werden kann', 'score': 1},
        {'text': 'Zum Halten und Rückhalten', 'score': 0},
        {'text': 'Zum Selbstretten', 'score': 0}
      ]
    }, {
      'questionText': 'Darf der Feuerwehr-Haltegurt als Auffanggurt benutzt werden?',
      'answers': [
        {'text': 'Nein, ein Feuerwehr-Haltegurt darf grundsätzlich nicht als Auffanggurt genutzt werden', 'score': 1},
        {'text': 'Ja, wenn dieser jünger als 10 Jahre ist und jährlich geprüft wird', 'score': 0},
        {'text': 'Ja, dafür ist dieser Gurt geeignet', 'score': 0}
      ]
    }, {
      'questionText': 'Kann das Halten mit Feuerwehr-Haltegurt und Feuerwehrleine durchgeführt werden?',
      'answers': [
        {'text': 'Ja, es genügt eine Feuerwehrleine und der Feuerwehr- Haltegurt', 'score': 1},
        {'text': 'Nein, hierzu benötigt man einen Gerätesatz Absturzsicherung', 'score': 0},
        {'text': 'Nein, da die Feuerwehrleine das nicht aushält', 'score': 0}
      ]
    }, {
      'questionText': 'Was ist beim Rückhalten zu beachten?',
      'answers': [
        {'text': 'Ein Absturz wird ausgeschlossen, weil die Absturzkante durch das Rückhalten nicht erreicht werden kann', 'score': 1},
        {'text': 'Rückhalten ist in der Feuerwehr nicht vorgesehen, wir gehen immer bis an die Grenze', 'score': 0},
        {'text': 'Wenn ich abstürzen sollte, hält mich der Feuerwehr- Haltegurt und die Feuerwehrleine', 'score': 0}
      ]
    }, {
      'questionText': 'Was ist beim Sichern einer Person zu beachten?',
      'answers': [
        {'text': 'Der Anschlagpunkt ist oberhalb der zu sichernden Person anzubringen', 'score': 1},
        {'text': 'Es ist genügend Schlaffseil vorzuhalten, damit der Gesicherte in seiner Bewegungsfreiheit nicht eingeschränkt wird', 'score': 0},
        {'text': 'Das Seil über scharfe Kanten führen', 'score': 0}
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
      body: _questionIndex < _fragenSichernUndAbsichern.length
          ? Quiz(
        questions: _fragenSichernUndAbsichern,
        answerQuestions: _answerQuestions,
        questionIndex: _questionIndex,
      )
          : Result(_resetQuiz, _fragenSichernUndAbsichern.length,themengebiet,_totalScore, _fragenSichernUndAbsichern, _questionIndex,),
    );
  }
}