import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class alternativeAntriebstechnikenBeiAutos extends StatefulWidget {
  @override
  _alternativeAntriebstechnikenBeiAutos createState() => _alternativeAntriebstechnikenBeiAutos();
}

class _alternativeAntriebstechnikenBeiAutos extends State<alternativeAntriebstechnikenBeiAutos> with SingleTickerProviderStateMixin {
  var _questionIndex = 0;
  var _totalScore = 0.0;


  String themengebiet="Alternative Antriebstechniken\nbei Autos";

  final _fragenalternativeAntriebstechnikenBeiAutos = [
    {
      'questionText': 'Welche Erkennungsmöglichkeit von außen besteht bei einem Fahrzeug, das mit Flüssiggas betrieben wird?',
      'answers': [
        {'text': 'Von außen nicht erkennbar', 'score': 0},
        {'text': 'Mögliche Fahrzeugbeschriftung, z. B. LPG, BiFuel, Flüssiggas, Autogas', 'score': 1},
        {'text': 'Durch rechteckigen Tankdeckel am Einfüllstutzen', 'score': 0}
      ]
    }, {
      'questionText': 'Welche alternative Antriebe werden derzeit in der Fahrzeugtechnik verwendet?',
      'answers': [
        {'text': 'Diesel; Benzin; Biodiesel', 'score': 0},
        {'text': 'Erdgas (CNG); Flüssiggas (LPG); Hybridantrieb', 'score': 1},
        {'text': 'Photovoltaik; Biogas', 'score': 0}
      ]
    },{
      'questionText': 'Wo kann man Erkennungshinweise auf alternative Antriebstechnik an einem PKW finden?',
      'answers': [
        {'text': 'Es gibt keine Erkennungshinweise auf alternative Antriebstechnik an einem PKW', 'score': 1},
        {'text': 'Rettungskarte (Sonnenblende); Tankdeckelinnenseite; im Motorraum', 'score': 0},
        {'text': 'Unter dem Fahrersitz', 'score': 0}
      ]
    },{
      'questionText': 'Welche besonderen Maßnahmen sind an einem verunfallten gasbetriebenen PKW (LPG oder CNG) erforderlich?',
      'answers': [
        {'text': 'Es sind keine besonderen Maßnahmen erforderlich', 'score': 0},
        {'text': 'Gefahrenbereich weiträumig sperren; Motor abstellen; Gasabsperrventil schließen', 'score': 1},
        {'text': 'PKW gegen Wegrollen sichern, Batterie abklemmen, Brandschutz mit Kübelspritze sicherstellen', 'score': 0}
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
            minFontSize: 4.0,
            maxFontSize: 15.0,
            maxLines: 2,
            textAlign: TextAlign.center,
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
      body: _questionIndex < _fragenalternativeAntriebstechnikenBeiAutos.length
          ? Quiz(
        questions: _fragenalternativeAntriebstechnikenBeiAutos,
        answerQuestions: _answerQuestions,
        questionIndex: _questionIndex,
      )
          : Result(_resetQuiz, _fragenalternativeAntriebstechnikenBeiAutos.length,themengebiet,_totalScore, _fragenalternativeAntriebstechnikenBeiAutos, _questionIndex,),
    );
  }
}