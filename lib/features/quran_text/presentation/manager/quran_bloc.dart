import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:islam_moshaf/features/quran_text/domain/use_case/get_surah_list_use_case.dart';
import 'package:islam_moshaf/features/quran_text/domain/use_case/get_surah_use_case.dart';
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_event.dart';
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_state.dart';

@injectable
class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final GetSurahListUseCase getSurahListUseCase;
  final GetSurahUseCase getSurahUseCase;
  QuranBloc(this.getSurahListUseCase, this.getSurahUseCase) : super(const QuranState()) {
    on<GetSurahEvent>(_onGetSurah);
    on<GetSurahDetailsEvent>(_onGetSurahDetails);
  }
  Future<void> _onGetSurah( GetSurahEvent event, Emitter<QuranState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
    try {
      var response = await getSurahListUseCase.call();
      emit(state.copyWith(status: RequestStatus.success, surahList: response));
    } catch (e) {
      emit(state.copyWith(status: RequestStatus.error, message: e.toString()));
    }

  }
  Future<void> _onGetSurahDetails(GetSurahDetailsEvent event, Emitter<QuranState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
    try {
      var response = await getSurahUseCase.call(event.surahNumber);
      emit(state.copyWith(status: RequestStatus.success, surahDetails: response));
    } catch (e) {
      emit(state.copyWith(status: RequestStatus.error, message: e.toString()));
    }
    }
}