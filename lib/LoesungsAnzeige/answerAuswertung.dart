import 'package:ffw_quiz_test/ButtonsAndConstants/AuswertungButton.dart';
import 'package:ffw_quiz_test/ButtonsAndConstants/LoesungsButton.dart';
import 'package:flutter/material.dart';

class answerAuswertung extends StatefulWidget {
  String answerText;
  var score;
  Function selectHandler;

  answerAuswertung(
    Function selectHandler,
    String answerText,
    var score,
  ) {
    this.selectHandler = selectHandler;
    this.answerText = answerText;
    this.score = score;
  }

  @override
  _answerAuswertung createState() => _answerAuswertung();
}

class _answerAuswertung extends State<answerAuswertung> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
            ),
            margin: EdgeInsets.all(5.0),
            child: LoesungsButton(
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
