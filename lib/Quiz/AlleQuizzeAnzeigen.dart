
import 'package:ffw_quiz_test/ButtonsAndConstants/MenuButton.dart';
import 'package:ffw_quiz_test/ButtonsAndConstants/TextStyles.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class AlleQuizzeAnzeigen extends StatefulWidget{
  @override
  _AlleQuizzeAnzeigen createState()=>_AlleQuizzeAnzeigen();
}

class _AlleQuizzeAnzeigen extends State<AlleQuizzeAnzeigen> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text('Themengebiete',style: WeisserTextStyle,),
            leading:IconButton(
                icon: Icon(Icons.arrow_back_ios,color: Colors.white, size: 30),
                onPressed:() {
                  Navigator.pushNamed(context, 'HomeScreen');
                }
          )),
        body: new ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                MenuButton(
                  height: 60,
                  text: 'Rechtsgrundlagen',
                 onPress: (){
                    Navigator.pushNamed(context, 'Rechtsgrundlagen');
                 },
                ),
                SizedBox(
                  height: 5.0,
                ),
                MenuButton(
                  height: 60,
                  text: 'Brennen und Löschen',
                  onPress:(){
                    Navigator.pushNamed(context, 'BrennenUndLoeschen');
                    },

                ),
                SizedBox(
                  height: 5.0,
                ),
                MenuButton(
                  height: 60,
                  text: 'Fahrzeugkunde',
                  onPress:(){
                    Navigator.pushNamed(context, 'Fahrzeugkunde');
                  }

                ),  SizedBox(
                  height: 5.0,
                ),MenuButton(
                  height: 60,
                  text: 'Gerätekunde',
                  onPress:(){
                    Navigator.pushNamed(context, 'Geraetekunde');
                  }
                ),  SizedBox(
                  height: 5.0,
                ),MenuButton(
                  height: 60,
                  text: 'Hilfeleistung- Löscheinsatz',
                  onPress:(){
                    Navigator.pushNamed(context, 'Hilfeleistungs-Loescheinsatz');
                  }
                ),  SizedBox(
                  height: 5.0,
                ),MenuButton(
                  height: 60,
                  text: 'Rettung von Personen',
                  onPress:(){
                    Navigator.pushNamed(context, 'RettungVonPersonen');
                  }

                ),  SizedBox(
                  height: 5.0,
                ),MenuButton(
                  height: 60,
                  text: 'Einsatzhygiene',
                  onPress:(){
                    Navigator.pushNamed(context, 'Einsatzhygiene');
                  }
                ),  SizedBox(
                  height: 5.0,
                ),MenuButton(
                  height: 60,
                  text: 'Gefahren beim Einsatz',
                  onPress: (){
                    Navigator.pushNamed(context, 'GefahrenBeimEinsatz');
                  },

                ),  SizedBox(
                  height: 5.0,
                ),MenuButton(
                  height: 60,
                  text: 'Physische- und psychische Belastung',
                  onPress: (){
                    Navigator.pushNamed(context, 'Physische&PsychischeBelastung');
                  }
                ),  SizedBox(
                  height: 5.0,
                ),MenuButton(
                  height: 60,
                  text: 'Gefahren an der Einsatzstelle',
                  onPress: (){
                    Navigator.pushNamed(context, 'GefahrenAnDerEinsatzstelle');
                  }
                ),  SizedBox(
                  height: 5.0,
                ),MenuButton(
                  height: 60,
                  text: 'Löscheinsatz',
                  onPress: (){
                    Navigator.pushNamed(context, 'Loescheinsatz');
                  }

                ),  SizedBox(
                  height: 5.0,
                ),MenuButton(
                  height: 60,
                  text: 'Sichern und Absichern',
                    onPress: (){
                      Navigator.pushNamed(context, 'SichernUndAbsichern');
                    }
                ),  SizedBox(
                  height: 5.0,
                ),MenuButton(
                  height: 60,
                  text: 'Technische Hilfeleistung',
                  onPress: (){
                    Navigator.pushNamed(context, 'THL');
                  }

                ),  SizedBox(
                  height: 5.0,
                ),MenuButton(
                  height: 60,
                  text: 'Alternative Antriebe bei PKWs',
                    onPress: (){
                      Navigator.pushNamed(context, 'alternativeAntriebstechnikenBeiAutos');
                    }
                ),  SizedBox(
                  height: 5.0,
                ),MenuButton(
                  height: 60,
                  text: 'Funk',
                  onPress:(){
                    Navigator.pushNamed(context, 'Funk');
                  }
                ),
              ],
            )
        );
  }
}

