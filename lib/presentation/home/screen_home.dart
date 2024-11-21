import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';

import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/core/colors/strings.dart';
import 'package:netflix/presentation/home/widgets/BackGroundCard.dart';

import 'widgets/maintitlecard.dart';
import 'widgets/number_card_widget.dart';

ValueNotifier<bool> scrollNotifiier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifiier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (Notification) {
                  final ScrollDirection direction = Notification.direction;
                  print(direction);
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifiier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifiier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.iserror) {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        } else if (state.iserror) {
                          return const Center(
                              child: Text('Error while Fetching Data'));
                        }
                        final releasedPastYear =
                            state.pastYearMovieList.map((m) {
                          return "$ImageAppendUrl${m.posterPath}";
                        }).toList();
                        releasedPastYear.shuffle();

                        final trendingNow = state.trenidngNowMovieList.map((m) {
                          return "$ImageAppendUrl${m.posterPath}";
                        }).toList();
                        trendingNow.shuffle();

                        final top10TvShows = state.trendingTvList.map((t) {
                          return "$ImageAppendUrl${t.posterPath}";
                        }).toList();
                        top10TvShows.shuffle();

                        final tenseDrama = state.tenseDramaMovieList.map((m) {
                          return "$ImageAppendUrl${m.posterPath}";
                        }).toList();
                        tenseDrama.shuffle();

                        final SouthIndian = state.southIndianMovieList.map((m) {
                          return "$ImageAppendUrl${m.posterPath}";
                        }).toList();
                        SouthIndian.shuffle();

                        return ListView(
                          children: [
                            const BackGroundCard(),
                            MainTitleCard(
                              title: 'Released This Year',
                              posterList: releasedPastYear.length >= 10
                                  ? releasedPastYear.sublist(0, 10)
                                  : releasedPastYear,
                            ),
                            MainTitleCard(
                              title: 'Trending Now',
                              posterList: trendingNow.length >= 10
                                  ? trendingNow.sublist(0, 10)
                                  : trendingNow,
                            ),
                            numbercardwidget(
                              title: 'Top 10 Shows',
                              posterList: top10TvShows.length >= 10
                                  ? top10TvShows.sublist(0, 10)
                                  : top10TvShows,
                            ),
                            MainTitleCard(
                              title: 'Popular Movies',
                              posterList: tenseDrama.length >= 10
                                  ? tenseDrama.sublist(0, 10)
                                  : tenseDrama,
                            ),
                            MainTitleCard(
                              title: 'Most Viewed',
                              posterList: SouthIndian.length >= 10
                                  ? SouthIndian.sublist(0, 10)
                                  : SouthIndian,
                            ),
                            kheight10
                          ],
                        );
                      },
                    ),
                    scrollNotifiier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(microseconds: 1000),
                            height: 90,
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.3),
                            child: Column(
                              children: [
                                kheight10,
                                Row(
                                  children: [
                                    kwidth,
                                    Image.network(
                                      'https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png',
                                      width: 40,
                                      height: 40,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    kwidth,
                                const    CharachterContainer(charachterImage: "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&s=30",),
                                    kwidth,
                                  ],
                                ),
                                kheight10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      ' TV Shows',
                                      style: kHomeTitleText,
                                    ),
                                    Text(
                                      "Movies",
                                      style: kHomeTitleText,
                                    ),
                                    Text(
                                      "Categories",
                                      style: kHomeTitleText,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        : kheight10,
                  ],
                ),
              );
            }));
  }
}

class CharachterContainer extends StatelessWidget {
  const CharachterContainer({
    super.key, required this.charachterImage,
  });
  final String charachterImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(
         charachterImage
      ))
      ),
    );
  }
}
