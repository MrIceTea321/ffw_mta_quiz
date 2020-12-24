import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fahrzeugkunde extends StatefulWidget {
  @override
  _Fahrzeugkunde createState() => _Fahrzeugkunde();
}

class _Fahrzeugkunde extends State<Fahrzeugkunde> {
  var _questionIndex = 0;
  var _totalScore = 0.0;
  String themengebiet="Fahrzeugkunde";

  final _fragenFahrzeugkunde = [
    {
      'questionText': 'Welches Feuerwehrfahrzeug hat eine Löschgruppe als Besatzung?',
      'answers': [
        {'text': 'TSF', 'score': 0},
        {'text': 'TLF', 'score': 1},
        {'text': 'HLF', 'score': 0}
      ]
    }, {
      'questionText': 'Welche Steckleiter befindet sich in der Regel auf dem Dach eines TSF-W?',
      'answers': [
        {'text': 'Einteilige Steckleiter', 'score': 0},
        {'text': 'Zweiteilige Steckleiter', 'score': 1},
        {'text': 'Vierteilige Steckleiter', 'score': 0}
      ]
    },
    {
      'questionText': 'Welches Feuerlöschfahrzeug besitzt keinen Löschwassertank?',
      'answers': [
        {'text': 'LF 20', 'score': 0},
        {'text': 'MLF', 'score': 1},
        {'text': 'TSF', 'score': 0}
      ]
    },
    {
      'questionText': 'Auf welchem Feuerlöschfahrzeug ist die Ausstattung zur erweiterten technischen Hilfeleistung verladen?',
      'answers': [
        {'text': 'LF', 'score': 0},
        {'text': 'TLF', 'score': 1},
        {'text': 'HLF', 'score': 0}
      ]
    },
    {
      'questionText': 'Für wieviele Feuerwehrdienstleistende ist die Beladung von TSA, TSF und TSF-W ausgelegt?',
      'answers': [
        {'text': 'Für einen Trupp 1/1', 'score': 0},
        {'text': 'Für eine Staffel 1/5', 'score': 1},
        {'text': 'Für eine Gruppe 1/8', 'score': 0}
      ]
    },
    {
      'questionText': 'Wieviele Atemschutzgeräte werden üblicherweise auf Feuerlöschfahrzeugen (TLF ausgenommen) mit Atemschutzausstattung mitgeführt?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '6', 'score': 1},
        {'text': '4', 'score': 0}
      ]
    },
    {
      'questionText': 'Für wieviele Feuerwehrdienstleistende bietet die Atemschutzausstattung von Löschfahrzeugen (TLF ausgenommen) üblicherweise Schutz?',
      'answers': [
        {'text': 'Für einen Trupp', 'score': 0},
        {'text': 'Für drei Trupps', 'score': 0},
        {'text': 'Für zwei Trupps', 'score': 1}
      ]
    },
    {
      'questionText': 'Was bedeutet die Bezeichnung LF10?',
      'answers': [
        {'text': 'Löschgruppenfahrzeug mit einer zulässigen Gesamtmasse von 10 t', 'score': 0},
        {'text': 'Löschgruppenfahrzeug mit einem Mindesttankvolumenvon 1.000 l) ', 'score': 0},
        {'text': 'Löschgruppenfahrzeug mit einer fest eingebauter Feuerlöschkreiselpumpe FPN 10-1000', 'score': 1}
      ]
    },
    {
      'questionText': 'Was bedeutet die Bezeichnung FPN 10-1000?',
      'answers': [
        {'text': 'Feuerlöschkreiselpumpe Normaldruck mit einer Nennförderstreckevon 1.000 m bei einem Nennförderdruck von 10 bar', 'score': 1},
        {'text': 'Feuerwehrpumpennorm 10, Blatt 100', 'score': 0},
        {'text': 'Feuerlöschkreiselpumpe Normaldruck mit einer Nennförderleistung von 1.000 l/min bei einem Nennförderdruck von 10 bar', 'score': 0}
      ]
    },
    {
      'questionText': 'Wie wird die Tragkraftspritze TS (tragbare Feuerlöschkreiselpumpe) nach Norm bezeichnet?',
      'answers': [
        {'text': 'FPN (Fire Pump Normal Pressure)', 'score': 0},
        {'text': 'TFPN (Tragbare Fire Pump Normal Pressure)', 'score': 0},
        {'text': 'PFPN (Portable Fire Pump Normal Pressure)', 'score': 1}
      ]
    },
    {
      'questionText': 'Welches Feuerwehrfahrzeug hat eine Staffel als Besatzung?',
      'answers': [
        {'text': 'HLF', 'score': 1},
        {'text': 'RW', 'score': 0},
        {'text': 'TSF', 'score': 0}
      ]
    },
    {
      'questionText': 'Welches Feuerwehrfahrzeug hat einen Trupp als Besatzung?',
      'answers': [
        {'text': 'TSF', 'score': 1},
        {'text': 'HLF', 'score': 0},
        {'text': 'RW', 'score': 0}
      ]
    },
    {
      'questionText': ' Welche Aussage trifft auf ein MLF zu?',
      'answers': [
        {'text': 'Besatzung für eine Gruppe; Beladung für eine Gruppe; 1200 l Löschwasserbehälter', 'score': 1},
        {'text': 'Das MLF führt auf dem Dach eine dreiteilige Schiebeleiter mit', 'score': 0},
        {'text': 'Besatzung für eine Staffel; Beladung für eine Gruppe', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche aktuellen Fahrzeugtypen gehören zur Gruppe der Feuerlöschfahrzeuge?',
      'answers': [
        {'text': 'GW-L 1; TSF; RW', 'score': 1},
        {'text': 'DLK; WLF; ELW 1', 'score': 0},
        {'text': 'LF 10; HLF 10; LF 20l', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche Verwendung hat das LF 20 KatS?',
      'answers': [
        {'text': 'Rettung von Personen aus Höhen', 'score': 1},
        {'text': 'Technische Hilfeleistung großen Umfangs', 'score': 0},
        {'text': 'Brandbekämpfung, schnelle Wasserabgabe, Wasserförderung, technische Hilfeleistung', 'score': 0}
      ]
    },
    {
      'questionText': ' Welche Besatzung hat ein TLF 3000?',
      'answers': [
        {'text': 'Staffel 1/5', 'score': 1},
        {'text': 'Gruppe 1/8', 'score': 0},
        {'text': 'Trupp 1/2', 'score': 0}
      ]
    },
    {
      'questionText': 'Wie viel Liter Löschwasser führt ein TLF 4000 mit?',
      'answers': [
        {'text': '400 l Löschwasser', 'score': 1},
        {'text': 'Führt kein Löschwasser mit', 'score': 0},
        {'text': '4.000 l Löschwasser', 'score': 0}
      ]
    },
    {
      'questionText': 'Wie viel Liter Löschwasser führt ein TSF mit?',
      'answers': [
        {'text': '500 l Löschwasser', 'score': 1},
        {'text': 'Führt kein Löschwasser mit', 'score': 0},
        {'text': '600 l Löschwasser', 'score': 0}
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
      body: _questionIndex < _fragenFahrzeugkunde.length
          ? Quiz(
        questions: _fragenFahrzeugkunde,
        answerQuestions: _answerQuestions,
        questionIndex: _questionIndex,
      )
          : Result(_resetQuiz, _fragenFahrzeugkunde.length,themengebiet,_totalScore, _fragenFahrzeugkunde, _questionIndex),
    );
  }
}