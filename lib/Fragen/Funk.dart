import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Funk extends StatefulWidget {
  @override
  _Funk createState() => _Funk();
}

class _Funk extends State<Funk> with SingleTickerProviderStateMixin {
  var _questionIndex = 0;
  var _totalScore = 0.0;


  String themengebiet="Funk";

  final _fragenFunk = [
    {
      'questionText': 'Wofür werden Handfunkgeräte in der Regelverwendet?',
      'answers': [
        {'text': 'Funkverbindung von Feststation zu Fahrzeug', 'score': 0},
        {'text': 'Funkverbindung von Einsatzkraft zu Einsatzkraft an der Einsatzstelle', 'score': 1},
        {'text': 'Funkverbindung von Fahrzeug zu Fahrzeug', 'score': 0}
      ]
    },  {
      'questionText': 'Was ist zu tun, wenn im Sprechfunk eine Notfallmeldung abgesetzt wird?',
      'answers': [
        {'text': 'Nichts, der normale Sprechfunkverkehr kann fortgesetzt werden', 'score': 0},
        {'text': 'Es antworten sofort alle auf die Notfallmeldung', 'score': 0},
        {'text': 'Der bestehende Sprechfunkverkehr ist zu unterbrechen', 'score': 1}
      ]
    }, {
      'questionText': 'Bei welcher Aufzählung gehören sämtliche Behörden/Organisationen zu den Behörden und Organisationen mit Sicherheitsaufgaben (BOS)?',
      'answers': [
        {'text': 'Malteser-Hilfsdienst, ADAC, Luftrettungsstaffel Bayern', 'score': 0},
        {'text': 'Berufsfeuerwehr, Telekom, Bundespolizei', 'score': 0},
        {'text': 'Polizei, Bundeszollverwaltung, Freiwillige Feuerwehren', 'score': 1}
      ]
    }, {
      'questionText': 'Ein Anruf ist durch folgende Anrufantwort zu bestätigen...',
      'answers': [
        {'text': '„(Rufname) hört!”', 'score': 0},
        {'text': '„(Rufname) absetzen!”', 'score': 0},
        {'text': '„Hier (Rufname), kommen!”', 'score': 1}
      ]
    }, {
      'questionText': 'Wie wird ein Gespräch im Funkverkehr beendet?',
      'answers': [
        {'text': '„Ende mit Florian Würzburg”', 'score': 0},
        {'text': 'Mit „Ende” ohne weitere Zusätze', 'score': 1},
        {'text': 'Mit Wiederholung des Funkgespäches', 'score': 0}
      ]
    }, {
      'questionText': 'Von welchen Faktoren hängt die Reichweite einer Funkverbindung ab?',
      'answers': [
        {'text': 'Gruppeneinteilung/Kanaleinteilung', 'score': 0},
        {'text': 'Akkuzustand', 'score': 0},
        {'text': 'Bebauung, Geländeform und ggf. Witterung', 'score': 1}
      ]
    }, {
      'questionText': 'Der Sprechfunkverkehr wird eröffnet durch...',
      'answers': [
        {'text': 'die Gegenstelle', 'score': 0},
        {'text': 'den Anruf', 'score': 1},
        {'text': 'den Einsatzleiter', 'score': 0}
      ]
    }, {
      'questionText': 'Welcher Grundsatz ist unter anderem beim Sprechfunkverkehr zu beachten?',
      'answers': [
        {'text': 'Schnell und deutlich sprechen', 'score': 0},
        {'text': 'Nicht zu laut sprechen', 'score': 1},
        {'text': 'Abkürzungen benutzen (Zeitersparnis)', 'score': 0}
      ]
    }, {
      'questionText': 'Am Einsatzort angekommen, stellen Sie fest, dass Sie eine schlechte Verbindung zur Leitstelle haben. Welche Maßnahme ist jetzt richtig?',
      'answers': [
        {'text': 'Ausfall der Relaisfunkstelle/Basisstation über Telefon melden', 'score': 0},
        {'text': 'Standort verändern', 'score': 1},
        {'text': 'Umschalten auf Oberband-Gegenverkehr bzw. eine andere Gruppe', 'score': 0}
      ]
    }, {
      'questionText': 'Eine formlose Nachricht ist...',
      'answers': [
        {'text': 'eine Meldung', 'score': 0},
        {'text': 'eine Durchsage', 'score': 1},
        {'text': 'ein Spruch', 'score': 0}
      ]
    }, {
      'questionText': 'Eine Lagemeldung enthält in der Regel folgende Angaben:',
      'answers': [
        {'text': 'Einsatzort, Lage, Schadenshöhe', 'score': 0},
        {'text': 'Lage, Maßnahmen, Uhrzeit', 'score': 0},
        {'text': 'Einsatzort, Lage, Maßnahmen, Zeit-/Kräftebedarf', 'score': 1}
      ]
    }, {
      'questionText': 'Bei der Durchgabe einer Nachricht hat sich der Sprechfunker versprochen und will den Fehler richtig stellen. Welche Formulierung ist richtig?',
      'answers': [
        {'text': 'Die Verpflegung trifft in einer Stunde - ich berichtige - in einer halben Stunde ein, kommen', 'score': 1},
        {'text': 'Die Verpflegung trifft in einer Stunde - ich verbessere - in einer halben Stunde ein, kommen', 'score': 0},
        {'text': 'Wiederhole - in einer halben Stunde ein, kommen', 'score': 0}
      ]
    }, {
      'questionText': 'Wann ist eine Lagemeldung erforderlich?',
      'answers': [
        {'text': 'Wenn die Lage festgestellt (erkundet) wurde oder sich wesentlich verändert hat', 'score': 1},
        {'text': 'Gleich nach dem Ausrücken', 'score': 0},
        {'text': 'Wenn der Einsatzbefehl hierfür Zeit lässt', 'score': 0}
      ]
    }, {
      'questionText': 'Die Funkalarmierung ist ein Verfahren zum...',
      'answers': [
        {'text': 'Übermittlen von Nachrichtentexten', 'score': 0},
        {'text': 'Alarmieren von Fahrzeugen an der Einsatzstelle', 'score': 0},
        {'text': 'Alarmieren von Führungs- und Einsatzkräften', 'score': 1}
      ]
    }, {
      'questionText': 'Welches ist die richtige Buchstabierweise des Wortes „Duplex”?',
      'answers': [
        {'text': 'Dora-Ulrich-Paula-Ludwig-Emil-Xantippe', 'score': 1},
        {'text': 'Delta-Ulrich-Paula-Ludwig-Erich-Xantippe', 'score': 0},
        {'text': 'Dora-Ulrich-Paul-Ludwig-Emil-Xantippe', 'score': 0}
      ]
    }, {
      'questionText': 'Welche Vorschrift regelt die Durchführung des Sprechfunkverkehrs?',
      'answers': [
        {'text': 'BOS-Funkrichtlinie', 'score': 0},
        {'text': 'PDV 810 / DV 810', 'score': 1},
        {'text': 'Vollzugsbekanntmachung BayFwG', 'score': 0}
      ]
    }, {
      'questionText': 'Nach welchen Gesetzmäßigkeiten breiten sich UKW-Funkwellen aus?',
      'answers': [
        {'text': 'Sie folgen dem Verlauf der Erdkrümmung', 'score': 0},
        {'text': 'Sie breiten sich mit Schallgeschwindigkeit aus', 'score': 0},
        {'text': 'Sie breiten sich fast genauso aus wie Lichtstrahlen', 'score': 1}
      ]
    }, {
      'questionText': 'Eigenhändiges Ändern einer Nachricht ist dem Betriebspersonal...',
      'answers': [
        {'text': 'in Einzelfällen erlaubt', 'score': 0},
        {'text': 'verboten', 'score': 1},
        {'text': 'freigestellt', 'score': 0}
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
      body: _questionIndex < _fragenFunk.length
          ? Quiz(
        questions: _fragenFunk,
        answerQuestions: _answerQuestions,
        questionIndex: _questionIndex,
      )
          : Result(_resetQuiz, _fragenFunk.length,themengebiet,_totalScore, _fragenFunk, _questionIndex,),
    );
  }
}