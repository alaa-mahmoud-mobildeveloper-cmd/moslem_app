abstract class QuranAudioEvent {}

class PlayAudioEvent extends QuranAudioEvent {
  final String url;
  PlayAudioEvent(this.url);
}

class PauseAudioEvent extends QuranAudioEvent {}

class StopAudioEvent extends QuranAudioEvent {}