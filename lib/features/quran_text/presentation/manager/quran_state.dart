import 'package:equatable/equatable.dart';
import 'package:islam_moshaf/features/quran_text/data/model/surah_details_model.dart';
import 'package:islam_moshaf/features/quran_text/data/model/surah_model.dart';

enum RequestStatus {
  initial,
  loading,
  success,
  error
}

class QuranState extends Equatable {
  final RequestStatus status;
  final String? message;
  final SurahModelAll? surahList;
  final SurahDetailsModel? surahDetails;

  const QuranState({
    this.status = RequestStatus.initial,
    this.message,
    this.surahList,
    this.surahDetails,
  });

  @override
  List<Object?> get props => [status, message, surahList, surahDetails];


  QuranState copyWith({
    RequestStatus? status,
    String? message,
    SurahModelAll? surahList,
    SurahDetailsModel? surahDetails,
  }) {
    return QuranState(

      status: status ?? this.status,
      message: message ?? this.message,
      surahList: surahList ?? this.surahList,
      surahDetails: surahDetails ?? this.surahDetails,
    );
  }
}