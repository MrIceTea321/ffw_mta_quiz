import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget> [
          Expanded(
            child: Container(
                width:double.infinity,
                margin:EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white60,
                    border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: AutoSizeText(questionText,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}