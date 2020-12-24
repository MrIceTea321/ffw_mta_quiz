import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Geraetekunde extends StatefulWidget {
  @override
  _Geraetekunde createState() => _Geraetekunde();
}

class _Geraetekunde extends State<Geraetekunde> with SingleTickerProviderStateMixin {
  var _questionIndex = 0;
  var _totalScore = 0.0;


  String themengebiet="Gerätekunde";

  final _fragenGeraetekunde = [
    {
      'questionText': ' Welche ergänzende Schutzausrüstung kann der Einheitsführer bei Einsätzen mit gefährlichen Stoffen anordnen?',
      'answers': [
        {'text': 'Schutzanzug Bayern 2000', 'score': 0},
        {'text': 'Feuerwehrhelm', 'score': 0},
        {'text': 'Pressluftatmer', 'score': 1}
      ]
    }, {
      'questionText': ' Welche Schutzhandschuhe sind bei der Behandlung von Verletzten zu verwenden?',
      'answers': [
        {'text': 'Infektionsschutzhandschuhe', 'score': 1},
        {'text': '5-Finger-Lederhandschuhe mit langen Stulpen und Verstärkungen', 'score': 0},
        {'text': 'Mineralölbeständige Schutzhandschuhe', 'score': 0}
      ]
    },
    {
      'questionText': 'Wozu dient die Kübelspritze?',
      'answers': [
        {'text': 'Zum Löschen eines Großbrandes', 'score': 0},
        {'text': 'Zum Ablöschen von Brandnestern und Entstehungsbränden', 'score': 1},
        {'text': 'Zum Löschen von Benzinbränden', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche Funktionsart kennt man bei tragbaren Feuerlöschern?',
      'answers': [
        {'text': 'Durchladelöscher', 'score': 0},
        {'text': 'Dauerdrucklöscher', 'score': 1},
        {'text': 'Überdrucklöscher', 'score': 0}
      ]
    },
    {
      'questionText': 'Was ist nach Beendigung des Einsatzes bei tragbaren Feuerlöschern (Pulver) zu beachten?',
      'answers': [
        {'text': 'Wenn der Feuerlöscher nur teilweise entleert wurde, kann er ohne weitere Überprüfung wieder für den nächsten Einsatz benutzt werden', 'score': 0},
        {'text': 'Feuerlöscher auf den Kopf stellen und drucklos machen', 'score': 1},
        {'text': 'Alle tragbaren Feuerlöscher sind Einweg-Geräte und müssen nach dem Einsatz fachgerecht entsorgt werden', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche Schläuche werden bei der Wasserentnahme aus Hydranten verwendet?',
      'answers': [
        {'text': 'Druckschläuche', 'score': 1},
        {'text': 'Saugschläuche', 'score': 0},
        {'text': 'Mineralölbeständige Schläuche', 'score': 0}
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
      'questionText': 'Wozu findet das Standrohr Verwendung?',
      'answers': [
        {'text': 'Zur Wasserentnahme aus Überflurhydranten', 'score': 0},
        {'text': 'Zur Wasserentnahme aus Löschwasserbehältern', 'score': 0},
        {'text': 'Zur Wasserentnahme aus Unterflurhydranten', 'score': 1}
      ]
    },
    {
      'questionText': 'Armaturen zur Löschmittelfortleitung sind:',
      'answers': [
        {'text': 'Strahlrohre', 'score': 0},
        {'text': 'Sammelstück, Verteiler, Stützkrümmer', 'score': 1},
        {'text': 'Saugkorb, Standrohr', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche Längen haben B-Druckschläuche nach gültiger Norm?',
      'answers': [
        {'text': '15, 20 und 30 m', 'score': 0},
        {'text': '5, 15 und 35 m', 'score': 0},
        {'text': '5, 20 und 35 m', 'score': 1}
      ]
    },
    {
      'questionText': 'Warum sind Hohlstrahlrohre für den Innenangriff anstelle von Mehrzweckstrahlrohren zu bevorzugen?',
      'answers': [
        {'text': 'Hohlstrahlrohre sind teurer', 'score': 1},
        {'text': 'Mit Hohlstrahlrohren lässt sich eine bessere Kühl- und Löschwirkung erzielen', 'score': 0},
        {'text': 'Hohlstrahlrohre besitzen keine Spülstellung', 'score': 0}
      ]
    },
    {
      'questionText': ' Welche maximale Steighöhe kann in der Regel mit vier Steckleiterteilen erreicht werden?',
      'answers': [
        {'text': '2. Obergeschoss', 'score': 1},
        {'text': '1. Obergeschoss', 'score': 0},
        {'text': '3. Obergeschoss', 'score': 0}
      ]
    },
    {
      'questionText': 'Wo darf eine Feuerwehrleine nicht eingesetzt werden?',
      'answers': [
        {'text': 'Zum Hochziehen von Geräten', 'score': 0},
        {'text': 'Zum Einbinden von Verletzten auf einer Trage', 'score': 0},
        {'text': 'Zum Sichern gegen Absturz, wenn ein freier Fall nicht auszuschließen ist', 'score': 1}
      ]
    },
    {
      'questionText': 'Wozu dient die Tauchpumpe?',
      'answers': [
        {'text': 'Zur Luftversorgung für Taucher', 'score': 0},
        {'text': 'Zum Fördern von brennbaren Flüssigkeiten', 'score': 0},
        {'text': 'Zum Auspumpen überfluteter Keller, Schächte, Gruben und Behälter', 'score': 1}
      ]
    },
    {
      'questionText': 'Worauf ist bei der Inbetriebnahme eines Unterflurhydrantenzu achten?',
      'answers': [
        {'text': 'Bei Frostgefahr die Straßenkappe mit Sand füllen', 'score': 0},
        {'text': 'Es ist immer eine Wasseruhr am Standrohr anzubringen', 'score': 0},
        {'text': 'Beim Setzen des Standrohres muss die Klauenmutter ganz nach unten geschraubt sein', 'score': 1}
      ]
    },
    {
      'questionText': 'Wann ist Feuerwehrschutzschuhwerk zu tragen?',
      'answers': [
        {'text': 'Beim Feuerwehrfest', 'score': 0},
        {'text': 'Im Unterricht', 'score': 0},
        {'text': 'Bei Einsätzen und Übungen', 'score': 1}
      ]
    },
    {
      'questionText': 'Welche Einsatzgrundsätze für tragbare Feuerlöscher sind richtig?',
      'answers': [
        {'text': 'Nach Möglichkeit mehrere Löscher gleichzeitig einsetzen', 'score': 1},
        {'text': 'Alle Brände von oben nach unten löschen', 'score': 0},
        {'text': 'Feuer gegen die Windrichtung angreifen', 'score': 0}
      ]
    },
    {
      'questionText': 'Wie groß ist die Wasserabgabe bei CM-Strahlrohren mit Mundstück bei einem Strahlrohrdruckvon ca. 5 bar?',
      'answers': [
        {'text': 'ca. 200 l/min', 'score': 0},
        {'text': 'ca. 100 l/min', 'score': 1},
        {'text': 'ca. 400 l/min', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche Behandlung von Druckschläuchen nach dem Gebrauch (Einsatz) ist richtig?',
      'answers': [
        {'text': 'Nach jedem Gebrauch reinigen und trocknen', 'score': 1},
        {'text': 'Nasse Schläuche doppelt rollen', 'score': 0},
        {'text': 'Schläuche zum Trocknen in die Sonne legen', 'score': 0}
      ]
    },
    {
      'questionText': 'Wie viele C-Schläuche befinden sich in der Regel in einem Schlauchtragekorb?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '3', 'score': 1},
        {'text': '4', 'score': 0}
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
      body: _questionIndex < _fragenGeraetekunde.length
          ? Quiz(
        questions: _fragenGeraetekunde,
        answerQuestions: _answerQuestions,
        questionIndex: _questionIndex,
      )
          : Result(_resetQuiz, _fragenGeraetekunde.length,themengebiet,_totalScore, _fragenGeraetekunde, _questionIndex,),
    );
  }
}