import 'package:flutter/material.dart';
import 'package:flutter_playing_video/volume_manager.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class PlayWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const PlayWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Play!'),
              onPressed: _play,
            ),
            ElevatedButton(
              child: const Text('Pause'),
              onPressed: _pause,
            ),
          ],
        ),
        Consumer<VolumeManager>(
          builder: (context, manager, _) {
            return Slider(
              value: manager.volume,
              onChanged: (value) {
                manager.setVolume(
                    volumeValue: value,
                    controller: controller
                );
              },
              min: 0,
              max: 100,
              divisions: 10,
              label: '${manager.volume}%',
            );
          },
        ),
      ],
    );
  }

  void _play() {
    if (!controller.value.isPlaying) {
      controller.play();
    }
  }

  void _pause() {
    if (controller.value.isPlaying) {
      controller.pause();
    }
  }
}
