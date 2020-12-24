import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loescheinsatz extends StatefulWidget {
  @override
  _Loescheinsatz createState() => _Loescheinsatz();
}

class _Loescheinsatz extends State<Loescheinsatz> with SingleTickerProviderStateMixin {
  var _questionIndex = 0;
  var _totalScore = 0.0;


  String themengebiet="Löscheinsatz";

  final _fragenLoescheinsatz = [
    {
      'questionText': 'Welcher Trupp stellt in der Regel die Wasserversorgung zwischen Löschfahrzeug und Wasserentnahme her?',
      'answers': [
        {'text': 'Wassertrupp', 'score': 1},
        {'text': 'Angriffstrupp', 'score': 0},
        {'text': 'Schlauchtrupp', 'score': 0}
      ]
    },  {
      'questionText': 'Mit welcher Ausrüstung geht der Angriffstrupp bei einem Brandeinsatz (Außenangriff) im Regelfall vor?',
      'answers': [
        {'text': 'Pulverlöscher', 'score': 0},
        {'text': 'Kübelspritze und C-Schlauch', 'score': 0},
        {'text': 'Strahlrohr, Schlauchhalter, Beleuchtungsgerät', 'score': 1}
      ]
    }, {
      'questionText': 'Wo wird am Verteiler das 2. C-Rohr angeschlossen (in Fließrichtung des Wassers betrachtet)?',
      'answers': [
        {'text': 'links', 'score': 0},
        {'text': 'rechts', 'score': 1},
        {'text': 'mittig', 'score': 0}
      ]
    }, {
      'questionText': 'Nach dem Kommando „Gefahr - Alle sofort zurück!“ sammeln sich die Einsatzkräfte…',
      'answers': [
        {'text': 'am Verteiler', 'score': 0},
        {'text': 'bei der Einsatzleitung', 'score': 0},
        {'text': 'am Feuerwehrfahrzeug', 'score': 1}
      ]
    }, {
      'questionText': 'Welche Angaben sind auf dem Hinweisschild zu einem Unterflurhydranten enthalten?',
      'answers': [
        {'text': 'Betriebsdruck und Wasserlieferung', 'score': 0},
        {'text': 'Position des Hydranten und Durchmesser der Wasserleitung', 'score': 1},
        {'text': 'Zuständiger Wasserwart und Position des Hydranten', 'score': 0}
      ]
    }, {
      'questionText': 'Wer kuppelt bei einer Gruppe, bei der Wasserentnahme aus offenen Gewässern, die Saugleitung?',
      'answers': [
        {'text': 'Angriffstrupp, der Wassertrupp unterstützt', 'score': 0},
        {'text': 'Schlauchtrupp, der Wassertrupp unterstützt', 'score': 0},
        {'text': 'Wassertrupp, der Schlauchtrupp unterstützt', 'score': 1}
      ]
    }, {
      'questionText': 'In welcher Reihenfolge wird die Wasserversorgung bei Löschfahrzeugen mit Löschwasserbehälter (z. B. LF 20) verlegt?',
      'answers': [
        {'text': 'Zuerst von der Wasserentnahmestelle zum Löschfahrzeug und danach zum Verteiler', 'score': 0},
        {'text': 'Keine Festlegung, da der Arbeitsaufwand gleich ist', 'score': 0},
        {'text': 'Zuerst vom Löschfahrzeug zum Verteiler und danach zur Wasserentnahmestelle', 'score': 1}
      ]
    }, {
      'questionText': 'Der Gruppenführer verlangt, dass Sie seinen Befehl wiederholen. Warum?',
      'answers': [
        {'text': 'Zeitersparnis', 'score': 0},
        {'text': 'Damit er weiß, ob Sie ihn verstanden haben', 'score': 1},
        {'text': 'Weil es zum Anstand gehört', 'score': 0}
      ]
    }, {
      'questionText': 'Welcher Trupp setzt im Brandeinsatz den Verteiler?',
      'answers': [
        {'text': 'Wassertrupp', 'score': 0},
        {'text': 'Angriffstrupp', 'score': 0},
        {'text': 'Schlauchtrupp', 'score': 1}
      ]
    }, {
      'questionText': 'Welchen Vorteil hat die festgelegte Sitzordnung im Löschgruppenfahrzeug?',
      'answers': [
        {'text': 'Keinen', 'score': 0},
        {'text': 'Dient dem militärischen Dienst', 'score': 0},
        {'text': 'Ermöglicht während der Anfahrt, sich auf die entsprechendenFunktionstätigkeiten vorzubereiten', 'score': 1}
      ]
    }, {
      'questionText': 'Eine angetretene Gruppe erhält den Einsatzbefehl: „Wasserentnahmestelle der Überflurhydrant - Verteiler neben Hauseingang - zum Einsatz fertig!”. Welche Aufgaben haben Sie als Angriffstruppführer?',
      'answers': [
        {'text': 'Ausrüsten und bis zum Hauseingang vorgehen', 'score': 0},
        {'text': 'Verteiler und C-Schläuche zur befohlenen Stelle bringen', 'score': 1},
        {'text': 'B-Schlauchleitung zum Verteiler vorlegen', 'score': 0}
      ]
    }, {
      'questionText': 'Welche Maßnahmen führt der Trupp aus auf den Befehl „...trupp mit C-Rohr zur/zum ... über ... vor!”?',
      'answers': [
        {'text': 'C-Schlauchleitung wird an einem der drei Abgänge des Verteilers angeschlossen', 'score': 1},
        {'text': 'Schnellangriffseinrichtung des Löschfahrzeuges wird vorgenommen', 'score': 0},
        {'text': 'C-Schlauchleitung wird von der Feuerlöschkreiselpumpe direkt zur befohlenen Einsatzstelle verlegt', 'score': 0}
      ]
    }, {
      'questionText': 'Wer verlegt im Regelfall bei der Staffel im Löscheinsatz die B-Schlauchleitung zum Verteiler?',
      'answers': [
        {'text': 'Angriffstrupp', 'score': 0},
        {'text': 'Maschinist', 'score': 0},
        {'text': 'Wassertrupp', 'score': 1}
      ]
    }, {
      'questionText': 'Wie verhalten Sie sich als Truppführer beim Erkennen einer Eigengefährdung des Trupps?',
      'answers': [
        {'text': 'Der Trupp geht geschlossen zurück, Rückmeldung an den Einheitsführer', 'score': 1},
        {'text': 'Jeder im Trupp tritt für sich den Rückzug an', 'score': 0},
        {'text': 'Wartet die Situation ab', 'score': 0}
      ]
    }, {
      'questionText': 'Wer bestimmt bei einer Wasserentnahme aus offenem Gewässer die Anzahl der Saugschläuche?',
      'answers': [
        {'text': 'Der Wassertruppführer', 'score': 1},
        {'text': 'Der Einheitsführer', 'score': 0},
        {'text': 'Der Schlauchtruppführer', 'score': 0}
      ]
    }, {
      'questionText': 'Welche Aufgabe hat der Angriffstruppführer bei der Vornahme des Verteilers?',
      'answers': [
        {'text': 'Er bestimmt die genaue Lage des Verteilers', 'score': 1},
        {'text': 'Ist nicht seine Aufgabe als Angriffstrupp', 'score': 0},
        {'text': 'Er bestimmt, wo das erste Rohr angeschlossen wird', 'score': 0}
      ]
    }, {
      'questionText': 'Welchen Einsatz hat der Einheitsführer gewählt, wenn sein Befehl wie folgt lautet: „Wasserentnahme der Überflurhydrant, Verteiler 5 m neben die Eingangstür, zum Einsatz fertig!”?',
      'answers': [
        {'text': 'Einen Einsatz mit Bereitstellung', 'score': 1},
        {'text': 'Einen Einsatz ohne Bereitstellung', 'score': 0},
        {'text': 'Einen Einsatz auf Vorbereitung', 'score': 0}
      ]
    }, {
      'questionText': 'Dürfen sie eigenverantwortlich während der Löscharbeiten das Mundstück ihres BM-Strahlrohres abschrauben?',
      'answers': [
        {'text': 'Nein, der dadurch erhöhte Wasserdurchfluss muss vorher mit dem Einheitsführer abgesprochen werden', 'score': 1},
        {'text': 'Ja, wenn die Einsatzsituation es erfordert', 'score': 0},
        {'text': 'Liegt im Ermessen des Trupps', 'score': 0}
      ]
    }, {
      'questionText': 'Wie erkennen sie, dass der Einheitsführer einenEinsatz ohne Bereitstellung durchführen will?',
      'answers': [
        {'text': 'Durch das Wort „vor”', 'score': 1},
        {'text': 'Durch Angabe der Wasserentnahmestelle', 'score': 0},
        {'text': 'An der Lage des Verteilers', 'score': 0}
      ]
    }, {
      'questionText': 'Die Schlauchreserve bei einem Angriff mit einem Strahlrohr muss berücksichtigt werden...',
      'answers': [
        {'text': 'damit der vorgebende Trupp eine notwendige Beweglichkeit und Reichweite erhält', 'score': 1},
        {'text': 'damit die Schläuche besser in Buchten verlegt werden können', 'score': 0},
        {'text': 'damit der Trupp weiter vom Verteiler entfernt ist', 'score': 0}
      ]
    }, {
      'questionText': 'Als Angriffstrupp bekommen sie den Einsatzbefehl einen brennenden Palettenstapel abzulöschen. Welche Löschtaktik wenden sie an?',
      'answers': [
        {'text': 'Mit Sprühstrahl, um das Brandobjekt bewegend', 'score': 1},
        {'text': 'Aus größerer Entfernung mit Vollstrahl', 'score': 0},
        {'text': 'Mit Sprühstrahl, von einem festen Punkt aus', 'score': 0}
      ]
    }, {
      'questionText': 'Die Schläuche für Sonderrohre werden am Verteiler (in Fließrichtung)...',
      'answers': [
        {'text': 'in der Mitte angeschlossen', 'score': 1},
        {'text': 'links angeschlossen', 'score': 0},
        {'text': 'rechts angeschlossen', 'score': 0}
      ]
    }, {
      'questionText': 'An welchen Abgang am Verteiler wird das erste Rohr angeschlossen?',
      'answers': [
        {'text': 'Am linken Abgang', 'score': 1},
        {'text': 'Am rechten Abgang', 'score': 0},
        {'text': 'In der Mitte', 'score': 0}
      ]
    }, {
      'questionText': 'Welche Aussage zur Löschtaktik bei einem Feststoffbrand ist richtig?',
      'answers': [
        {'text': 'Feuer muss von vorne nach hinten bekämpft werden', 'score': 1},
        {'text': 'Feuer muss von hinten nach vorne bekämpft werden', 'score': 0},
        {'text': 'Feuer muss von der Seite bekämpft werden', 'score': 0}
      ]
    },{
      'questionText': 'Der Einheitsführer befiehlt: „Wasserentnahmestelle der Überflurhydrant am Bürgersteig, Verteiler zur Gartentür, zum Einsatz fertig!”. Siesind Angriffstruppführer, wie platzieren sie den Verteiler?',
      'answers': [
        {'text': 'Seitlich versetzt, damit der Zugang zum Gebäude nicht behindert wird', 'score': 1},
        {'text': 'Direkt in die offene Gartentür', 'score': 0},
        {'text': 'Mittig, unmittelbar hinter der Gartentür', 'score': 0}
      ]
    },{
      'questionText': 'Gemäß FwDV 3 „Einheiten im Löscheinsatz” unterscheidet man die Einsatzformen...',
      'answers': [
        {'text': 'Einsatz mit Bereitstellung und ohne Bereitstellung', 'score': 1},
        {'text': 'Einsätze neben- und hintereinander', 'score': 0},
        {'text': 'Einsätze getrennt und geschlossen', 'score': 0}
      ]
    },{
      'questionText': 'Der Strahlrohrführer öffnet das Strahlrohr zur Brandbekämpfung...',
      'answers': [
        {'text': 'unter Beachtung von Weisungen des Truppführers', 'score': 1},
        {'text': 'an der Rauchgrenze', 'score': 0},
        {'text': 'sobald er Wasser am Strahlrohr hat', 'score': 0}
      ]
    },{
      'questionText': 'Welche Länge hat eine Feuerwehrleine?',
      'answers': [
        {'text': '30 Meter', 'score': 1},
        {'text': '25 Meter', 'score': 0},
        {'text': '15 Meter', 'score': 0}
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
      body: _questionIndex < _fragenLoescheinsatz.length
          ? Quiz(
        questions: _fragenLoescheinsatz,
        answerQuestions: _answerQuestions,
        questionIndex: _questionIndex,
      )
          : Result(_resetQuiz, _fragenLoescheinsatz.length,themengebiet,_totalScore, _fragenLoescheinsatz, _questionIndex,),
    );
  }
}