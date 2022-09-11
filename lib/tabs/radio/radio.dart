import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app/tabs/radio/radio_item.dart';
import 'package:islami_app/tabs/radio/radio_response.dart';

class RadioScreen extends StatefulWidget {
  static const String routeName = 'quran';

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  late Future<RadioResponse> radioResponseFuture;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    radioResponseFuture = getradios();
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return FutureBuilder<RadioResponse>(
      future: radioResponseFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Radios> radios = snapshot.data?.radios ?? [];
          return Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/radio2.png',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: ListView.builder(
                  physics: PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: radios.length,
                  itemBuilder: (context, index) => Container(
                      width: width,
                      child: Center(
                        child: SizedBox(
                            width: width * 0.9,
                            child: RadioItem(radios[index], audioPlayer)),
                      )),
                )),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
              child: IconButton(
                  onPressed: () {
                    radioResponseFuture = getradios();
                  },
                  icon: Icon(Icons.refresh)));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<RadioResponse> getradios() async {
    var uri = Uri.parse('https://api.mp3quran.net/radios/radio_arabic.json');
    var response = await http.get(uri);
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return RadioResponse.fromJson(json);
    } else {
      throw Exception('Failed to load radio');
    }
  }
}
