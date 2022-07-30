import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:islamicdua_/text_strings.dart';

class TextAndAudio extends StatefulWidget {
  RxInt index = 0.obs;
  RxString currentUrduText = ''.obs;
  RxString currentArabicText = ''.obs;
  RxString currentAudioPath = ''.obs;
  TextAndAudio({Key? key}) : super(key: key);

  @override
  State<TextAndAudio> createState() => _TextAndAudioState();
}

class _TextAndAudioState extends State<TextAndAudio> {
  AudioPlayer player = AudioPlayer();
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    fillList();
    widget.currentUrduText.value = urduText[widget.index.value];
    widget.currentArabicText.value = arabicText[widget.index.value];
    widget.currentAudioPath.value = audioPaths[widget.index.value];
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text("Ziarat e Nahiya - ${widget.index.value + 1}")),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
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
                child: Obx(() => Text(widget.currentUrduText.value)),
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
                          Audio(
                            widget.currentAudioPath.value,
                          ),
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RaisedButton(
                  child: Text('Next'),
                  onPressed: () async {
                    widget.index.value++;
                    if (widget.index.value == urduText.length) {
                      widget.index.value = 0;
                    }
                    widget.currentUrduText.value = urduText[widget.index.value];
                    widget.currentArabicText.value =
                        arabicText[widget.index.value];
                    widget.currentAudioPath.value =
                        audioPaths[widget.index.value];
                    assetsAudioPlayer.stop();
                  },
                ),
              ),
            ],
          )
        ])));
  }
}
