import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TextStyles.dart';

class LoesungsButton extends StatefulWidget{

  Function onPress;
  String text;
  var score;
  Color color;

  LoesungsButton(Function onPress, String text, var score){
    this.onPress=onPress;
    this.text=text;
    this.score=score;
    if(score==1){
      this.color=Colors.green;
    }
    else{
      this.color=Colors.red;
    }
  }

  @override
  _LoesungsButtonState createState() => new _LoesungsButtonState();
}

class _LoesungsButtonState extends State<LoesungsButton> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(color: widget.color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black)
      ),
      child: Text(widget.text, textAlign: TextAlign.center, style: TextStyle(fontSize: 19.0),

      ),
      onPressed: widget.onPress,
    );
  }
}