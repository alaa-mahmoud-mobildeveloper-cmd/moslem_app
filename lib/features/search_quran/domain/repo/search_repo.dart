import 'package:islam_moshaf/features/search_quran/data/model/search_model.dart';

abstract class SearchRepo {
  Future<SearchSurahModel> getSearchSurah(String name);
}