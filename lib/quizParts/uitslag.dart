import 'package:flutter/material.dart';

import '../bibliotheek.dart' as lib;

import 'mailDialoog.dart';

class Uitslag extends StatefulWidget {
  final int score;

  Uitslag(this.score);

  @override
  _UitslagState createState() => _UitslagState();
}

class _UitslagState extends State<Uitslag> {
  String mailStatus = "Deel je uitslag";
  String mailKnopTekst = "Versturen";
  bool kanMailVerzenden = true;

  @override
  Widget build(BuildContext context) {
    if (!lib.smtpData.isConfigured()) {
      kanMailVerzenden = false;
      mailStatus = "Mailer is niet geconfigureerd";
    }

    return ListView(
      children: [
        Container(
            height: 60,
            child: Center(
              child: Text("Uitslag", style: lib.kopTekst,),
            )
        ),
        Center(
          child: Text(widget.score.toString(), style: lib.kopTekst, textScaleFactor: 7),
        ),
        Center(
          child: Text("van de ${lib.vragen.length} vragen goed", style: lib.basisTekst, textScaleFactor: 1.2),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // background
              onPrimary: Colors.white, // foreground
            ),
            child: Text('Opnieuw', style: lib.basisTekst, textScaleFactor: 1.2),
            onPressed: () => lib.startOpnieuw.add(true),
          ),
        ),
        Container(
            height: 60,
            child: Center(
              child: Text(mailStatus, style: lib.kopTekst,),
            )
        ),
        if (kanMailVerzenden) Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white
              ),
              child: Text(mailKnopTekst, style: lib.basisTekst, textScaleFactor: 1.2),
              onPressed: () => {
                showDialog(
                    context: context,
                    builder: (context) => MailDialoog(widget.score, zetMailStatus)
                )
              }
          ),
        )
      ]
    );
  }

  void zetMailStatus(bool status) {
    setState(() {
      this.kanMailVerzenden = status;
      if (status) {
        this.mailStatus = "Deel je uitslag";
      } else {
        this.mailStatus = "Je uitslag is verzonden";
      }
    });
  }
}

