import 'package:flutter/material.dart';

import 'bibliotheek.dart' as lib;

import 'welkom.dart';
import 'quiz.dart';
import 'config.dart';

void main() {
  lib.smtpData = lib.SmtpData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Flutter Quiz"),
            ),
            bottomNavigationBar: TabBar(
                indicatorColor: Colors.blueAccent,
                labelColor: Colors.blueAccent,
                tabs: [
                  Tab(icon:Icon(Icons.home), text:"welkom"),
                  Tab(icon:Icon(Icons.live_help), text:"QUIZ!"),
                  Tab(icon:Icon(Icons.settings), text:"configuratie"),
                ]
            ),
            body: TabBarView(
              children: [
                Welkom(),
                Quiz(),
                Config()
              ],
            )
        )
    );
  }
}