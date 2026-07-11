import 'package:injectable/injectable.dart';
import 'package:islam_moshaf/features/search_quran/data/model/search_model.dart' show SearchSurahModel;
import 'package:islam_moshaf/features/search_quran/data/source/ds.dart';
import 'package:islam_moshaf/features/search_quran/domain/repo/search_repo.dart';

@Injectable(as:SearchRepo)
class SearchRepoImpl implements SearchRepo{
  SearchDs searchDs;
  SearchRepoImpl(this.searchDs);
  @override
  Future<SearchSurahModel> getSearchSurah(String name) async {
    try{
      var response = await searchDs.searchSurah(name);
      return response;
    }catch(e){
      rethrow;
    }
  }
}