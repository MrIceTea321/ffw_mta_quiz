import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrennenUndLoeschen extends StatefulWidget {
  @override
  _BrennenUndLoeschen createState() => _BrennenUndLoeschen();
}

class _BrennenUndLoeschen extends State<BrennenUndLoeschen> {
  var _questionIndex = 0;
  var _totalScore = 0.0;
  String themengebiet="Brennen und Löschen";
  final _fragenBrennenUndLoeschen = [
    {
      'questionText': 'Ein brennbarer gasförmiger Stoff gehört zur Brandklasse…',
      'answers': [
        {'text': 'A', 'score': 0},
        {'text': 'C', 'score': 1},
        {'text': 'B', 'score': 0}
      ]
    }, {
      'questionText': 'Welche Aussage über brennbare Flüssigkeiten ist richtig??',
      'answers': [
        {'text': 'Anbringen von Dekorationen', 'score': 0},
        {'text': 'Brandbekämpfung und technische Hilfeleistung', 'score': 1},
        {'text': 'Auspumpen von Baugruben', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche Aussage über brennbare Flüssigkeiten ist richtig?',
      'answers': [
        {'text': 'Es brennen die Dämpfe und die Flüssigkeit selbst', 'score': 0},
        {'text': 'Es brennen nur die Dämpfe einer Flüssigkeit', 'score': 1},
        {'text': 'Es brennt nur die Flüssigkeit', 'score': 0}
      ]
    },
    {
      'questionText': 'Wie kann sich die Verbrennungswärme ausbreiten?',
      'answers': [
        {'text': 'Durch Wärmestrahlung, Wärmedurchfluss, Wärmeströmung', 'score': 0},
        {'text': 'Durch Wärmestrahlung, Wärmeströmung, Wärmeleitung', 'score': 1},
        {'text': 'Durch Wärmeaustausch, Wärmeleitung, Wärmeübergang', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche Stoffe gehören zur Brandklasse F?',
      'answers': [
        {'text': 'Feste Stoffe', 'score': 0},
        {'text': 'Speisefette und -öle', 'score': 1},
        {'text': 'Flüssige Stoffe', 'score': 0}
      ]
    },
    {
      'questionText': 'Wodurch kann ein Feuer gelöscht werden?',
      'answers': [
        {'text': 'Entzug von Stickstoff', 'score': 0},
        {'text': 'Entzug von Wärme (Abkühlen)', 'score': 1},
        {'text': 'Zuführung von Sauerstoff', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche Voraussetzungen sind für das Brennen notwendig?',
      'answers': [
        {'text': 'Es muss nur ein brennbarer Stoff vorhanden sein', 'score': 0},
        {'text': 'Es müssen nur ein brennbarer Stoff und Sauerstoff vorhanden sein', 'score': 0},
        {'text': 'Es müssen brennbarer Stoff, Sauerstoff und Wärme vorhanden sein', 'score': 1}
      ]
    },
    {
      'questionText': 'Welche Stoffe gehören zur Brandklasse B?',
      'answers': [
        {'text': 'Benzin, Diesel, Petroleum', 'score': 1},
        {'text': 'Holz, Papier, Kohle', 'score': 0},
        {'text': 'Propan, Butan, Acetylen', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche Stoffe gehören zur Brandklasse A?',
      'answers': [
        {'text': 'Holz, Papier, Kohle', 'score': 1},
        {'text': 'Benzin, Diesel, Petroleum', 'score': 0},
        {'text': 'Propan, Butan, Acetylen', 'score': 0}
      ]
    },
    {
      'questionText': ' Welcher Feuerlöscher ist für Brände fester glutbildender Stoffe besonders geeignet?',
      'answers': [
        {'text': 'Gaslöscher', 'score': 0},
        {'text': 'Pulverlöscher BC', 'score': 0},
        {'text': 'Wasserlöscher', 'score': 1}
      ]
    },
    {
      'questionText': 'Wer ist für den feuerwehrtechnisch richtigen Einsatz des befohlenen Löschmittels verantwortlich?',
      'answers': [
        {'text': 'Der Truppführer', 'score': 1},
        {'text': 'Der Truppmann', 'score': 0},
        {'text': 'Der Gruppenführer oder Staffelführer', 'score': 0}
      ]
    },
    {
      'questionText': 'Wer ist für die Auswahl des einzusetzenden Löschmittels zuständig?',
      'answers': [
        {'text': 'Gruppenführer oder Einheitsführer', 'score': 1},
        {'text': 'Truppführer', 'score': 0},
        {'text': 'Truppmann', 'score': 0}
      ]
    },
    {
      'questionText': 'Wer ist für die Durchführung der Löschtechnik des Trupps verantwortlich?',
      'answers': [
        {'text': 'Der Truppführer', 'score': 1},
        {'text': 'Der Truppmann', 'score': 0},
        {'text': 'Der Einheitsführer', 'score': 0}
      ]
    },
    {
      'questionText': 'Kann es durch falschen Strahlrohreinsatz bei der Brandbekämpfung zu einer Vergrößerung der Gefahr kommen ?',
      'answers': [
        {'text': 'Ja, z. B. Fettexplosion oder Staubexplosion', 'score': 1},
        {'text': 'Kann nur bei unerfahrenen Feuerwehrdienstleistenden vorkommen', 'score': 0},
        {'text': 'Nein, Wasser ist immer das beste Löschmittel', 'score': 0}
      ]
    },
    {
      'questionText': 'Wie verhält sich Wasser beim Verdampfen?',
      'answers': [
        {'text': 'Sehr starke Volumenvergrößerung', 'score': 1},
        {'text': 'Geringe Volumenvergrößerung', 'score': 0},
        {'text': 'Wasser lässt sich nicht vollständig verdampfenn', 'score': 0}
      ]
    },
    {
      'questionText': 'Untrügliches Zeichen dafür, dass das Löschmittel Wasser seine Wirkung getan hat, ist die Dampfbildungüber dem Brandherd. Es gilt „Strahlrohr schließen”, wenn...',
      'answers': [
        {'text': 'kein dunkler Rauch, sondern nur weißer Wasserdampf über dem Brandherd aufsteigt', 'score': 1},
        {'text': 'sich Rauch und Dampf über dem Brandherd bilden', 'score': 0},
        {'text': 'eine deutlich erkennbare Wasserschicht über dem brennbaren Material aufgebracht ist', 'score': 0}
      ]
    },
    {
      'questionText': 'Welchen Nachteil hat der Sprühstrahl gegenüber dem Vollstrahl?',
      'answers': [
        {'text': 'Der Sprühstrahl hat eine geringe Wurfweite und Wurfhöhe', 'score': 1},
        {'text': 'Das Wärmebindungsvermögen des Sprühstrahles ist geringer', 'score': 0},
        {'text': 'Der Druck am Strahlrohr ist höher als beim Vollstrahl', 'score': 0}
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
      body: _questionIndex < _fragenBrennenUndLoeschen.length
          ? Quiz(
        questions: _fragenBrennenUndLoeschen,
        answerQuestions: _answerQuestions,
        questionIndex: _questionIndex,
      )
          : Result(_resetQuiz, _fragenBrennenUndLoeschen.length,themengebiet,_totalScore, _fragenBrennenUndLoeschen,_questionIndex),
    );
  }
}