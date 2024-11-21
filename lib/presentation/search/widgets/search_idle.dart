import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:netflix/core/colors/strings.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

final getIt = GetIt.instance;

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kheight10,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isloading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.iserror) {
                return const Center(
                  child: Text('Error while loading the data'),
                );
              } else if (state.idleSearchList.isEmpty) {
                return const Center(
                  child: Text('No Search Results'),
                );
              }

              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final movie = state.idleSearchList[index];
                    return TopSearchItemTile(
                        title: movie.title ?? 'No Title',
                        imageUrl: '$ImageAppendUrl${movie.posterPath}');
                  },
                  separatorBuilder: (ctx, index) => kheight20,
                  itemCount: state.idleSearchList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final int index;
  final String title;
  final String imageUrl;
  TopSearchItemTile(
      {super.key, this.index = 0, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    print('Rendering image for TopSearchItemTile $index');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: screenWidth * 0.39,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                color: kWhiteColor, fontWeight: FontWeight.w900),
            textDirection: TextDirection.ltr,
          ),
        ),
        kwidth,
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_circle_outlined,
              color: kWhiteColor,
              size: 38,
            ))
      ],
    );
  }
}
