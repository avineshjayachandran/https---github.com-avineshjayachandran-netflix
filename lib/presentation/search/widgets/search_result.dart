import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kheight20,
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.searchResultList == null ||
                  state.searchResultList!.isEmpty) {
                return const Center(child: Text('No results found'));
              }
              return GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1.2 / 2.2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 15,
                  shrinkWrap: true,
                  children:
                      List.generate(state.searchResultList!.length, (index) {
                    final movie = state.searchResultList![index];
                    return MainCard(
                      imageurl: movie.posterImageUrl,
                    );
                  }));
            },
          ),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageurl;
  const MainCard({super.key, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageurl),
            fit: BoxFit.cover,
            onError: (exception, stackTrace) {},
          ),
          borderRadius: BorderRadius.circular(6)),
    );
  }
}
