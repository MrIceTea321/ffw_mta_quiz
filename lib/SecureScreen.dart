import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ButtonsAndConstants/MenuButton.dart';
import 'ButtonsAndConstants/TextStyles.dart';

class SecureScreen extends StatefulWidget {
  @override
  _SecureScreenState createState() => _SecureScreenState();
}

class _SecureScreenState extends State<SecureScreen> {
  String status = "Freiwillige Feuerwehr Sommerach Modulare Truppausbildung";
  String correct = "Sommerach";
  String insert = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
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
          TextFormField(
            obscureText: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              insert = value;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white30,
              hintText: 'Passwort',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF58A4B0), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF58A4B0), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          MenuButton(
            text: "Weiter",
            height: 40.0,
            onPress: () {
              showDialog(
                  context: context,
                  builder: (_) => CupertinoAlertDialog(
                        content: Text(
                          'Um den vollen Anzeigeumfang der Fragen zu sehen,'
                          ' stellen Sie bitte ihre Display -'
                          ' und Anzeigeeinstellungen auf Standard, '
                          'falls Sie die Anzeigegröße ihres '
                          'Smartphones verändert haben.',
                          style: TextStyle(fontSize: 22.0),
                        ),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: Text('Weiter zum Quiz'),
                            onPressed: () {
                              if (insert.compareTo(correct) == 0) {
                                Navigator.pushNamed(context, 'HomeScreen');
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (_) => CupertinoAlertDialog(
                                          content: Text(
                                            'Ihr eingegebenes '
                                            'Passwort war leider falsch',
                                            style: TextStyle(fontSize: 22.0),
                                          ),
                                        ),
                                    barrierDismissible: true);
                              }
                            },
                          ),
                        ],
                      ),
                  barrierDismissible: true);
            },
          ),
          SizedBox(
            height: 20.0,
          ),
        ]),
      ),
    ));
  }
}
