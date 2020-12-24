import 'package:ffw_quiz_test/ButtonsAndConstants/FlexButton.dart';
import 'package:ffw_quiz_test/LoesungsAnzeige/LoesungsAnzeige.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/cupertino.dart';

class Result extends StatefulWidget {
  Function resetHandlar;
  int kartenAnzahl;
  String themengebiet;
  double richtig;
  List<Map<String, Object>> questions;
  int questionIndex=0;
  Function selectHandlar;

  Result(this.resetHandlar, this.kartenAnzahl, this.themengebiet,
      this.richtig, this.questions, this.questionIndex);
  @override
  _Result createState() => _Result();
}
   class _Result extends State<Result> {
   Map<String, double> data = new Map();

   @override
   void initState() {
   double richtig= widget.richtig;
   String richtigString = widget.richtig.toInt().toString();
   String falschString = (widget.kartenAnzahl-widget.richtig).toInt().toString();
   data.addAll({
   'Richtig beantwortet'+' '+richtigString:richtig,
   'Falsch beantwortet'+' '+falschString: (widget.kartenAnzahl-widget.richtig).toDouble(),
   });
   super.initState();
   }
   List<Color> _colors = [
   Colors.green,
   Colors.red,
   ];

   @override
   void _resetQuiz() {
     setState(() {
      widget.questionIndex = 0;
       widget.richtig = 0.0;
     });
   }

   Widget build(BuildContext context) {
   return Container(
      child: Scaffold(
     body: Center(
     child: Column(
        children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
          Text(
        'Auswertung der beantworteten Fragen',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)
        ),
        Center(
           child: PieChart(
              dataMap: data,
              colorList:
              _colors, // if not declared, random colors will be chosen
              animationDuration: Duration(milliseconds: 1500),
              chartLegendSpacing: 30.0,
              chartRadius: MediaQuery.of(context).size.width / 1.3, //determines the size of the chart
              showChartValuesInPercentage: true,
              showChartValues: true,
              showChartValuesOutside: false,
              chartValueBackgroundColor: Colors.grey[200],
              showLegends: true,
              legendPosition:
              LegendPosition.bottom,
              legendStyle: TextStyle(fontSize: 22, fontWeight:FontWeight.bold, color: Colors.white),
              decimalPlaces: 1,
              showChartValueLabel: true,
              initialAngle: 0,
              chartValueStyle: defaultChartValueStyle.copyWith(
                 color: Colors.blueGrey[900].withOpacity(1.0),
              ),
              chartType: ChartType.disc, //can be changed to ChartType.ring
           ),
        ),
          FlexButton(
              onPress: ()
              { _resetQuiz();
                print(widget.questionIndex);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => LoesungsAnzeige(widget.questionIndex,
                        widget.themengebiet,
                        widget.questions)));
                },
              text: 'Lösungen Anzeigen'
          ),
        ],
        ),
     ),
     ),
   );
   }
}