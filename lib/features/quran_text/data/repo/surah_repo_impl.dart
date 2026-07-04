import 'package:injectable/injectable.dart';
import 'package:islam_moshaf/features/quran_text/data/model/surah_details_model.dart';
import 'package:islam_moshaf/features/quran_text/data/model/surah_model.dart';
import 'package:islam_moshaf/features/quran_text/data/source/ds.dart';
import 'package:islam_moshaf/features/quran_text/domain/repo/surah_repo.dart';
@Injectable(as: SurahRepo)
class SurahRepoImpl implements SurahRepo{
  SurahDs surahDs;
  SurahRepoImpl(this.surahDs);
  @override
  Future<SurahModelAll> getQuranList()async {
    try{
      var response = await surahDs.getQuranList();
      return response;
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<SurahDetailsModel> getSurahDetails(int surahNumber) {
    try{
      var response = surahDs.getSurahDetails(surahNumber);
      return response;
    }catch(e){
      rethrow;
    }
  }

}