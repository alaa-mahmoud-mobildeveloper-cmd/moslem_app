import 'package:equatable/equatable.dart';

abstract class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object?> get props => [];
}


class GetSurahEvent extends QuranEvent {}
class GetSurahDetailsEvent extends QuranEvent {
  final int surahNumber;
  const GetSurahDetailsEvent(this.surahNumber);

}