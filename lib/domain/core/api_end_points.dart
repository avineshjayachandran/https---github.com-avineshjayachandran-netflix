import 'package:netflix/core/colors/strings.dart';
import 'package:netflix/domain/models/HotAndNew/hot_and_new/hot_and_new.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/movie/popular?api_key=$ApiKey";
  static const search =
      "$kBaseUrl/search/movie?api_key=$ApiKey&query=spiderman";
  static const hotAndNewMovie =
      "$kBaseUrl/discover/movie?api_key=$ApiKey";
        static const hotAndNewTv =
      "$kBaseUrl/discover/tv?api_key=$ApiKey";

}
