part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState(
      {@Default([]) List<ModelDownloads> videoList,
      required bool isloading,
      required bool iserror}) = _Initial;

  factory FastLaughState.initial() => const FastLaughState(
        videoList: [],
        isloading: true,
        iserror: false,
      );
}
