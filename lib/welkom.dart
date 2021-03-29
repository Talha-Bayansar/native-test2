import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Welkom extends StatelessWidget {
  final VideoPlayerController videoController = VideoPlayerController.asset("assets/video/intro.mp4");

  Widget build(BuildContext context) {
    videoController
      ..initialize()
      ..play();
    return VideoPlayer(videoController);
  }
}