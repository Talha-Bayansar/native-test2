import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';

import '../bibliotheek.dart' as lib;

class MailDialoog extends StatelessWidget {
  final int score;
  final TextEditingController tekstveldController = TextEditingController();
  final tijdOpmaak = DateFormat('dd-MM-yyyy H:m:s');
  bool correctEmailAdres = false;
  final Function zetMailStatus;

  MailDialoog(this.score, this.zetMailStatus);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Voer jouw e-mailadres in'),
      content: TextFormField(
        validator: (invoer) {
          if (EmailValidator.validate(invoer)) {
            correctEmailAdres = true;
            return "";
          } else {
            correctEmailAdres = false;
            return "Voer een geldig e-mailadres in";
          }
        },
        autovalidateMode: AutovalidateMode.always,
        controller: tekstveldController,
        decoration: InputDecoration(hintText: 'naam@domein.be'),
      ),
      actions: [
        TextButton(
          child: Text('Annuleer'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text('Verstuur'),
          onPressed: () {
            if (correctEmailAdres) {
              stuurMail();
              Navigator.of(context).pop();
            }
          },
        )
      ],
    );
  }

  stuurMail() async {
    String gebruikersnaam = lib.smtpData.username;  // gebruik je nummer
    String paswoord = lib.smtpData.password;

    final smtpServer = SmtpServer(lib.smtpData.smtphost,
        port: lib.smtpData.smtpport,
        allowInsecure: true,
        ignoreBadCertificate: true,
        username: gebruikersnaam,
        password: paswoord
    );

    final message = Message();
    message.from = Address(gebruikersnaam, 'Flutter Quiz');
    message.recipients.add(tekstveldController.text);
    message.subject = 'Uitslag van de quiz';
    message.html = "<h1>Uitslag</h1>\n" +
        "<p>Je score is $score</p>" +
        "<p>Verzonden op ${tijdOpmaak.format(DateTime.now())}</p>";

    try {
      await send(message, smtpServer);
      zetMailStatus(false);
    } catch(error) {
      zetMailStatus(true);
    }
  }
}