import 'package:flutter/material.dart';
import 'package:flutter_playing_video/widgets/video_play_widget.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget();

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late final VideoPlayerController controller;
  late final Future<void> initVideo;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(
      'assets/butterfly.mp4'
    );

    controller.setLooping(true);
    initVideo = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initVideo,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return PlayWidget(controller);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
