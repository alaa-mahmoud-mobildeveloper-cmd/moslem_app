// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api/api_manager.dart' as _i237;
import 'features/quran_text/data/repo/surah_repo_impl.dart' as _i817;
import 'features/quran_text/data/source/ds.dart' as _i328;
import 'features/quran_text/domain/repo/surah_repo.dart' as _i78;
import 'features/quran_text/domain/use_case/get_surah_list_use_case.dart'
    as _i797;
import 'features/quran_text/domain/use_case/get_surah_use_case.dart' as _i140;
import 'features/quran_text/presentation/manager/quran_bloc.dart' as _i88;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i328.SurahDs>(() => _i328.SurahDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i78.SurahRepo>(() => _i817.SurahRepoImpl(gh<_i328.SurahDs>()));
    gh.factory<_i797.GetSurahListUseCase>(
      () => _i797.GetSurahListUseCase(gh<_i78.SurahRepo>()),
    );
    gh.factory<_i140.GetSurahUseCase>(
      () => _i140.GetSurahUseCase(gh<_i78.SurahRepo>()),
    );
    gh.factory<_i88.QuranBloc>(
      () => _i88.QuranBloc(
        gh<_i797.GetSurahListUseCase>(),
        gh<_i140.GetSurahUseCase>(),
      ),
    );
    return this;
  }
}
