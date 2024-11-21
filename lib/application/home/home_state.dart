part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> trenidngNowMovieList,
    required List<HotAndNewData> tenseDramaMovieList,
    required List<HotAndNewData> southIndianMovieList,
    required List<HotAndNewData> trendingTvList,
    
    required bool isloading,
    required bool iserror,
  }) = _Initial;

  factory HomeState.initial() => const HomeState(
        pastYearMovieList: [],
        trenidngNowMovieList: [],
        tenseDramaMovieList: [],
        southIndianMovieList: [],
        trendingTvList: [],
        isloading: false,
        iserror: false,
         stateId: '0',
      );
}
