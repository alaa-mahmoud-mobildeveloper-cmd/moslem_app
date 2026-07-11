import 'package:injectable/injectable.dart';
import 'package:islam_moshaf/core/api/api_manager.dart';
import 'package:islam_moshaf/core/api/base_url.dart';
import 'package:islam_moshaf/core/api/endPoint.dart';
import 'package:islam_moshaf/features/search_quran/data/model/search_model.dart';


abstract class SearchDs{
  Future<SearchSurahModel> searchSurah(String name);
}


@Injectable(as: SearchDs )
class SearchDsImpl implements SearchDs{
  ApiManager apiManager;
  SearchDsImpl(this.apiManager);
  @override
  Future<SearchSurahModel> searchSurah(String name) async{
    try{
      var response = await apiManager.get("${BaseURl.alQuran}${Endpoints.surahList}");
      var data = response.data;

      SearchSurahModel surahModelAll = SearchSurahModel.fromJson(data);
      if (name.isEmpty) {
        surahModelAll.data = [];
        return surahModelAll;
      }
      if (surahModelAll.data != null) {
        surahModelAll.data = surahModelAll.data!.where((surah) {
          final searchWord = name.toLowerCase();
          final arabicName = (surah.name ?? '');
          final englishName = (surah.englishName ?? '').toLowerCase();

          return arabicName.contains(searchWord) || englishName.contains(searchWord);
        }).toList();
      }

      return surahModelAll;
    }catch(e){
      rethrow;
    }
  }
}