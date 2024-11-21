import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/models/HotAndNew/hot_and_new/hot_and_new.dart';
import 'package:netflix/domain/models/HotAndNew/hot_and_new_service.dart';

@LazySingleton(as:HotAndNewService)
class HotAndNewImpl implements HotAndNewService {
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData() async {
     try {
     
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
       
      );
      log(response.data.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.ServerFailure());
      }
    } catch (e) {
      log("SearchRepository Error: ${e.toString()}");
      return const Left(MainFailure.ClientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData() async {
        try {
     
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTv,
       
      );
      log(response.data.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.ServerFailure());
      }
    } catch (e) {
      log("SearchRepository Error: ${e.toString()}");
      return const Left(MainFailure.ClientFailure());
    }
  }
  }
