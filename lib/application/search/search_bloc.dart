import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failure/main_failure.dart';
import 'package:netflix/domain/models/Search/search_response/i_search.dart';
import 'package:netflix/domain/models/Search/search_response/search_response.dart';
import 'package:netflix/domain/models/downloads/i_downloads.dart';
import 'package:netflix/domain/models/downloads/model_downloads.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsServie;
  final ISearchRepo _searchService;
  SearchBloc(this._downloadsServie, this._searchService)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      if (state.idleSearchList.isNotEmpty) {
        emit(
          SearchState(
            searchResultList: [],
            idleSearchList: state.idleSearchList,
            isloading: false,
            iserror: false,
          ),
        );
        return;
      }
      emit(
        const SearchState(
          searchResultList: [],
          idleSearchList: [],
          isloading: true,
          iserror: false,
        ),
      );
      // get trending movies
      final _result = await _downloadsServie.getDownloadImage();
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idleSearchList: [],
            isloading: false,
            iserror: true,
          );
        },
        (List<ModelDownloads> list) {
          return SearchState(
            searchResultList: [],
            idleSearchList: list,
            isloading: false,
            iserror: false,
          );
        },
      );
      // Display to UI
      emit(_state);
    });

    on<SearchMovie>((event, emit) async {
      // Call searchMovie Api
      log('Searching for ${event.movieQuery}');
      emit(
        const SearchState(
          searchResultList: [],
          idleSearchList: [],
          isloading: true,
          iserror: false,
        ),
      );

      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);

      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idleSearchList: [],
            isloading: false,
            iserror: true,
          );
        },
        (SearchResponse r) {
          return SearchState(
            searchResultList: r.results,
            idleSearchList: [],
            isloading: false,
            iserror: false,
          );
        },
      );
      // Display to UI
      emit(_state);
    });
  }
}
