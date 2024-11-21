part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<HotAndNewData> comingSoonList,
    required List<HotAndNewData> everyoneWatchingList,
    required bool isloading,
    required bool iserror,
  }) = _Initial;

  factory HotAndNewState.initial() => const HotAndNewState(
      comingSoonList: [],
      everyoneWatchingList: [],
      isloading: false,
      iserror: false);
}
