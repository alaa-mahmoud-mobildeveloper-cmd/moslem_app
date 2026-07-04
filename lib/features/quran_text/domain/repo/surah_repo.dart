import 'package:islam_moshaf/features/quran_text/data/model/surah_details_model.dart';
import 'package:islam_moshaf/features/quran_text/data/model/surah_model.dart';

abstract class SurahRepo {
  Future<SurahModelAll> getQuranList();
  Future<SurahDetailsModel> getSurahDetails(int surahNumber);
}