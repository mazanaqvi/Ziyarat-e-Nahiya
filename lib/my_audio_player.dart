import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';

class MyAudioPlayer extends StatefulWidget {
  const MyAudioPlayer({Key? key}) : super(key: key);

  @override
  State<MyAudioPlayer> createState() => _MyAudioPlayerState();
}

class _MyAudioPlayerState extends State<MyAudioPlayer> {
  AudioPlayer player = AudioPlayer();
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Play'),
              onPressed: () async {
                assetsAudioPlayer.open(
                  Audio("assets/audio.mp3"),
                  showNotification: true,
                );
              },
            ),
            RaisedButton(
              child: Text('Stop'),
              onPressed: () async {
                assetsAudioPlayer.stop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
