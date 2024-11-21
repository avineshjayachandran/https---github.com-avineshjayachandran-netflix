import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/domain/core/Debouncer/debounce.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';
import 'package:netflix/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final _debouncer = Debouncer(milliseconds: 1 * 500);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        BlocProvider.of<SearchBloc>(context).add(const Initialize());
      } catch (e) {
        print('Error in SearchBloc initialization: $e');
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  }
                  _debouncer.run(() {
                    if (value.trim().isNotEmpty) {
                      BlocProvider.of<SearchBloc>(context)
                          .add(SearchMovie(movieQuery: value));
                    }
                  });
                },
              ),
              kheight20,
              Expanded(child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.iserror) {
                    return const Center(
                        child: Text('An error occurred, please try again.'));
                  } else if (state.isloading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.searchResultList == null ||
                      state.searchResultList!.isEmpty) {
                    return const SearchIdleWidget();
                  } else {
                    return const SearchResultWidget();
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
