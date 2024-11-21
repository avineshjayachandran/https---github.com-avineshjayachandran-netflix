// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:netflix/application/Downloads/downloads_bloc.dart' as _i12;
import 'package:netflix/application/fastlaugh/fast_laugh_bloc.dart' as _i1041;
import 'package:netflix/application/home/home_bloc.dart' as _i586;
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart' as _i803;
import 'package:netflix/application/search/search_bloc.dart' as _i85;
import 'package:netflix/domain/models/downloads/i_downloads.dart' as _i372;
import 'package:netflix/domain/models/HotAndNew/hot_and_new_service.dart'
    as _i639;
import 'package:netflix/domain/models/Search/search_response/i_search.dart'
    as _i1039;
import 'package:netflix/infrastructure/downloads/downloads_repository.dart'
    as _i334;
import 'package:netflix/infrastructure/Hot&New/hot_and_new_impl.dart' as _i869;
import 'package:netflix/infrastructure/Search/Search_Repository.dart' as _i191;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i372.IDownloadsRepo>(() => _i334.DownloadsRepository());
  gh.lazySingleton<_i639.HotAndNewService>(() => _i869.HotAndNewImpl());
  gh.lazySingleton<_i1039.ISearchRepo>(() => _i191.SearchRepository());
  gh.factory<_i586.HomeBloc>(
      () => _i586.HomeBloc(gh<_i639.HotAndNewService>()));
  gh.factory<_i85.SearchBloc>(() => _i85.SearchBloc(
        gh<_i372.IDownloadsRepo>(),
        gh<_i1039.ISearchRepo>(),
      ));
  gh.factory<_i1041.FastLaughBloc>(
      () => _i1041.FastLaughBloc(gh<_i372.IDownloadsRepo>()));
  gh.factory<_i12.DownloadsBloc>(
      () => _i12.DownloadsBloc(gh<_i372.IDownloadsRepo>()));
  gh.factory<_i803.HotAndNewBloc>(
      () => _i803.HotAndNewBloc(gh<_i639.HotAndNewService>()));
  return getIt;
}
