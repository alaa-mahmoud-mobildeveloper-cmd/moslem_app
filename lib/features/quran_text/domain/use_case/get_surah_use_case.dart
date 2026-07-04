import 'package:injectable/injectable.dart';
import 'package:islam_moshaf/features/quran_text/data/model/surah_details_model.dart';
import 'package:islam_moshaf/features/quran_text/domain/repo/surah_repo.dart';

@injectable
class GetSurahUseCase {
  SurahRepo surahRepo;
  GetSurahUseCase(this.surahRepo);
  Future<SurahDetailsModel> call(int surahNumber) async {
    try {
      var response = await surahRepo.getSurahDetails(
        surahNumber,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}