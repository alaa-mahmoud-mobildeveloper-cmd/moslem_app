import 'package:injectable/injectable.dart';
import 'package:islam_moshaf/features/search_quran/data/model/search_model.dart';
import 'package:islam_moshaf/features/search_quran/domain/repo/search_repo.dart';


@injectable
class SearchUseCase {
  SearchRepo searchRepo;
  SearchUseCase(this.searchRepo);

  Future<SearchSurahModel> call(String name) async {
    try {
      var response = await searchRepo.getSearchSurah(name);
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
