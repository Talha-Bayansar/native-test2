import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_test2/states.dart';
import 'package:provider/provider.dart';

import 'bibliotheek.dart' as lib;

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController paswoordController = TextEditingController();

  final TextEditingController smtpHostController = TextEditingController();

  final TextEditingController smtpPortController = TextEditingController();

  bool email = false;

  bool pw = false;

  bool port = false;

  bool host = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Instellingen SMTP-server"),
          ),
          TextFormField(
            validator: (value) {
              if (EmailValidator.validate(value)) {
                email = true;
                return "";
              } else {
                email = false;
                return "Voer een geldig e-mailadres in";
              }
            },
            autovalidateMode: AutovalidateMode.always,
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'naam@domein.be',
              labelText: "E-mailadres(username)",
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value.length >= 6) {
                pw = true;
                return "";
              } else {
                pw = false;
                return "Een paswoord moet minstens 6 karakters lang zijn";
              }
            },
            autovalidateMode: AutovalidateMode.always,
            controller: paswoordController,
            decoration: InputDecoration(
              hintText: 'paswoord',
              labelText: "Paswoord",
            ),
            obscureText: true,
          ),
          TextFormField(
            controller: smtpHostController,
            decoration: InputDecoration(
              hintText: 'SMTP-host',
              labelText: "SMTP-host",
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value.length > 0 && int.parse(value) > 0) {
                port = true;
                return "";
              } else {
                port = false;
                return "De SMTP-poort is een geheel getal groter dan 0";
              }
            },
            autovalidateMode: AutovalidateMode.always,
            controller: smtpPortController,
            decoration: InputDecoration(
              hintText: '587',
              labelText: "SMTP-port",
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          ElevatedButton(
            onPressed: () {
              if (email && pw && port) {
                setState(() {
                  lib.smtpData.isValidConfigured = true;
                });
              }
              if (lib.smtpData.isValidConfigured) {
                lib.smtpData.username = emailController.text;
                lib.smtpData.password = paswoordController.text;
                lib.smtpData.smtphost = smtpHostController.text;
                lib.smtpData.smtpport = int.parse(smtpPortController.text);
              }
              print(lib.smtpData.username);
            },
            child: Text("BEWAAR CONFIGURATIE"),
          ),
        ],
      ),
    );
  }
}
