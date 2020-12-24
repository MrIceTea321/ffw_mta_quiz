import 'package:ffw_quiz_test/Fragen/BrennenUndLoeschen.dart';
import 'package:ffw_quiz_test/Fragen/Einsatzhygiene.dart';
import 'package:ffw_quiz_test/Fragen/Fahrzeugkunde.dart';
import 'package:ffw_quiz_test/Fragen/Funk.dart';
import 'package:ffw_quiz_test/Fragen/GefahrenAnDerEinsatzstelle.dart';
import 'package:ffw_quiz_test/Fragen/GefahrenBeimEinsatz.dart';
import 'package:ffw_quiz_test/Fragen/Geraetekunde.dart';
import 'package:ffw_quiz_test/Fragen/Hilfeleistungs-Loescheinsatz.dart';
import 'package:ffw_quiz_test/Fragen/Loescheinsatz.dart';
import 'package:ffw_quiz_test/Fragen/Physische&PsychischeBelastung.dart';
import 'package:ffw_quiz_test/Fragen/Pruefungsmodus.dart';
import 'package:ffw_quiz_test/Fragen/Rechtsgrundlagen.dart';
import 'package:ffw_quiz_test/Fragen/RettungVonPersonen.dart';
import 'package:ffw_quiz_test/Fragen/SichernUndAbsichern.dart';
import 'package:ffw_quiz_test/Fragen/THL.dart';
import 'package:ffw_quiz_test/Fragen/alternativeAntriebstechnikenBeiAutos.dart';
import 'package:ffw_quiz_test/Quiz/AlleQuizzeAnzeigen.dart';
import 'package:ffw_quiz_test/SecureScreen.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

void main(){
  return runApp((ffw()));
}

class ffw extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ).copyWith(primaryColor: Color(0xFF3E7882),
          scaffoldBackgroundColor:  Color(0xFF3E7882),
          accentColor: Colors.grey),
      home: SecureScreen(),
      routes: {
        'AlleQuizzeAnzeigen': (context) => AlleQuizzeAnzeigen(),
        'Rechtsgrundlagen':(context)=>Rechtsgrundlagen(),
        'HomeScreen':(context)=>HomeScreen(),
        'BrennenUndLoeschen':(context)=>BrennenUndLoeschen(),
        'Fahrzeugkunde':(context)=>Fahrzeugkunde(),
        'Geraetekunde':(context)=>Geraetekunde(),
        'Hilfeleistungs-Loescheinsatz':(context)=>HilfeleistungsLoescheinsatz(),
        'RettungVonPersonen':(context)=>RettungVonPersonen(),
        'Einsatzhygiene':(context)=>Einsatzhygiene(),
        'GefahrenBeimEinsatz':(context)=>GefahrenBeimEinsatz(),
        'Physische&PsychischeBelastung':(context)=>Physische_PsychischeBelastung(),
        'GefahrenAnDerEinsatzstelle':(context)=>GefahrenAnDerEinsatzstelle(),
        'Loescheinsatz':(context)=>Loescheinsatz(),
        'SichernUndAbsichern':(context)=>SichernUndAbsichern(),
        'THL':(context)=>THL(),
        'alternativeAntriebstechnikenBeiAutos':(context)=>alternativeAntriebstechnikenBeiAutos(),
        'Funk':(context)=>Funk(),
        'Pruefungsmodus':(context)=>Pruefungsmodus(),
      },
    );
  }
}
