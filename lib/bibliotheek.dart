library bibliotheek;

import 'package:flutter/material.dart';
import 'dart:async';

const double tekstMarge = 10.0;
const TextStyle basisTekst = TextStyle(fontFamily: 'Verdana', fontSize: 16);
const TextStyle kopTekst =
    TextStyle(fontFamily: 'Verdana', fontSize: 18, fontWeight: FontWeight.bold);

List<dynamic> vragen = [
  {
    "vraag": "In welk jaar ontstond het besturingssysteem MS-DOS?",
    "antwoorden": ["1981", "1975", "1984", "1978"],
    "correct": 0,
    "afbeelding": "msdos.png",
    "categorie": ["ICT", "history"]
  },
  {
    "vraag": "In welk jaar werd de Sovjet-Unie officieel opgericht?",
    "antwoorden": ["1917", "1919", "1922", "1925", "1931"],
    "correct": 2,
    "afbeelding": "sovjetunion.png",
    "categorie": ["history", "revolution"]
  },
  {
    "vraag":
        "Hendrik VIII was van 1509 tot 1547 koning van Engeland. Hoeveel keer is hij gehuwd?",
    "antwoorden": ["5", "6", "7", "8"],
    "correct": 1,
    "afbeelding": "henry8.jpg",
    "categorie": ["history"]
  },
  {
    "vraag":
        "De stad Parijs werd gedurende een korte periode in 1871 bestuurd door een revolutionaire regering. Hoe noemt men die regering en periode?",
    "antwoorden": [
      "De Parijse omwenteling",
      "Paris en flammes",
      "Commune van Parijs",
      "De Parijse Bevrijding",
      "Liberté et Egalité"
    ],
    "correct": 2,
    "afbeelding": "commune.jpg",
    "categorie": ["history", "revolution"]
  },
  {
    "vraag": "Waarvan is dit het logo?",
    "antwoorden": ["Android Studio", "Dart", "Flutter", "Xcode", "IntelliJ"],
    "correct": 2,
    "afbeelding": "flutterbis.png",
    "categorie": ["ICT"]
  },
  {
    "vraag": "Welke taal gebruiken we in Flutter?",
    "antwoorden": ["C", "Dart", "Java", "Python"],
    "correct": 1,
    "afbeelding": "programminglanguages.png",
    "categorie": ["ICT"]
  },
  {
    "vraag": "Wat is een voorbeeld van een widget?",
    "antwoorden": ["class", "Container", "const", "import"],
    "correct": 1,
    "afbeelding": "widgettree.png",
    "categorie": ["ICT"]
  },
  {
    "vraag":
        "In welk jaar werd de Amerikaanse onafhankelijkheidsverklaring ondertekend?",
    "antwoorden": ["1821", "1813", "1776", "1795"],
    "correct": 2,
    "afbeelding": "usindependence.jpg",
    "categorie": ["history"]
  },
  {
    "vraag": "Wie creëerde rond 1972 de programmeertaal Prolog?",
    "antwoorden": [
      "Robert Kowalski",
      "Alain Colmerauer",
      "William Carlsson",
      "Paul Allen"
    ],
    "correct": 1,
    "afbeelding": "alainc.jpg",
    "categorie": ["ICT", "history"]
  },
  {
    "vraag":
        "In 1953 ontwikkelde John W. Backus een praktischer alternatief voor assembleertaal. Welke programmeertaal is toen ontstaan?",
    "antwoorden": ["COBOL", "Java", "Basic", "LISP", "Fortran"],
    "correct": 4,
    "afbeelding": "programl.jpg",
    "categorie": ["ICT", "history"]
  },
  {
    "vraag":
        "Aan hoeveel mensen heeft naar schatting de tweede wereldoorlog het leven gekost?",
    "antwoorden": ["18 miljoen", "103 miljoen", "55 miljoen", "39 miljoen"],
    "correct": 2,
    "afbeelding": "wo2doden.jpg",
    "categorie": ["history"]
  },
  {
    "vraag": "Welke widget heeft maar 1 child?",
    "antwoorden": ["Column", "Container", "ListView", "Row"],
    "correct": 1,
    "afbeelding": "widgetchild.png",
    "categorie": ["ICT"]
  },
  {
    "vraag": "De bestorming van de Bastille wordt vaak gezien als het startpunt van de Franse Revolutie. Wanneer vond die plaats?",
    "antwoorden": ["14 juli 1789", "28 juni 1698", "25 juli 1791", "2 augustus 1802"],
    "correct": 0,
    "afbeelding": "bastille.jpg",
    "categorie": ["history", "revolution"]
  },
  {
    "vraag":
        "In welk bestand declareert u afbeeldingen en andere bronnen in Flutter?",
    "antwoorden": [
      "assets",
      "main.dart",
      "pubspec.\nyaml",
      "Runner.\nxcodeproj"
    ],
    "correct": 2,
    "afbeelding": "pubspec.png",
    "categorie": ["ICT"]
  }
];

StreamController<bool> startOpnieuw = StreamController.broadcast();

SmtpData smtpData;

class SmtpData {
  String username;
  String password;
  String smtphost;
  int smtpport;
  bool isValidConfigured = false;

  bool isConfigured() {
    return isValidConfigured;
  }
}
