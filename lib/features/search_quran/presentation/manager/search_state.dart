
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_state.dart';

import '../../data/model/search_model.dart';


class SearchState {
  final RequestStatus status;
  final String? message;
  final List<SearchData> surahList;


  const SearchState({
    this.status = RequestStatus.initial,
    this.message,
    this.surahList = const [],

  });




  SearchState copyWith({
    RequestStatus? status,
    String? message,
    List<SearchData>? surahList,

  }) {
    return SearchState(

      status: status ?? this.status,
      message: message ?? this.message,
      surahList: surahList ?? this.surahList,

    );
  }
}
