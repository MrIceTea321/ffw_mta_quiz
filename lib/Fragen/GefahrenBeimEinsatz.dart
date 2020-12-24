import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GefahrenBeimEinsatz extends StatefulWidget {
  @override
  _GefahrenBeimEinsatz createState() => _GefahrenBeimEinsatz();
}

class _GefahrenBeimEinsatz extends State<GefahrenBeimEinsatz> with SingleTickerProviderStateMixin {
  var _questionIndex = 0;
  var _totalScore = 0.0;


  String themengebiet="Einsatzhygiene";

  final _fragenGefahrenBeimEinsatz = [
    {
      'questionText': 'Welche Faktoren können die persönliche Einsatzfähigkeit negativ beeinflussen?',
      'answers': [
        {'text': 'Ausreichend Schlaf', 'score': 0},
        {'text': 'Krankheit, Alkohol, Rauschmittel', 'score': 1},
        {'text': 'Guter Gesundheitszustand', 'score': 0}
      ]
    },  {
      'questionText': 'Worauf achten Sie bei Fahrzeugen, die zum Einsatz aus der Fahrzeughalle fahren?',
      'answers': [
        {'text': 'Vollständige Besatzung', 'score': 0},
        {'text': 'Nicht auf bereits anfahrende Fahrzeuge aufspringen', 'score': 1},
        {'text': 'Atemschutzgeräte bereits in der Fahrzeughalle', 'score': 0}
      ]
    }, {
      'questionText': 'Warum müssen Sie ihrem Einheitsführer bei der Mannschaftseinteilung während der Anfahrt mitteilen, wenn ihre Einsatzbereitschaft z. B. durch eine Erkältungbeeinträchtigt ist?',
      'answers': [
        {'text': 'Ich muss es dem Einheitsführer nicht mitteilen, weil ich erwarten kann, dass er meine verminderte Einsatzfähigkeit selbst erkennt', 'score': 0},
        {'text': 'Nur so kann der Einheitsführer die Einsatzfähigkeit jedes Feuerwehrdienstleistenden bei der Einteilung berücksichtigent', 'score': 1},
        {'text': 'Damit er Sie nicht als Gruppenführer einteilt', 'score': 0}
      ]
    }, {
      'questionText': 'Zu welcher Fahrzeugseite hin wird die Mannschaft bei Eintreffen an der Einsatzstelle im Regelfall absitzen, wenn der Einheitsführer keine anderen Anweisungen gibt?',
      'answers': [
        {'text': 'Zur verkehrszugewandten Seite', 'score': 0},
        {'text': 'Zur verkehrsabgewandten Seite', 'score': 1},
        {'text': 'Alle Feuerwehrdienstleistenden steigen auf der ihrem Sitzplatz nächstgelegenen Fahrzeugseite aus', 'score': 0}
      ]
    }, {
      'questionText': 'Wie verhalten Sie sich, wenn Sie den Einsatzbefehl des Einheitsführers nicht richtig verstanden haben?',
      'answers': [
        {'text': 'Ich bestätige mit „Verstanden Ende!“', 'score': 0},
        {'text': 'Ich frage beim Einheitsführer nach', 'score': 1},
        {'text': 'Ich verzichte auf die Wiederholung des Einsatzbefehls', 'score': 0}
      ]
    }, {
      'questionText': 'Welche Einsatzgrundsätze gelten beim Vorgehen eines Angriffstrupps?',
      'answers': [
        {'text': 'Trupp teilt sich immer auf und jeder führt seine Aufgaben durch', 'score': 0},
        {'text': 'Trupp bleibt zusammen und beachtet die Eigensicherung', 'score': 1},
        {'text': 'Nur der Truppmann gibt Rückmeldung an den Einheitsführer', 'score': 0}
      ]
    }, {
      'questionText': 'Wie verhalten Sie sich als Truppführer, wenn Einsturzgefahr besteht?',
      'answers': [
        {'text': 'Ein Hinweis an den Einheitsführer ist ausreichend', 'score': 0},
        {'text': 'Hinweis an den Truppmann geben, im Trupp Schutz unter besonders standfesten Gebäudeteilen suchen, Rückzugsweg sicherstellen, Meldung an den Einheitsführer', 'score': 1},
        {'text': 'Ein Hinweis an den Truppmann ist ausreichend', 'score': 0}
      ]
    }, {
      'questionText': 'An der Einsatzstelle ertönt das Signal „Gefahr – Alles zurück!“ Wie verhalten Sie sich?',
      'answers': [
        {'text': 'Es reicht völlig aus, wenn ich nur das Signal wiederhole', 'score': 0},
        {'text': 'Signal wiederholen, Sammelplatz am Fahrzeug aufsuchen,Meldung beim Einheitsführer', 'score': 1},
        {'text': 'Ich gehe mit meinem Trupp zum Rettungswagen (RTW)', 'score': 0}
      ]
    }, {
      'questionText': 'Warum wird nach Einsätzen eine Einsatznachbesprechung durchgeführt?',
      'answers': [
        {'text': 'Um Truppführer, die sich falsch verhalten haben, vor der gesamten Mannschaft zu tadeln', 'score': 0},
        {'text': 'Um Fremd- und Eigenfehler zu erkennen, das Einsatzgeschehen zu verbessern und belastende Situationen zu erkennen', 'score': 1},
        {'text': 'Um die Einsatzdauer zu erhöhen', 'score': 0}
      ]
    }, {
      'questionText': 'Wie verhalten Sie sich als Wassertruppmann beim Eintreffen an der Einsatzstelle?',
      'answers': [
        {'text': 'Ich springe sofort aus dem Fahrzeug und suche eine Wasserentnahmestelle, denn Wasser wird für den Feuerwehreinsatz immer dringend benötigt', 'score': 0},
        {'text': 'Auf den Einsatzbefehl des Einheitsführer warten, Ruhe bewahren und keine unüberlegten Aktionen durchführen', 'score': 1},
        {'text': 'Ich trete in jedem Fall hinter dem Fahrzeug an', 'score': 0}
      ]
    }, {
      'questionText': 'Was versteht man unter Kontamination?',
      'answers': [
        {'text': 'Reinigung der Oberfläche von Lebewesen, des Bodens, von Gewässern und Gegenständen bei Verunreinigung mit ABC-Gefahrstoffen', 'score': 0},
        {'text': 'Verunreinigung der Oberfläche von Lebewesen,des Bodens, von Gewässern und Gegenständenmit ABC-Gefahrstoffen', 'score': 1},
        {'text': 'Aufnahme von Schadstoffen in den Körper, zum Beispiel über die Atemwege', 'score': 0}
      ]
    }, {
      'questionText': 'Was versteht man unter Inkorporation?',
      'answers': [
        {'text': 'Reinigung der Oberfläche von Lebewesen, des Bodens, von Gewässern und Gegenständen bei Verunreinigung mit ABC-Gefahrstoffen', 'score': 0},
        {'text': 'Aufnahme von Schadstoffen in den Körper, zum Beispiel über die Atemwege oder bei der Nahrungsaufnahme', 'score': 1},
        {'text': 'Verunreinigung der Oberfläche von Lebewesen, des Bodens, von Gewässern und Gegenständen mit ABC-Gefahrstoffen', 'score': 0}
      ]
    }, {
      'questionText': 'Wie erfolgt die Übertragung von Krankheitserregern bei einer Tröpfcheninfektion?',
      'answers': [
        {'text': 'Durch den Kontakt mit Körperflüssigkeiten eines Verletzten (z. B. Blut, Erbrochenes)', 'score': 0},
        {'text': 'Durch Husten, Niesen oder Ansprechen', 'score': 1},
        {'text': 'Durch Tragen von Infektionsschutzhandschuhen', 'score': 0}
      ]
    }, {
      'questionText': 'Wie werden Kanülen nach Gebrauch entsorgt?',
      'answers': [
        {'text': 'Zusammen mit dem Schrott der Unfallfahrzeuge', 'score': 0},
        {'text': 'Entsorgung in speziellen Behältern (Spritzenabwurf)', 'score': 1},
        {'text': 'Die Entsorgung ist ausschließlich Aufgabe des Rettungsdienstes', 'score': 0}
      ]
    }, {
      'questionText': 'Warum wird der Einheitsführer versuchen, die Anzahl der Einsatzkräfte im Gefahrenbereich auf das erforderliche Mindestmaß reduzieren?',
      'answers': [
        {'text': 'Damit alle gleichmäßig mit Arbeit belastet werden', 'score': 0},
        {'text': 'Um die Infektionsgefahr und Eigengefährdung der Einsatzkräfte zu verringern', 'score': 1},
        {'text': 'Um die notwendige Lohnfortzahlung im Einsatzfall möglichst gering zu halten', 'score': 0}
      ]
    }, {
      'questionText': 'Wie werden stark verschmutzte Geräte nach Einsatzende von der Einsatzstelle zum Feuerwehrhaus transportiert?',
      'answers': [
        {'text': 'Im Mannschaftsraum des Löschfahrzeugs', 'score': 0},
        {'text': 'In einem Kunststoffsack oder einem dichtschließenden Behälter verpackt', 'score': 1},
        {'text': 'Durch Fahrzeuge des Rettungsdienstes, da diese regelmäßig desinfizieret werden', 'score': 0}
      ]
    }, {
      'questionText': 'Worauf ist bei Einsturzgefahr besonders zu achten?',
      'answers': [
        {'text': 'Trümmerschatten beachten', 'score': 1},
        {'text': 'Ergänzende persönliche Schutzausrüstung tragen', 'score': 0},
        {'text': 'Windrichtung beachten', 'score': 0}
      ]
    }, {
      'questionText': 'Wie kann ich mich vor der Gefahr durch Erkrankung/ Ansteckung schützen?',
      'answers': [
        {'text': 'Immer Atemschutz tragen', 'score': 0},
        {'text': 'Schnittschutzkleidung tragen', 'score': 0},
        {'text': 'Beim Umgang mit Verletzten Infektionsschutzhandschuhe tragen', 'score': 1}
      ]
    },{
      'questionText': 'Welche Abstände sind von Spannung führenden Teilen beim Einsatz von CM-Strahlrohren zu halten?',
      'answers': [
        {'text': '1 m für Sprühstrahl bei Niederspannung und 10 m für Vollstrahl bei Hochspannung', 'score': 1},
        {'text': 'Entsprechend der Wurfweite des Strahlrohres', 'score': 0},
        {'text': 'Wasser darf im Bereich der elektrischen Anlagen nicht eingesetzt werden', 'score': 0}
      ]
    },{
      'questionText': 'Welche Gefahr fehlt im folgenden Merkschema für die Gefahren der Einsatzstelle? Atemgifte, Angstreaktionen, Atomare Gefahren, Ausbreitung, Chemische Stoffe, Erkrankung, Explosion, Einsturz',
      'answers': [
        {'text': 'Elektrizität', 'score': 1},
        {'text': 'Ertrinken', 'score': 0},
        {'text': 'Absturz', 'score': 0}
      ]
    },{
      'questionText': 'Wie lässt sich die Strahlenbelastung bei atomaren Gefahren verringern?',
      'answers': [
        {'text': 'Abstand halten, Einsatzzeit begrenzen, Abschirmung nutzen', 'score': 1},
        {'text': 'An der Einsatzstelle trinken, essen und rauchen', 'score': 0},
        {'text': 'Mit Wasser-Sprühstrahl eine „Hydrowand” aufbauen', 'score': 0}
      ]
    },{
      'questionText': 'Wie kann sich der Angriffstrupp vor der Gefahr durch Brandausbreitung schützen?',
      'answers': [
        {'text': 'Nur mit Wasser am Rohr vorgehen', 'score': 1},
        {'text': 'Schnell und ohne Sicherung der Rückzugswege zum Brandherd vordringen, um die Ausbreitungszeit zu begrenzen', 'score': 0},
        {'text': 'Nur unter umluftunabhängigem Atemschutz vorgehen', 'score': 0}
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
      body: _questionIndex < _fragenGefahrenBeimEinsatz.length
          ? Quiz(
        questions: _fragenGefahrenBeimEinsatz,
        answerQuestions: _answerQuestions,
        questionIndex: _questionIndex,
      )
          : Result(_resetQuiz, _fragenGefahrenBeimEinsatz.length,themengebiet,_totalScore, _fragenGefahrenBeimEinsatz, _questionIndex,),
    );
  }
}