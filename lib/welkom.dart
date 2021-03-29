import 'package:flutter/material.dart';
import 'package:native_test2/states.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:native_test2/bibliotheek.dart' as lib;

class Welkom extends StatefulWidget {
  @override
  _WelkomState createState() => _WelkomState();
}

class _WelkomState extends State<Welkom> {
  final VideoPlayerController videoController =
      VideoPlayerController.asset("assets/video/intro.mp4");

  List<String> categories = lib.vragen
      .map((v) {
        List<String> categories2 = [];
        v["categorie"].forEach((c) {
          categories2.add(c);
        });
        return categories2;
      })
      .toList()
      .reduce((value, cl) {
        cl.forEach((c) {
          if (!value.contains(c)) {
            value.add(c);
          }
        });
        return value;
      });

  List<OutlinedButton> makeCategorieButtons() {
    List<OutlinedButton> categorieButtons = [
      OutlinedButton(
          onPressed: () {
            Provider.of<States>(context, listen: false).setCategory("All");
          },
          child: Text("All",
              style: Provider.of<States>(context).selectedCategory == "All"
                  ? TextStyle(
                      color: Colors.white,
                    )
                  : null),
          style: Provider.of<States>(context).selectedCategory == "All"
              ? ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                )
              : null),
    ];
    categories.forEach((element) {
      categorieButtons.add(OutlinedButton(
          onPressed: () {
            Provider.of<States>(context, listen: false).setCategory(element);
          },
          child: Text(element,
              style: Provider.of<States>(context).selectedCategory == element
                  ? TextStyle(
                      color: Colors.white,
                    )
                  : null),
          style: Provider.of<States>(context).selectedCategory == element
              ? ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                )
              : null));
    });
    return categorieButtons;
  }

  void videoInitialize() {
    videoController
      ..initialize()
      ..play();
  }

  Widget build(BuildContext context) {
    videoInitialize();
    return Stack(
      children: [
        VideoPlayer(videoController),
        Center(
          child: Container(
            height: 200,
            child: Column(
              children: makeCategorieButtons(),
            ),
          ),
        ),
      ],
    );
  }
}
