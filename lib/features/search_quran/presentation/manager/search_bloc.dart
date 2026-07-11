import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_state.dart';
import 'package:islam_moshaf/features/search_quran/domain/use_case/search_use_case.dart';
import 'package:islam_moshaf/features/search_quran/presentation/manager/search_event.dart';
import 'package:islam_moshaf/features/search_quran/presentation/manager/search_state.dart';

import '../../data/model/search_model.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent,SearchState>{
  SearchUseCase useCase;
  SearchBloc(this.useCase):super (SearchState()){
    on<GetSearchSurahEvent>(_onGetSearch);
  }

  Future<void> _onGetSearch (GetSearchSurahEvent event,Emitter<SearchState>emit)async {
    if (event.name.trim().isEmpty) {
      emit(state.copyWith(status: RequestStatus.success, surahList: []));
      return;
    }
    emit(state.copyWith(status: RequestStatus.loading));
    try{
      var response = await useCase.call(event.name);
      final List<SearchData> surah = List<SearchData>.from(response.data ?? []);
      emit(state.copyWith(status: RequestStatus.success, surahList: surah));

    }catch(e){
      emit(state.copyWith(status: RequestStatus.error, message: e.toString()));
    }
  }

}