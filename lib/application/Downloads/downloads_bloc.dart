import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/models/downloads/i_downloads.dart';
import 'package:netflix/domain/models/downloads/model_downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(state.copyWith(
        isloading: true,
        downloadFailureOrSuccessOption: none(),
      ));
      print('fetching downloads..');

      final Either<MainFailure, List<ModelDownloads>> downloadsOption =
          await _downloadsRepo.getDownloadImage();

      print("Repository result: $downloadsOption");

      emit(
        downloadsOption.fold((failure) {
          print("Error occurred : $failure");
          return state.copyWith(
              isloading: false,
              downloadFailureOrSuccessOption: some(left(failure)));
        }, (success) {
          print("Success ! Download fetched : ${success.length}");
          return state.copyWith(
              isloading: false,
              downloads: success,
              downloadFailureOrSuccessOption: some(right(success)));
        }),
      );
    });
  }
}
