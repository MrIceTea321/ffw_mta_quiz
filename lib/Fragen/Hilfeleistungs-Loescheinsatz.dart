import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HilfeleistungsLoescheinsatz extends StatefulWidget {
  @override
  _HilfeleistungsLoescheinsatz createState() => _HilfeleistungsLoescheinsatz();
}

class _HilfeleistungsLoescheinsatz extends State<HilfeleistungsLoescheinsatz> with SingleTickerProviderStateMixin {
  var _questionIndex = 0;
  var _totalScore = 0.0;


  String themengebiet="Hilfeleistungs- Löscheinsatz";

  final _fragenHilfeleistungsLoescheinsatz = [
    {
      'questionText': 'Wie ist eine Person, die über tragbare Leitern gerettet werden soll, zu sichern?',
      'answers': [
        {'text': 'Mit Brustbund und Spierenstich als Knotensicherung', 'score': 1},
        {'text': 'Überhaupt nicht, weil das Anlegen von Knoten zu zeitaufwändig ist', 'score': 0},
        {'text': 'Mit doppeltem Ankerstich und Halbschlag zum Hintersichern', 'score': 0}
      ]
    }, {
      'questionText': 'Welche ergänzende persönliche Ausrüstung ist beim Hilfeleistungseinsatz erforderlich?',
      'answers': [
        {'text': 'Vollschutzanzug, Gesichtsschutz', 'score': 0},
        {'text': 'Gesichtsschutz, Infektionsschutzhandschuhe', 'score': 1},
        {'text': 'Schnittschutz (Beinlinge), Infektionsschutzhandschuhe', 'score': 0}
      ]
    },{
      'questionText': 'Wie groß muss der Abstand des Warndreieckes zur Unfallstelle sein, wenn sich der Unfall auf einer Straße mit Gegenverkehr außerhalb geschlossener Ortschaften ereignete?',
      'answers': [
        {'text': 'ca. 50 m', 'score': 0},
        {'text': 'ca. 200 m', 'score': 1},
        {'text': 'ca. 100 m', 'score': 0}
      ]
    },{
      'questionText': 'Warum wird beim Einsatz des B-Strahlrohres der Stützkrümmer verwendet?',
      'answers': [
        {'text': 'Um den Wasserdurchfluss zu vergrößern', 'score': 0},
        {'text': 'Um den Schlauch mit dem Strahlrohr verbinden zu können', 'score': 0},
        {'text': 'Um den Trupp zu entlasten (Verringerung der Rückstoßkräfte)', 'score': 1}
      ]
    },{
      'questionText': 'Wozu dient der Unterflurhydrantenschlüssel?',
      'answers': [
        {'text': 'Öffnen der Hydrantenabdeckung und des Hydranten', 'score': 1},
        {'text': 'Öffnen des Feuerwehrhauses', 'score': 0},
        {'text': 'Öffnen des Fallmantels', 'score': 0}
      ]
    },{
      'questionText': 'Wieviele Steckleiterteile dürfen höchstens zusammengesteckt werden?',
      'answers': [
        {'text': 'Drei Leiterteile', 'score': 0},
        {'text': 'Vier Leiterteile', 'score': 1},
        {'text': 'Sechs Leiterteile', 'score': 0}
      ]
    },{
      'questionText': 'Für welche Rettungshöhe ist ein Sprungpolster (SP16) maximal zugelassen?',
      'answers': [
        {'text': 'max. 8 m', 'score': 0},
        {'text': 'max. 22 m', 'score': 0},
        {'text': 'max. 16 m', 'score': 1}
      ]
    },{
      'questionText': 'Wer ordnet dem Truppführer die zu benutzende Schutzausrüstung an?',
      'answers': [
        {'text': 'Truppführer entscheidet selbst', 'score': 0},
        {'text': 'Eine besondere Anordnung ist nicht notwendig.Jeder weiß selbst, was er tun muss', 'score': 0},
        {'text': 'Der Einheitsführer', 'score': 1}
      ]
    },{
      'questionText': 'Auf was muss beim Aufstellen einer tragbaren Leiter u.a. geachtet werden?',
      'answers': [
        {'text': 'Auf einen Anstellwinkel von 15°', 'score': 0},
        {'text': 'Dass sie so nahe wie möglich an das Gebäudegerückt wird', 'score': 0},
        {'text': 'Auf einen festen Standplatz', 'score': 1}
      ]
    },{
      'questionText': 'In welchem Anstellwinkel soll eine tragbare Leiter aufgestellt werden?',
      'answers': [
        {'text': '45° - 65°', 'score': 0},
        {'text': 'Immer 90°', 'score': 0},
        {'text': '65° - 75°', 'score': 1}
      ]
    },{
      'questionText': 'Mit welchen Knoten soll eine Schlauchleitung mit Strahlrohr befestigt werden, um sie in ein Obergeschoss hochzuziehen?',
      'answers': [
        {'text': 'Kreuzknoten', 'score': 0},
        {'text': 'Schotenstich mit Halbschlag', 'score': 0},
        {'text': 'Mastwurf und Halbschlag', 'score': 1}
      ]
    },{
      'questionText': 'Was müssen sie als Truppführer beim Aufstellen einer tragbaren Leiter u. a. beachten?',
      'answers': [
        {'text': 'Fußteil so nahe wie möglich an das Gebäude', 'score': 0},
        {'text': 'Leiterkopf darf nicht über den Einstieg (z. B. Fenster) hinausragen', 'score': 0},
        {'text': 'Leiter grundsätzlich immer sichern', 'score': 1}
      ]
    },{
      'questionText': 'Wie viele Einsatzkräfte werden benötigt, um eine 4-teilige Steckleiter aufzustellen?',
      'answers': [
        {'text': 'Zwei Personen', 'score': 0},
        {'text': 'Eine Staffelbesatzung', 'score': 0},
        {'text': 'Drei oder vier Personen', 'score': 1}
      ]
    },{
      'questionText': 'Der Einheitsführer befiehlt ihrem Trupp mit einem Pulverlöscher im Freien einen Brand zu löschen. Was ist zu beachten?',
      'answers': [
        {'text': 'Feuer gegen die Windrichtung angreifen', 'score': 0},
        {'text': 'Feuer seitlich angreifen', 'score': 0},
        {'text': 'Feuer in Windrichtung angreifen', 'score': 1}
      ]
    },{
      'questionText': 'Zur Rettung und Sicherung wird ein Brustbund angelegt.Welche Knoten/Stiche werden zur Sicherungverwendet?',
      'answers': [
        {'text': 'Zimmermannsschlag', 'score': 0},
        {'text': 'Doppelschlinge und Halbschlag', 'score': 0},
        {'text': 'Pfahlstich und Spierenstich bzw. Pfahlstich und Kreuzschlag', 'score': 1}
      ]
    },{
      'questionText': 'Es wird die Rettung einer Person über die Steckleiterbefohlen. Welche Leine darf zur Sicherung der Personverwendet werden?',
      'answers': [
        {'text': 'Mehrzweckleine', 'score': 0},
        {'text': 'Alle Leinen', 'score': 0},
        {'text': 'Feuerwehrleine', 'score': 1}
      ]
    },{
      'questionText': 'Für welche Einsatzmöglichkeiten findet die Brechstange Anwendung?',
      'answers': [
        {'text': 'Um eine Kraft abzufedern', 'score': 0},
        {'text': 'Um Kraft und Weg zu sparen', 'score': 0},
        {'text': 'Verwendung als Hebel', 'score': 1}
      ]
    },{
      'questionText': 'Mit welcher Gangart können tragbare Leitern nach FwDV 10 „Tragbare Leiter” bestiegen werden?',
      'answers': [
        {'text': 'Erlaubt ist nur der Kreuzgang, wobei die Sprossen im Klammergriff zu umfassen sind', 'score': 0},
        {'text': 'Im Pass- oder Kreuzgang, wobei die Holme im Klammergriff zu umfassen sind', 'score': 0},
        {'text': 'Im Pass- oder Kreuzgang, wobei die Sprossen im Klammergriff zu umfassen sind', 'score': 1}
      ]
    },{
      'questionText': 'Welche Schaltmöglichkeiten müssen bei einem genormten Hohlstrahlrohr gegeben sein?',
      'answers': [
        {'text': 'Sprühstrahl und Vollstrahl, Einstellmöglichkeit der Wasserstrahlform', 'score': 0},
        {'text': 'Durchflussmengeneinstellung, Strahlrohr auf/zu', 'score': 0},
        {'text': 'Strahlrohr auf/zu, Einstellmöglichkeit der Wasserstrahlform und Durchflussmengeneinstellung', 'score': 1}
      ]
    },{
      'questionText': 'Welche Schaltstellungen besitzt ein Mehrzweckstrahlrohr?',
      'answers': [
        {'text': 'Mittelstrahl, Strahlrohr zu/auf', 'score': 0},
        {'text': 'Sprühstrahl, Strahlrohr auf/zu', 'score': 0},
        {'text': 'Strahlrohr zu, Sprühstrahl, Vollstrahl', 'score': 1}
      ]
    },{
      'questionText': 'Sie haben als Trupp den Auftrag mit einem Pulverlöscher einen Flüssigkeitsbrand zu bekämpfen. Auf was haben sie zu achten?',
      'answers': [
        {'text': 'Der Löschstrahl sollte direkt in die brennende Flüssigkeitgeführt werden', 'score': 0},
        {'text': 'Sich möglichst nahe an den Brandherd annähern', 'score': 0},
        {'text': 'Den Löschstrahl nicht direkt in, sondern fächerförmig über die brennende Flüssigkeit verteilen', 'score':1}
      ]
    },{
      'questionText': 'Darf der vorgehende Trupp die Steckleiter selbst sichern?',
      'answers': [
        {'text': 'Nein, grundsätzlich nicht', 'score': 0},
        {'text': 'Nein, der Trupp wartet, bis der Melder oder ein Sicherungstrupp kommt', 'score': 0},
        {'text': 'Ja, der Truppmann sichert und der Truppführersteigt auf. Danach sichert der Truppführer und der Truppmann steigt auf', 'score': 1}
      ]
    },{
      'questionText': 'Wer kann eine Abweichung von der persönlichen Schutzausrüstung anordnen?',
      'answers': [
        {'text': 'Der Truppführer', 'score': 0},
        {'text': 'Jeder im Trupp trifft seine eigene Entscheidung', 'score': 0},
        {'text': 'Nur der Einheitsführer', 'score': 1}
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
      body: _questionIndex < _fragenHilfeleistungsLoescheinsatz.length
          ? Quiz(
        questions: _fragenHilfeleistungsLoescheinsatz,
        answerQuestions: _answerQuestions,
        questionIndex: _questionIndex,
      )
          : Result(_resetQuiz, _fragenHilfeleistungsLoescheinsatz.length,themengebiet,_totalScore, _fragenHilfeleistungsLoescheinsatz, _questionIndex,),
    );
  }
}