import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/models/Search/search_response/i_search.dart';
import 'package:netflix/domain/models/Search/search_response/search_response.dart';

@LazySingleton(as: ISearchRepo)
class SearchRepository implements ISearchRepo {
  final Dio _dio = Dio(BaseOptions());
  @override
  Future<Either<MainFailure, SearchResponse>> searchMovies(
      {required String movieQuery}) async {
    try {
      if (movieQuery.trim().isEmpty) {
        return const Left(MainFailure.ClientFailure());
      }
      final Response response = await _dio.get(
        ApiEndPoints.search,
        queryParameters: {'query': movieQuery},
      );
      log(response.data.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponse.fromJson(response.data);
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
