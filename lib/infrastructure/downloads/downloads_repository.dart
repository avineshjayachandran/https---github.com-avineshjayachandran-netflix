import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/models/downloads/i_downloads.dart';
import 'package:netflix/domain/models/downloads/model_downloads.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  final Dio _dio = Dio(BaseOptions());
  @override
  Future<Either<MainFailure, List<ModelDownloads>>> getDownloadImage() async {
    try {
      final Response response = await _dio.get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadsList = (response.data['results'] as List).map((e) {
          return ModelDownloads.fromJson(e);
        }).toList();

        print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.ServerFailure());
      }
    } catch (e) {
      print('Error in getDownloadImage: ${e.toString()}');
      return const Left(MainFailure.ClientFailure());
    }
  }
}
