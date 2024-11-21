import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/models/HotAndNew/hot_and_new/hot_and_new.dart';
import 'package:netflix/domain/models/HotAndNew/hot_and_new_service.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      emit(
         HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trenidngNowMovieList: [],
          tenseDramaMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isloading: true,
          iserror: false,
        ),
      );
      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTvData();

      final _state1 = _movieResult.fold((MainFailure failure) {
        return  HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trenidngNowMovieList: [],
          tenseDramaMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isloading: false,
          iserror: true,
        );
      }, (HotAndNewResp resp) {
        final pastYearmovieList = resp.results;
        final trendingmovieList = resp.results;
        final DramaMovieList = resp.results;
        final SouthindianList = resp.results;
        pastYearmovieList.shuffle();
        trendingmovieList.shuffle();
        SouthindianList.shuffle();
        DramaMovieList.shuffle();

        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: pastYearmovieList,
          trenidngNowMovieList: trendingmovieList,
          tenseDramaMovieList: DramaMovieList,
          southIndianMovieList: SouthindianList,
          trendingTvList: state.trendingTvList,
          isloading: false,
          iserror: false,
        );
      });
      emit(_state1);

       
       final _state2 =  _tvResult.fold((MainFailure failure) {
          return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trenidngNowMovieList: [],
          tenseDramaMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isloading: false,
          iserror: true,
        );
          }, (HotAndNewResp resp) {
        final top10List = resp.results;
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trenidngNowMovieList: state.trenidngNowMovieList,
            tenseDramaMovieList: state.tenseDramaMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: top10List,
            isloading: false,
            iserror: false
            );
      }
    );
       emit(_state2);
    });
   
  }
}
