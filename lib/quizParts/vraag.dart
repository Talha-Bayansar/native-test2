import 'package:flutter/material.dart';

import '../bibliotheek.dart' as lib;

import 'antwoordKnop.dart';

class Vraag extends StatelessWidget {
  final int vraagNummer;
  final int score;
  final Function verwerkAntwoord;

  Vraag(this.vraagNummer, this.score, this.verwerkAntwoord);

  @override
  Widget build(BuildContext context) {
    List<Widget> header = <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: lib.tekstMarge),
              child: Text('vraag ' + (vraagNummer+1).toString() + ' van ' + lib.vragen.length.toString(), style: lib.basisTekst,)
          ),
          Container(
            padding: EdgeInsets.only(right: lib.tekstMarge),
            child: Text("score: " + score.toString(), style: lib.basisTekst,),
          )
        ],
      ),
      Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Image.asset('assets/images/' + lib.vragen[vraagNummer]['afbeelding'], fit: BoxFit.fitWidth,)
      ),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: 50),
        child: Container(
            child: Text(lib.vragen[vraagNummer]['vraag'], style: lib.kopTekst, textAlign: TextAlign.center,)
        ),
      )
    ];

    return ListView(
      children: [...header, ...maakAntwoordRijen()]
    );
  }

  List<Row> maakAntwoordRijen() {
    List<Row> rijen = List<Row>();
    int maxRij = (lib.vragen[vraagNummer]['antwoorden'].length / 2).ceil();

    for (int rij = 0; rij < maxRij; rij++) {
      List<AntwoordKnop> knoppen = List<AntwoordKnop>();
      knoppen.add(AntwoordKnop(lib.vragen[vraagNummer]['antwoorden'][2 * rij], lib.vragen[vraagNummer]['correct'] == 2 * rij, verwerkAntwoord));
      if (rij < maxRij - 1 || lib.vragen[vraagNummer]['antwoorden'].length == 2 * rij + 2) {
        knoppen.add(AntwoordKnop(lib.vragen[vraagNummer]['antwoorden'][2 * rij + 1], lib.vragen[vraagNummer]['correct'] == 2 * rij + 1, verwerkAntwoord));
      }

      rijen.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: knoppen
      ));
    }

    return rijen;
  }
}
