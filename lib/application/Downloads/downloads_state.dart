part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isloading,
    required List<ModelDownloads>? downloads,
    required Option<Either<MainFailure, List<ModelDownloads>>>
        downloadFailureOrSuccessOption,
  }) = _DownloadsState;

  factory DownloadsState.initial() {
    return const DownloadsState(
        isloading: false,
        downloadFailureOrSuccessOption: None(),
        downloads: []);
  }
}
