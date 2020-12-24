import 'dart:math';
import 'package:ffw_quiz_test/Quiz/quiz.dart';
import 'package:ffw_quiz_test/Quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pruefungsmodus extends StatefulWidget {
  @override
  _Pruefungsmodus createState() => _Pruefungsmodus();
}

class _Pruefungsmodus extends State<Pruefungsmodus>
    with SingleTickerProviderStateMixin {
  var _questionIndex = 0;
  var _totalScore = 0.0;
  List<Map<String, Object>> questionsPruefung = <Map<String, Object>>[];

  String themengebiet = "Prüfung";

  List<Map<String, Object>> fragenPruefungsmodus = [
    {
      'questionText':
          'Mit welchem Gesetz wird das Feuerwehrwesen in Bayern geregelt?',
      'answers': [
        {'text': 'Bayerisches Katastrophenschutzgesetz', 'score': 0},
        {'text': 'Bayerisches Feuerwehrgesetz', 'score': 1},
        {'text': 'Schornsteinfegergesetz', 'score': 0}
      ]
    },
    {
      'questionText': 'Was zählt zu den Pflichtaufgaben der Feuerwehr?',
      'answers': [
        {'text': 'Anbringen von Dekorationen', 'score': 0},
        {'text': 'Brandbekämpfung und technische Hilfeleistung', 'score': 1},
        {'text': 'Auspumpen von Baugruben', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wer hat für die ordnungsgemäße Ausrüstung der Feuerwehr zu sorgen?',
      'answers': [
        {'text': 'Gemeinde', 'score': 1},
        {'text': 'Landkreis', 'score': 0},
        {'text': 'Feuerwehrverein', 'score': 0}
      ]
    },
    {
      'questionText':
          'Ab wann dürfen Feuerwehranwärter an Einsätzen teilnehmen?',
      'answers': [
        {'text': 'Truppführerausbildung muss abgeschlossen sein', 'score': 0},
        {
          'text':
              'Basismodul muss abgeschlossen sein; Alter mindestens 16 Jahre; Kommandant muss zustimmen',
          'score': 1
        },
        {
          'text': 'Gruppenführerlehrgang muss erfolgreich abgeschlossen sein',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Welche Pflicht besteht für Feuerwehrdienstleistende bei Alarm?',
      'answers': [
        {'text': 'Unverzüglich am Gerätehaus einfinden', 'score': 1},
        {'text': 'Rückruf bei der Leitstelle', 'score': 0},
        {'text': 'Melden bei der Gemeindeverwaltung', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wer übernimmt die Lohnfortzahlung eines Arbeitnehmers bei einem Feuerwehreinsatz während der Arbeitszeit?',
      'answers': [
        {'text': 'Feuerwehr', 'score': 0},
        {'text': 'Landkreis', 'score': 0},
        {'text': 'Arbeitgeber', 'score': 1}
      ]
    },
    {
      'questionText':
          'Wer ist für die Ernennung von Dienstgraden in der Feuerwehr zuständig?',
      'answers': [
        {'text': 'Bürgermeister', 'score': 0},
        {'text': 'Kommandant', 'score': 1},
        {'text': 'Vorstand der Freiwilligen Feuerwehr', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wozu ist jeder Bürger bei Wahrnehmung eines Brandes verpflichtet?',
      'answers': [
        {'text': 'Hat keine Verpflichtung', 'score': 0},
        {'text': 'Muss nur Löschversuche unternehmen', 'score': 0},
        {'text': 'Melden und Löschversuch unternehmen', 'score': 1}
      ]
    },
    {
      'questionText': 'Was ist bei Dienstverhinderung zu veranlassen?',
      'answers': [
        {'text': 'Es ist nichts zu veranlassen', 'score': 0},
        {
          'text': 'Entschuldigung beim Kommandanten oder nächsten Vorgesetzten',
          'score': 1
        },
        {'text': 'Kreisbrandrat ist zu verständigen', 'score': 0}
      ]
    },
    {
      'questionText':
          'Das Mindestalter für die Aufnahme in die Freiwillige Feuerwehr als gemeindliche Einrichtung beträgt?',
      'answers': [
        {'text': '12 Jahre', 'score': 0},
        {'text': '14 Jahre', 'score': 1},
        {'text': '16 Jahre', 'score': 0}
      ]
    },
    {
      'questionText':
          'Bei welchem Versicherungsträger sind Feuerwehrdienstleistende gegen Körperschäden versichert?',
      'answers': [
        {'text': 'Berufsgenossenschaft Glas- und Keramik', 'score': 1},
        {'text': 'Haftpflichtversicherung der Gemeinde', 'score': 0},
        {'text': 'Kommunale Unfallversicherung Bayern', 'score': 0}
      ]
    },
    {
      'questionText': 'Wer ist bei der Wahl des Kommandanten wahlberechtigt?',
      'answers': [
        {
          'text':
              'Alle Feuerwehrdienstleistenden und Feuerwehranwärter ab 16 Jahre',
          'score': 1
        },
        {'text': 'Alle Vereinsangehörigen', 'score': 0},
        {'text': 'Nur die Führungsdienstgrade', 'score': 0}
      ]
    },
    {
      'questionText':
          ' Welche Arten von Feuerwehren nennt das Bayerische Feuerwehrgesetz?',
      'answers': [
        {
          'text': 'Bundesbahnfeuerwehr, Freiwillige Feuerwehr, Berufsfeuerwehr',
          'score': 0
        },
        {
          'text':
              'Flughafenfeuerwehr, Betriebsfeuerwehr, Freiwillige Feuerwehr',
          'score': 0
        },
        {
          'text':
              'Freiwillige Feuerwehr, Pflichtfeuerwehr, Berufsfeuerwehr, Werkfeuerwehr',
          'score': 1
        }
      ]
    },
    {
      'questionText': 'Rechte des Feuerwehrdienstleistenden sind:',
      'answers': [
        {
          'text':
              'Lohnfortzahlung durch Arbeitgeber; Versicherungsschutz bei Personen- und Sachschäden; Freistellung bei Einsätzen',
          'score': 1
        },
        {'text': 'Teilnahme am Dienst nur dann, wenn er Zeit hat', 'score': 0},
        {'text': 'Anspruch auf Platz im Feuerwehrerholungsheim', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche besonderen Aufgaben hat der Truppführer bei Anwendung der Unfallverhütungsvorschriften?',
      'answers': [
        {
          'text':
              'Der Truppführer muss prüfen, welche Bestimmungen der Unfallverhütungsvorschriften den Trupp betreffen',
          'score': 1
        },
        {'text': 'Keine, jeder im Trupp achtet auf sich selbst', 'score': 0},
        {'text': 'Keine, weil beide im Trupp das Gleiche tun', 'score': 0}
      ]
    },
    {
      'questionText':
          'Die Unfallverhütungsvorschrift (UVV) - Feuerwehren hat Gültigkeit...',
      'answers': [
        {'text': 'bei Einhaltung der Versicherungsbedingungen', 'score': 0},
        {'text': 'nur bei Einsätzen', 'score': 0},
        {'text': 'bei Einsätzen, Übungen und Ausbildung', 'score': 1}
      ]
    },
    {
      'questionText':
          'Sie bemerken als Truppführer, dass ihr Truppmann die B-Druckschläuche falsch auswirft. Bis jetzt hat er sich noch nicht verletzt. Wie handeln sie?',
      'answers': [
        {
          'text':
              'Ich muss ihn auf das fachgerechte Auswerfen hinweisen und überwachen',
          'score': 1
        },
        {
          'text':
              'Er hat das richtige Auswerfen in seiner Ausbildung gelernt und muss nun seine Erfahrungen machen',
          'score': 0
        },
        {
          'text':
              'Es ist ja noch nichts passiert, außerdem ist es Aufgabe des Einheitsführers etwas zu sagen',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Ein brennbarer gasförmiger Stoff gehört zur Brandklasse…',
      'answers': [
        {'text': 'A', 'score': 0},
        {'text': 'C', 'score': 1},
        {'text': 'B', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Aussage über brennbare Flüssigkeiten ist richtig??',
      'answers': [
        {'text': 'Anbringen von Dekorationen', 'score': 0},
        {'text': 'Brandbekämpfung und technische Hilfeleistung', 'score': 1},
        {'text': 'Auspumpen von Baugruben', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Aussage über brennbare Flüssigkeiten ist richtig?',
      'answers': [
        {
          'text': 'Es brennen die Dämpfe und die Flüssigkeit selbst',
          'score': 0
        },
        {'text': 'Es brennen nur die Dämpfe einer Flüssigkeit', 'score': 1},
        {'text': 'Es brennt nur die Flüssigkeit', 'score': 0}
      ]
    },
    {
      'questionText': 'Wie kann sich die Verbrennungswärme ausbreiten?',
      'answers': [
        {
          'text': 'Durch Wärmestrahlung, Wärmedurchfluss, Wärmeströmung',
          'score': 0
        },
        {
          'text': 'Durch Wärmestrahlung, Wärmeströmung, Wärmeleitung',
          'score': 1
        },
        {
          'text': 'Durch Wärmeaustausch, Wärmeleitung, Wärmeübergang',
          'score': 0
        }
      ]
    },
    {
      'questionText': 'Welche Stoffe gehören zur Brandklasse F?',
      'answers': [
        {'text': 'Feste Stoffe', 'score': 0},
        {'text': 'Speisefette und -öle', 'score': 1},
        {'text': 'Flüssige Stoffe', 'score': 0}
      ]
    },
    {
      'questionText': 'Wodurch kann ein Feuer gelöscht werden?',
      'answers': [
        {'text': 'Entzug von Stickstoff', 'score': 0},
        {'text': 'Entzug von Wärme (Abkühlen)', 'score': 1},
        {'text': 'Zuführung von Sauerstoff', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche Voraussetzungen sind für das Brennen notwendig?',
      'answers': [
        {'text': 'Es muss nur ein brennbarer Stoff vorhanden sein', 'score': 0},
        {
          'text':
              'Es müssen nur ein brennbarer Stoff und Sauerstoff vorhanden sein',
          'score': 0
        },
        {
          'text':
              'Es müssen brennbarer Stoff, Sauerstoff und Wärme vorhanden sein',
          'score': 1
        }
      ]
    },
    {
      'questionText': 'Welche Stoffe gehören zur Brandklasse B?',
      'answers': [
        {'text': 'Benzin, Diesel, Petroleum', 'score': 1},
        {'text': 'Holz, Papier, Kohle', 'score': 0},
        {'text': 'Propan, Butan, Acetylen', 'score': 1}
      ]
    },
    {
      'questionText': 'Welche Stoffe gehören zur Brandklasse A?',
      'answers': [
        {'text': 'Holz, Papier, Kohle', 'score': 1},
        {'text': 'Benzin, Diesel, Petroleum', 'score': 0},
        {'text': 'Propan, Butan, Acetylen', 'score': 0}
      ]
    },
    {
      'questionText':
          ' Welcher Feuerlöscher ist für Brände fester glutbildender Stoffe besonders geeignet?',
      'answers': [
        {'text': 'Gaslöscher', 'score': 0},
        {'text': 'Pulverlöscher BC', 'score': 0},
        {'text': 'Wasserlöscher', 'score': 1}
      ]
    },
    {
      'questionText':
          'Wer ist für den feuerwehrtechnisch richtigen Einsatz des befohlenen Löschmittels verantwortlich?',
      'answers': [
        {'text': 'Der Truppführer', 'score': 1},
        {'text': 'Der Truppmann', 'score': 0},
        {'text': 'Der Gruppenführer oder Staffelführer', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wer ist für die Auswahl des einzusetzenden Löschmittels zuständig?',
      'answers': [
        {'text': 'Gruppenführer oder Einheitsführer', 'score': 1},
        {'text': 'Truppführer', 'score': 0},
        {'text': 'Truppmann', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wer ist für die Durchführung der Löschtechnik des Trupps verantwortlich?',
      'answers': [
        {'text': 'Der Truppführer', 'score': 1},
        {'text': 'Der Truppmann', 'score': 0},
        {'text': 'Der Einheitsführer', 'score': 0}
      ]
    },
    {
      'questionText':
          'Kann es durch falschen Strahlrohreinsatz bei der Brandbekämpfung zu einer Vergrößerung der Gefahr kommen ?',
      'answers': [
        {'text': 'Ja, z. B. Fettexplosion oder Staubexplosion', 'score': 1},
        {
          'text':
              'Kann nur bei unerfahrenen Feuerwehrdienstleistenden vorkommen',
          'score': 0
        },
        {'text': 'Nein, Wasser ist immer das beste Löschmittel', 'score': 0}
      ]
    },
    {
      'questionText': 'Wie verhält sich Wasser beim Verdampfen?',
      'answers': [
        {'text': 'Sehr starke Volumenvergrößerung', 'score': 1},
        {'text': 'Geringe Volumenvergrößerung', 'score': 0},
        {'text': 'Wasser lässt sich nicht vollständig verdampfenn', 'score': 0}
      ]
    },
    {
      'questionText':
          'Untrügliches Zeichen dafür, dass das Löschmittel Wasser seine Wirkung getan hat, ist die Dampfbildungüber dem Brandherd. Es gilt „Strahlrohr schließen”, wenn...',
      'answers': [
        {
          'text':
              'kein dunkler Rauch, sondern nur weißer Wasserdampf über dem Brandherd aufsteigt',
          'score': 1
        },
        {'text': 'sich Rauch und Dampf über dem Brandherd bilden', 'score': 0},
        {
          'text':
              'eine deutlich erkennbare Wasserschicht über dem brennbaren Material aufgebracht ist',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Welchen Nachteil hat der Sprühstrahl gegenüber dem Vollstrahl?',
      'answers': [
        {
          'text': 'Der Sprühstrahl hat eine geringe Wurfweite und Wurfhöhe',
          'score': 1
        },
        {
          'text': 'Das Wärmebindungsvermögen des Sprühstrahles ist geringer',
          'score': 0
        },
        {
          'text': 'Der Druck am Strahlrohr ist höher als beim Vollstrahl',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Welches Feuerwehrfahrzeug hat eine Löschgruppe als Besatzung?',
      'answers': [
        {'text': 'TSF', 'score': 0},
        {'text': 'TLF', 'score': 1},
        {'text': 'HLF', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Steckleiter befindet sich in der Regel auf dem Dach eines TSF-W?',
      'answers': [
        {'text': 'Einteilige Steckleiter', 'score': 0},
        {'text': 'Zweiteilige Steckleiter', 'score': 1},
        {'text': 'Vierteilige Steckleiter', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welches Feuerlöschfahrzeug besitzt keinen Löschwassertank?',
      'answers': [
        {'text': 'LF 20', 'score': 0},
        {'text': 'MLF', 'score': 1},
        {'text': 'TSF', 'score': 0}
      ]
    },
    {
      'questionText':
          'Auf welchem Feuerlöschfahrzeug ist die Ausstattung zur erweiterten technischen Hilfeleistung verladen?',
      'answers': [
        {'text': 'LF', 'score': 0},
        {'text': 'TLF', 'score': 1},
        {'text': 'HLF', 'score': 0}
      ]
    },
    {
      'questionText':
          'Für wieviele Feuerwehrdienstleistende ist die Beladung von TSA, TSF und TSF-W ausgelegt?',
      'answers': [
        {'text': 'Für einen Trupp 1/1', 'score': 0},
        {'text': 'Für eine Staffel 1/5', 'score': 1},
        {'text': 'Für eine Gruppe 1/8', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wieviele Atemschutzgeräte werden üblicherweise auf Feuerlöschfahrzeugen (TLF ausgenommen) mit Atemschutzausstattung mitgeführt?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '6', 'score': 1},
        {'text': '4', 'score': 0}
      ]
    },
    {
      'questionText':
          'Für wieviele Feuerwehrdienstleistende bietet die Atemschutzausstattung von Löschfahrzeugen (TLF ausgenommen) üblicherweise Schutz?',
      'answers': [
        {'text': 'Für einen Trupp', 'score': 0},
        {'text': 'Für drei Trupps', 'score': 0},
        {'text': 'Für zwei Trupps', 'score': 1}
      ]
    },
    {
      'questionText': 'Was bedeutet die Bezeichnung LF10?',
      'answers': [
        {
          'text':
              'Löschgruppenfahrzeug mit einer zulässigen Gesamtmasse von 10 t',
          'score': 1
        },
        {
          'text':
              'Löschgruppenfahrzeug mit einem Mindesttankvolumenvon 1.000 l) ',
          'score': 0
        },
        {
          'text':
              'Löschgruppenfahrzeug mit einer fest eingebauter Feuerlöschkreiselpumpe FPN 10-1000',
          'score': 1
        }
      ]
    },
    {
      'questionText': 'Was bedeutet die Bezeichnung FPN 10-1000?',
      'answers': [
        {
          'text':
              'Feuerlöschkreiselpumpe Normaldruck mit einer Nennförderstreckevon 1.000 m bei einem Nennförderdruck von 10 bar',
          'score': 1
        },
        {'text': 'Feuerwehrpumpennorm 10, Blatt 100', 'score': 0},
        {
          'text':
              'Feuerlöschkreiselpumpe Normaldruck mit einer Nennförderleistung von 1.000 l/min bei einem Nennförderdruck von 10 bar',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Wie wird die Tragkraftspritze TS (tragbare Feuerlöschkreiselpumpe) nach Norm bezeichnet?',
      'answers': [
        {'text': 'FPN (Fire Pump Normal Pressure)', 'score': 0},
        {'text': 'TFPN (Tragbare Fire Pump Normal Pressure)', 'score': 0},
        {'text': 'PFPN (Portable Fire Pump Normal Pressure)', 'score': 1}
      ]
    },
    {
      'questionText':
          'Welches Feuerwehrfahrzeug hat eine Staffel als Besatzung?',
      'answers': [
        {'text': 'HLF', 'score': 1},
        {'text': 'RW', 'score': 0},
        {'text': 'TSF', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welches Feuerwehrfahrzeug hat einen Trupp als Besatzung?',
      'answers': [
        {'text': 'TSF', 'score': 1},
        {'text': 'HLF', 'score': 0},
        {'text': 'RW', 'score': 0}
      ]
    },
    {
      'questionText': ' Welche Aussage trifft auf ein MLF zu?',
      'answers': [
        {
          'text':
              'Besatzung für eine Gruppe; Beladung für eine Gruppe; 1200 l Löschwasserbehälter',
          'score': 1
        },
        {
          'text':
              'Das MLF führt auf dem Dach eine dreiteilige Schiebeleiter mit',
          'score': 0
        },
        {
          'text': 'Besatzung für eine Staffel; Beladung für eine Gruppe',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Welche aktuellen Fahrzeugtypen gehören zur Gruppe der Feuerlöschfahrzeuge?',
      'answers': [
        {'text': 'GW-L 1; TSF; RW', 'score': 1},
        {'text': 'DLK; WLF; ELW 1', 'score': 0},
        {'text': 'LF 10; HLF 10; LF 20l', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche Verwendung hat das LF 20 KatS?',
      'answers': [
        {'text': 'Rettung von Personen aus Höhen', 'score': 1},
        {'text': 'Technische Hilfeleistung großen Umfangs', 'score': 0},
        {
          'text':
              'Brandbekämpfung, schnelle Wasserabgabe, Wasserförderung, technische Hilfeleistung',
          'score': 0
        }
      ]
    },
    {
      'questionText': ' Welche Besatzung hat ein TLF 3000?',
      'answers': [
        {'text': 'Staffel 1/5', 'score': 1},
        {'text': 'Gruppe 1/8', 'score': 0},
        {'text': 'Trupp 1/2', 'score': 0}
      ]
    },
    {
      'questionText': 'Wie viel Liter Löschwasser führt ein TLF 4000 mit?',
      'answers': [
        {'text': '400 l Löschwasser', 'score': 1},
        {'text': 'Führt kein Löschwasser mit', 'score': 0},
        {'text': '4.000 l Löschwasser', 'score': 0}
      ]
    },
    {
      'questionText': 'Wie viel Liter Löschwasser führt ein TSF mit?',
      'answers': [
        {'text': '500 l Löschwasser', 'score': 1},
        {'text': 'Führt kein Löschwasser mit', 'score': 0},
        {'text': '600 l Löschwasser', 'score': 0}
      ]
    },
    {
      'questionText':
          ' Welche ergänzende Schutzausrüstung kann der Einheitsführer bei Einsätzen mit gefährlichen Stoffen anordnen?',
      'answers': [
        {'text': 'Schutzanzug Bayern 2000', 'score': 0},
        {'text': 'Feuerwehrhelm', 'score': 0},
        {'text': 'Pressluftatmer', 'score': 1}
      ]
    },
    {
      'questionText':
          ' Welche Schutzhandschuhe sind bei der Behandlung von Verletzten zu verwenden?',
      'answers': [
        {'text': 'Infektionsschutzhandschuhe', 'score': 1},
        {
          'text':
              '5-Finger-Lederhandschuhe mit langen Stulpen und Verstärkungen',
          'score': 0
        },
        {'text': 'Mineralölbeständige Schutzhandschuhe', 'score': 0}
      ]
    },
    {
      'questionText': 'Wozu dient die Kübelspritze?',
      'answers': [
        {'text': 'Zum Löschen eines Großbrandes', 'score': 0},
        {
          'text': 'Zum Ablöschen von Brandnestern und Entstehungsbränden',
          'score': 1
        },
        {'text': 'Zum Löschen von Benzinbränden', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Funktionsart kennt man bei tragbaren Feuerlöschern?',
      'answers': [
        {'text': 'Durchladelöscher', 'score': 0},
        {'text': 'Dauerdrucklöscher', 'score': 1},
        {'text': 'Überdrucklöscher', 'score': 0}
      ]
    },
    {
      'questionText':
          'Was ist nach Beendigung des Einsatzes bei tragbaren Feuerlöschern (Pulver) zu beachten?',
      'answers': [
        {
          'text':
              'Wenn der Feuerlöscher nur teilweise entleert wurde, kann er ohne weitere Überprüfung wieder für den nächsten Einsatz benutzt werden',
          'score': 0
        },
        {
          'text': 'Feuerlöscher auf den Kopf stellen und drucklos machen',
          'score': 1
        },
        {
          'text':
              'Alle tragbaren Feuerlöscher sind Einweg-Geräte und müssen nach dem Einsatz fachgerecht entsorgt werden',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Welche Schläuche werden bei der Wasserentnahme aus Hydranten verwendet?',
      'answers': [
        {'text': 'Druckschläuche', 'score': 1},
        {'text': 'Saugschläuche', 'score': 0},
        {'text': 'Mineralölbeständige Schläuche', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wer ist für die Ernennung von Dienstgraden in der Feuerwehr zuständig?',
      'answers': [
        {'text': 'Bürgermeister', 'score': 0},
        {'text': 'Kommandant', 'score': 1},
        {'text': 'Vorstand der Freiwilligen Feuerwehr', 'score': 0}
      ]
    },
    {
      'questionText': 'Wozu findet das Standrohr Verwendung?',
      'answers': [
        {'text': 'Zur Wasserentnahme aus Überflurhydranten', 'score': 0},
        {'text': 'Zur Wasserentnahme aus Löschwasserbehältern', 'score': 0},
        {'text': 'Zur Wasserentnahme aus Unterflurhydranten', 'score': 1}
      ]
    },
    {
      'questionText': 'Armaturen zur Löschmittelfortleitung sind:',
      'answers': [
        {'text': 'Strahlrohre', 'score': 0},
        {'text': 'Sammelstück, Verteiler, Stützkrümmer', 'score': 1},
        {'text': 'Saugkorb, Standrohr', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Längen haben B-Druckschläuche nach gültiger Norm?',
      'answers': [
        {'text': '15, 20 und 30 m', 'score': 0},
        {'text': '5, 15 und 35 m', 'score': 0},
        {'text': '5, 20 und 35 m', 'score': 1}
      ]
    },
    {
      'questionText':
          'Warum sind Hohlstrahlrohre für den Innenangriff anstelle von Mehrzweckstrahlrohren zu bevorzugen?',
      'answers': [
        {'text': 'Hohlstrahlrohre sind teurer', 'score': 1},
        {
          'text':
              'Mit Hohlstrahlrohren lässt sich eine bessere Kühl- und Löschwirkung erzielen',
          'score': 0
        },
        {'text': 'Hohlstrahlrohre besitzen keine Spülstellung', 'score': 0}
      ]
    },
    {
      'questionText':
          ' Welche maximale Steighöhe kann in der Regel mit vier Steckleiterteilen erreicht werden?',
      'answers': [
        {'text': '2. Obergeschoss', 'score': 1},
        {'text': '1. Obergeschoss', 'score': 0},
        {'text': '3. Obergeschoss', 'score': 0}
      ]
    },
    {
      'questionText': 'Wo darf eine Feuerwehrleine nicht eingesetzt werden?',
      'answers': [
        {'text': 'Zum Hochziehen von Geräten', 'score': 0},
        {'text': 'Zum Einbinden von Verletzten auf einer Trage', 'score': 0},
        {
          'text':
              'Zum Sichern gegen Absturz, wenn ein freier Fall nicht auszuschließen ist',
          'score': 1
        }
      ]
    },
    {
      'questionText': 'Wozu dient die Tauchpumpe?',
      'answers': [
        {'text': 'Zur Luftversorgung für Taucher', 'score': 0},
        {'text': 'Zum Fördern von brennbaren Flüssigkeiten', 'score': 0},
        {
          'text':
              'Zum Auspumpen überfluteter Keller, Schächte, Gruben und Behälter',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          'Worauf ist bei der Inbetriebnahme eines Unterflurhydrantenzu achten?',
      'answers': [
        {
          'text': 'Bei Frostgefahr die Straßenkappe mit Sand füllen',
          'score': 0
        },
        {
          'text': 'Es ist immer eine Wasseruhr am Standrohr anzubringen',
          'score': 0
        },
        {
          'text':
              'Beim Setzen des Standrohres muss die Klauenmutter ganz nach unten geschraubt sein',
          'score': 1
        }
      ]
    },
    {
      'questionText': 'Wann ist Feuerwehrschutzschuhwerk zu tragen?',
      'answers': [
        {'text': 'Beim Feuerwehrfest', 'score': 0},
        {'text': 'Im Unterricht', 'score': 0},
        {'text': 'Bei Einsätzen und Übungen', 'score': 1}
      ]
    },
    {
      'questionText':
          'Welche Einsatzgrundsätze für tragbare Feuerlöscher sind richtig?',
      'answers': [
        {
          'text': 'Nach Möglichkeit mehrere Löscher gleichzeitig einsetzen',
          'score': 1
        },
        {'text': 'Alle Brände von oben nach unten löschen', 'score': 0},
        {'text': 'Feuer gegen die Windrichtung angreifen', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wie groß ist die Wasserabgabe bei CM-Strahlrohren mit Mundstück bei einem Strahlrohrdruckvon ca. 5 bar?',
      'answers': [
        {'text': 'ca. 200 l/min', 'score': 0},
        {'text': 'ca. 100 l/min', 'score': 1},
        {'text': 'ca. 400 l/min', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Behandlung von Druckschläuchen nach dem Gebrauch (Einsatz) ist richtig?',
      'answers': [
        {'text': 'Nach jedem Gebrauch reinigen und trocknen', 'score': 1},
        {'text': 'Nasse Schläuche doppelt rollen', 'score': 0},
        {'text': 'Schläuche zum Trocknen in die Sonne legen', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wie viele C-Schläuche befinden sich in der Regel in einem Schlauchtragekorb?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '3', 'score': 1},
        {'text': '4', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wie ist eine Person, die über tragbare Leitern gerettet werden soll, zu sichern?',
      'answers': [
        {
          'text': 'Mit Brustbund und Spierenstich als Knotensicherung',
          'score': 1
        },
        {
          'text':
              'Überhaupt nicht, weil das Anlegen von Knoten zu zeitaufwändig ist',
          'score': 0
        },
        {
          'text': 'Mit doppeltem Ankerstich und Halbschlag zum Hintersichern',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Welche ergänzende persönliche Ausrüstung ist beim Hilfeleistungseinsatz erforderlich?',
      'answers': [
        {'text': 'Vollschutzanzug, Gesichtsschutz', 'score': 0},
        {'text': 'Gesichtsschutz, Infektionsschutzhandschuhe', 'score': 1},
        {
          'text': 'Schnittschutz (Beinlinge), Infektionsschutzhandschuhe',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Wie groß muss der Abstand des Warndreieckes zur Unfallstelle sein, wenn sich der Unfall auf einer Straße mit Gegenverkehr außerhalb geschlossener Ortschaften ereignete?',
      'answers': [
        {'text': 'ca. 50 m', 'score': 0},
        {'text': 'ca. 200 m', 'score': 1},
        {'text': 'ca. 100 m', 'score': 0}
      ]
    },
    {
      'questionText':
          'Warum wird beim Einsatz des B-Strahlrohres der Stützkrümmer verwendet?',
      'answers': [
        {'text': 'Um den Wasserdurchfluss zu vergrößern', 'score': 0},
        {
          'text': 'Um den Schlauch mit dem Strahlrohr verbinden zu können',
          'score': 0
        },
        {
          'text': 'Um den Trupp zu entlasten (Verringerung der Rückstoßkräfte)',
          'score': 1
        }
      ]
    },
    {
      'questionText': 'Wozu dient der Unterflurhydrantenschlüssel?',
      'answers': [
        {'text': 'Öffnen der Hydrantenabdeckung und des Hydranten', 'score': 1},
        {'text': 'Öffnen des Feuerwehrhauses', 'score': 0},
        {'text': 'Öffnen des Fallmantels', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wieviele Steckleiterteile dürfen höchstens zusammengesteckt werden?',
      'answers': [
        {'text': 'Drei Leiterteile', 'score': 0},
        {'text': 'Vier Leiterteile', 'score': 1},
        {'text': 'Sechs Leiterteile', 'score': 0}
      ]
    },
    {
      'questionText':
          'Für welche Rettungshöhe ist ein Sprungpolster (SP16) maximal zugelassen?',
      'answers': [
        {'text': 'max. 8 m', 'score': 0},
        {'text': 'max. 22 m', 'score': 0},
        {'text': 'max. 16 m', 'score': 1}
      ]
    },
    {
      'questionText':
          'Wer ordnet dem Truppführer die zu benutzende Schutzausrüstung an?',
      'answers': [
        {'text': 'Truppführer entscheidet selbst', 'score': 0},
        {
          'text':
              'Eine besondere Anordnung ist nicht notwendig.Jeder weiß selbst, was er tun muss',
          'score': 0
        },
        {'text': 'Der Einheitsführer', 'score': 1}
      ]
    },
    {
      'questionText':
          'Auf was muss beim Aufstellen einer tragbaren Leiter u.a. geachtet werden?',
      'answers': [
        {'text': 'Auf einen Anstellwinkel von 15°', 'score': 0},
        {
          'text': 'Dass sie so nahe wie möglich an das Gebäudegerückt wird',
          'score': 0
        },
        {'text': 'Auf einen festen Standplatz', 'score': 1}
      ]
    },
    {
      'questionText':
          'In welchem Anstellwinkel soll eine tragbare Leiter aufgestellt werden?',
      'answers': [
        {'text': '45° - 65°', 'score': 0},
        {'text': 'Immer 90°', 'score': 0},
        {'text': '65° - 75°', 'score': 1}
      ]
    },
    {
      'questionText':
          'Mit welchen Knoten soll eine Schlauchleitung mit Strahlrohr befestigt werden, um sie in ein Obergeschoss hochzuziehen?',
      'answers': [
        {'text': 'Kreuzknoten', 'score': 0},
        {'text': 'Schotenstich mit Halbschlag', 'score': 0},
        {'text': 'Mastwurf und Halbschlag', 'score': 1}
      ]
    },
    {
      'questionText':
          'Was müssen sie als Truppführer beim Aufstellen einer tragbaren Leiter u. a. beachten?',
      'answers': [
        {'text': 'Fußteil so nahe wie möglich an das Gebäude', 'score': 0},
        {
          'text':
              'Leiterkopf darf nicht über den Einstieg (z. B. Fenster) hinausragen',
          'score': 0
        },
        {'text': 'Leiter grundsätzlich immer sichern', 'score': 1}
      ]
    },
    {
      'questionText':
          'Wie viele Einsatzkräfte werden benötigt, um eine 4-teilige Steckleiter aufzustellen?',
      'answers': [
        {'text': 'Zwei Personen', 'score': 0},
        {'text': 'Eine Staffelbesatzung', 'score': 0},
        {'text': 'Drei oder vier Personen', 'score': 1}
      ]
    },
    {
      'questionText':
          'Der Einheitsführer befiehlt ihrem Trupp mit einem Pulverlöscher im Freien einen Brand zu löschen. Was ist zu beachten?',
      'answers': [
        {'text': 'Feuer gegen die Windrichtung angreifen', 'score': 0},
        {'text': 'Feuer seitlich angreifen', 'score': 0},
        {'text': 'Feuer in Windrichtung angreifen', 'score': 1}
      ]
    },
    {
      'questionText':
          'Zur Rettung und Sicherung wird ein Brustbund angelegt.Welche Knoten/Stiche werden zur Sicherungverwendet?',
      'answers': [
        {'text': 'Zimmermannsschlag', 'score': 0},
        {'text': 'Doppelschlinge und Halbschlag', 'score': 0},
        {
          'text': 'Pfahlstich und Spierenstich bzw. Pfahlstich und Kreuzschlag',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          'Es wird die Rettung einer Person über die Steckleiterbefohlen. Welche Leine darf zur Sicherung der Personverwendet werden?',
      'answers': [
        {'text': 'Mehrzweckleine', 'score': 0},
        {'text': 'Alle Leinen', 'score': 0},
        {'text': 'Feuerwehrleine', 'score': 1}
      ]
    },
    {
      'questionText':
          'Für welche Einsatzmöglichkeiten findet die Brechstange Anwendung?',
      'answers': [
        {'text': 'Um eine Kraft abzufedern', 'score': 0},
        {'text': 'Um Kraft und Weg zu sparen', 'score': 0},
        {'text': 'Verwendung als Hebel', 'score': 1}
      ]
    },
    {
      'questionText':
          'Mit welcher Gangart können tragbare Leitern nach FwDV 10 „Tragbare Leiter” bestiegen werden?',
      'answers': [
        {
          'text':
              'Erlaubt ist nur der Kreuzgang, wobei die Sprossen im Klammergriff zu umfassen sind',
          'score': 0
        },
        {
          'text':
              'Im Pass- oder Kreuzgang, wobei die Holme im Klammergriff zu umfassen sind',
          'score': 0
        },
        {
          'text':
              'Im Pass- oder Kreuzgang, wobei die Sprossen im Klammergriff zu umfassen sind',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          'Welche Schaltmöglichkeiten müssen bei einem genormten Hohlstrahlrohr gegeben sein?',
      'answers': [
        {
          'text':
              'Sprühstrahl und Vollstrahl, Einstellmöglichkeit der Wasserstrahlform',
          'score': 0
        },
        {'text': 'Durchflussmengeneinstellung, Strahlrohr auf/zu', 'score': 0},
        {
          'text':
              'Strahlrohr auf/zu, Einstellmöglichkeit der Wasserstrahlform und Durchflussmengeneinstellung',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          'Welche Schaltstellungen besitzt ein Mehrzweckstrahlrohr?',
      'answers': [
        {'text': 'Mittelstrahl, Strahlrohr zu/auf', 'score': 0},
        {'text': 'Sprühstrahl, Strahlrohr auf/zu', 'score': 0},
        {'text': 'Strahlrohr zu, Sprühstrahl, Vollstrahl', 'score': 1}
      ]
    },
    {
      'questionText':
          'Sie haben als Trupp den Auftrag mit einem Pulverlöscher einen Flüssigkeitsbrand zu bekämpfen. Auf was haben sie zu achten?',
      'answers': [
        {
          'text':
              'Der Löschstrahl sollte direkt in die brennende Flüssigkeitgeführt werden',
          'score': 0
        },
        {'text': 'Sich möglichst nahe an den Brandherd annähern', 'score': 1},
        {
          'text':
              'Den Löschstrahl nicht direkt in, sondern fächerförmig über die brennende Flüssigkeit verteilen',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          'Darf der vorgehende Trupp die Steckleiter selbst sichern?',
      'answers': [
        {'text': 'Nein, grundsätzlich nicht', 'score': 0},
        {
          'text':
              'Nein, der Trupp wartet, bis der Melder oder ein Sicherungstrupp kommt',
          'score': 0
        },
        {
          'text':
              'Ja, der Truppmann sichert und der Truppführersteigt auf. Danach sichert der Truppführer und der Truppmann steigt auf',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          'Wer kann eine Abweichung von der persönlichen Schutzausrüstung anordnen?',
      'answers': [
        {'text': 'Der Truppführer', 'score': 0},
        {'text': 'Jeder im Trupp trifft seine eigene Entscheidung', 'score': 0},
        {'text': 'Nur der Einheitsführer', 'score': 1}
      ]
    },
    {
      'questionText':
          'Welche Lagerung für eine bewusstlose Person ist richtig?',
      'answers': [
        {'text': 'Kopf tief lagern', 'score': 0},
        {'text': 'Flach auf den Rücken legen', 'score': 0},
        {'text': 'Stabile Seitenlage', 'score': 1}
      ]
    },
    {
      'questionText':
          'Welche Aussage zu verletzten Personen, die noch im Fahrzeug sitzen, ist richtig?',
      'answers': [
        {
          'text':
              'Verletzte müssen immer schnellstmöglich aus dem Fahrzeug geholt werden',
          'score': 0
        },
        {
          'text': 'Eingeklemmte Personen müssen sofort befreit werden',
          'score': 0
        },
        {
          'text':
              'Sofern keine akute Gefahr durch Brand, Bewusstlosigkeit ä. besteht, sollen Verletzte im Fahrzeugverbleiben bis der Rettungsdienst die medizinischeLage beurteilt hat',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          'Was gehört zur Überprüfung der lebenswichtigen Körperfunktionen?',
      'answers': [
        {
          'text':
              'Ich sorge mit Rettungsdecke oder Krankenhausdecke für Wärmeerhalt',
          'score': 0
        },
        {
          'text':
              'Ich spreche ihn laut an. Ich schüttle an den Schultern,kontrolliere Mund und Rachenraum, stelle die Atmung fest',
          'score': 1
        },
        {'text': 'Ich decke keimfrei die Brandwunden ab', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wie betreue ich als Ersthelfer (Feuerwehrdienstleistender) eine verletzte Person?',
      'answers': [
        {'text': 'Das ist nicht Aufgabe der Feuerwehr', 'score': 0},
        {
          'text':
              'Ich leiste Erste Hilfe. Sage, dass ich für ihn da bin, dass der Rettungsdienst informiert ist. Ich spreche ihm gut zu und höre zu',
          'score': 1
        },
        {
          'text': 'Ich warte bis der Rettungsdienst an der Einsatzstelle ist',
          'score': 0
        }
      ]
    },
    {
      'questionText': 'Wie erkenne ich die sichtbaren Schockanzeichen?',
      'answers': [
        {'text': 'Schneller und gut tastbarer Puls', 'score': 0},
        {
          'text': 'Fahle Blässe, Frieren, kalter Schweiß auf der Stirn',
          'score': 1
        },
        {'text': 'Ich messe den Blutdruck', 'score': 0}
      ]
    },
    {
      'questionText':
          'Was unternehmen Sie bei einer starken Blutung (Schnittwunde)?',
      'answers': [
        {'text': 'Abbinden der Blutung, z. B. am Arm', 'score': 0},
        {'text': 'Druckverband anlegen', 'score': 1},
        {
          'text':
              'Rettungsdienst nicht verständigen, wenn die Blutung gestoppt werden kann',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Wie gehen Sie beim Vorfinden einer bewusstlosen Person vor?',
      'answers': [
        {
          'text': 'Den Verletzten in die stabile Seitenlage bringen',
          'score': 0
        },
        {
          'text':
              'Ich kontrolliere die Atmung und den Mundraum, dannbringe ich den Verletzten in die stabile Seitenlage und betreue ihn bis zum Eintreffen des Rettungsdienstes',
          'score': 1
        },
        {'text': 'Die Polizei verständigen', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Einsatzgrundsätze gelten u. a. an der Einsatzstelle bezüglich der Einsatzhygiene?',
      'answers': [
        {'text': 'Wird erst durch den Einheitsführer bestimmt', 'score': 0},
        {
          'text': 'Im Gefahrenbereich nicht essen, trinken und rauchen',
          'score': 1
        },
        {
          'text': 'Die Einsatzhygiene ist erst im Feuerwehrhaus durchzuführen',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Welche Hygienemaßnahme ist beim Umgang mit Verletzten zu beachten?',
      'answers': [
        {
          'text':
              'Es ist ausreichend, nach dem Einsatz sich gründlich die Hände zu waschen',
          'score': 0
        },
        {
          'text':
              'Beim Umgang mit Verletzten sind Infektionsschutzhandschuhe zu tragen',
          'score': 1
        },
        {
          'text': 'Die Feuerwehrhandschuhe stellen einen genügenden Schutz dar',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Ein Feuerwehrangehöriger nimmt unter Medikamenteneinfluss an einem Einsatz teil. Welche Folgen kann dies haben?',
      'answers': [
        {
          'text':
              'Da die Krankheitssymptome ausgeschaltet sind, ist mit keinerlei Folgen zu rechnen',
          'score': 0
        },
        {
          'text':
              'Hohe körperliche Anforderungen können zu einer Überlastung führen',
          'score': 1
        },
        {
          'text':
              'Der Einsatzleiter ist zu informieren, damit er sich um einen eventuelle ärztliche Versorgung vor Ort kümmert',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Nach einem Feuerwehreinsatz ist Ihre Einsatzkleidung stark verschmutzt. Wie verhalten Sie sich vor dem Abrücken?',
      'answers': [
        {
          'text':
              'Es ist nichts besonderes zu beachten, lediglich die Fenster der Mannschaftskabine öffnen',
          'score': 0
        },
        {
          'text':
              'Stark verschmutzte Einsatzkleidung nicht in der Mannschaftskabine transportieren; gesondert in einem Behälter/Sack transportieren',
          'score': 1
        },
        {
          'text':
              'Es ist ausreichend, die Einsatzkleidung am Gerätehaus zu reinigen',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Sie rücken nach einem Feuerwehreinsatz im Gerätehaus ein, wie verhalten Sie sich richtig?',
      'answers': [
        {
          'text': 'Nach dem Einrücken ist die Verpflegung zu organisieren',
          'score': 0
        },
        {
          'text':
              'Im Gerätehaus Aufenthalts- und Sozialräume nicht mit verschmutzter Einsatzkleidung betreten; Schwarz/Weiß-Trennung beachten',
          'score': 1
        },
        {
          'text':
              'Getränke verteilen, verschmutzte Einsatzkleidung im Spind verstauen',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Welche Faktoren können die persönliche Einsatzfähigkeit negativ beeinflussen?',
      'answers': [
        {'text': 'Ausreichend Schlaf', 'score': 0},
        {'text': 'Krankheit, Alkohol, Rauschmittel', 'score': 1},
        {'text': 'Guter Gesundheitszustand', 'score': 0}
      ]
    },
    {
      'questionText':
          'Worauf achten Sie bei Fahrzeugen, die zum Einsatz aus der Fahrzeughalle fahren?',
      'answers': [
        {'text': 'Vollständige Besatzung', 'score': 0},
        {
          'text': 'Nicht auf bereits anfahrende Fahrzeuge aufspringen',
          'score': 1
        },
        {'text': 'Atemschutzgeräte bereits in der Fahrzeughalle', 'score': 0}
      ]
    },
    {
      'questionText':
          'Warum müssen Sie ihrem Einheitsführer bei der Mannschaftseinteilung während der Anfahrt mitteilen, wenn ihre Einsatzbereitschaft z. B. durch eine Erkältungbeeinträchtigt ist?',
      'answers': [
        {
          'text':
              'Ich muss es dem Einheitsführer nicht mitteilen, weil ich erwarten kann, dass er meine verminderte Einsatzfähigkeit selbst erkennt',
          'score': 0
        },
        {
          'text':
              'Nur so kann der Einheitsführer die Einsatzfähigkeit jedes Feuerwehrdienstleistenden bei der Einteilung berücksichtigent',
          'score': 1
        },
        {'text': 'Damit er Sie nicht als Gruppenführer einteilt', 'score': 0}
      ]
    },
    {
      'questionText':
          'Zu welcher Fahrzeugseite hin wird die Mannschaft bei Eintreffen an der Einsatzstelle im Regelfall absitzen, wenn der Einheitsführer keine anderen Anweisungen gibt?',
      'answers': [
        {'text': 'Zur verkehrszugewandten Seite', 'score': 0},
        {'text': 'Zur verkehrsabgewandten Seite', 'score': 1},
        {
          'text':
              'Alle Feuerwehrdienstleistenden steigen auf der ihrem Sitzplatz nächstgelegenen Fahrzeugseite aus',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Wie verhalten Sie sich, wenn Sie den Einsatzbefehl des Einheitsführers nicht richtig verstanden haben?',
      'answers': [
        {'text': 'Ich bestätige mit „Verstanden Ende!“', 'score': 0},
        {'text': 'Ich frage beim Einheitsführer nach', 'score': 1},
        {
          'text': 'Ich verzichte auf die Wiederholung des Einsatzbefehls',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Welche Einsatzgrundsätze gelten beim Vorgehen eines Angriffstrupps?',
      'answers': [
        {
          'text':
              'Trupp teilt sich immer auf und jeder führt seine Aufgaben durch',
          'score': 0
        },
        {
          'text': 'Trupp bleibt zusammen und beachtet die Eigensicherung',
          'score': 1
        },
        {
          'text': 'Nur der Truppmann gibt Rückmeldung an den Einheitsführer',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Wie verhalten Sie sich als Truppführer, wenn Einsturzgefahr besteht?',
      'answers': [
        {
          'text': 'Ein Hinweis an den Einheitsführer ist ausreichend',
          'score': 0
        },
        {
          'text':
              'Hinweis an den Truppmann geben, im Trupp Schutz unter besonders standfesten Gebäudeteilen suchen, Rückzugsweg sicherstellen, Meldung an den Einheitsführer',
          'score': 1
        },
        {'text': 'Ein Hinweis an den Truppmann ist ausreichend', 'score': 0}
      ]
    },
    {
      'questionText':
          'An der Einsatzstelle ertönt das Signal „Gefahr – Alles zurück!“ Wie verhalten Sie sich?',
      'answers': [
        {
          'text': 'Es reicht völlig aus, wenn ich nur das Signal wiederhole',
          'score': 0
        },
        {
          'text':
              'Signal wiederholen, Sammelplatz am Fahrzeug aufsuchen,Meldung beim Einheitsführer',
          'score': 1
        },
        {
          'text': 'Ich gehe mit meinem Trupp zum Rettungswagen (RTW)',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Warum wird nach Einsätzen eine Einsatznachbesprechung durchgeführt?',
      'answers': [
        {
          'text':
              'Um Truppführer, die sich falsch verhalten haben, vor der gesamten Mannschaft zu tadeln',
          'score': 0
        },
        {
          'text':
              'Um Fremd- und Eigenfehler zu erkennen, das Einsatzgeschehen zu verbessern und belastende Situationen zu erkennen',
          'score': 1
        },
        {'text': 'Um die Einsatzdauer zu erhöhen', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wie verhalten Sie sich als Wassertruppmann beim Eintreffen an der Einsatzstelle?',
      'answers': [
        {
          'text':
              'Ich springe sofort aus dem Fahrzeug und suche eine Wasserentnahmestelle, denn Wasser wird für den Feuerwehreinsatz immer dringend benötigt',
          'score': 0
        },
        {
          'text':
              'Auf den Einsatzbefehl des Einheitsführer warten, Ruhe bewahren und keine unüberlegten Aktionen durchführen',
          'score': 1
        },
        {'text': 'Ich trete in jedem Fall hinter dem Fahrzeug an', 'score': 0}
      ]
    },
    {
      'questionText': 'Was versteht man unter Kontamination?',
      'answers': [
        {
          'text':
              'Reinigung der Oberfläche von Lebewesen, des Bodens, von Gewässern und Gegenständen bei Verunreinigung mit ABC-Gefahrstoffen',
          'score': 0
        },
        {
          'text':
              'Verunreinigung der Oberfläche von Lebewesen,des Bodens, von Gewässern und Gegenständenmit ABC-Gefahrstoffen',
          'score': 1
        },
        {
          'text':
              'Aufnahme von Schadstoffen in den Körper, zum Beispiel über die Atemwege',
          'score': 0
        }
      ]
    },
    {
      'questionText': 'Was versteht man unter Inkorporation?',
      'answers': [
        {
          'text':
              'Reinigung der Oberfläche von Lebewesen, des Bodens, von Gewässern und Gegenständen bei Verunreinigung mit ABC-Gefahrstoffen',
          'score': 0
        },
        {
          'text':
              'Aufnahme von Schadstoffen in den Körper, zum Beispiel über die Atemwege oder bei der Nahrungsaufnahme',
          'score': 1
        },
        {
          'text':
              'Verunreinigung der Oberfläche von Lebewesen, des Bodens, von Gewässern und Gegenständen mit ABC-Gefahrstoffen',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Wie erfolgt die Übertragung von Krankheitserregern bei einer Tröpfcheninfektion?',
      'answers': [
        {
          'text':
              'Durch den Kontakt mit Körperflüssigkeiten eines Verletzten (z. B. Blut, Erbrochenes)',
          'score': 0
        },
        {'text': 'Durch Husten, Niesen oder Ansprechen', 'score': 1},
        {'text': 'Durch Tragen von Infektionsschutzhandschuhen', 'score': 0}
      ]
    },
    {
      'questionText': 'Wie werden Kanülen nach Gebrauch entsorgt?',
      'answers': [
        {'text': 'Zusammen mit dem Schrott der Unfallfahrzeuge', 'score': 0},
        {
          'text': 'Entsorgung in speziellen Behältern (Spritzenabwurf)',
          'score': 1
        },
        {
          'text':
              'Die Entsorgung ist ausschließlich Aufgabe des Rettungsdienstes',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Warum wird der Einheitsführer versuchen, die Anzahl der Einsatzkräfte im Gefahrenbereich auf das erforderliche Mindestmaß reduzieren?',
      'answers': [
        {
          'text': 'Damit alle gleichmäßig mit Arbeit belastet werden',
          'score': 0
        },
        {
          'text':
              'Um die Infektionsgefahr und Eigengefährdung der Einsatzkräfte zu verringern',
          'score': 1
        },
        {
          'text':
              'Um die notwendige Lohnfortzahlung im Einsatzfall möglichst gering zu halten',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Wie werden stark verschmutzte Geräte nach Einsatzende von der Einsatzstelle zum Feuerwehrhaus transportiert?',
      'answers': [
        {'text': 'Im Mannschaftsraum des Löschfahrzeugs', 'score': 0},
        {
          'text':
              'In einem Kunststoffsack oder einem dichtschließenden Behälter verpackt',
          'score': 1
        },
        {
          'text':
              'Durch Fahrzeuge des Rettungsdienstes, da diese regelmäßig desinfizieret werden',
          'score': 0
        }
      ]
    },
    {
      'questionText': 'Worauf ist bei Einsturzgefahr besonders zu achten?',
      'answers': [
        {'text': 'Trümmerschatten beachten', 'score': 1},
        {'text': 'Ergänzende persönliche Schutzausrüstung tragen', 'score': 0},
        {'text': 'Windrichtung beachten', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wie kann ich mich vor der Gefahr durch Erkrankung/ Ansteckung schützen?',
      'answers': [
        {'text': 'Immer Atemschutz tragen', 'score': 0},
        {'text': 'Schnittschutzkleidung tragen', 'score': 0},
        {
          'text':
              'Beim Umgang mit Verletzten Infektionsschutzhandschuhe tragen',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          'Welche Abstände sind von Spannung führenden Teilen beim Einsatz von CM-Strahlrohren zu halten?',
      'answers': [
        {
          'text':
              '1 m für Sprühstrahl bei Niederspannung und 10 m für Vollstrahl bei Hochspannung',
          'score': 1
        },
        {'text': 'Entsprechend der Wurfweite des Strahlrohres', 'score': 0},
        {
          'text':
              'Wasser darf im Bereich der elektrischen Anlagen nicht eingesetzt werden',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Welche Gefahr fehlt im folgenden Merkschema für die Gefahren der Einsatzstelle? Atemgifte, Angstreaktionen, Atomare Gefahren, Ausbreitung, Chemische Stoffe, Erkrankung, Explosion, Einsturz',
      'answers': [
        {'text': 'Elektrizität', 'score': 1},
        {'text': 'Ertrinken', 'score': 0},
        {'text': 'Absturz', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wie lässt sich die Strahlenbelastung bei atomaren Gefahren verringern?',
      'answers': [
        {
          'text': 'Abstand halten, Einsatzzeit begrenzen, Abschirmung nutzen',
          'score': 1
        },
        {'text': 'An der Einsatzstelle trinken, essen und rauchen', 'score': 0},
        {'text': 'Mit Wasser-Sprühstrahl eine „Hydrowand” aufbauen', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wie kann sich der Angriffstrupp vor der Gefahr durch Brandausbreitung schützen?',
      'answers': [
        {'text': 'Nur mit Wasser am Rohr vorgehen', 'score': 1},
        {
          'text':
              'Schnell und ohne Sicherung der Rückzugswege zum Brandherd vordringen, um die Ausbreitungszeit zu begrenzen',
          'score': 0
        },
        {'text': 'Nur unter umluftunabhängigem Atemschutz vorgehen', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welches Verhalten kann bei der Stressbewältigung hilfreich sein?',
      'answers': [
        {'text': 'Pausen einlegen, sich ablösen lassen', 'score': 1},
        {'text': 'Aufgaben möglichst alleine durchführen', 'score': 0},
        {'text': 'Schneller arbeiten, um sich abzulenken', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche der folgenden Symptome sind üblicherweise anzutreffende negative Stressreaktionen?',
      'answers': [
        {'text': 'Zittern, Schwitzen', 'score': 1},
        {'text': 'Konzentrationssteigerung', 'score': 0},
        {'text': 'Euphorie', 'score': 0}
      ]
    },
    {
      'questionText': 'Was ist Stress?',
      'answers': [
        {'text': 'Eine Reaktion des Körpers', 'score': 1},
        {'text': 'Eine Fastenspeise', 'score': 0},
        {'text': 'Ein gefährlicher Stoff', 'score': 0}
      ]
    },
    {
      'questionText':
          'Was hat der Truppführer beim Vorgehen des Trupps zu beachten?',
      'answers': [
        {'text': 'Ständig auf mögliche Gefahrensituationen achten', 'score': 1},
        {
          'text': 'Dass immer Sichtkontakt zu seinem Einheitsführer besteht',
          'score': 0
        },
        {'text': 'Keine weitere Verantwortung für den Trupp', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche der folgenden Symptome sind üblicherweise anzutreffende negative Stressreaktionen?',
      'answers': [
        {'text': 'Zittern, Schwitzen', 'score': 1},
        {'text': 'Konzentrationssteigerung', 'score': 0},
        {'text': 'Euphorie', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welcher Sicherheitsabstand muss mindestens zu spannungsführenden Anlagen mit einer Spannung von 380 kV eingehalten werden?',
      'answers': [
        {'text': '5 m', 'score': 1},
        {'text': '1 m', 'score': 0},
        {'text': '1,5 m', 'score': 0}
      ]
    },
    {
      'questionText': 'Was ist der Trümmerschatten?',
      'answers': [
        {
          'text':
              'Ein durch Einsturz bedrohter Bereich, nur im Innern eines Gebäudes',
          'score': 1
        },
        {'text': 'Ein durch Trümmer schwer einsehbarer Bereich', 'score': 0},
        {'text': 'Ein durch Einsturz bedrohter Bereich', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Schutzmaßnahmen beachten sie als Truppführer bei der Gefahr durch Elektrizität?',
      'answers': [
        {'text': 'Die Einhaltung erforderlicher Mindestabstände', 'score': 1},
        {
          'text':
              'Die Strahlrohreinstellung „Sprühstrahl”, durch die alle Risiken ausgeschlossen sind',
          'score': 0
        },
        {
          'text':
              'Durch die Erdung durch meine Schlauchleitung besteht keine Gefahr',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Welcher Trupp stellt in der Regel die Wasserversorgung zwischen Löschfahrzeug und Wasserentnahme her?',
      'answers': [
        {'text': 'Wassertrupp', 'score': 1},
        {'text': 'Angriffstrupp', 'score': 0},
        {'text': 'Schlauchtrupp', 'score': 0}
      ]
    },
    {
      'questionText':
          'Mit welcher Ausrüstung geht der Angriffstrupp bei einem Brandeinsatz (Außenangriff) im Regelfall vor?',
      'answers': [
        {'text': 'Pulverlöscher', 'score': 0},
        {'text': 'Kübelspritze und C-Schlauch', 'score': 0},
        {'text': 'Strahlrohr, Schlauchhalter, Beleuchtungsgerät', 'score': 1}
      ]
    },
    {
      'questionText':
          'Wo wird am Verteiler das 2. C-Rohr angeschlossen (in Fließrichtung des Wassers betrachtet)?',
      'answers': [
        {'text': 'links', 'score': 0},
        {'text': 'rechts', 'score': 1},
        {'text': 'mittig', 'score': 0}
      ]
    },
    {
      'questionText':
          'Nach dem Kommando „Gefahr - Alle sofort zurück!“ sammeln sich die Einsatzkräfte…',
      'answers': [
        {'text': 'am Verteiler', 'score': 0},
        {'text': 'bei der Einsatzleitung', 'score': 0},
        {'text': 'am Feuerwehrfahrzeug', 'score': 1}
      ]
    },
    {
      'questionText':
          'Welche Angaben sind auf dem Hinweisschild zu einem Unterflurhydranten enthalten?',
      'answers': [
        {'text': 'Betriebsdruck und Wasserlieferung', 'score': 0},
        {
          'text': 'Position des Hydranten und Durchmesser der Wasserleitung',
          'score': 1
        },
        {
          'text': 'Zuständiger Wasserwart und Position des Hydranten',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Wer kuppelt bei einer Gruppe, bei der Wasserentnahme aus offenen Gewässern, die Saugleitung?',
      'answers': [
        {'text': 'Angriffstrupp, der Wassertrupp unterstützt', 'score': 0},
        {'text': 'Schlauchtrupp, der Wassertrupp unterstützt', 'score': 0},
        {'text': 'Wassertrupp, der Schlauchtrupp unterstützt', 'score': 1}
      ]
    },
    {
      'questionText':
          'In welcher Reihenfolge wird die Wasserversorgung bei Löschfahrzeugen mit Löschwasserbehälter (z. B. LF 20) verlegt?',
      'answers': [
        {
          'text':
              'Zuerst von der Wasserentnahmestelle zum Löschfahrzeug und danach zum Verteiler',
          'score': 0
        },
        {
          'text': 'Keine Festlegung, da der Arbeitsaufwand gleich ist',
          'score': 0
        },
        {
          'text':
              'Zuerst vom Löschfahrzeug zum Verteiler und danach zur Wasserentnahmestelle',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          'Der Gruppenführer verlangt, dass Sie seinen Befehl wiederholen. Warum?',
      'answers': [
        {'text': 'Zeitersparnis', 'score': 0},
        {'text': 'Damit er weiß, ob Sie ihn verstanden haben', 'score': 1},
        {'text': 'Weil es zum Anstand gehört', 'score': 0}
      ]
    },
    {
      'questionText': 'Welcher Trupp setzt im Brandeinsatz den Verteiler?',
      'answers': [
        {'text': 'Wassertrupp', 'score': 0},
        {'text': 'Angriffstrupp', 'score': 0},
        {'text': 'Schlauchtrupp', 'score': 1}
      ]
    },
    {
      'questionText':
          'Welchen Vorteil hat die festgelegte Sitzordnung im Löschgruppenfahrzeug?',
      'answers': [
        {'text': 'Keinen', 'score': 0},
        {'text': 'Dient dem militärischen Dienst', 'score': 0},
        {
          'text':
              'Ermöglicht während der Anfahrt, sich auf die entsprechendenFunktionstätigkeiten vorzubereiten',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          'Eine angetretene Gruppe erhält den Einsatzbefehl: „Wasserentnahmestelle der Überflurhydrant - Verteiler neben Hauseingang - zum Einsatz fertig!”. Welche Aufgaben haben Sie als Angriffstruppführer?',
      'answers': [
        {'text': 'Ausrüsten und bis zum Hauseingang vorgehen', 'score': 0},
        {
          'text': 'Verteiler und C-Schläuche zur befohlenen Stelle bringen',
          'score': 1
        },
        {'text': 'B-Schlauchleitung zum Verteiler vorlegen', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Maßnahmen führt der Trupp aus auf den Befehl „...trupp mit C-Rohr zur/zum ... über ... vor!”?',
      'answers': [
        {
          'text':
              'C-Schlauchleitung wird an einem der drei Abgänge des Verteilers angeschlossen',
          'score': 1
        },
        {
          'text':
              'Schnellangriffseinrichtung des Löschfahrzeuges wird vorgenommen',
          'score': 0
        },
        {
          'text':
              'C-Schlauchleitung wird von der Feuerlöschkreiselpumpe direkt zur befohlenen Einsatzstelle verlegt',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Wer verlegt im Regelfall bei der Staffel im Löscheinsatz die B-Schlauchleitung zum Verteiler?',
      'answers': [
        {'text': 'Angriffstrupp', 'score': 0},
        {'text': 'Maschinist', 'score': 0},
        {'text': 'Wassertrupp', 'score': 1}
      ]
    },
    {
      'questionText':
          'Wie verhalten Sie sich als Truppführer beim Erkennen einer Eigengefährdung des Trupps?',
      'answers': [
        {
          'text':
              'Der Trupp geht geschlossen zurück, Rückmeldung an den Einheitsführer',
          'score': 1
        },
        {'text': 'Jeder im Trupp tritt für sich den Rückzug an', 'score': 0},
        {'text': 'Wartet die Situation ab', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wer bestimmt bei einer Wasserentnahme aus offenem Gewässer die Anzahl der Saugschläuche?',
      'answers': [
        {'text': 'Der Wassertruppführer', 'score': 1},
        {'text': 'Der Einheitsführer', 'score': 0},
        {'text': 'Der Schlauchtruppführer', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Aufgabe hat der Angriffstruppführer bei der Vornahme des Verteilers?',
      'answers': [
        {'text': 'Er bestimmt die genaue Lage des Verteilers', 'score': 1},
        {'text': 'Ist nicht seine Aufgabe als Angriffstrupp', 'score': 0},
        {
          'text': 'Er bestimmt, wo das erste Rohr angeschlossen wird',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Welchen Einsatz hat der Einheitsführer gewählt, wenn sein Befehl wie folgt lautet: „Wasserentnahme der Überflurhydrant, Verteiler 5 m neben die Eingangstür, zum Einsatz fertig!”?',
      'answers': [
        {'text': 'Einen Einsatz mit Bereitstellung', 'score': 1},
        {'text': 'Einen Einsatz ohne Bereitstellung', 'score': 0},
        {'text': 'Einen Einsatz auf Vorbereitung', 'score': 0}
      ]
    },
    {
      'questionText':
          'Dürfen sie eigenverantwortlich während der Löscharbeiten das Mundstück ihres BM-Strahlrohres abschrauben?',
      'answers': [
        {
          'text':
              'Nein, der dadurch erhöhte Wasserdurchfluss muss vorher mit dem Einheitsführer abgesprochen werden',
          'score': 1
        },
        {'text': 'Ja, wenn die Einsatzsituation es erfordert', 'score': 0},
        {'text': 'Liegt im Ermessen des Trupps', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wie erkennen sie, dass der Einheitsführer einenEinsatz ohne Bereitstellung durchführen will?',
      'answers': [
        {'text': 'Durch das Wort „vor”', 'score': 1},
        {'text': 'Durch Angabe der Wasserentnahmestelle', 'score': 0},
        {'text': 'An der Lage des Verteilers', 'score': 0}
      ]
    },
    {
      'questionText':
          'Die Schlauchreserve bei einem Angriff mit einem Strahlrohr muss berücksichtigt werden...',
      'answers': [
        {
          'text':
              'damit der vorgebende Trupp eine notwendige Beweglichkeit und Reichweite erhält',
          'score': 1
        },
        {
          'text': 'damit die Schläuche besser in Buchten verlegt werden können',
          'score': 0
        },
        {
          'text': 'damit der Trupp weiter vom Verteiler entfernt ist',
          'score': 0
        }
      ]
    },
    {
      'questionText':
          'Als Angriffstrupp bekommen sie den Einsatzbefehl einen brennenden Palettenstapel abzulöschen. Welche Löschtaktik wenden sie an?',
      'answers': [
        {'text': 'Mit Sprühstrahl, um das Brandobjekt bewegend', 'score': 1},
        {'text': 'Aus größerer Entfernung mit Vollstrahl', 'score': 0},
        {'text': 'Mit Sprühstrahl, von einem festen Punkt aus', 'score': 0}
      ]
    },
    {
      'questionText':
          'Die Schläuche für Sonderrohre werden am Verteiler (in Fließrichtung)...',
      'answers': [
        {'text': 'in der Mitte angeschlossen', 'score': 1},
        {'text': 'links angeschlossen', 'score': 0},
        {'text': 'rechts angeschlossen', 'score': 0}
      ]
    },
    {
      'questionText':
          'An welchen Abgang am Verteiler wird das erste Rohr angeschlossen?',
      'answers': [
        {'text': 'Am linken Abgang', 'score': 1},
        {'text': 'Am rechten Abgang', 'score': 0},
        {'text': 'In der Mitte', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Aussage zur Löschtaktik bei einem Feststoffbrand ist richtig?',
      'answers': [
        {
          'text': 'Feuer muss von vorne nach hinten bekämpft werden',
          'score': 1
        },
        {
          'text': 'Feuer muss von hinten nach vorne bekämpft werden',
          'score': 0
        },
        {'text': 'Feuer muss von der Seite bekämpft werden', 'score': 0}
      ]
    },
    {
      'questionText':
          'Der Einheitsführer befiehlt: „Wasserentnahmestelle der Überflurhydrant am Bürgersteig, Verteiler zur Gartentür, zum Einsatz fertig!”. Siesind Angriffstruppführer, wie platzieren sie den Verteiler?',
      'answers': [
        {
          'text':
              'Seitlich versetzt, damit der Zugang zum Gebäude nicht behindert wird',
          'score': 1
        },
        {'text': 'Direkt in die offene Gartentür', 'score': 0},
        {'text': 'Mittig, unmittelbar hinter der Gartentür', 'score': 0}
      ]
    },
    {
      'questionText':
          'Gemäß FwDV 3 „Einheiten im Löscheinsatz” unterscheidet man die Einsatzformen...',
      'answers': [
        {
          'text': 'Einsatz mit Bereitstellung und ohne Bereitstellung',
          'score': 1
        },
        {'text': 'Einsätze neben- und hintereinander', 'score': 0},
        {'text': 'Einsätze getrennt und geschlossen', 'score': 0}
      ]
    },
    {
      'questionText':
          'Der Strahlrohrführer öffnet das Strahlrohr zur Brandbekämpfung...',
      'answers': [
        {'text': 'unter Beachtung von Weisungen des Truppführers', 'score': 1},
        {'text': 'an der Rauchgrenze', 'score': 0},
        {'text': 'sobald er Wasser am Strahlrohr hat', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche Länge hat eine Feuerwehrleine?',
      'answers': [
        {'text': '30 Meter', 'score': 1},
        {'text': '25 Meter', 'score': 0},
        {'text': '15 Meter', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche Verwendung hat der Feuerwehr-Haltegurt?',
      'answers': [
        {
          'text': 'Sichern der Gefahr des Stürzens durch Halten/Rückhalten',
          'score': 1
        },
        {'text': 'Sichern der Einsatzkleidung gegen Abrutschen', 'score': 0},
        {'text': 'Sichern gegen Absturz an der Absturzkante', 'score': 0}
      ]
    },
    {
      'questionText': 'Welche Sicherungsmethoden kennen Sie?',
      'answers': [
        {'text': 'Halten/Rückhalten', 'score': 1},
        {'text': 'Sichern/Rücksichern', 'score': 0},
        {'text': 'Anleinen/Abseilen', 'score': 0}
      ]
    },
    {
      'questionText': 'Welchen Zweck hat die Feuerwehrleine?',
      'answers': [
        {
          'text': 'Rettung; Selbstrettung; Sicherung/Aufziehen von Geräten',
          'score': 1
        },
        {'text': 'Verwendung als Halte- und Ventilleine', 'score': 0},
        {'text': 'Absperren der Einsatzstelle', 'score': 0}
      ]
    },
    {
      'questionText':
          'Nennen Sie den Mindestabstand zur Absturzkante beim Rückhalten:',
      'answers': [
        {'text': 'Zwei Meter', 'score': 1},
        {'text': 'Fünf Meter', 'score': 0},
        {'text': 'Einen halben Meter', 'score': 0}
      ]
    },
    {
      'questionText': 'Was ist beim Sichern einer Person zu beachten?',
      'answers': [
        {
          'text':
              'Der Anschlagpunkt ist oberhalb der zu sichernden Person anzubringen',
          'score': 1
        },
        {
          'text':
              'Es ist genügend Schlaffseil vorzuhalten, damit der Gesicherte in seiner Bewegungsfreiheit nicht eingeschränkt wird',
          'score': 0
        },
        {'text': 'Das Seil über scharfe Kanten führen', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wie weit darf man beim Rückhalten an die Absturzkante heran treten?',
      'answers': [
        {
          'text':
              'Ein Abstand von zwei Metern zur Absturzkante ist einzuhalten',
          'score': 1
        },
        {
          'text':
              'Es darf unmittelbar bis an die Absturzkante herangetreten werden',
          'score': 0
        },
        {
          'text': 'Kurzzeitige Arbeiten an der Absturzkante sind erlaubt',
          'score': 0
        }
      ]
    },
    {
      'questionText': 'Wann darf eine Feuerwehrleine nicht eingesetzt werden?',
      'answers': [
        {
          'text': 'Wenn ein Absturz nicht ausgeschlossen werden kann',
          'score': 1
        },
        {'text': 'Zum Halten und Rückhalten', 'score': 0},
        {'text': 'Zum Selbstretten', 'score': 0}
      ]
    },
    {
      'questionText':
          'Darf der Feuerwehr-Haltegurt als Auffanggurt benutzt werden?',
      'answers': [
        {
          'text':
              'Nein, ein Feuerwehr-Haltegurt darf grundsätzlich nicht als Auffanggurt genutzt werden',
          'score': 1
        },
        {
          'text':
              'Ja, wenn dieser jünger als 10 Jahre ist und jährlich geprüft wird',
          'score': 0
        },
        {'text': 'Ja, dafür ist dieser Gurt geeignet', 'score': 0}
      ]
    },
    {
      'questionText':
          'Kann das Halten mit Feuerwehr-Haltegurt und Feuerwehrleine durchgeführt werden?',
      'answers': [
        {
          'text':
              'Ja, es genügt eine Feuerwehrleine und der Feuerwehr- Haltegurt',
          'score': 1
        },
        {
          'text': 'Nein, hierzu benötigt man einen Gerätesatz Absturzsicherung',
          'score': 0
        },
        {'text': 'Nein, da die Feuerwehrleine das nicht aushält', 'score': 0}
      ]
    },
    {
      'questionText': 'Was ist beim Rückhalten zu beachten?',
      'answers': [
        {
          'text':
              'Ein Absturz wird ausgeschlossen, weil die Absturzkante durch das Rückhalten nicht erreicht werden kann',
          'score': 1
        },
        {
          'text':
              'Rückhalten ist in der Feuerwehr nicht vorgesehen, wir gehen immer bis an die Grenze',
          'score': 0
        },
        {
          'text':
              'Wenn ich abstürzen sollte, hält mich der Feuerwehr- Haltegurt und die Feuerwehrleine',
          'score': 0
        }
      ]
    },
    {
      'questionText': 'Was ist beim Sichern einer Person zu beachten?',
      'answers': [
        {
          'text':
              'Der Anschlagpunkt ist oberhalb der zu sichernden Person anzubringen',
          'score': 1
        },
        {
          'text':
              'Es ist genügend Schlaffseil vorzuhalten, damit der Gesicherte in seiner Bewegungsfreiheit nicht eingeschränkt wird',
          'score': 0
        },
        {'text': 'Das Seil über scharfe Kanten führen', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wie schützt sich die Mannschaft bei technischen Hilfeleistungen auf öffentlichen Verkehrsflächen vor Gefahren durch den Verkehr?',
      'answers': [
        {'text': 'Mannschaft bleibt im Löschfahrzeug', 'score': 0},
        {
          'text':
              'Mannschaft steigt auf Befehl zur verkehrsabgewandten Seite aus',
          'score': 1
        },
        {'text': 'Mannschaft tritt hinter dem Löschfahrzeug an', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welcher Trupp ist im technischen Hilfeleistungseinsatz grundsätzlich erster Rettungstrupp?',
      'answers': [
        {'text': 'Angriffstrupp', 'score': 1},
        {'text': 'Wassertrupp', 'score': 0},
        {'text': 'Schlauchtrupp', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welcher Trupp ist bei der technischen Hilfeleistung für Sicherungsaufgaben zuständig?',
      'answers': [
        {'text': 'Wassertrupp', 'score': 1},
        {'text': 'Angriffstrupp', 'score': 0},
        {'text': 'Schlauchtrupp', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Aufgabe hat der Wassertrupp bei einem Hilfeleistungseinsatz?',
      'answers': [
        {
          'text': 'Sichern der Einsatzstelle, z. B. gegen Brandgefahr',
          'score': 1
        },
        {'text': 'Bereitstellen der Geräte', 'score': 0},
        {'text': 'Rettungsmaßnahmen durchführen', 'score': 0}
      ]
    },
    {
      'questionText':
          'Sie erhalten als Angriffstrupp vom Einheitsführer den Befehl: „Angriffstrupp zur Versorgung der Person im PKW vor!”. Welche erste Maßnahme führen sie durch?',
      'answers': [
        {'text': 'Überprüfen der Vitalfunktionen', 'score': 1},
        {'text': 'Sofortige Rettung der Person', 'score': 0},
        {'text': 'Versuchen die Person zu befreien', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Aufgabe übernimmt der Schlauchtrupp bei einem Hilfeleistungseinsatz?',
      'answers': [
        {'text': 'Die Gerätebereitstellung', 'score': 1},
        {'text': 'Die Sicherung', 'score': 0},
        {'text': 'Die Rettung', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Aussage über den Angriffstrupp im Hilfeleistungseinsatz ist richtig?',
      'answers': [
        {'text': 'Er rettet und leistet technische Hilfe', 'score': 1},
        {
          'text':
              'Er sichert die Einsatzstelle und nimmt das dafür notwendige Gerät vor',
          'score': 0
        },
        {
          'text': 'Er bereitet die befohlenen Geräte für den Einsatz vor',
          'score': 0
        }
      ]
    },
    {
      'questionText': 'Worauf achten Sie beim Absitzen an der Einsatzstelle?',
      'answers': [
        {'text': 'Auf Gefahren durch den fließenden Verkehr', 'score': 1},
        {'text': 'Nur zur rechten Seite absitzen', 'score': 0},
        {'text': 'Nur zur linken Seite absitzen', 'score': 0}
      ]
    },
    {
      'questionText':
          'Eine in einem PKW eingeklemmte Person soll durch ihren Trupp betreut werden. Das Fahrzeug ist noch nicht gesichert und könnte abrutschen. Wie verhalten sie sich?',
      'answers': [
        {
          'text':
              'Mit der Betreuung der Person wird unverzüglich von außerhalb begonnen',
          'score': 1
        },
        {
          'text':
              'Die Betreuung der Person erfolgt erst nachdem das Fahrzeug gesichert ist',
          'score': 0
        },
        {
          'text': 'Ich steige sofort zur Betreuung der Person in das Fahrzeug',
          'score': 0
        }
      ]
    },
    {
      'questionText': 'Was wird mit orangefarbenen Warntafeln gekennzeichnet?',
      'answers': [
        {
          'text':
              'Straßen- und Schienenfahrzeuge, die gefährliche Stoffe ab bestimmten Mengen befördern',
          'score': 1
        },
        {
          'text':
              'Gebäude, in denen gefährliche Stoffe und Güter gelagert sind',
          'score': 0
        },
        {'text': 'Nur Versandstücke', 'score': 0}
      ]
    },
    {
      'questionText':
          'Sie sehen auf einer Kiste der Ladung eines verunglückten LKW folgendes Schild. Was melden Sie Ihrem Gruppenführer?',
      'answers': [
        {'text': 'Brandgefahr', 'score': 0},
        {'text': 'Vergiftungsgefahr', 'score': 0},
        {'text': 'Ansteckungsgefahr', 'score': 1}
      ]
    },
    {
      'questionText':
          'Sie sehen an der Tür eines Gebäudes folgendes Schild(schwarz auf gelbem Hintergrund). Womit müssen Sie rechnen?',
      'answers': [
        {'text': 'Verätzungsgefahr', 'score': 0},
        {
          'text':
              'Mit starkem Wind durch eine, sich hinter der Tür befindliche Lüftungsanlage',
          'score': 0
        },
        {'text': 'Explosionsgefahr', 'score': 1}
      ]
    },
    {
      'questionText':
          'Welche Nummernsysteme befinden sich auf einer orangefarbenen Warntafel?',
      'answers': [
        {'text': 'Gefährdungsnummer und Einsatznummer', 'score': 0},
        {'text': 'Transportkennzahl und Gefahrencode', 'score': 0},
        {
          'text': 'Stoffnummer und Nummer zur Kennzeichnung der Gefahr',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          'Sie sehen auf einem Fass in einem Lager folgendes Schild (schwarz auf weiß-rotem Hintergrund). Welche Gefahr kann von diesem Stoff ausgehen?',
      'answers': [
        {'text': 'Vergiftungsgefahr', 'score': 0},
        {'text': 'Austritt von Gas', 'score': 0},
        {'text': 'Brandgefahr', 'score': 1}
      ]
    },
    {
      'questionText':
          'Eine Gefahrgutumschließung ist mit folgendem Symbol gekennzeichnet (schwarz auf rotem Hintergrund). Was enthält die Verpackung?',
      'answers': [
        {'text': 'Einen festen brennbaren Stoff', 'score': 0},
        {'text': 'Einen gasförmigen brennbaren Stoff', 'score': 0},
        {'text': 'Einen flüssigen brennbaren Stoff', 'score': 1}
      ]
    },
    {
      'questionText':
          'Wie verhalten Sie sich, wenn Sie im Gefahrguteinsatz einen verletzten Menschen im Gefahrenbereich entdecken?',
      'answers': [
        {
          'text': 'Ich retten den Menschen sofort aus dem Gefahrenbereich',
          'score': 0
        },
        {'text': 'Ich melde es dem Einheitsführer', 'score': 1},
        {
          'text':
              'Ich lasse mich zuerst dekontaminieren und rette dann den Menschen',
          'score': 0
        }
      ]
    },
    {
      'questionText': 'Welche Einsatzmaßnahmen beschreibt die GAMSRegel?',
      'answers': [
        {'text': 'Gase Absorbieren, Mineralöle Separieren', 'score': 0},
        {
          'text':
              'Gefahr erkennen, Absperren, Menschenrettung durchführen, Spezialkräfte alarmieren',
          'score': 1
        },
        {
          'text':
              'Gefahr beseitigen, Ausleuchten, Menschenrettung durchführen, Spezialfirma beauftragen',
          'score': 0
        }
      ]
    },
    {
      'questionText': 'Was bedeutet folgende Kennzeichnung(schwarz-weiß)?',
      'answers': [
        {'text': 'Tank enthält wassergefährdende Stoffe', 'score': 0},
        {'text': 'Karton enthält kein Gefahrgut', 'score': 0},
        {
          'text':
              'erpackung enthält kleinere Behälter, die Gefahrgut inbegrenzten Mengen enthalten',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          ' Welche Gefahr besteht bei folgender Kennzeichnung (schwarz-weiß)?',
      'answers': [
        {'text': 'esundheitsgefahr', 'score': 0},
        {'text': 'Gefahr durch erwärmte Stoffe', 'score': 0},
        {'text': 'Verätzungsgefahr', 'score': 1}
      ]
    },
    {
      'questionText':
          'Welche Erkennungsmöglichkeit von außen besteht bei einem Fahrzeug, das mit Flüssiggas betrieben wird?',
      'answers': [
        {'text': 'Von außen nicht erkennbar', 'score': 0},
        {
          'text':
              'Mögliche Fahrzeugbeschriftung, z. B. LPG, BiFuel, Flüssiggas, Autogas',
          'score': 1
        },
        {'text': 'Durch rechteckigen Tankdeckel am Einfüllstutzen', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche alternative Antriebe werden derzeit in der Fahrzeugtechnik verwendet?',
      'answers': [
        {'text': 'Diesel; Benzin; Biodiesel', 'score': 0},
        {'text': 'Erdgas (CNG); Flüssiggas (LPG); Hybridantrieb', 'score': 1},
        {'text': 'Photovoltaik; Biogas', 'score': 0}
      ]
    },
    {
      'questionText':
          'Wo kann man Erkennungshinweise auf alternative Antriebstechnik an einem PKW finden?',
      'answers': [
        {
          'text':
              'Es gibt keine Erkennungshinweise auf alternative Antriebstechnik an einem PKW',
          'score': 1
        },
        {
          'text':
              'Rettungskarte (Sonnenblende); Tankdeckelinnenseite; im Motorraum',
          'score': 0
        },
        {'text': 'Unter dem Fahrersitz', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche besonderen Maßnahmen sind an einem verunfallten gasbetriebenen PKW (LPG oder CNG) erforderlich?',
      'answers': [
        {'text': 'Es sind keine besonderen Maßnahmen erforderlich', 'score': 0},
        {
          'text':
              'Gefahrenbereich weiträumig sperren; Motor abstellen; Gasabsperrventil schließen',
          'score': 1
        },
        {
          'text':
              'PKW gegen Wegrollen sichern, Batterie abklemmen, Brandschutz mit Kübelspritze sicherstellen',
          'score': 0
        }
      ]
    },
    {
      'questionText': 'Wofür werden Handfunkgeräte in der Regelverwendet?',
      'answers': [
        {'text': 'Funkverbindung von Feststation zu Fahrzeug', 'score': 0},
        {
          'text':
              'Funkverbindung von Einsatzkraft zu Einsatzkraft an der Einsatzstelle',
          'score': 1
        },
        {'text': 'Funkverbindung von Fahrzeug zu Fahrzeug', 'score': 0}
      ]
    },
    {
      'questionText':
          'Was ist zu tun, wenn im Sprechfunk eine Notfallmeldung abgesetzt wird?',
      'answers': [
        {
          'text':
              'Nichts, der normale Sprechfunkverkehr kann fortgesetzt werden',
          'score': 0
        },
        {'text': 'Es antworten sofort alle auf die Notfallmeldung', 'score': 0},
        {
          'text': 'Der bestehende Sprechfunkverkehr ist zu unterbrechen',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          'Bei welcher Aufzählung gehören sämtliche Behörden/Organisationen zu den Behörden und Organisationen mit Sicherheitsaufgaben (BOS)?',
      'answers': [
        {
          'text': 'Malteser-Hilfsdienst, ADAC, Luftrettungsstaffel Bayern',
          'score': 0
        },
        {'text': 'Berufsfeuerwehr, Telekom, Bundespolizei', 'score': 0},
        {
          'text': 'Polizei, Bundeszollverwaltung, Freiwillige Feuerwehren',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          'Ein Anruf ist durch folgende Anrufantwort zu bestätigen...',
      'answers': [
        {'text': '„(Rufname) hört!”', 'score': 0},
        {'text': '„(Rufname) absetzen!”', 'score': 0},
        {'text': '„Hier (Rufname), kommen!”', 'score': 1}
      ]
    },
    {
      'questionText': 'Wie wird ein Gespräch im Funkverkehr beendet?',
      'answers': [
        {'text': '„Ende mit Florian Würzburg”', 'score': 0},
        {'text': 'Mit „Ende” ohne weitere Zusätze', 'score': 1},
        {'text': 'Mit Wiederholung des Funkgespäches', 'score': 0}
      ]
    },
    {
      'questionText':
          'Von welchen Faktoren hängt die Reichweite einer Funkverbindung ab?',
      'answers': [
        {'text': 'Gruppeneinteilung/Kanaleinteilung', 'score': 0},
        {'text': 'Akkuzustand', 'score': 0},
        {'text': 'Bebauung, Geländeform und ggf. Witterung', 'score': 1}
      ]
    },
    {
      'questionText': 'Der Sprechfunkverkehr wird eröffnet durch...',
      'answers': [
        {'text': 'die Gegenstelle', 'score': 0},
        {'text': 'den Anruf', 'score': 1},
        {'text': 'den Einsatzleiter', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welcher Grundsatz ist unter anderem beim Sprechfunkverkehr zu beachten?',
      'answers': [
        {'text': 'Schnell und deutlich sprechen', 'score': 0},
        {'text': 'Nicht zu laut sprechen', 'score': 1},
        {'text': 'Abkürzungen benutzen (Zeitersparnis)', 'score': 0}
      ]
    },
    {
      'questionText':
          'Am Einsatzort angekommen, stellen Sie fest, dass Sie eine schlechte Verbindung zur Leitstelle haben. Welche Maßnahme ist jetzt richtig?',
      'answers': [
        {
          'text':
              'Ausfall der Relaisfunkstelle/Basisstation über Telefon melden',
          'score': 0
        },
        {'text': 'Standort verändern', 'score': 1},
        {
          'text':
              'Umschalten auf Oberband-Gegenverkehr bzw. eine andere Gruppe',
          'score': 0
        }
      ]
    },
    {
      'questionText': 'Eine formlose Nachricht ist...',
      'answers': [
        {'text': 'eine Meldung', 'score': 0},
        {'text': 'eine Durchsage', 'score': 1},
        {'text': 'ein Spruch', 'score': 0}
      ]
    },
    {
      'questionText': 'Eine Lagemeldung enthält in der Regel folgende Angaben:',
      'answers': [
        {'text': 'Einsatzort, Lage, Schadenshöhe', 'score': 0},
        {'text': 'Lage, Maßnahmen, Uhrzeit', 'score': 0},
        {'text': 'Einsatzort, Lage, Maßnahmen, Zeit-/Kräftebedarf', 'score': 1}
      ]
    },
    {
      'questionText':
          'Bei der Durchgabe einer Nachricht hat sich der Sprechfunker versprochen und will den Fehler richtig stellen. Welche Formulierung ist richtig?',
      'answers': [
        {
          'text':
              'Die Verpflegung trifft in einer Stunde - ich berichtige - in einer halben Stunde ein, kommen',
          'score': 1
        },
        {
          'text':
              'Die Verpflegung trifft in einer Stunde - ich verbessere - in einer halben Stunde ein, kommen',
          'score': 0
        },
        {'text': 'Wiederhole - in einer halben Stunde ein, kommen', 'score': 0}
      ]
    },
    {
      'questionText': 'Wann ist eine Lagemeldung erforderlich?',
      'answers': [
        {
          'text':
              'Wenn die Lage festgestellt (erkundet) wurde oder sich wesentlich verändert hat',
          'score': 1
        },
        {'text': 'Gleich nach dem Ausrücken', 'score': 0},
        {'text': 'Wenn der Einsatzbefehl hierfür Zeit lässt', 'score': 0}
      ]
    },
    {
      'questionText': 'Die Funkalarmierung ist ein Verfahren zum...',
      'answers': [
        {'text': 'Übermittlen von Nachrichtentexten', 'score': 0},
        {'text': 'Alarmieren von Fahrzeugen an der Einsatzstelle', 'score': 0},
        {'text': 'Alarmieren von Führungs- und Einsatzkräften', 'score': 1}
      ]
    },
    {
      'questionText':
          'Welches ist die richtige Buchstabierweise des Wortes „Duplex”?',
      'answers': [
        {'text': 'Dora-Ulrich-Paula-Ludwig-Emil-Xantippe', 'score': 1},
        {'text': 'Delta-Ulrich-Paula-Ludwig-Erich-Xantippe', 'score': 0},
        {'text': 'Dora-Ulrich-Paul-Ludwig-Emil-Xantippe', 'score': 0}
      ]
    },
    {
      'questionText':
          'Welche Vorschrift regelt die Durchführung des Sprechfunkverkehrs?',
      'answers': [
        {'text': 'BOS-Funkrichtlinie', 'score': 0},
        {'text': 'PDV 810 / DV 810', 'score': 1},
        {'text': 'Vollzugsbekanntmachung BayFwG', 'score': 0}
      ]
    },
    {
      'questionText':
          'Nach welchen Gesetzmäßigkeiten breiten sich UKW-Funkwellen aus?',
      'answers': [
        {'text': 'Sie folgen dem Verlauf der Erdkrümmung', 'score': 0},
        {'text': 'Sie breiten sich mit Schallgeschwindigkeit aus', 'score': 0},
        {
          'text': 'Sie breiten sich fast genauso aus wie Lichtstrahlen',
          'score': 1
        }
      ]
    },
    {
      'questionText':
          'Eigenhändiges Ändern einer Nachricht ist dem Betriebspersonal...',
      'answers': [
        {'text': 'in Einzelfällen erlaubt', 'score': 0},
        {'text': 'verboten', 'score': 1},
        {'text': 'freigestellt', 'score': 0}
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0.0;
    });
  }

  void initState() {
    super.initState();
    int zufall;
    int ende;
    var random = new Random();
    zufall = random.nextInt(215);
    if (zufall <= 50) {
      ende = zufall + 50;
    } else if (zufall >= 165) {
      ende = zufall;
      zufall = zufall - 50;
    } else if (zufall >= 50 && zufall <= 165) {
      zufall = zufall;
      ende = zufall + 50;
    }
    questionsPruefung.addAll(fragenPruefungsmodus.getRange(zufall, ende));
  }

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          themengebiet,
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
            icon: Icon(Icons.home, color: Colors.white, size: 40),
            onPressed: () {
              Navigator.pushNamed(context, 'HomeScreen');
            }),
        actions: <Widget>[],
      ),
      body: _questionIndex < questionsPruefung.length
          ? Quiz(
              questions: questionsPruefung,
              answerQuestions: _answerQuestions,
              questionIndex: _questionIndex,
            )
          : Result(
              _resetQuiz,
              questionsPruefung.length,
              themengebiet,
              _totalScore,
              questionsPruefung,
              _questionIndex,
            ),
    );
  }
}
