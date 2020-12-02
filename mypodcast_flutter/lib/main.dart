import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void playsound(String sound) {
    final player = AudioCache();
    player.play(sound);
  }

  Expanded buildKey({String img, String sound}) {
    return Expanded(
      child: FlatButton(
          child: Image.asset(img),
          onPressed: () {
            playsound(sound);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyPodcast'),
      ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  buildKey(
                      img: 'assets/images/1.jpg',
                      sound: 'assets/sound/EP1.mp3'),
                  SizedBox(
                    height: 10.0,
                  ),
                  buildKey(
                      img: 'assets/images/2.jpg',
                      sound: 'assets/sound/EP2.mp3'),
                  SizedBox(
                    height: 10.0,
                  ),
                  buildKey(
                      img: 'assets/images/3.jpg',
                      sound: 'assets/sound/EP3.mp3'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  buildKey(
                      img: 'assets/images/4.jpg',
                      sound: 'assets/sound/EP4.mp3'),
                  SizedBox(
                    height: 10.0,
                  ),
                  buildKey(
                      img: 'assets/images/5.jpg',
                      sound: 'assets/sound/EP5.mp3'),
                  SizedBox(
                    height: 10.0,
                  ),
                  buildKey(
                      img: 'assets/images/6.jpg',
                      sound: 'assets/sound/EP6.mp3'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
