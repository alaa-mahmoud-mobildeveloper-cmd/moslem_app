enum AudioStatus { initial, loading, playing, paused, error }

class QuranAudioState {
  final AudioStatus status;
  final String? currentUrl;
  final String? errorMessage;

  QuranAudioState({
    this.status = AudioStatus.initial,
    this.currentUrl,
    this.errorMessage,
  });

  // وظيفة copyWith لتعديل الحالة بسهولة
  QuranAudioState copyWith({
    AudioStatus? status,
    String? currentUrl,
    String? errorMessage,
  }) {
    return QuranAudioState(
      status: status ?? this.status,
      currentUrl: currentUrl ?? this.currentUrl,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}