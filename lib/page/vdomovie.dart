import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:termproject/page/homepage.dart';

import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class VdoMovie extends StatefulWidget {
  const VdoMovie({super.key});

  @override
  State<VdoMovie> createState() => _VdoMovieState();
}

class _VdoMovieState extends State<VdoMovie> {
  final FlickManager flickManager = FlickManager(
    //from network
    videoPlayerController:
        VideoPlayerController.asset("asstes/vdo/example.mp4"),
  );
  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomePage(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: FlickVideoPlayer(flickManager: flickManager),
        ),
      ),
    );
  }
}
