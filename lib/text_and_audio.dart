import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:islamicdua_/text_strings.dart';

class TextAndAudio extends StatefulWidget {
  final int index;
  const TextAndAudio({Key? key, required this.index}) : super(key: key);

  @override
  State<TextAndAudio> createState() => _TextAndAudioState();
}

class _TextAndAudioState extends State<TextAndAudio> {
  AudioPlayer player = AudioPlayer();
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    fillList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(arabicText[0]),
        ),
        Divider(
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(urduText[0]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Play'),
                onPressed: () async {
                  assetsAudioPlayer.open(
                    Audio(audioPaths[0]),
                    showNotification: true,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RaisedButton(
                  child: Text('Stop'),
                  onPressed: () async {
                    assetsAudioPlayer.stop();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
