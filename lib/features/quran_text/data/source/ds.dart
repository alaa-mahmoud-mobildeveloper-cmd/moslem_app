import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:islam_moshaf/core/api/api_manager.dart';
import 'package:islam_moshaf/core/api/base_url.dart';
import 'package:islam_moshaf/core/api/endPoint.dart';
import 'package:islam_moshaf/features/quran_text/data/model/surah_details_model.dart';
import 'package:islam_moshaf/features/quran_text/data/model/surah_model.dart' hide Data;

abstract class SurahDs{
  Future<SurahModelAll> getQuranList();
  Future<SurahDetailsModel> getSurahDetails(int surahNumber);
}
@Injectable(as: SurahDs)
class SurahDsImpl implements SurahDs{
  ApiManager apiManager;
  SurahDsImpl(this.apiManager);
  @override
  Future<SurahModelAll> getQuranList() async{
    try{
      var response =await apiManager.get("${BaseURl.alQuran}${Endpoints.surahList}");
      var data = response.data;
      SurahModelAll surahModelAll = SurahModelAll.fromJson(data);
      return surahModelAll;

    }catch(e){
      rethrow;
    }
  
  }

  @override
  Future<SurahDetailsModel> getSurahDetails(int surahNumber)async {
    try{
      String suraFile = await rootBundle.loadString("assets/files/$surahNumber.txt");
      List<String> suraLines = suraFile.split("\n");
      List<Ayahs> ayahsList = [];
      for (int i = 0; i < suraLines.length; i++) {
        String line = suraLines[i].trim();
        if (line.isNotEmpty) {
          ayahsList.add(
            Ayahs(
              numberInSurah: i + 1,
              text: line,
              sajda: false,
            ),
          );
        }
      }
      return SurahDetailsModel(
        code: 200,
        status: "success",
        data: Data(
          number: surahNumber,
          ayahs: ayahsList,
        ),
      );
    }catch(e){
      rethrow;
    }
  }
}