import 'package:ffw_quiz_test/ButtonsAndConstants/AuswertungButton.dart';
import 'package:flutter/material.dart';

class Answer extends StatefulWidget {

  String answerText;
  var score;
  Function selectHandler;


  Answer(Function selectHandler, String answerText, var score, ){
    this.selectHandler=selectHandler;
    this.answerText=answerText;
    this.score=score;
  }

  @override
  _Answer createState() =>_Answer();
}

class _Answer extends State<Answer> {

  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                margin: EdgeInsets.all(5.0),
                child: AuswertungButton(
                  widget.selectHandler,
                  widget.answerText,
                  widget.score,
            ),
          ),
          )
    ],
      );
  }
}