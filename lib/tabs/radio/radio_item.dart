import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/tabs/radio/radio_response.dart';

class RadioItem extends StatefulWidget {
  Radios radio;
  AudioPlayer audioPlayer;

  RadioItem(this.radio, this.audioPlayer);

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.radio.name ?? '',
          style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 16),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  play();
                },
                icon: Icon(
                  Icons.play_arrow_rounded,
                  size: 30,
                ),
                color: Colors.brown,
              ),
              IconButton(
                onPressed: () {
                  pause();
                },
                icon: Icon(
                  Icons.pause_rounded,
                  size: 30,
                ),
                color: Colors.brown,
              ),
            ],
          ),
        )
      ],
    );
  }

  void play() async {
    await widget.audioPlayer.play(UrlSource(widget.radio.radioUrl!));
  }

  void pause() async {
    await widget.audioPlayer.pause();
  }
}
