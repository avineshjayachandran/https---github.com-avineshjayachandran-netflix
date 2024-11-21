import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/models/HotAndNew/hot_and_new/hot_and_new.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData();
}
