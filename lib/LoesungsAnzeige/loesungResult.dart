import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class loesungResult extends StatefulWidget {
  loesungResult();
  @override
  _loesungResult createState() => _loesungResult();
}

class _loesungResult extends State<loesungResult> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
            Container(
              height: 400.0,
              child: Image.asset('images/ffwlogo.png')
            )
        ]
        ),
      ),
      )
    );
  }
}