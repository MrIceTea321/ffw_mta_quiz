import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class THL extends StatefulWidget {
  @override
  _THL createState() => _THL();
}

class _THL extends State<THL> with SingleTickerProviderStateMixin {
  var _questionIndex = 0;
  var _totalScore = 0.0;


  String themengebiet="Technische Hilfeleistung";

  final _fragenTHL = [
    {
      'questionText': 'Wie schützt sich die Mannschaft bei technischen Hilfeleistungen auf öffentlichen Verkehrsflächen vor Gefahren durch den Verkehr?',
      'answers': [
        {'text': 'Mannschaft bleibt im Löschfahrzeug', 'score': 0},
        {'text': 'Mannschaft steigt auf Befehl zur verkehrsabgewandten Seite aus', 'score': 1},
        {'text': 'Mannschaft tritt hinter dem Löschfahrzeug an', 'score': 0}
      ]
    },  {
      'questionText': 'Welcher Trupp ist im technischen Hilfeleistungseinsatz grundsätzlich erster Rettungstrupp?',
      'answers': [
        {'text': 'Angriffstrupp', 'score': 1},
        {'text': 'Wassertrupp', 'score': 0},
        {'text': 'Schlauchtrupp', 'score': 0}
      ]
    },{
      'questionText': 'Welcher Trupp ist bei der technischen Hilfeleistung für Sicherungsaufgaben zuständig?',
      'answers': [
        {'text': 'Wassertrupp', 'score': 1},
        {'text': 'Angriffstrupp', 'score': 0},
        {'text': 'Schlauchtrupp', 'score': 0}
      ]
    },{
      'questionText': 'Welche Aufgabe hat der Wassertrupp bei einem Hilfeleistungseinsatz?',
      'answers': [
        {'text': 'Sichern der Einsatzstelle, z. B. gegen Brandgefahr', 'score': 1},
        {'text': 'Bereitstellen der Geräte', 'score': 0},
        {'text': 'Rettungsmaßnahmen durchführen', 'score': 0}
      ]
    },{
      'questionText': 'Sie erhalten als Angriffstrupp vom Einheitsführer den Befehl: „Angriffstrupp zur Versorgung der Person im PKW vor!”. Welche erste Maßnahme führen sie durch?',
      'answers': [
        {'text': 'Überprüfen der Vitalfunktionen', 'score': 1},
        {'text': 'Sofortige Rettung der Person', 'score': 0},
        {'text': 'Versuchen die Person zu befreien', 'score': 0}
      ]
    },{
      'questionText': 'Welche Aufgabe übernimmt der Schlauchtrupp bei einem Hilfeleistungseinsatz?',
      'answers': [
        {'text': 'Die Gerätebereitstellung', 'score': 1},
        {'text': 'Die Sicherung', 'score': 0},
        {'text': 'Die Rettung', 'score': 0}
      ]
    },{
      'questionText': 'Welche Aussage über den Angriffstrupp im Hilfeleistungseinsatz ist richtig?',
      'answers': [
        {'text': 'Er rettet und leistet technische Hilfe', 'score': 1},
        {'text': 'Er sichert die Einsatzstelle und nimmt das dafür notwendige Gerät vor', 'score': 0},
        {'text': 'Er bereitet die befohlenen Geräte für den Einsatz vor', 'score': 0}
      ]
    },{
      'questionText': 'Worauf achten Sie beim Absitzen an der Einsatzstelle?',
      'answers': [
        {'text': 'Auf Gefahren durch den fließenden Verkehr', 'score': 1},
        {'text': 'Nur zur rechten Seite absitzen', 'score': 0},
        {'text': 'Nur zur linken Seite absitzen', 'score': 0}
      ]
    },{
      'questionText': 'Eine in einem PKW eingeklemmte Person soll durch ihren Trupp betreut werden. Das Fahrzeug ist noch nicht gesichert und könnte abrutschen. Wie verhalten sie sich?',
      'answers': [
        {'text': 'Mit der Betreuung der Person wird unverzüglich von außerhalb begonnen', 'score': 1},
        {'text': 'Die Betreuung der Person erfolgt erst nachdem das Fahrzeug gesichert ist', 'score': 0},
        {'text': 'Ich steige sofort zur Betreuung der Person in das Fahrzeug', 'score': 0}
      ]
    },{
      'questionText': 'Was wird mit orangefarbenen Warntafeln gekennzeichnet?',
      'answers': [
        {'text': 'Straßen- und Schienenfahrzeuge, die gefährliche Stoffe ab bestimmten Mengen befördern', 'score': 1},
        {'text': 'Gebäude, in denen gefährliche Stoffe und Güter gelagert sind', 'score': 0},
        {'text': 'Nur Versandstücke', 'score': 0}
      ]
    },{
      'questionText': 'Sie sehen auf einer Kiste der Ladung eines verunglückten LKW folgendes Schild. Was melden Sie Ihrem Gruppenführer?',
      'answers': [
        {'text': 'Brandgefahr', 'score': 0},
        {'text': 'Vergiftungsgefahr', 'score': 0},
        {'text': 'Ansteckungsgefahr', 'score': 1}
      ]
    },{
      'questionText': 'Sie sehen an der Tür eines Gebäudes folgendes Schild(schwarz auf gelbem Hintergrund). Womit müssen Sie rechnen?',
      'answers': [
        {'text': 'Verätzungsgefahr', 'score': 0},
        {'text': 'Mit starkem Wind durch eine, sich hinter der Tür befindliche Lüftungsanlage', 'score': 0},
        {'text': 'Explosionsgefahr', 'score': 1}
      ]
    },{
      'questionText': 'Welche Nummernsysteme befinden sich auf einer orangefarbenen Warntafel?',
      'answers': [
        {'text': 'Gefährdungsnummer und Einsatznummer', 'score': 0},
        {'text': 'Transportkennzahl und Gefahrencode', 'score': 0},
        {'text': 'Stoffnummer und Nummer zur Kennzeichnung der Gefahr', 'score': 1}
      ]
    },{
      'questionText': 'Sie sehen auf einem Fass in einem Lager folgendes Schild (schwarz auf weiß-rotem Hintergrund). Welche Gefahr kann von diesem Stoff ausgehen?',
      'answers': [
        {'text': 'Vergiftungsgefahr', 'score': 0},
        {'text': 'Austritt von Gas', 'score': 0},
        {'text': 'Brandgefahr', 'score': 1}
      ]
    },{
      'questionText': 'Eine Gefahrgutumschließung ist mit folgendem Symbol gekennzeichnet (schwarz auf rotem Hintergrund). Was enthält die Verpackung?',
      'answers': [
        {'text': 'Einen festen brennbaren Stoff', 'score': 0},
        {'text': 'Einen gasförmigen brennbaren Stoff', 'score': 0},
        {'text': 'Einen flüssigen brennbaren Stoff', 'score': 1}
      ]
    },{
      'questionText': 'Wie verhalten Sie sich, wenn Sie im Gefahrguteinsatz einen verletzten Menschen im Gefahrenbereich entdecken?',
      'answers': [
        {'text': 'Ich retten den Menschen sofort aus dem Gefahrenbereich', 'score': 0},
        {'text': 'Ich melde es dem Einheitsführer', 'score': 1},
        {'text': 'Ich lasse mich zuerst dekontaminieren und rette dann den Menschen', 'score': 0}
      ]
    },{
      'questionText': 'Welche Einsatzmaßnahmen beschreibt die GAMSRegel?',
      'answers': [
        {'text': 'Gase Absorbieren, Mineralöle Separieren', 'score': 0},
        {'text': 'Gefahr erkennen, Absperren, Menschenrettung durchführen, Spezialkräfte alarmieren', 'score': 1},
        {'text': 'Gefahr beseitigen, Ausleuchten, Menschenrettung durchführen, Spezialfirma beauftragen', 'score': 0}
      ]
    },{
      'questionText': 'Was bedeutet folgende Kennzeichnung(schwarz-weiß)?',
      'answers': [
        {'text': 'Tank enthält wassergefährdende Stoffe', 'score': 0},
        {'text': 'Karton enthält kein Gefahrgut', 'score': 0},
        {'text': 'Verpackung enthält kleinere Behälter, die Gefahrgut inbegrenzten Mengen enthalten', 'score': 1}
      ]
    },{
      'questionText': ' Welche Gefahr besteht bei folgender Kennzeichnung (schwarz-weiß)?',
      'answers': [
        {'text': 'Gesundheitsgefahr', 'score': 0},
        {'text': 'Gefahr durch erwärmte Stoffe', 'score': 0},
        {'text': 'Verätzungsgefahr', 'score': 1}
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
      body: _questionIndex < _fragenTHL.length
          ? Quiz(
        questions: _fragenTHL,
        answerQuestions: _answerQuestions,
        questionIndex: _questionIndex,
      )
          : Result(_resetQuiz, _fragenTHL.length,themengebiet,_totalScore, _fragenTHL, _questionIndex,),
    );
  }
}