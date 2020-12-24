import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ButtonsAndConstants/MenuButton.dart';
import 'ButtonsAndConstants/TextStyles.dart';

//TODO einzelne Fragen checken,
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String status = "Freiwillige Feuerwehr Sommerach Modulare Truppausbildung";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              AutoSizeText(
                status,
                style: WeisserTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: SafeArea(
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/ffwlogo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              MenuButton(
                text: 'Quiz Starten',
                height: 60.0,
                onPress: () {
                  showDialog(
                      context: context,
                      builder: (_) => CupertinoAlertDialog(
                            content: Text(
                              'Quiz Regeln: Die Fragen werden nacheinander '
                              'gestellt. Am Ende des Quiz erfolgt eine '
                              'Auswertung. Anschließend wird Ihnen eine '
                              'Übersicht der Lösungen gezeigt.',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: Text('Weiter zum Quiz'),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, 'AlleQuizzeAnzeigen');
                                },
                              ),
                            ],
                          ),
                      barrierDismissible: true);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              MenuButton(
                text: 'Prüfungsmodus Starten',
                height: 60.0,
                onPress: () {
                  showDialog(
                      context: context,
                      builder: (_) => CupertinoAlertDialog(
                            content: Text(
                              'Prüfungsregeln: Es werden 50 Fragen '
                              'gestellt. Die Fragen werden nacheinander '
                              'gestellt. Am Ende der Prüfung erfolgt eine '
                              'Auswertung. Anschließend wird Ihnen eine '
                              'Übersicht der Lösungen gezeigt.',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: Text('Weiter zur Prüfung'),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, 'Pruefungsmodus');
                                },
                              ),
                            ],
                          ),
                      barrierDismissible: true);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
            ]),
      ),
    ));
  }
}
