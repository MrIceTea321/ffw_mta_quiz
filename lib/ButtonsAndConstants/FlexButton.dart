import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TextStyles.dart';


class FlexButton extends StatelessWidget{


  FlexButton({@required this.onPress,@required this.text,this.color,this.style});

  Color color;
  String text;
  final Function onPress;
  TextStyle style;


  @override
  Widget build(BuildContext context) {
    return FlatButton(

      onPressed: onPress,

      child: Container(

        width: 300.0,
        height: 80.0,
        child: Center(
          child:  AutoSizeText(
            text,
            textAlign: TextAlign.center,
            style: MenuButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color ??  Colors.white30,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}