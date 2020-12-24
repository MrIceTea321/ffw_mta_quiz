import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RettungVonPersonen extends StatefulWidget {
  @override
  _RettungVonPersonen createState() => _RettungVonPersonen();
}

class _RettungVonPersonen extends State<RettungVonPersonen> with SingleTickerProviderStateMixin {
  var _questionIndex = 0;
  var _totalScore = 0.0;


  String themengebiet="Rettung von Personen";

  final _fragenRettungVonPersonen = [
    {
      'questionText': 'Welche Lagerung für eine bewusstlose Person ist richtig?',
      'answers': [
        {'text': 'Kopf tief lagern', 'score': 0},
        {'text': 'Flach auf den Rücken legen', 'score': 0},
        {'text': 'Stabile Seitenlage', 'score': 1}
      ]
    }, {
      'questionText': 'Welche Aussage zu verletzten Personen, die noch im Fahrzeug sitzen, ist richtig?',
      'answers': [
        {'text': 'Verletzte müssen immer schnellstmöglich aus dem Fahrzeug geholt werden', 'score': 0},
        {'text': 'Eingeklemmte Personen müssen sofort befreit werden', 'score': 0},
        {'text': 'Sofern keine akute Gefahr durch Brand, Bewusstlosigkeit ä. besteht, sollen Verletzte im Fahrzeugverbleiben bis der Rettungsdienst die medizinischeLage beurteilt hat', 'score': 1}
      ]
    },{
      'questionText': 'Was gehört zur Überprüfung der lebenswichtigen Körperfunktionen?',
      'answers': [
        {'text': 'Ich sorge mit Rettungsdecke oder Krankenhausdecke für Wärmeerhalt', 'score': 0},
        {'text': 'Ich spreche ihn laut an. Ich schüttle an den Schultern,kontrolliere Mund und Rachenraum, stelle die Atmung fest', 'score': 1},
        {'text': 'Ich decke keimfrei die Brandwunden ab', 'score': 0}
      ]
    },{
      'questionText': 'Wie betreue ich als Ersthelfer (Feuerwehrdienstleistender) eine verletzte Person?',
      'answers': [
        {'text': 'Das ist nicht Aufgabe der Feuerwehr', 'score': 0},
        {'text': 'Ich leiste Erste Hilfe. Sage, dass ich für ihn da bin, dass der Rettungsdienst informiert ist. Ich spreche ihm gut zu und höre zu', 'score': 1},
        {'text': 'Ich warte bis der Rettungsdienst an der Einsatzstelle ist', 'score': 0}
      ]
    },{
      'questionText': 'Wie erkenne ich die sichtbaren Schockanzeichen?',
      'answers': [
        {'text': 'Schneller und gut tastbarer Puls', 'score': 0},
        {'text': 'Fahle Blässe, Frieren, kalter Schweiß auf der Stirn', 'score': 1},
        {'text': 'Ich messe den Blutdruck', 'score': 0}
      ]
    },{
      'questionText': 'Was unternehmen Sie bei einer starken Blutung (Schnittwunde)?',
      'answers': [
        {'text': 'Abbinden der Blutung, z. B. am Arm', 'score': 0},
        {'text': 'Druckverband anlegen', 'score': 1},
        {'text': 'Rettungsdienst nicht verständigen, wenn die Blutung gestoppt werden kann', 'score': 0}
      ]
    },{
      'questionText': 'Wie gehen Sie beim Vorfinden einer bewusstlosen Person vor?',
      'answers': [
        {'text': 'Den Verletzten in die stabile Seitenlage bringen', 'score': 0},
        {'text': 'Ich kontrolliere die Atmung und den Mundraum, dannbringe ich den Verletzten in die stabile Seitenlage und betreue ihn bis zum Eintreffen des Rettungsdienstes', 'score': 1},
        {'text': 'Die Polizei verständigen', 'score': 0}
      ]
    }
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
      body: _questionIndex < _fragenRettungVonPersonen.length
          ? Quiz(
        questions: _fragenRettungVonPersonen,
        answerQuestions: _answerQuestions,
        questionIndex: _questionIndex,
      )
          : Result(_resetQuiz, _fragenRettungVonPersonen.length,themengebiet,_totalScore, _fragenRettungVonPersonen, _questionIndex,),
    );
  }
}