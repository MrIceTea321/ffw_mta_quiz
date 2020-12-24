
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuswertungButton extends StatefulWidget{
  Function onPress;
  String text;
  var score;

  AuswertungButton(Function onPress, String text, var score){
    this.onPress=onPress;
    this.text=text;
    this.score=score;
  }

  @override
  _AuswertungButtonState createState() => new _AuswertungButtonState();
}

class _AuswertungButtonState extends State<AuswertungButton> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black)
      ),
      child: Text(widget.text, textAlign: TextAlign.center, style: TextStyle(fontSize: 19.0)),

    onPressed: widget.onPress,
    );
  }
}