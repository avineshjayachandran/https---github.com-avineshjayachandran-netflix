import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/models/downloads/i_downloads.dart';
import 'package:netflix/domain/models/downloads/model_downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final sampleVideoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
];

ValueNotifier<Set<int>> LikedVideosNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDownloadsRepo _downloadService)
      : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      emit(
        const FastLaughState(
          videoList: [],
          isloading: true,
          iserror: false,
        ),
      );
      final _result = await _downloadService.getDownloadImage();
      final _state = _result.fold((MainFailure f) {
        return  FastLaughState(
          videoList: [],
          isloading: false,
          iserror: true,
        );
      }, (resp) {
        return FastLaughState(
          videoList: resp,
          isloading: false,
          iserror: false,
        );
      });
      emit(_state);
    });

    on<LikedVideo>((event, emit) async {
      LikedVideosNotifier.value.add(event.id);
      LikedVideosNotifier.notifyListeners();
    });

    on<UnlikeVideo>((event, emit) async {
      LikedVideosNotifier.value.remove(event.id);
      LikedVideosNotifier.notifyListeners();
    });
  }
}
