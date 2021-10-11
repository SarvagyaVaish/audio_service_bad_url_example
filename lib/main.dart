import 'package:audio_service/audio_service.dart';
import 'package:audio_test_app/audio_player_handler.dart';
import 'package:flutter/material.dart';

late AudioHandler _audioHandler; // singleton.

Future<void> main() async {
  _audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: AudioServiceConfig(
      androidNotificationChannelId: 'com.mycompany.myapp.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Example', home: MainScreen());
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(child: Text("Play"), onPressed: _audioHandler.play),
            ElevatedButton(
                child: Text("Pause"), onPressed: _audioHandler.pause),
          ],
        ),
      ),
    );
  }
}
