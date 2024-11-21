import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/models/HotAndNew/hot_and_new/hot_and_new.dart';
import 'package:netflix/domain/models/HotAndNew/hot_and_new_service.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    //loading
    emit(const HotAndNewState(
        comingSoonList: [],
        everyoneWatchingList: [],
        isloading: true,
        iserror: false));

    //coming soon
    on<LoadDataInComingSoon>((event, emit) async {
      //get movie data
      final result = await _hotAndNewService.getHotAndNewMovieData();

      final newState = result.fold((MainFailure failure) {
        return const HotAndNewState(
          comingSoonList: [],
          everyoneWatchingList: [],
          isloading: false,
          iserror: true,
        );
      }, (HotAndNewResp resp) {
        return HotAndNewState(
            comingSoonList: resp.results,
            everyoneWatchingList: state.everyoneWatchingList,
            isloading: false,
            iserror: false);
      });
      emit(newState);
    });

    on<LoadDataInEveryoneIsWatching>((event, emit) async {
           final result = await _hotAndNewService.getHotAndNewTvData();

      final newState = result.fold((MainFailure failure) {
        return const HotAndNewState(
          comingSoonList: [],
          everyoneWatchingList: [],
          isloading: false,
          iserror: true,
        );
      }, (HotAndNewResp resp) {
        return HotAndNewState(
            comingSoonList: state.comingSoonList,
            everyoneWatchingList: resp.results,
            isloading: false,
            iserror: false);
      });
      emit(newState);
      
    });
  }
}
