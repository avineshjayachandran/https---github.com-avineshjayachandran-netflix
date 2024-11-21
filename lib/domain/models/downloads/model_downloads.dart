import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'model_downloads.freezed.dart';
part 'model_downloads.g.dart';

@freezed
class ModelDownloads with _$ModelDownloads {
  const factory ModelDownloads({
    @JsonKey(name: "poster_path") required String? posterPath,
    @JsonKey(name: "title") required String? title,
  }) = _ModelDownloads;

  factory ModelDownloads.fromJson(Map<String, dynamic> json) =>
      _$ModelDownloadsFromJson(json);
}
