import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  AudioPlayerHandler() {
    String good_url =
        "https://storage.googleapis.com/cfm-dev-public/good_file.mp3";
    String bad_url =
        "https://storage.googleapis.com/cfm-dev-public/does_not_exist.mp3";

    _player.setUrl(bad_url);
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();
}
