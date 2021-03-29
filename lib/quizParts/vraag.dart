import 'package:flutter/material.dart';
import 'package:native_test2/states.dart';
import 'package:provider/provider.dart';

import '../bibliotheek.dart' as lib;

import 'antwoordKnop.dart';

class Vraag extends StatelessWidget {
  final int vraagNummer;
  final int score;
  final Function verwerkAntwoord;

  Vraag(this.vraagNummer, this.score, this.verwerkAntwoord);

  @override
  Widget build(BuildContext context) {
    List<Row> maakAntwoordRijen() {
      List<Row> rijen = List<Row>();
      int maxRij = (Provider.of<States>(context)
                  .vragen[vraagNummer]['antwoorden']
                  .length /
              2)
          .ceil();

      for (int rij = 0; rij < maxRij; rij++) {
        List<AntwoordKnop> knoppen = List<AntwoordKnop>();
        knoppen.add(AntwoordKnop(
            Provider.of<States>(context).vragen[vraagNummer]['antwoorden']
                [2 * rij],
            Provider.of<States>(context).vragen[vraagNummer]['correct'] ==
                2 * rij,
            verwerkAntwoord));
        if (rij < maxRij - 1 ||
            Provider.of<States>(context)
                    .vragen[vraagNummer]['antwoorden']
                    .length ==
                2 * rij + 2) {
          knoppen.add(AntwoordKnop(
              Provider.of<States>(context).vragen[vraagNummer]['antwoorden']
                  [2 * rij + 1],
              Provider.of<States>(context).vragen[vraagNummer]['correct'] ==
                  2 * rij + 1,
              verwerkAntwoord));
        }

        rijen.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: knoppen));
      }

      return rijen;
    }

    List<Widget> header = <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: lib.tekstMarge),
              child: Text(
                'vraag ' +
                    (vraagNummer + 1).toString() +
                    ' van ' +
                    Provider.of<States>(context).vragen.length.toString(),
                style: lib.basisTekst,
              )),
          Container(
            padding: EdgeInsets.only(right: lib.tekstMarge),
            child: Text(
              "score: " + score.toString(),
              style: lib.basisTekst,
            ),
          )
        ],
      ),
      Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Image.asset(
            'assets/images/' +
                Provider.of<States>(context).vragen[vraagNummer]['afbeelding'],
            fit: BoxFit.fitWidth,
          )),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: 50),
        child: Container(
            child: Text(
          Provider.of<States>(context).vragen[vraagNummer]['vraag'],
          style: lib.kopTekst,
          textAlign: TextAlign.center,
        )),
      )
    ];

    return ListView(children: [...header, ...maakAntwoordRijen()]);
  }
}
