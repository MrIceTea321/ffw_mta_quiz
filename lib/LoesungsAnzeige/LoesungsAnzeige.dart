import 'package:auto_size_text/auto_size_text.dart';
import 'package:ffw_quiz_test/LoesungsAnzeige/Loesungen.dart';
import 'package:ffw_quiz_test/LoesungsAnzeige/loesungResult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoesungsAnzeige extends StatefulWidget {
  var _questionIndex = 0;
  String themengebiet;
  List<Map<String, Object>> questions;


  LoesungsAnzeige(@required this._questionIndex,@required this.themengebiet, @required this.questions);

  @override
  _LoesungsAnzeige createState() => _LoesungsAnzeige();

}

class _LoesungsAnzeige extends State<LoesungsAnzeige>  {


  void _answerQuestions(int score) {
    setState(() {
      widget._questionIndex =  widget._questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:AutoSizeText(
          widget.themengebiet,
          textAlign: TextAlign.center,
          minFontSize: 6.0,
          maxFontSize: 13.0,
        ),
        leading: IconButton(
            icon: Icon(Icons.home,color: Colors.white, size: 40),
            onPressed:() {
              Navigator.pushNamed(context, 'AlleQuizzeAnzeigen');
            }
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white, size:40),
            onPressed:(){
      showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
            content:
            Text('Durch klicken auf eines der Lösungsfelder, gelangen Sie zur nächsten Antwort',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600,),
            ),
          ),
          barrierDismissible: true);
    }
          )
          ],
      ),
      body: widget._questionIndex < widget.questions.length
          ? Loesungen(
        questions: widget.questions,
        answerQuestions: _answerQuestions,
        questionIndex: widget._questionIndex,
      )
          : loesungResult(),
    );
  }
}