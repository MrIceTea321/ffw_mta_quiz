import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rechtsgrundlagen extends StatefulWidget {
  @override
  _Rechtsgrundlagen createState() => _Rechtsgrundlagen();
  }

  class _Rechtsgrundlagen extends State<Rechtsgrundlagen> with SingleTickerProviderStateMixin {
    var _questionIndex = 0;
    var _totalScore = 0.0;


    String themengebiet="Rechtsgrundlagen";

    final _fragenRechtsgrundlagen = [
      {
        'questionText': 'Mit welchem Gesetz wird das Feuerwehrwesen in Bayern geregelt?',
        'answers': [
          {'text': 'Bayerisches Katastrophenschutzgesetz', 'score': 0},
          {'text': 'Bayerisches Feuerwehrgesetz', 'score': 1},
          {'text': 'Schornsteinfegergesetz', 'score': 0}
        ]
      }, {
        'questionText': 'Was zählt zu den Pflichtaufgaben der Feuerwehr?',
        'answers': [
          {'text': 'Anbringen von Dekorationen', 'score': 0},
          {'text': 'Brandbekämpfung und technische Hilfeleistung', 'score': 1},
          {'text': 'Auspumpen von Baugruben', 'score': 0}
        ]
      },
      {
        'questionText': 'Wer hat für die ordnungsgemäße Ausrüstung der Feuerwehr zu sorgen?',
        'answers': [
          {'text': 'Gemeinde', 'score': 1},
          {'text': 'Landkreis', 'score': 0},
          {'text': 'Feuerwehrverein', 'score': 0}
        ]
      },
      {
        'questionText': 'Ab wann dürfen Feuerwehranwärter an Einsätzen teilnehmen?',
        'answers': [
          {'text': 'Truppführerausbildung muss abgeschlossen sein', 'score': 0},
          {'text': 'Basismodul muss abgeschlossen sein; Alter mindestens 16 Jahre; Kommandant muss zustimmen', 'score': 1},
          {'text': 'Gruppenführerlehrgang muss erfolgreich abgeschlossen sein', 'score': 0}
        ]
      },
      {
        'questionText': 'Welche Pflicht besteht für Feuerwehrdienstleistende bei Alarm?',
        'answers': [
          {'text': 'Unverzüglich am Gerätehaus einfinden', 'score': 1},
          {'text': 'Rückruf bei der Leitstelle', 'score': 0},
          {'text': 'Melden bei der Gemeindeverwaltung', 'score': 0}
        ]
      },
      {
        'questionText': 'Wer übernimmt die Lohnfortzahlung eines Arbeitnehmers bei einem Feuerwehreinsatz während der Arbeitszeit?',
        'answers': [
          {'text': 'Feuerwehr', 'score': 0},
          {'text': 'Landkreis', 'score': 0},
          {'text': 'Arbeitgeber', 'score': 1}
        ]
      },
      {
        'questionText': 'Wer ist für die Ernennung von Dienstgraden in der Feuerwehr zuständig?',
        'answers': [
          {'text': 'Bürgermeister', 'score': 0},
          {'text': 'Kommandant', 'score': 1},
          {'text': 'Vorstand der Freiwilligen Feuerwehr', 'score': 0}
        ]
      },
      {
        'questionText': 'Wozu ist jeder Bürger bei Wahrnehmung eines Brandes verpflichtet?',
        'answers': [
          {'text': 'Hat keine Verpflichtung', 'score': 0},
          {'text': 'Muss nur Löschversuche unternehmen', 'score': 0},
          {'text': 'Melden und Löschversuch unternehmen', 'score': 1}
        ]
      },
      {
        'questionText': 'Was ist bei Dienstverhinderung zu veranlassen?',
        'answers': [
          {'text': 'Es ist nichts zu veranlassen', 'score': 0},
          {'text': 'Entschuldigung beim Kommandanten oder nächsten Vorgesetzten', 'score': 1},
          {'text': 'Kreisbrandrat ist zu verständigen', 'score': 0}
        ]
      },
      {
        'questionText': 'Das Mindestalter für die Aufnahme in die Freiwillige Feuerwehr als gemeindliche Einrichtung beträgt?',
        'answers': [
          {'text': '12 Jahre', 'score': 0},
          {'text': '14 Jahre', 'score': 1},
          {'text': '16 Jahre', 'score': 0}
        ]
      },
      {
        'questionText': 'Bei welchem Versicherungsträger sind Feuerwehrdienstleistende gegen Körperschäden versichert?',
        'answers': [
          {'text': 'Berufsgenossenschaft Glas- und Keramik', 'score': 1},
          {'text': 'Haftpflichtversicherung der Gemeinde', 'score': 0},
          {'text': 'Kommunale Unfallversicherung Bayern', 'score': 0}
        ]
      },
      {
        'questionText': 'Wer ist bei der Wahl des Kommandanten wahlberechtigt?',
        'answers': [
          {'text': 'Alle Feuerwehrdienstleistenden und Feuerwehranwärter ab 16 Jahre', 'score': 1},
          {'text': 'Alle Vereinsangehörigen', 'score': 0},
          {'text': 'Nur die Führungsdienstgrade', 'score': 0}
        ]
      },
      {
        'questionText': ' Welche Arten von Feuerwehren nennt das Bayerische Feuerwehrgesetz?',
        'answers': [
          {'text': 'Bundesbahnfeuerwehr, Freiwillige Feuerwehr, Berufsfeuerwehr', 'score': 0},
          {'text': 'Flughafenfeuerwehr, Betriebsfeuerwehr, Freiwillige Feuerwehr', 'score': 0},
          {'text': 'Freiwillige Feuerwehr, Pflichtfeuerwehr, Berufsfeuerwehr, Werkfeuerwehr', 'score': 1}
        ]
      },
      {
        'questionText': 'Rechte des Feuerwehrdienstleistenden sind:',
        'answers': [
          {'text': 'Lohnfortzahlung durch Arbeitgeber; Versicherungsschutz bei Personen- und Sachschäden; Freistellung bei Einsätzen', 'score': 1},
          {'text': 'Teilnahme am Dienst nur dann, wenn er Zeit hat', 'score': 0},
          {'text': 'Anspruch auf Platz im Feuerwehrerholungsheim', 'score': 0}
        ]
      },
      {
        'questionText': 'Welche besonderen Aufgaben hat der Truppführer bei Anwendung der Unfallverhütungsvorschriften?',
        'answers': [
          {'text': 'Der Truppführer muss prüfen, welche Bestimmungen der Unfallverhütungsvorschriften den Trupp betreffen', 'score': 1},
          {'text': 'Keine, jeder im Trupp achtet auf sich selbst', 'score': 0},
          {'text': 'Keine, weil beide im Trupp das Gleiche tun', 'score': 0}
        ]
      },
      {
        'questionText': 'Die Unfallverhütungsvorschrift (UVV) - Feuerwehren hat Gültigkeit...',
        'answers': [
          {'text': 'bei Einhaltung der Versicherungsbedingungen', 'score': 0},
          {'text': 'nur bei Einsätzen', 'score': 0},
          {'text': 'bei Einsätzen, Übungen und Ausbildung', 'score': 1}
        ]
      },
      {
        'questionText': 'Sie bemerken als Truppführer, dass ihr Truppmann die B-Druckschläuche falsch auswirft. Bis jetzt hat er sich noch nicht verletzt. Wie handeln sie?',
        'answers': [
          {'text': 'Ich muss ihn auf das fachgerechte Auswerfen hinweisen und überwachen', 'score': 1},
          {'text': 'Er hat das richtige Auswerfen in seiner Ausbildung gelernt und muss nun seine Erfahrungen machen', 'score': 0},
          {'text': 'Es ist ja noch nichts passiert, außerdem ist es Aufgabe des Einheitsführers etwas zu sagen', 'score': 0}
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
          body: _questionIndex < _fragenRechtsgrundlagen.length
              ? Quiz(
              questions: _fragenRechtsgrundlagen,
              answerQuestions: _answerQuestions,
              questionIndex: _questionIndex,
               )
              : Result(_resetQuiz, _fragenRechtsgrundlagen.length,themengebiet,_totalScore, _fragenRechtsgrundlagen, _questionIndex,),
        );
    }
  }