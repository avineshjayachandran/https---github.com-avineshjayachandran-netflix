import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/models/Search/search_response/search_response.dart';

abstract class ISearchRepo {
  Future<Either<MainFailure, SearchResponse>> searchMovies({
    required String movieQuery,
  });
}
