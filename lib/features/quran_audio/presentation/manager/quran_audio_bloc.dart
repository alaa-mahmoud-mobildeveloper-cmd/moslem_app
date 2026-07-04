import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/manager/quran_audio_event.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/manager/quran_audio_state.dart';

class QuranAudioBloc extends Bloc<QuranAudioEvent, QuranAudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  QuranAudioBloc() : super(QuranAudioState()) {

    on<PlayAudioEvent>((event, emit) async {
      try {
        if (state.currentUrl == event.url && _audioPlayer.processingState == ProcessingState.ready) {
          _audioPlayer.play();
          emit(state.copyWith(status: AudioStatus.playing));
          return;
        }

        emit(state.copyWith(status: AudioStatus.loading, currentUrl: event.url));
        await _audioPlayer.setUrl(event.url);
        _audioPlayer.play();
        emit(state.copyWith(status: AudioStatus.playing));
      } catch (e) {
        emit(state.copyWith(status: AudioStatus.error, errorMessage: e.toString()));
      }
    });

    on<PauseAudioEvent>((event, emit) async {
      await _audioPlayer.pause();
      emit(state.copyWith(status: AudioStatus.paused));
    });
  }
}