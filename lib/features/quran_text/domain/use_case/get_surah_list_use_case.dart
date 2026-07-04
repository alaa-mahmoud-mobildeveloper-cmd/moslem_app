import 'package:injectable/injectable.dart';
import 'package:islam_moshaf/features/quran_text/data/model/surah_model.dart';
import 'package:islam_moshaf/features/quran_text/domain/repo/surah_repo.dart';
@injectable
class GetSurahListUseCase {
  SurahRepo surahRepo;
  GetSurahListUseCase(this.surahRepo);
  Future<SurahModelAll> call() async {
    try {
      var response = await surahRepo.getQuranList();
      return response;
    } catch (e) {
      rethrow;
    }
  }

}