import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/models/downloads/model_downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<ModelDownloads>>> getDownloadImage();
}
